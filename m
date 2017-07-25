Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] soc: qcom: GLINK SSR notifier
Date: Mon, 24 Jul 2017 22:56:44 -0700
Message-Id: <20170725055644.20947-3-bjorn.andersson@linaro.org>
In-Reply-To: <20170725055644.20947-1-bjorn.andersson@linaro.org>
References: <20170725055644.20947-1-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This driver register as a subsystem restart notifier and will send out
notifications to remote processors that has opened the "glink_ssr" GLINK
channel.

This mechanism is used to signal any GLINK participants that a 3rd party
is gone and that the communication state has to be reset; i.e. that read
and write pointers of the GLINK FIFOs are stale.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/Kconfig     |   9 +++
 drivers/soc/qcom/Makefile    |   1 +
 drivers/soc/qcom/glink_ssr.c | 164 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 drivers/soc/qcom/glink_ssr.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 9fca977ef18d..d0fc331972d2 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -1,6 +1,15 @@
 #
 # QCOM Soc drivers
 #
+config QCOM_GLINK_SSR
+	tristate "Qualcomm Glink SSR driver"
+	depends on RPMSG
+	depends on QCOM_RPROC_COMMON
+	help
+	  Say y here to enable GLINK SSR support. The GLINK SSR driver
+	  implements the SSR protocol for notifying the remote processor about
+	  neighboring subsystems going up or down.
+
 config QCOM_GSBI
         tristate "QCOM General Serial Bus Interface"
         depends on ARCH_QCOM
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 414f0de274fa..f151de41eb93 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_PM)	+=	spm.o
diff --git a/drivers/soc/qcom/glink_ssr.c b/drivers/soc/qcom/glink_ssr.c
new file mode 100644
index 000000000000..19c7399eddb5
--- /dev/null
+++ b/drivers/soc/qcom/glink_ssr.c
@@ -0,0 +1,164 @@
+/*
+ * Copyright (c) 2014-2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017, Linaro Ltd.
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
+#include <linux/completion.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/rpmsg.h>
+#include <linux/remoteproc/qcom_rproc.h>
+
+/**
+ * struct do_cleanup_msg - The data structure for an SSR do_cleanup message
+ * version:     The G-Link SSR protocol version
+ * command:     The G-Link SSR command - do_cleanup
+ * seq_num:     Sequence number
+ * name_len:    Length of the name of the subsystem being restarted
+ * name:        G-Link edge name of the subsystem being restarted
+ */
+struct do_cleanup_msg {
+	__le32 version;
+	__le32 command;
+	__le32 seq_num;
+	__le32 name_len;
+	char name[32];
+};
+
+/**
+ * struct cleanup_done_msg - The data structure for an SSR cleanup_done message
+ * version:     The G-Link SSR protocol version
+ * response:    The G-Link SSR response to a do_cleanup command, cleanup_done
+ * seq_num:     Sequence number
+ */
+struct cleanup_done_msg {
+	__le32 version;
+	__le32 response;
+	__le32 seq_num;
+};
+
+/**
+ * G-Link SSR protocol commands
+ */
+#define GLINK_SSR_DO_CLEANUP	0
+#define GLINK_SSR_CLEANUP_DONE	1
+
+struct glink_ssr {
+	struct device *dev;
+	struct rpmsg_endpoint *ept;
+
+	struct notifier_block nb;
+
+	u32 seq_num;
+	struct completion completion;
+};
+
+static int qcom_glink_ssr_callback(struct rpmsg_device *rpdev,
+				   void *data, int len, void *priv, u32 addr)
+{
+	struct cleanup_done_msg *msg = data;
+	struct glink_ssr *ssr = dev_get_drvdata(&rpdev->dev);
+
+	if (len < sizeof(*msg)) {
+		dev_err(ssr->dev, "message too short\n");
+		return -EINVAL;
+	}
+
+	if (le32_to_cpu(msg->version) != 0)
+		return -EINVAL;
+
+	if (le32_to_cpu(msg->response) != GLINK_SSR_CLEANUP_DONE)
+		return 0;
+
+	if (le32_to_cpu(msg->seq_num) != ssr->seq_num) {
+		dev_err(ssr->dev, "invalid sequence number of response\n");
+		return -EINVAL;
+	}
+
+	complete(&ssr->completion);
+
+	return 0;
+}
+
+static int qcom_glink_ssr_notify(struct notifier_block *nb, unsigned long event,
+				 void *data)
+{
+	struct glink_ssr *ssr = container_of(nb, struct glink_ssr, nb);
+	struct do_cleanup_msg msg;
+	char *ssr_name = data;
+	int ret;
+
+	ssr->seq_num++;
+	reinit_completion(&ssr->completion);
+
+	memset(&msg, 0, sizeof(msg));
+	msg.command = cpu_to_le32(GLINK_SSR_DO_CLEANUP);
+	msg.seq_num = cpu_to_le32(ssr->seq_num);
+	msg.name_len = cpu_to_le32(strlen(ssr_name));
+	strlcpy(msg.name, ssr_name, sizeof(msg.name));
+
+	ret = rpmsg_send(ssr->ept, &msg, sizeof(msg));
+	if (ret < 0)
+		dev_err(ssr->dev, "failed to send cleanup message\n");
+
+	ret = wait_for_completion_timeout(&ssr->completion, HZ);
+	if (!ret)
+		dev_err(ssr->dev, "timeout waiting for cleanup done message\n");
+
+	return NOTIFY_DONE;
+}
+
+static int qcom_glink_ssr_probe(struct rpmsg_device *rpdev)
+{
+	struct glink_ssr *ssr;
+
+	ssr = devm_kzalloc(&rpdev->dev, sizeof(*ssr), GFP_KERNEL);
+	if (!ssr)
+		return -ENOMEM;
+
+	init_completion(&ssr->completion);
+
+	ssr->dev = &rpdev->dev;
+	ssr->ept = rpdev->ept;
+	ssr->nb.notifier_call = qcom_glink_ssr_notify;
+
+	dev_set_drvdata(&rpdev->dev, ssr);
+
+	return qcom_register_ssr_notifier(&ssr->nb);
+}
+
+static void qcom_glink_ssr_remove(struct rpmsg_device *rpdev)
+{
+	struct glink_ssr *ssr = dev_get_drvdata(&rpdev->dev);
+
+	qcom_unregister_ssr_notifier(&ssr->nb);
+}
+
+static const struct rpmsg_device_id qcom_glink_ssr_match[] = {
+	{ "glink_ssr" },
+	{}
+};
+
+static struct rpmsg_driver qcom_glink_ssr_driver = {
+	.probe = qcom_glink_ssr_probe,
+	.remove = qcom_glink_ssr_remove,
+	.callback = qcom_glink_ssr_callback,
+	.id_table = qcom_glink_ssr_match,
+	.drv = {
+		.name = "qcom_glink_ssr",
+	},
+};
+module_rpmsg_driver(qcom_glink_ssr_driver);
+
+MODULE_ALIAS("rpmsg:glink_ssr");
+MODULE_DESCRIPTION("Qualcomm GLINK SSR notifier");
+MODULE_LICENSE("GPL v2");
-- 
2.12.0
