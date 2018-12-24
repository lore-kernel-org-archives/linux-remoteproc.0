Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 3/4] remoteproc: qcom: Wait for shutdown-ack/ind on sysmon shutdown
Date: Mon, 24 Dec 2018 14:18:24 +0530
Message-Id: <20181224084824.25193-3-sibis@codeaurora.org>
In-Reply-To: <20181224084824.25193-1-sibis@codeaurora.org>
References: <20181224084824.25193-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

After sending a sysmon shutdown request to the SSCTL service on the
subsystem, wait for the service to send shutdown-ack interrupt or
an indication message to signal the completion of graceful shutdown.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_sysmon.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index c0d6ee8de995..0da83638ca99 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -36,6 +36,7 @@ struct qcom_sysmon {
 
 	struct rpmsg_endpoint *ept;
 	struct completion comp;
+	struct completion ind_comp;
 	struct mutex lock;
 
 	bool ssr_ack;
@@ -139,6 +140,7 @@ static int sysmon_callback(struct rpmsg_device *rpdev, void *data, int count,
 }
 
 #define SSCTL_SHUTDOWN_REQ		0x21
+#define SSCTL_SHUTDOWN_READY_IND	0x21
 #define SSCTL_SUBSYS_EVENT_REQ		0x23
 
 #define SSCTL_MAX_MSG_LEN		7
@@ -254,6 +256,29 @@ static struct qmi_elem_info ssctl_subsys_event_resp_ei[] = {
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
+	complete(&sysmon->ind_comp);
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
@@ -264,6 +289,7 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 	struct qmi_txn txn;
 	int ret;
 
+	reinit_completion(&sysmon->ind_comp);
 	ret = qmi_txn_init(&sysmon->qmi, &txn, ssctl_shutdown_resp_ei, &resp);
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to allocate QMI txn\n");
@@ -285,6 +311,16 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 		dev_err(sysmon->dev, "shutdown request failed\n");
 	else
 		dev_dbg(sysmon->dev, "shutdown request completed\n");
+
+	if (sysmon->q6v5) {
+		ret = qcom_q6v5_wait_for_shutdown(sysmon->q6v5, 10 * HZ);
+		if (ret) {
+			ret = try_wait_for_completion(&sysmon->ind_comp);
+			if (!ret)
+				dev_err(sysmon->dev,
+					"timeout waiting for shutdown ack\n");
+		}
+	}
 }
 
 /**
@@ -462,9 +498,11 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 	sysmon->q6v5 = q6v5;
 
 	init_completion(&sysmon->comp);
+	init_completion(&sysmon->ind_comp);
 	mutex_init(&sysmon->lock);
 
-	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops, NULL);
+	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops,
+			      qmi_indication_handler);
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to initialize qmi handle\n");
 		kfree(sysmon);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
