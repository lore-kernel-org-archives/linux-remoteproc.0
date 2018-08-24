Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 6/6] remoteproc: qcom: q6v5-pil: Add PDC reset for modem on SDM845 SoCs
Date: Fri, 24 Aug 2018 18:49:00 +0530
Message-Id: <20180824131900.5353-7-sibis@codeaurora.org>
In-Reply-To: <20180824131900.5353-1-sibis@codeaurora.org>
References: <20180824131900.5353-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In the presence of a PDC block working with subsystem RSC, assert/deassert
PDC reset in modem start/stop path.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 968413edf0c8..835fa005fe3e 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -149,6 +149,7 @@ struct q6v5 {
 	u32 halt_nc;
 
 	struct reset_control *mss_restart;
+	struct reset_control *pdc_reset;
 
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
+		reset_control_assert(qproc->pdc_reset);
+		ret = reset_control_reset(qproc->mss_restart);
+		reset_control_deassert(qproc->pdc_reset);
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
+		reset_control_assert(qproc->pdc_reset);
 		writel(1, qproc->rmb_base + RMB_MBA_ALT_RESET);
 		ret = reset_control_reset(qproc->mss_restart);
 		writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
+		reset_control_deassert(qproc->pdc_reset);
 	} else {
 		ret = reset_control_deassert(qproc->mss_restart);
 	}
@@ -1183,6 +1193,15 @@ static int q6v5_init_reset(struct q6v5 *qproc)
 		return PTR_ERR(qproc->mss_restart);
 	}
 
+	if (qproc->has_alt_reset) {
+		qproc->pdc_reset = devm_reset_control_get_exclusive(qproc->dev,
+								"pdc_reset");
+		if (IS_ERR(qproc->pdc_reset)) {
+			dev_err(qproc->dev, "failed to acquire pdc reset\n");
+			return PTR_ERR(qproc->pdc_reset);
+		}
+	}
+
 	return 0;
 }
 
@@ -1303,12 +1322,12 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 	qproc->active_reg_count = ret;
 
+	qproc->has_alt_reset = desc->has_alt_reset;
 	ret = q6v5_init_reset(qproc);
 	if (ret)
 		goto free_rproc;
 
 	qproc->version = desc->version;
-	qproc->has_alt_reset = desc->has_alt_reset;
 	qproc->need_mem_protection = desc->need_mem_protection;
 
 	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
