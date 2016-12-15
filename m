Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v5 3/7] remoteproc: qcom: Add and initialize proxy and active regulators.
Date: Thu, 15 Dec 2016 17:51:26 +0530
Message-Id: <1481804490-8583-4-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Certain regulators and clocks need voting by rproc on behalf of hexagon
only during restart operation but certain clocks and voltage need to be
voted till hexagon is up, these regulators and clocks are identified as
proxy and active resource respectively, whose handle is being obtained
by supplying proxy and active regulator string name.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 118 +++++++++++++++++++++++++++++++------
 1 file changed, 100 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 8c8b239..e95d118 100644
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
 	char **proxy_clk_string;
 	char **active_clk_string;
 };
@@ -121,6 +135,11 @@ struct q6v5 {
 	int active_clk_count;
 	int proxy_clk_count;
 
+	struct reg_info active_regs[1];
+	struct reg_info proxy_regs[3];
+	int active_reg_count;
+	int proxy_reg_count;
+
 	struct regulator_bulk_data supply[4];
 
 	struct clk *ahb_clk;
@@ -148,29 +167,34 @@ enum {
 	Q6V5_SUPPLY_PLL,
 };
 
-static int q6v5_regulator_init(struct q6v5 *qproc)
+static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
+				const struct qcom_mss_reg_res *reg_res)
 {
-	int ret;
+	int count = 0;
+	int rc;
+	int i;
 
-	qproc->supply[Q6V5_SUPPLY_CX].supply = "cx";
-	qproc->supply[Q6V5_SUPPLY_MX].supply = "mx";
-	qproc->supply[Q6V5_SUPPLY_MSS].supply = "mss";
-	qproc->supply[Q6V5_SUPPLY_PLL].supply = "pll";
+	while (reg_res[count].supply)
+	count++;
 
-	ret = devm_regulator_bulk_get(qproc->dev,
-				      ARRAY_SIZE(qproc->supply), qproc->supply);
-	if (ret < 0) {
-		dev_err(qproc->dev, "failed to get supplies\n");
-		return ret;
-	}
+	for (i = 0; i < count; i++) {
+		regs[i].reg = devm_regulator_get(dev, reg_res[i].supply);
+		if (IS_ERR(regs[i].reg)) {
+			rc = PTR_ERR(regs[i].reg);
+			if (rc != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get %s\n regulator",
+						reg_res[i].supply);
+			return rc;
+		}
 
-	regulator_set_load(qproc->supply[Q6V5_SUPPLY_CX].consumer, 100000);
-	regulator_set_load(qproc->supply[Q6V5_SUPPLY_MSS].consumer, 100000);
-	regulator_set_load(qproc->supply[Q6V5_SUPPLY_PLL].consumer, 10000);
+		regs[i].uV = reg_res[i].uV;
+		regs[i].uA = reg_res[i].uA;
+	}
 
-	return 0;
+	return count;
 }
 
+
 static int q6v5_regulator_enable(struct q6v5 *qproc)
 {
 	struct regulator *mss = qproc->supply[Q6V5_SUPPLY_MSS].consumer;
@@ -872,9 +896,21 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 	qproc->active_clk_count = ret;
 
-	ret = q6v5_regulator_init(qproc);
-	if (ret)
+	ret = q6v5_regulator_init(&pdev->dev, qproc->proxy_regs,
+					desc->proxy_supply);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to setup proxy regulators.\n");
 		goto free_rproc;
+	}
+	qproc->proxy_reg_count = ret;
+
+	ret = q6v5_regulator_init(&pdev->dev,  qproc->active_regs,
+					desc->active_supply);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to setup active regulators.\n");
+		goto free_rproc;
+	}
+	qproc->active_reg_count = ret;
 
 	ret = q6v5_init_reset(qproc);
 	if (ret)
@@ -926,12 +962,58 @@ static int q6v5_remove(struct platform_device *pdev)
 
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
+		{ NULL }
+	},
+	.active_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mss",
+			.uV = 1050000,
+			.uA = 100000,
+		},
+		{ NULL }
+	},
 	.proxy_clk_string = (char*[]){"xo", NULL},
 	.active_clk_string = (char*[]){"iface", "bus", "mem", NULL},
 };
 
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
+		{ NULL }
+	},
+	.active_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mss",
+			.uV = 1050000,
+			.uA = 100000,
+		},
+		{ NULL }
+	},
 	.proxy_clk_string = (char*[]){"xo", NULL},
 	.active_clk_string = (char*[]){"iface", "bus", "mem", NULL},
 };
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
