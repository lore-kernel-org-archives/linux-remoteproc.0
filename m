Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/4] soc: qcom: Introduce APCS IPC driver
Date: Tue,  2 May 2017 22:29:27 -0700
Message-Id: <20170503052929.17422-2-bjorn.andersson@linaro.org>
In-Reply-To: <20170503052929.17422-1-bjorn.andersson@linaro.org>
References: <20170503052929.17422-1-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This implements a driver that exposes the IPC bits found in the APCS
Global block in various Qualcomm platforms. The bits are used to signal
inter-processor communication signals from the application CPU to other
masters.

The driver implements the "doorbell" binding and could be used as basis
for a new Linux framework, if found useful outside Qualcomm.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New driver

 drivers/soc/qcom/Kconfig          |   8 ++
 drivers/soc/qcom/Makefile         |   1 +
 drivers/soc/qcom/apcs-ipc.c       | 182 ++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/apcs_ipc.h |  26 ++++++
 4 files changed, 217 insertions(+)
 create mode 100644 drivers/soc/qcom/apcs-ipc.c
 create mode 100644 include/linux/soc/qcom/apcs_ipc.h

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 78b1bb7bcf20..4113da81d18b 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -1,6 +1,14 @@
 #
 # QCOM Soc drivers
 #
+config QCOM_APCS_IPC
+	tristate "Qualcomm APCS IPC driver"
+	depends on ARCH_QCOM
+	help
+	  Say y here to enable support for the APCS IPC doorbell driver,
+	  providing an interface for invoking the inter-process communication
+	  signals from the application processor to other masters.
+
 config QCOM_GSBI
         tristate "QCOM General Serial Bus Interface"
         depends on ARCH_QCOM
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 1f30260b06b8..e15b33e5a630 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_QCOM_APCS_IPC) +=	apcs-ipc.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_PM)	+=	spm.o
diff --git a/drivers/soc/qcom/apcs-ipc.c b/drivers/soc/qcom/apcs-ipc.c
new file mode 100644
index 000000000000..ea835cb08657
--- /dev/null
+++ b/drivers/soc/qcom/apcs-ipc.c
@@ -0,0 +1,182 @@
+/*
+ * Copyright (c) 2017, Linaro Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static struct platform_driver qcom_apcs_ipc_driver;
+
+struct qcom_apcs_ipc {
+	struct device *dev;
+
+	void __iomem *base;
+	unsigned long offset;
+};
+
+struct qcom_apcs_ipc_bell {
+	struct qcom_apcs_ipc *apcs;
+	unsigned int bit;
+};
+
+static void qcom_apcs_ipc_release(struct device *dev, void *res)
+{
+	struct qcom_apcs_ipc_bell *bell = res;
+	struct qcom_apcs_ipc *apcs = bell->apcs;
+
+	put_device(apcs->dev);
+}
+
+/**
+ * qcom_apcs_ipc_get() - acquire a handle to a doorbell
+ * @dev:	client device handle
+ * @id:		identifier of the doorbell
+ *
+ * Returns a doorbell reference, or negative errno on failure.
+ */
+struct qcom_apcs_ipc_bell *devm_qcom_apcs_ipc_get(struct device *dev,
+						  const char *id)
+{
+	struct qcom_apcs_ipc_bell *bell;
+	struct platform_device *pdev;
+	struct of_phandle_args args;
+	int index = 0;
+	int ret;
+
+	if (id) {
+		index = of_property_match_string(dev->of_node,
+						 "doorbell-names", id);
+		if (index < 0)
+			return ERR_PTR(index);
+	}
+
+	ret = of_parse_phandle_with_args(dev->of_node, "doorbells",
+					 "#doorbell-cells", index, &args);
+	if (ret) {
+		dev_err(dev, "unable to resolve doorbell\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	pdev = of_find_device_by_node(args.np);
+	of_node_put(args.np);
+
+	if (!pdev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (args.args[0] >= 32) {
+		dev_err(dev, "invalid doorbell requested\n");
+		ret = -EINVAL;
+		goto release_device;
+	}
+
+	if (pdev->dev.driver != &qcom_apcs_ipc_driver.driver) {
+		dev_err(dev, "failed to acquire apcs ipc driver\n");
+		ret = -EINVAL;
+		goto release_device;
+	}
+
+	bell = devres_alloc(qcom_apcs_ipc_release, sizeof(*bell), GFP_KERNEL);
+	if (!bell) {
+		ret = -ENOMEM;
+		goto release_device;
+	}
+
+	bell->apcs = platform_get_drvdata(pdev);
+	bell->bit = args.args[0];
+
+	devres_add(dev, bell);
+
+	return bell;
+
+release_device:
+	put_device(&pdev->dev);
+
+	return ERR_PTR(ret);
+
+}
+EXPORT_SYMBOL_GPL(devm_qcom_apcs_ipc_get);
+
+/**
+ * qcom_apcs_ipc_ring() - ring the doorbell
+ * @bell:	doorbell to ring
+ */
+void qcom_apcs_ipc_ring(struct qcom_apcs_ipc_bell *bell)
+{
+	struct qcom_apcs_ipc *apcs = bell->apcs;
+
+	writel(BIT(bell->bit), apcs->base + apcs->offset);
+}
+EXPORT_SYMBOL_GPL(qcom_apcs_ipc_ring);
+
+static int qcom_apcs_ipc_probe(struct platform_device *pdev)
+{
+	struct qcom_apcs_ipc *apcs;
+	struct resource *res;
+
+	apcs = devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
+	if (!apcs)
+		return -ENOMEM;
+
+	apcs->dev = &pdev->dev;
+	apcs->offset = (unsigned long)of_device_get_match_data(&pdev->dev);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	apcs->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(apcs->base))
+		return PTR_ERR(apcs->base);
+
+	platform_set_drvdata(pdev, apcs);
+
+	return 0;
+}
+
+static int qcom_apcs_ipc_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+/* .data is the offset of the ipc register within the global block */
+static const struct of_device_id qcom_apcs_ipc_of_match[] = {
+	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = (void *)8 },
+	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = (void *)16 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
+
+static struct platform_driver qcom_apcs_ipc_driver = {
+	.probe = qcom_apcs_ipc_probe,
+	.remove = qcom_apcs_ipc_remove,
+	.driver = {
+		.name = "qcom_apcs_ipc",
+		.of_match_table = qcom_apcs_ipc_of_match,
+	},
+};
+
+static int __init qcom_apcs_ipc_init(void)
+{
+	return platform_driver_register(&qcom_apcs_ipc_driver);
+}
+postcore_initcall(qcom_apcs_ipc_init);
+
+static void __exit qcom_apcs_ipc_exit(void)
+{
+	platform_driver_unregister(&qcom_apcs_ipc_driver);
+}
+module_exit(qcom_apcs_ipc_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm APCS IPC driver");
diff --git a/include/linux/soc/qcom/apcs_ipc.h b/include/linux/soc/qcom/apcs_ipc.h
new file mode 100644
index 000000000000..72be77555261
--- /dev/null
+++ b/include/linux/soc/qcom/apcs_ipc.h
@@ -0,0 +1,26 @@
+#ifndef __QCOM_APCS_IPC_H__
+#define __QCOM_APCS_IPC_H__
+
+#include <linux/err.h>
+
+struct device;
+struct qcom_apcs_ipc_bell;
+
+#if IS_ENABLED(CONFIG_QCOM_APCS_IPC)
+
+struct qcom_apcs_ipc_bell *devm_qcom_apcs_ipc_get(struct device *dev,
+						  const char *id);
+void qcom_apcs_ipc_ring(struct qcom_apcs_ipc_bell *bell);
+
+#else
+
+static inline struct qcom_apcs_ipc_bell *devm_qcom_apcs_ipc_get(struct device *dev,
+								const char *id)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline void qcom_apcs_ipc_ring(struct qcom_apcs_ipc_bell *bell) {}
+
+#endif
+#endif
-- 
2.12.0
