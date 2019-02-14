Return-Path: <xiaoxiang781216@gmail.com>
Return-Path: <xiaoxiang781216@gmail.com>
From: Xiang Xiao <xiaoxiang781216@gmail.com>
Subject: [PATCH V2 2/2] rpmsg: add syslog redirection driver
Date: Thu, 14 Feb 2019 14:02:38 +0800
Message-Id: <1550124158-1111-2-git-send-email-xiaoxiang@xiaomi.com>
In-Reply-To: <1550124158-1111-1-git-send-email-xiaoxiang@xiaomi.com>
References: <1550124158-1111-1-git-send-email-xiaoxiang@xiaomi.com>
To: rdunlap@infradead.org, gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com, andriy.shevchenko@linux.intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, wendy.liang@xilinx.com, arnaud.pouliquen@st.com, kumar.gala@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Guiding Li <liguiding@pinecone.net>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Guiding Li <liguiding@pinecone.net>

This driver allows the remote processor to redirect the output of
syslog or printf into the kernel log, which is very useful to see
what happen in the remote side.

Signed-off-by: Guiding Li <liguiding@pinecone.net>
---
 drivers/rpmsg/Kconfig        |  12 ++++
 drivers/rpmsg/Makefile       |   1 +
 drivers/rpmsg/rpmsg_syslog.c | 163 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)
 create mode 100644 drivers/rpmsg/rpmsg_syslog.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index d0322b4..13ead55 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -15,6 +15,18 @@ config RPMSG_CHAR
 	  in /dev. They make it possible for user-space programs to send and
 	  receive rpmsg packets.
 
+config RPMSG_SYSLOG
+	tristate "RPMSG syslog redirection"
+	depends on RPMSG
+	help
+	  Say Y here to redirect the syslog/printf from remote processor into
+	  the kernel log which is very useful to see what happened in the remote
+	  side.
+
+	  If the remote processor hangs during bootup or panics during runtime,
+	  we can even cat /sys/kernel/debug/remoteproc/remoteprocX/trace0 to
+	  get the last log which hasn't been output yet.
+
 config RPMSG_QCOM_GLINK_NATIVE
 	tristate
 	select RPMSG
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 9aa8595..bfd22df 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
+obj-$(CONFIG_RPMSG_SYSLOG)	+= rpmsg_syslog.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_NATIVE) += qcom_glink_native.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
diff --git a/drivers/rpmsg/rpmsg_syslog.c b/drivers/rpmsg/rpmsg_syslog.c
new file mode 100644
index 0000000..b7a0d27
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_syslog.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017 Pinecone Inc.
+ *
+ * redirect syslog/printf from remote to the kernel.
+ */
+
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+#include <linux/slab.h>
+
+#define RPMSG_SYSLOG_TRANSFER		0
+#define RPMSG_SYSLOG_TRANSFER_DONE	1
+#define RPMSG_SYSLOG_SUSPEND		2
+#define RPMSG_SYSLOG_RESUME		3
+
+struct rpmsg_syslog_header {
+	u32				command;
+	s32				result;
+} __packed;
+
+struct rpmsg_syslog_transfer {
+	struct rpmsg_syslog_header	header;
+	u32				count;
+	char				data[0];
+} __packed;
+
+#define rpmsg_syslog_suspend		rpmsg_syslog_header
+#define rpmsg_syslog_resume		rpmsg_syslog_header
+#define rpmsg_syslog_transfer_done	rpmsg_syslog_header
+
+struct rpmsg_syslog {
+	char				*buf;
+	unsigned int			next;
+	unsigned int			size;
+};
+
+static int rpmsg_syslog_callback(struct rpmsg_device *rpdev,
+				 void *data, int len, void *priv_, u32 src)
+{
+	struct rpmsg_syslog *priv = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_syslog_transfer *msg = data;
+	struct rpmsg_syslog_transfer_done done;
+	unsigned int copied = msg->count;
+	unsigned int printed = 0;
+	const char *nl;
+
+	if (msg->header.command != RPMSG_SYSLOG_TRANSFER)
+		return -EINVAL;
+
+	/* output the message before '\n' to the kernel log */
+	nl = memrchr(msg->data, '\n', msg->count);
+	if (nl) {
+		printed = nl + 1 - msg->data;
+		copied = msg->count - printed;
+
+		if (priv->next) {
+			pr_info("%.*s%.*s", priv->next,
+				priv->buf, printed, msg->data);
+			priv->next = 0;
+		} else {
+			pr_info("%.*s", printed, msg->data);
+		}
+	}
+
+	/* append the message after '\n' to the buffer */
+	if (copied != 0) {
+		unsigned int newsize = priv->next + copied;
+
+		if (newsize > priv->size) {
+			char *newbuf;
+
+			newbuf = krealloc(priv->buf, newsize, GFP_KERNEL);
+			if (newbuf) {
+				priv->buf  = newbuf;
+				priv->size = newsize;
+			} else {
+				copied = priv->size - priv->next;
+			}
+		}
+
+		strncpy(priv->buf + priv->next, msg->data + printed, copied);
+		priv->next += copied;
+	}
+
+	done.command = RPMSG_SYSLOG_TRANSFER_DONE;
+	done.result  = printed + copied;
+	return rpmsg_send(rpdev->ept, &done, sizeof(done));
+}
+
+static int rpmsg_syslog_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_syslog *priv;
+
+	priv = devm_kzalloc(&rpdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&rpdev->dev, priv);
+	return 0;
+}
+
+static void rpmsg_syslog_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_syslog *priv = dev_get_drvdata(&rpdev->dev);
+
+	/* flush the buffered log if need */
+	if (priv->next)
+		pr_info("%.*s\n", priv->next, priv->buf);
+	kfree(priv->buf);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int rpmsg_syslog_dev_suspend(struct device *dev)
+{
+	struct rpmsg_device *rpdev = dev_get_drvdata(dev);
+	struct rpmsg_syslog_suspend msg = {
+		.command = RPMSG_SYSLOG_SUSPEND,
+	};
+
+	return rpmsg_send(rpdev->ept, &msg, sizeof(msg));
+}
+
+static int rpmsg_syslog_dev_resume(struct device *dev)
+{
+	struct rpmsg_device *rpdev = dev_get_drvdata(dev);
+	struct rpmsg_syslog_resume msg = {
+		.command = RPMSG_SYSLOG_RESUME,
+	};
+
+	return rpmsg_send(rpdev->ept, &msg, sizeof(msg));
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(rpmsg_syslog_pm,
+			rpmsg_syslog_dev_suspend,
+			rpmsg_syslog_dev_resume);
+
+static const struct rpmsg_device_id rpmsg_syslog_id_table[] = {
+	{ .name = "rpmsg-syslog" },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_syslog_id_table);
+
+static struct rpmsg_driver rpmsg_syslog_driver = {
+	.drv = {
+		.name  = "rpmsg_syslog",
+		.owner = THIS_MODULE,
+		.pm    = &rpmsg_syslog_pm,
+	},
+
+	.id_table = rpmsg_syslog_id_table,
+	.probe    = rpmsg_syslog_probe,
+	.callback = rpmsg_syslog_callback,
+	.remove   = rpmsg_syslog_remove,
+};
+
+module_rpmsg_driver(rpmsg_syslog_driver);
+
+MODULE_ALIAS("rpmsg:rpmsg_syslog");
+MODULE_AUTHOR("Guiding Li <liguiding@pinecone.net>");
+MODULE_DESCRIPTION("rpmsg syslog redirection driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
