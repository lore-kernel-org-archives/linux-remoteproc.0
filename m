Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 4/4] remoteproc: qcom: q6v5-pil: Add PDC restart for modem on SDM845 SoCs
Date: Fri, 27 Jul 2018 20:58:11 +0530
Message-Id: <20180727152811.15258-4-sibis@codeaurora.org>
In-Reply-To: <20180727152811.15258-1-sibis@codeaurora.org>
References: <20180727152811.15258-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In the presence of a PDC block working with subsystem RSC,
assert/deassert PDC restart in modem start/stop path.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/remoteproc/qcom,q6v5.txt         |  4 +++
 drivers/remoteproc/qcom_q6v5_pil.c            | 27 ++++++++++++++++---
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 601dd9f389aa..124fb1dc6fb8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -51,6 +51,8 @@ on the Qualcomm Hexagon core.
 	Usage: required
 	Value type: <phandle>
 	Definition: reference to the reset-controller for the modem sub-system
+		    reference to the list of 2 reset-controllers for the modem
+		    sub-system on SDM845 SoCs
 		    reference to the list of 3 reset-controllers for the
 		    wcss sub-system
 
@@ -58,6 +60,8 @@ on the Qualcomm Hexagon core.
 	Usage: required
 	Value type: <stringlist>
 	Definition: must be "mss_restart" for the modem sub-system
+	Definition: must be "mss_restart", "pdc_restart" for the modem
+		    sub-system on SDM845 SoCs
 	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
 		    for the wcss syb-system
 
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index d57fdb34e3dd..5be794639fc3 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -149,6 +149,7 @@ struct q6v5 {
 	u32 halt_nc;
 
 	struct reset_control *mss_restart;
+	struct reset_control *pdc_restart;
 
 	struct qcom_q6v5 q6v5;
 
@@ -349,10 +350,17 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 
 static int q6v5_reset_assert(struct q6v5 *qproc)
 {
-	if (qproc->has_alt_reset)
-		return reset_control_reset(qproc->mss_restart);
-	else
-		return reset_control_assert(qproc->mss_restart);
+	int ret;
+
+	if (qproc->has_alt_reset) {
+		reset_control_assert(qproc->pdc_restart);
+		ret = reset_control_reset(qproc->mss_restart);
+		reset_control_deassert(qproc->pdc_restart);
+	} else {
+		ret = reset_control_assert(qproc->mss_restart);
+	}
+
+	return ret;
 }
 
 static int q6v5_reset_deassert(struct q6v5 *qproc)
@@ -360,9 +368,11 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
 	int ret;
 
 	if (qproc->has_alt_reset) {
+		reset_control_assert(qproc->pdc_restart);
 		writel(1, qproc->rmb_base + RMB_MBA_ALT_RESET);
 		ret = reset_control_reset(qproc->mss_restart);
 		writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
+		reset_control_deassert(qproc->pdc_restart);
 	} else {
 		ret = reset_control_deassert(qproc->mss_restart);
 	}
@@ -1182,6 +1192,15 @@ static int q6v5_init_reset(struct q6v5 *qproc)
 		return PTR_ERR(qproc->mss_restart);
 	}
 
+	if (qproc->has_alt_reset) {
+		qproc->pdc_restart = devm_reset_control_get(qproc->dev,
+							    "pdc_restart");
+		if (IS_ERR(qproc->pdc_restart)) {
+			dev_err(qproc->dev, "failed to acquire pdc restart\n");
+			return PTR_ERR(qproc->pdc_restart);
+		}
+	}
+
 	return 0;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
