Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: sysmon: Wait for shutdown-ack/ind on sysmon shutdown
Date: Wed, 21 Nov 2018 02:32:08 +0530
Message-Id: <20181120210209.9029-2-sibis@codeaurora.org>
In-Reply-To: <20181120210209.9029-1-sibis@codeaurora.org>
References: <20181120210209.9029-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

After sending a sysmon shutdown request to the SSCTL service on the
subsystem, wait for the service to send shutdown-ack interrupt or
an indication message back.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_sysmon.c | 59 +++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index e976a602b015..a545181341d1 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017, Linaro Ltd.
  */
 #include <linux/firmware.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/slab.h>
@@ -25,6 +26,7 @@ struct qcom_sysmon {
 
 	const char *name;
 
+	int shutdown_irq;
 	int ssctl_version;
 	int ssctl_instance;
 
@@ -34,6 +36,7 @@ struct qcom_sysmon {
 
 	struct rpmsg_endpoint *ept;
 	struct completion comp;
+	struct completion shutdown_comp;
 	struct mutex lock;
 
 	bool ssr_ack;
@@ -137,6 +140,7 @@ static int sysmon_callback(struct rpmsg_device *rpdev, void *data, int count,
 }
 
 #define SSCTL_SHUTDOWN_REQ		0x21
+#define SSCTL_SHUTDOWN_READY_IND	0x21
 #define SSCTL_SUBSYS_EVENT_REQ		0x23
 
 #define SSCTL_MAX_MSG_LEN		7
@@ -252,6 +256,29 @@ static struct qmi_elem_info ssctl_subsys_event_resp_ei[] = {
 	{}
 };
 
+static struct qmi_elem_info ssctl_shutdown_ind_ei[] = {
+	{}
+};
+
+static void sysmon_ind_cb(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
+			  struct qmi_txn *txn, const void *data)
+{
+	struct qcom_sysmon *sysmon = container_of(qmi, struct qcom_sysmon, qmi);
+
+	complete(&sysmon->shutdown_comp);
+}
+
+static struct qmi_msg_handler qmi_indication_handler[] = {
+	{
+		.type = QMI_INDICATION,
+		.msg_id = SSCTL_SHUTDOWN_READY_IND,
+		.ei = ssctl_shutdown_ind_ei,
+		.decoded_size = 0,
+		.fn = sysmon_ind_cb
+	},
+	{}
+};
+
 /**
  * ssctl_request_shutdown() - request shutdown via SSCTL QMI service
  * @sysmon:	sysmon context
@@ -262,6 +289,7 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 	struct qmi_txn txn;
 	int ret;
 
+	reinit_completion(&sysmon->shutdown_comp);
 	ret = qmi_txn_init(&sysmon->qmi, &txn, ssctl_shutdown_resp_ei, &resp);
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to allocate QMI txn\n");
@@ -283,6 +311,14 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 		dev_err(sysmon->dev, "shutdown request failed\n");
 	else
 		dev_dbg(sysmon->dev, "shutdown request completed\n");
+
+	if (sysmon->shutdown_irq > 0) {
+		ret = wait_for_completion_timeout(&sysmon->shutdown_comp,
+						  msecs_to_jiffies(5000));
+		if (!ret)
+			dev_err(sysmon->dev,
+				"timeout waiting for shutdown ack\n");
+	}
 }
 
 /**
@@ -432,6 +468,15 @@ static int sysmon_notify(struct notifier_block *nb, unsigned long event,
 	return NOTIFY_DONE;
 }
 
+static irqreturn_t sysmon_shutdown_interrupt(int irq, void *data)
+{
+	struct qcom_sysmon *sysmon = data;
+
+	complete(&sysmon->shutdown_comp);
+
+	return IRQ_HANDLED;
+}
+
 /**
  * qcom_add_sysmon_subdev() - create a sysmon subdev for the given remoteproc
  * @rproc:	rproc context to associate the subdev with
@@ -445,6 +490,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 					   int ssctl_instance)
 {
 	struct qcom_sysmon *sysmon;
+	struct platform_device *pdev;
 	int ret;
 
 	sysmon = kzalloc(sizeof(*sysmon), GFP_KERNEL);
@@ -453,14 +499,25 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 
 	sysmon->dev = rproc->dev.parent;
 	sysmon->rproc = rproc;
+	pdev = container_of(sysmon->dev, struct platform_device, dev);
 
 	sysmon->name = name;
 	sysmon->ssctl_instance = ssctl_instance;
 
 	init_completion(&sysmon->comp);
+	init_completion(&sysmon->shutdown_comp);
 	mutex_init(&sysmon->lock);
 
-	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops, NULL);
+	sysmon->shutdown_irq = platform_get_irq_byname(pdev, "shutdown-ack");
+	ret = devm_request_threaded_irq(sysmon->dev, sysmon->shutdown_irq,
+					NULL, sysmon_shutdown_interrupt,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"q6v5 shutdown-ack", sysmon);
+	if (ret)
+		dev_err(sysmon->dev, "failed to acquire shutdown-ack IRQ\n");
+
+	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops,
+			      qmi_indication_handler);
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to initialize qmi handle\n");
 		kfree(sysmon);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
