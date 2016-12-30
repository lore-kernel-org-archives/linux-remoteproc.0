Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v6 3/3] remoteproc: qcom: Initialize and enable proxy and active regulators.
Date: Fri, 30 Dec 2016 19:24:02 +0530
Message-Id: <1483106042-32118-4-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1483106042-32118-1-git-send-email-akdwived@codeaurora.org>
References: <1483106042-32118-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Certain regulators need voting by rproc on behalf of hexagon only during
restart operation but certain regulator need to be voted till hexagon
is up, these regulators are identified as proxy and active regulators
respectively. This patch provide interface to initialize, enable and
disable proxy and active regulators separately.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 226 ++++++++++++++++++++++++++++---------
 1 file changed, 172 insertions(+), 54 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 1e5e27b..932a766 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -93,8 +93,22 @@
 #define QDSS_BHS_ON			BIT(21)
 #define QDSS_LDO_BYP			BIT(22)
 
+struct reg_info {
+	struct regulator *reg;
+	int uV;
+	int uA;
+};
+
+struct qcom_mss_reg_res {
+	const char *supply;
+	int uV;
+	int uA;
+};
+
 struct rproc_hexagon_res {
 	const char *hexagon_mba_image;
+	struct qcom_mss_reg_res proxy_supply[4];
+	struct qcom_mss_reg_res active_supply[2];
 	char **proxy_clk_names;
 	char **active_clk_names;
 };
@@ -121,8 +135,10 @@ struct q6v5 {
 	int active_clk_count;
 	int proxy_clk_count;
 
-	struct regulator_bulk_data supply[4];
-
+	struct reg_info active_regs[1];
+	struct reg_info proxy_regs[3];
+	int active_reg_count;
+	int proxy_reg_count;
 
 	struct completion start_done;
 	struct completion stop_done;
@@ -138,63 +154,92 @@ struct q6v5 {
 	size_t mpss_size;
 };
 
-enum {
-	Q6V5_SUPPLY_CX,
-	Q6V5_SUPPLY_MX,
-	Q6V5_SUPPLY_MSS,
-	Q6V5_SUPPLY_PLL,
-};
-
-static int q6v5_regulator_init(struct q6v5 *qproc)
+static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
+				const struct qcom_mss_reg_res *reg_res)
 {
-	int ret;
+	int rc;
+	int i;
 
-	qproc->supply[Q6V5_SUPPLY_CX].supply = "cx";
-	qproc->supply[Q6V5_SUPPLY_MX].supply = "mx";
-	qproc->supply[Q6V5_SUPPLY_MSS].supply = "mss";
-	qproc->supply[Q6V5_SUPPLY_PLL].supply = "pll";
+	for (i = 0; reg_res[i].supply; i++) {
+		regs[i].reg = devm_regulator_get(dev, reg_res[i].supply);
+		if (IS_ERR(regs[i].reg)) {
+			rc = PTR_ERR(regs[i].reg);
+			if (rc != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get %s\n regulator",
+						reg_res[i].supply);
+			return rc;
+		}
 
-	ret = devm_regulator_bulk_get(qproc->dev,
-				      ARRAY_SIZE(qproc->supply), qproc->supply);
-	if (ret < 0) {
-		dev_err(qproc->dev, "failed to get supplies\n");
-		return ret;
+		regs[i].uV = reg_res[i].uV;
+		regs[i].uA = reg_res[i].uA;
 	}
 
-	regulator_set_load(qproc->supply[Q6V5_SUPPLY_CX].consumer, 100000);
-	regulator_set_load(qproc->supply[Q6V5_SUPPLY_MSS].consumer, 100000);
-	regulator_set_load(qproc->supply[Q6V5_SUPPLY_PLL].consumer, 10000);
-
-	return 0;
+	return i;
 }
 
-static int q6v5_regulator_enable(struct q6v5 *qproc)
+static int q6v5_regulator_enable(struct q6v5 *qproc,
+			struct reg_info *regs, int count)
 {
-	struct regulator *mss = qproc->supply[Q6V5_SUPPLY_MSS].consumer;
-	struct regulator *mx = qproc->supply[Q6V5_SUPPLY_MX].consumer;
 	int ret;
+	int i;
+
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
 
-	/* TODO: Q6V5_SUPPLY_CX is supposed to be set to super-turbo here */
+		if (regs[i].uA > 0) {
+			ret = regulator_set_load(regs[i].reg,
+						regs[i].uA);
+			if (ret < 0) {
+				dev_err(qproc->dev, "Failed to set regulator mode\n");
+				goto err;
+			}
+		}
 
-	ret = regulator_set_voltage(mx, 1050000, INT_MAX);
-	if (ret)
-		return ret;
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
+
+		regulator_disable(regs[i].reg);
+	}
 
-	return regulator_bulk_enable(ARRAY_SIZE(qproc->supply), qproc->supply);
+	return ret;
 }
 
-static void q6v5_regulator_disable(struct q6v5 *qproc)
+static void q6v5_regulator_disable(struct q6v5 *qproc,
+			struct reg_info *regs, int count)
 {
-	struct regulator *mss = qproc->supply[Q6V5_SUPPLY_MSS].consumer;
-	struct regulator *mx = qproc->supply[Q6V5_SUPPLY_MX].consumer;
+	int i;
+
+	for (i = 0; i < count; i++) {
+		if (regs[i].uV > 0)
+			regulator_set_voltage(regs[i].reg, 0, INT_MAX);
 
-	/* TODO: Q6V5_SUPPLY_CX corner votes should be released */
+		if (regs[i].uA > 0)
+			regulator_set_load(regs[i].reg, 0);
 
-	regulator_bulk_disable(ARRAY_SIZE(qproc->supply), qproc->supply);
-	regulator_set_voltage(mx, 0, INT_MAX);
-	regulator_set_voltage(mss, 0, 1150000);
+		regulator_disable(regs[i].reg);
+	}
 }
 
 static int q6v5_clk_enable(struct device *dev,
@@ -517,9 +562,10 @@ static int q6v5_start(struct rproc *rproc)
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
 
@@ -527,12 +573,19 @@ static int q6v5_start(struct rproc *rproc)
 					qproc->proxy_clk_count);
 	if (ret) {
 		dev_err(qproc->dev, "failed to enable proxy clocks\n");
-		goto disable_vdd;
+		goto disable_proxy_reg;
+	}
+
+	ret = q6v5_regulator_enable(qproc, qproc->active_regs,
+					qproc->active_reg_count);
+	if (ret) {
+		dev_err(qproc->dev, "failed to enable supplies\n");
+		goto disable_proxy_clk;
 	}
 	ret = reset_control_deassert(qproc->mss_restart);
 	if (ret) {
 		dev_err(qproc->dev, "failed to deassert mss restart\n");
-		goto disable_proxy_clk;
+		goto disable_vdd;
 	}
 
 	ret = q6v5_clk_enable(qproc->dev, qproc->active_clks,
@@ -575,8 +628,10 @@ static int q6v5_start(struct rproc *rproc)
 
 	qproc->running = true;
 
-	/* TODO: All done, release the handover resources */
-
+	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
+				qproc->proxy_clk_count);
+	q6v5_regulator_disable(qproc, qproc->proxy_regs,
+				qproc->proxy_reg_count);
 	return 0;
 
 halt_axi_ports:
@@ -587,12 +642,15 @@ static int q6v5_start(struct rproc *rproc)
 				qproc->active_clk_count);
 assert_reset:
 	reset_control_assert(qproc->mss_restart);
+disable_vdd:
+	q6v5_regulator_disable(qproc, qproc->active_regs,
+				qproc->active_reg_count);
 disable_proxy_clk:
 	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
 				qproc->proxy_clk_count);
-disable_vdd:
-	q6v5_regulator_disable(qproc);
-
+disable_proxy_reg:
+	q6v5_regulator_disable(qproc, qproc->proxy_regs,
+				qproc->proxy_reg_count);
 	return ret;
 }
 
@@ -622,8 +680,10 @@ static int q6v5_stop(struct rproc *rproc)
 				qproc->active_clk_count);
 	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
 				qproc->proxy_clk_count);
-	q6v5_regulator_disable(qproc);
-
+	q6v5_regulator_disable(qproc, qproc->active_regs,
+				qproc->active_reg_count);
+	q6v5_regulator_disable(qproc, qproc->proxy_regs,
+				qproc->proxy_reg_count);
 	return 0;
 }
 
@@ -897,9 +957,21 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 	qproc->active_clk_count = ret;
 
-	ret = q6v5_regulator_init(qproc);
-	if (ret)
+	ret = q6v5_regulator_init(&pdev->dev, qproc->proxy_regs,
+					desc->proxy_supply);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get proxy regulators.\n");
+		goto free_rproc;
+	}
+	qproc->proxy_reg_count = ret;
+
+	ret = q6v5_regulator_init(&pdev->dev,  qproc->active_regs,
+					desc->active_supply);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get active regulators.\n");
 		goto free_rproc;
+	}
+	qproc->active_reg_count = ret;
 
 	ret = q6v5_init_reset(qproc);
 	if (ret)
@@ -951,6 +1023,29 @@ static int q6v5_remove(struct platform_device *pdev)
 
 static const struct rproc_hexagon_res msm8916_mss = {
 	.hexagon_mba_image = "mba.mbn",
+	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mx",
+			.uV = 1050000,
+		},
+		{
+			.supply = "cx",
+			.uA = 100000,
+		},
+		{
+			.supply = "pll",
+			.uA = 100000,
+		},
+		{}
+	},
+	.active_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mss",
+			.uV = 1050000,
+			.uA = 100000,
+		},
+		{}
+	},
 	.proxy_clk_names = (char*[]){
 			"xo",
 			NULL
@@ -965,6 +1060,29 @@ static int q6v5_remove(struct platform_device *pdev)
 
 static const struct rproc_hexagon_res msm8974_mss = {
 	.hexagon_mba_image = "mba.b00",
+	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mx",
+			.uV = 1050000,
+		},
+		{
+			.supply = "cx",
+			.uA = 100000,
+		},
+		{
+			.supply = "pll",
+			.uA = 100000,
+		},
+		{}
+	},
+	.active_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mss",
+			.uV = 1050000,
+			.uA = 100000,
+		},
+		{}
+	},
 	.proxy_clk_names = (char*[]){
 			"xo",
 			NULL
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
