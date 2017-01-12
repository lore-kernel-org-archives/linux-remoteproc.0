Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RFC 1/3] remoteproc: qcom: Introduce Qualcomm low pass sensor peripheral loader.
Date: Thu, 12 Jan 2017 19:23:35 +0530
Message-Id: <1484229217-23364-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
References: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch is to load and boot slpi core on Qualcomm plateforms. It is
used for loading the firmware images of the subsystems into memory
and preparing the subsystem's processor to execute code.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/Kconfig         |  12 +
 drivers/remoteproc/Makefile        |   1 +
 drivers/remoteproc/qcom_slpi_pil.c | 445 +++++++++++++++++++++++++++++++++++++
 3 files changed, 458 insertions(+)
 create mode 100644 drivers/remoteproc/qcom_slpi_pil.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 8f9cf0b..9622fb9 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -95,6 +95,18 @@ config QCOM_Q6V5_PIL
 	  Say y here to support the Qualcomm Peripherial Image Loader for the
 	  Hexagon V5 based remote processors.
 
+config QCOM_SLPI_PIL
+	tristate "Qualcomm SLPI Peripheral Image Loader"
+	depends on OF && ARCH_QCOM
+	depends on QCOM_SMEM
+	depends on REMOTEPROC
+	select MFD_SYSCON
+	select QCOM_MDT_LOADER
+	select QCOM_SCM
+	help
+	  Say y here to support the TrustZone based Peripherial Image Loader
+	  for the Qualcomm Sensor remote processors.
+
 config QCOM_WCNSS_PIL
 	tristate "Qualcomm WCNSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 0938ea3..16e742a 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
 obj-$(CONFIG_QCOM_ADSP_PIL)		+= qcom_adsp_pil.o
 obj-$(CONFIG_QCOM_MDT_LOADER)		+= qcom_mdt_loader.o
 obj-$(CONFIG_QCOM_Q6V5_PIL)		+= qcom_q6v5_pil.o
+obj-$(CONFIG_QCOM_SLPI_PIL)		+= qcom_slpi_pil.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
 qcom_wcnss_pil-y			+= qcom_wcnss.o
 qcom_wcnss_pil-y			+= qcom_wcnss_iris.o
diff --git a/drivers/remoteproc/qcom_slpi_pil.c b/drivers/remoteproc/qcom_slpi_pil.c
new file mode 100644
index 0000000..106c617
--- /dev/null
+++ b/drivers/remoteproc/qcom_slpi_pil.c
@@ -0,0 +1,445 @@
+/*
+ * Qualcomm slpi Peripheral Image Loader for MSM8974 and MSM8996
+ *
+ * Copyright (C) 2016-2017, Linaro Ltd
+ * Copyright (C) 2014-2017, Sony Mobile Communications AB
+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/clk.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/qcom_scm.h>
+#include <linux/regulator/consumer.h>
+#include <linux/remoteproc.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/smem_state.h>
+
+#include "qcom_mdt_loader.h"
+#include "remoteproc_internal.h"
+
+#define SLPI_CRASH_REASON_SMEM		424
+#define SLPI_FIRMWARE_NAME		"slpi.mdt"
+#define SLPI_PAS_ID			12
+
+struct qcom_slpi {
+	struct device *dev;
+	struct rproc *rproc;
+
+	int wdog_irq;
+	int fatal_irq;
+	int ready_irq;
+	int handover_irq;
+	int stop_ack_irq;
+
+	struct qcom_smem_state *state;
+	unsigned int stop_bit;
+
+	struct clk *xo;
+	struct clk *aggre2_noc;
+	struct regulator *cx;
+	struct regulator *px;
+
+	struct completion start_done;
+	struct completion stop_done;
+
+	phys_addr_t mem_phys;
+	phys_addr_t mem_reloc;
+	void *mem_region;
+	size_t mem_size;
+};
+
+static int slpi_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct qcom_slpi *slpi = (struct qcom_slpi *)rproc->priv;
+	phys_addr_t fw_addr;
+	size_t fw_size;
+	bool relocate;
+	int ret;
+
+	ret = qcom_scm_pas_init_image(SLPI_PAS_ID, fw->data, fw->size);
+	if (ret) {
+		dev_err(&rproc->dev, "invalid firmware metadata\n");
+		return ret;
+	}
+	ret = qcom_mdt_parse(fw, &fw_addr, &fw_size, &relocate);
+	if (ret) {
+		dev_err(&rproc->dev, "failed to parse mdt header\n");
+		return ret;
+	}
+
+	if (relocate) {
+		slpi->mem_reloc = fw_addr;
+
+		ret = qcom_scm_pas_mem_setup(SLPI_PAS_ID,
+					slpi->mem_phys, fw_size);
+		if (ret) {
+			dev_err(&rproc->dev,
+				"unable to setup memory for image\n");
+			return ret;
+		}
+	}
+
+	return qcom_mdt_load(rproc, fw, rproc->firmware);
+}
+
+static const struct rproc_fw_ops slpi_fw_ops = {
+	.find_rsc_table = qcom_mdt_find_rsc_table,
+	.load = slpi_load,
+};
+
+static int slpi_start(struct rproc *rproc)
+{
+	struct qcom_slpi *slpi = (struct qcom_slpi *)rproc->priv;
+	int ret;
+
+	ret = clk_prepare_enable(slpi->xo);
+	if (ret)
+		return ret;
+	ret = clk_prepare_enable(slpi->aggre2_noc);
+	if (ret)
+		goto disable_xo;
+	ret = regulator_enable(slpi->cx);
+	if (ret)
+		goto disable_aggr2;
+	ret = regulator_enable(slpi->px);
+	if (ret)
+		goto disable_cx;
+	ret = qcom_scm_pas_auth_and_reset(SLPI_PAS_ID);
+	if (ret) {
+		dev_err(slpi->dev,
+			"failed to authenticate image and release reset\n");
+		goto disable_px;
+	}
+	ret = wait_for_completion_timeout(&slpi->start_done,
+					  msecs_to_jiffies(10000));
+	if (!ret) {
+		dev_err(slpi->dev, "start timed out\n");
+		qcom_scm_pas_shutdown(SLPI_PAS_ID);
+		ret = -ETIMEDOUT;
+		goto disable_px;
+	}
+	ret = 0;
+	return ret;
+disable_px:
+	regulator_disable(slpi->px);
+disable_cx:
+	regulator_disable(slpi->cx);
+disable_aggr2:
+	clk_disable_unprepare(slpi->xo);
+disable_xo:
+	clk_disable_unprepare(slpi->aggre2_noc);
+
+	return ret;
+}
+
+static int slpi_stop(struct rproc *rproc)
+{
+	struct qcom_slpi *slpi = (struct qcom_slpi *)rproc->priv;
+	int ret;
+
+	qcom_smem_state_update_bits(slpi->state,
+				    BIT(slpi->stop_bit),
+				    BIT(slpi->stop_bit));
+
+	ret = wait_for_completion_timeout(&slpi->stop_done,
+					  msecs_to_jiffies(5000));
+	if (ret == 0)
+		dev_err(slpi->dev, "timed out on wait\n");
+
+	qcom_smem_state_update_bits(slpi->state,
+				    BIT(slpi->stop_bit),
+				    0);
+
+	ret = qcom_scm_pas_shutdown(SLPI_PAS_ID);
+	if (ret)
+		dev_err(slpi->dev, "failed to shutdown: %d\n", ret);
+	return ret;
+}
+
+static void *slpi_da_to_va(struct rproc *rproc, u64 da, int len)
+{
+	struct qcom_slpi *slpi = (struct qcom_slpi *)rproc->priv;
+	int offset;
+
+	offset = da - slpi->mem_reloc;
+	if (offset < 0 || offset + len > slpi->mem_size)
+		return NULL;
+
+	return slpi->mem_region + offset;
+}
+
+static const struct rproc_ops slpi_ops = {
+	.start = slpi_start,
+	.stop = slpi_stop,
+	.da_to_va = slpi_da_to_va,
+};
+
+static irqreturn_t slpi_wdog_interrupt(int irq, void *dev)
+{
+	struct qcom_slpi *slpi = dev;
+
+	rproc_report_crash(slpi->rproc, RPROC_WATCHDOG);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t slpi_fatal_interrupt(int irq, void *dev)
+{
+	struct qcom_slpi *slpi = dev;
+	size_t len;
+	char *msg;
+
+	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, SLPI_CRASH_REASON_SMEM, &len);
+	if (!IS_ERR(msg) && len > 0 && msg[0])
+		dev_err(slpi->dev, "fatal error received: %s\n", msg);
+
+	rproc_report_crash(slpi->rproc, RPROC_FATAL_ERROR);
+	if (!IS_ERR(msg))
+		msg[0] = '\0';
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t slpi_ready_interrupt(int irq, void *dev)
+{
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t slpi_handover_interrupt(int irq, void *dev)
+{
+	struct qcom_slpi *slpi = dev;
+
+	complete(&slpi->start_done);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t slpi_stop_ack_interrupt(int irq, void *dev)
+{
+	struct qcom_slpi *slpi = dev;
+
+	complete(&slpi->stop_done);
+	return IRQ_HANDLED;
+}
+
+static int slpi_init_clock(struct qcom_slpi *slpi)
+{
+	int ret;
+
+	slpi->xo  = devm_clk_get(slpi->dev, "xo");
+	if (IS_ERR(slpi->xo)) {
+		ret = PTR_ERR(slpi->xo);
+		if (ret != -EPROBE_DEFER)
+			dev_err(slpi->dev, "failed to get xo clock");
+		return ret;
+	}
+
+	slpi->aggre2_noc = devm_clk_get(slpi->dev, "aggre2");
+	if (IS_ERR(slpi->aggre2_noc)) {
+		ret = PTR_ERR(slpi->aggre2_noc);
+		if (ret != -EPROBE_DEFER)
+			dev_err(slpi->dev, "failed to get aggre2 clock");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int slpi_init_regulator(struct qcom_slpi *slpi)
+{
+	int ret;
+
+	slpi->cx = devm_regulator_get(slpi->dev, "vdd_cx");
+	if (IS_ERR(slpi->cx))
+		return PTR_ERR(slpi->cx);
+	ret = regulator_set_voltage(slpi->cx, 5, INT_MAX);
+	if (ret) {
+		dev_err(slpi->dev,
+			"Failed to request voltage(ret:%d)\n", ret);
+		return ret;
+	}
+
+	slpi->px = devm_regulator_get(slpi->dev, "vdd_px");
+	if (IS_ERR(slpi->px))
+		return PTR_ERR(slpi->px);
+
+	return 0;
+}
+
+static int slpi_request_irq(struct qcom_slpi *slpi,
+			     struct platform_device *pdev,
+			     const char *name,
+			     irq_handler_t thread_fn)
+{
+	int ret;
+
+	ret = platform_get_irq_byname(pdev, name);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "no %s IRQ defined\n", name);
+		return ret;
+	}
+	ret = devm_request_threaded_irq(&pdev->dev, ret,
+					NULL, thread_fn,
+					IRQF_ONESHOT,
+					"slpi", slpi);
+	if (ret)
+		dev_err(&pdev->dev, "request %s IRQ failed\n", name);
+
+	return ret;
+}
+
+static int slpi_alloc_memory_region(struct qcom_slpi *slpi)
+{
+	struct device_node *node;
+	struct resource r;
+	int ret;
+
+	node = of_parse_phandle(slpi->dev->of_node, "memory-region", 0);
+	if (!node) {
+		dev_err(slpi->dev, "no memory-region specified\n");
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(node, 0, &r);
+	if (ret)
+		return ret;
+
+	slpi->mem_phys = slpi->mem_reloc = r.start;
+	slpi->mem_size = resource_size(&r);
+	slpi->mem_region = devm_ioremap_wc(slpi->dev,
+				slpi->mem_phys, slpi->mem_size);
+	if (!slpi->mem_region) {
+		dev_err(slpi->dev, "unable to map memory region: %pa+%zx\n",
+			&r.start, slpi->mem_size);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static int slpi_probe(struct platform_device *pdev)
+{
+	struct qcom_slpi *slpi;
+	struct rproc *rproc;
+	int ret;
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	if (!qcom_scm_pas_supported(SLPI_PAS_ID)) {
+		dev_err(&pdev->dev, "PAS is not available for slpi\n");
+		return -ENXIO;
+	}
+	rproc = rproc_alloc(&pdev->dev, pdev->name, &slpi_ops,
+			    SLPI_FIRMWARE_NAME, sizeof(*slpi));
+	if (!rproc) {
+		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
+		return -ENOMEM;
+	}
+
+	rproc->fw_ops = &slpi_fw_ops;
+
+	slpi = (struct qcom_slpi *)rproc->priv;
+	slpi->dev = &pdev->dev;
+	slpi->rproc = rproc;
+	platform_set_drvdata(pdev, slpi);
+
+	init_completion(&slpi->start_done);
+	init_completion(&slpi->stop_done);
+
+	ret = slpi_alloc_memory_region(slpi);
+	if (ret)
+		goto free_rproc;
+
+	ret = slpi_init_clock(slpi);
+	if (ret)
+		goto free_rproc;
+
+	ret = slpi_init_regulator(slpi);
+	if (ret)
+		goto free_rproc;
+
+	ret = slpi_request_irq(slpi, pdev, "wdog", slpi_wdog_interrupt);
+	if (ret < 0)
+		goto free_rproc;
+	slpi->wdog_irq = ret;
+
+	ret = slpi_request_irq(slpi, pdev, "fatal", slpi_fatal_interrupt);
+	if (ret < 0)
+		goto free_rproc;
+	slpi->fatal_irq = ret;
+
+	ret = slpi_request_irq(slpi, pdev, "ready", slpi_ready_interrupt);
+	if (ret < 0)
+		goto free_rproc;
+	slpi->ready_irq = ret;
+
+	ret = slpi_request_irq(slpi, pdev, "handover", slpi_handover_interrupt);
+	if (ret < 0)
+		goto free_rproc;
+	slpi->handover_irq = ret;
+
+	ret = slpi_request_irq(slpi, pdev, "stop-ack", slpi_stop_ack_interrupt);
+	if (ret < 0)
+		goto free_rproc;
+	slpi->stop_ack_irq = ret;
+
+	slpi->state = qcom_smem_state_get(&pdev->dev, "stop",
+					  &slpi->stop_bit);
+	if (IS_ERR(slpi->state)) {
+		ret = PTR_ERR(slpi->state);
+		goto free_rproc;
+	}
+
+	ret = rproc_add(rproc);
+	if (ret)
+		goto free_rproc;
+
+	return 0;
+
+free_rproc:
+	rproc_put(rproc);
+
+	return ret;
+}
+
+static int slpi_remove(struct platform_device *pdev)
+{
+	struct qcom_slpi *slpi = platform_get_drvdata(pdev);
+
+	qcom_smem_state_put(slpi->state);
+	rproc_del(slpi->rproc);
+	rproc_put(slpi->rproc);
+
+	return 0;
+}
+
+static const struct of_device_id slpi_of_match[] = {
+	{ .compatible = "qcom,msm8996-slpi-pil" },
+	{ },
+};
+
+static struct platform_driver slpi_driver = {
+	.probe = slpi_probe,
+	.remove = slpi_remove,
+	.driver = {
+		.name = "qcom_slpi_pil",
+		.of_match_table = slpi_of_match,
+	},
+};
+
+module_platform_driver(slpi_driver);
+MODULE_DESCRIPTION("Qualcomm MSM8996 slpi Peripherial Image Loader");
+MODULE_LICENSE("GPL v2");
+
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
