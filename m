Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/4] remoteproc: qcom: q6v5-pil: Explicitly get mss_restart line
Date: Fri, 27 Jul 2018 20:58:10 +0530
Message-Id: <20180727152811.15258-3-sibis@codeaurora.org>
In-Reply-To: <20180727152811.15258-1-sibis@codeaurora.org>
References: <20180727152811.15258-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Explicitly get mss_restart to facilitate adding PDC
restart line for modem on SDM845 SoCs

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index b1296d614b8b..d57fdb34e3dd 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -1176,8 +1176,7 @@ static int q6v5_init_clocks(struct device *dev, struct clk **clks,
 
 static int q6v5_init_reset(struct q6v5 *qproc)
 {
-	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
-							      NULL);
+	qproc->mss_restart = devm_reset_control_get(qproc->dev, "mss_restart");
 	if (IS_ERR(qproc->mss_restart)) {
 		dev_err(qproc->dev, "failed to acquire mss restart\n");
 		return PTR_ERR(qproc->mss_restart);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
