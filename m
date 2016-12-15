Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v5 4/7] remoteproc: qcom: Modify regulator enable and disable interface.
Date: Thu, 15 Dec 2016 17:51:27 +0530
Message-Id: <1481804490-8583-5-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Regulator enable/disable routine will get additional input parameter
of regulator info and count, It will read regulator info and will do
appropriate voltage and load configuration before turning them up/down.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 100 ++++++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 30 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index e95d118..e19fb9d 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -140,7 +140,6 @@ struct q6v5 {
 	int active_reg_count;
 	int proxy_reg_count;
 
-	struct regulator_bulk_data supply[4];
 
 	struct clk *ahb_clk;
 	struct clk *axi_clk;
@@ -160,12 +159,6 @@ struct q6v5 {
 	size_t mpss_size;
 };
 
-enum {
-	Q6V5_SUPPLY_CX,
-	Q6V5_SUPPLY_MX,
-	Q6V5_SUPPLY_MSS,
-	Q6V5_SUPPLY_PLL,
-};
 
 static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
 				const struct qcom_mss_reg_res *reg_res)
@@ -194,34 +187,69 @@ static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
 	return count;
 }
 
-
-static int q6v5_regulator_enable(struct q6v5 *qproc)
+static int q6v5_regulator_enable(struct q6v5 *qproc,
+			struct reg_info *regs, int count)
 {
-	struct regulator *mss = qproc->supply[Q6V5_SUPPLY_MSS].consumer;
-	struct regulator *mx = qproc->supply[Q6V5_SUPPLY_MX].consumer;
 	int ret;
+	int i;
 
-	/* TODO: Q6V5_SUPPLY_CX is supposed to be set to super-turbo here */
+	for (i = 0; i < count; i++) {
+		if (regs[i].uV > 0) {
+			ret = regulator_set_voltage(regs[i].reg,
+					regs[i].uV, INT_MAX);
+			if (ret) {
+				dev_err(qproc->dev,
+					"Failed to request voltage for %d.\n",
+						i);
+				goto err;
+			}
+		}
 
-	ret = regulator_set_voltage(mx, 1050000, INT_MAX);
-	if (ret)
-		return ret;
+		if (regs[i].uA > 0) {
+			ret = regulator_set_load(regs[i].reg,
+						regs[i].uA);
+			if (ret < 0) {
+				dev_err(qproc->dev, "Failed to set regulator mode\n");
+				goto err;
+			}
+		}
+
+		ret = regulator_enable(regs[i].reg);
+		if (ret) {
+			dev_err(qproc->dev, "Regulator enable failed\n");
+			goto err;
+		}
+	}
+
+	return 0;
+err:
+	for (; i >= 0; i--) {
+		if (regs[i].uV > 0)
+			regulator_set_voltage(regs[i].reg, 0, INT_MAX);
 
-	regulator_set_voltage(mss, 1000000, 1150000);
+		if (regs[i].uA > 0)
+			regulator_set_load(regs[i].reg, 0);
 
-	return regulator_bulk_enable(ARRAY_SIZE(qproc->supply), qproc->supply);
+		regulator_disable(regs[i].reg);
+	}
+
+	return ret;
 }
 
-static void q6v5_regulator_disable(struct q6v5 *qproc)
+static void q6v5_regulator_disable(struct q6v5 *qproc,
+			struct reg_info *regs, int count)
 {
-	struct regulator *mss = qproc->supply[Q6V5_SUPPLY_MSS].consumer;
-	struct regulator *mx = qproc->supply[Q6V5_SUPPLY_MX].consumer;
+	int i;
 
-	/* TODO: Q6V5_SUPPLY_CX corner votes should be released */
+	for (i = 0; i < count; i++) {
+		if (regs[i].uV > 0)
+			regulator_set_voltage(regs[i].reg, 0, INT_MAX);
+
+		if (regs[i].uA > 0)
+			regulator_set_load(regs[i].reg, 0);
 
-	regulator_bulk_disable(ARRAY_SIZE(qproc->supply), qproc->supply);
-	regulator_set_voltage(mx, 0, INT_MAX);
-	regulator_set_voltage(mss, 0, 1150000);
+		regulator_disable(regs[i].reg);
+	}
 }
 
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
@@ -513,12 +541,19 @@ static int q6v5_start(struct rproc *rproc)
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
 	int ret;
 
-	ret = q6v5_regulator_enable(qproc);
+	ret = q6v5_regulator_enable(qproc, qproc->proxy_regs,
+					qproc->proxy_reg_count);
 	if (ret) {
-		dev_err(qproc->dev, "failed to enable supplies\n");
+		dev_err(qproc->dev, "failed to enable proxy supplies\n");
 		return ret;
 	}
 
+	ret = q6v5_regulator_enable(qproc, qproc->active_regs,
+					qproc->active_reg_count);
+	if (ret) {
+		dev_err(qproc->dev, "failed to enable supplies\n");
+		goto disable_proxy_reg;
+	}
 	ret = reset_control_deassert(qproc->mss_restart);
 	if (ret) {
 		dev_err(qproc->dev, "failed to deassert mss restart\n");
@@ -587,8 +622,11 @@ static int q6v5_start(struct rproc *rproc)
 assert_reset:
 	reset_control_assert(qproc->mss_restart);
 disable_vdd:
-	q6v5_regulator_disable(qproc);
-
+	q6v5_regulator_disable(qproc, qproc->active_regs,
+				qproc->active_reg_count);
+disable_proxy_reg:
+	q6v5_regulator_disable(qproc, qproc->proxy_regs,
+				qproc->proxy_reg_count);
 	return ret;
 }
 
@@ -617,8 +655,10 @@ static int q6v5_stop(struct rproc *rproc)
 	clk_disable_unprepare(qproc->rom_clk);
 	clk_disable_unprepare(qproc->axi_clk);
 	clk_disable_unprepare(qproc->ahb_clk);
-	q6v5_regulator_disable(qproc);
-
+	q6v5_regulator_disable(qproc, qproc->active_regs,
+				qproc->active_reg_count);
+	q6v5_regulator_disable(qproc, qproc->proxy_regs,
+				qproc->proxy_reg_count);
 	return 0;
 }
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
