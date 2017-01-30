Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: qcom: q6v5: Remove mss supply from 8916
Date: Mon, 30 Jan 2017 08:47:06 -0800
Message-Id: <20170130164706.4155-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The Q6V5 in MSM8916 doesn't have a mss supply, so remove this and update
the code to support cases without proxy or active supplies.

Cc: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 9a5149573298..79a8a371a2fb 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -160,6 +160,9 @@ static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
 	int rc;
 	int i;
 
+	if (!reg_res)
+		return 0;
+
 	for (i = 0; reg_res[i].supply; i++) {
 		regs[i].reg = devm_regulator_get(dev, reg_res[i].supply);
 		if (IS_ERR(regs[i].reg)) {
@@ -1036,14 +1039,6 @@ static const struct rproc_hexagon_res msm8916_mss = {
 		},
 		{}
 	},
-	.active_supply = (struct qcom_mss_reg_res[]) {
-		{
-			.supply = "mss",
-			.uV = 1050000,
-			.uA = 100000,
-		},
-		{}
-	},
 	.proxy_clk_names = (char*[]){
 		"xo",
 		NULL
-- 
2.11.0
