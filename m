Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 3/7] clk: qcom: define probe by index API as common API
Date: Fri, 26 Jul 2019 14:53:28 +0530
Message-Id: <20190726092332.25202-4-govinds@codeaurora.org>
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Extend the probe by index API in common code to be used
by other qcom clock controller.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/common.c         | 20 ++++++++++++++++++++
 drivers/clk/qcom/common.h         |  2 ++
 drivers/clk/qcom/lpasscc-sdm845.c | 23 ++---------------------
 3 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index a6b2f86112d8..28ddc747d703 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -306,4 +306,24 @@ int qcom_cc_probe(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 }
 EXPORT_SYMBOL_GPL(qcom_cc_probe);
 
+int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
+			   const struct qcom_cc_desc *desc)
+{
+	struct regmap *regmap;
+	struct resource *res;
+	void __iomem *base;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return qcom_cc_really_probe(pdev, desc, regmap);
+}
+EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
+
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 1e2a8bdac55a..bb39a7e106d8 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -61,5 +61,7 @@ extern int qcom_cc_really_probe(struct platform_device *pdev,
 				struct regmap *regmap);
 extern int qcom_cc_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc);
+extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
+				  const struct qcom_cc_desc *desc);
 
 #endif
diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
index e246b99dfbc6..56d3e9928892 100644
--- a/drivers/clk/qcom/lpasscc-sdm845.c
+++ b/drivers/clk/qcom/lpasscc-sdm845.c
@@ -112,25 +112,6 @@ static const struct qcom_cc_desc lpass_qdsp6ss_sdm845_desc = {
 	.num_clks = ARRAY_SIZE(lpass_qdsp6ss_sdm845_clocks),
 };
 
-static int lpass_clocks_sdm845_probe(struct platform_device *pdev, int index,
-				     const struct qcom_cc_desc *desc)
-{
-	struct regmap *regmap;
-	struct resource *res;
-	void __iomem *base;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	return qcom_cc_really_probe(pdev, desc, regmap);
-}
-
 static int lpass_cc_sdm845_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
@@ -139,14 +120,14 @@ static int lpass_cc_sdm845_probe(struct platform_device *pdev)
 	lpass_regmap_config.name = "cc";
 	desc = &lpass_cc_sdm845_desc;
 
-	ret = lpass_clocks_sdm845_probe(pdev, 0, desc);
+	ret = qcom_cc_probe_by_index(pdev, 0, desc);
 	if (ret)
 		return ret;
 
 	lpass_regmap_config.name = "qdsp6ss";
 	desc = &lpass_qdsp6ss_sdm845_desc;
 
-	return lpass_clocks_sdm845_probe(pdev, 1, desc);
+	return qcom_cc_probe_by_index(pdev, 1, desc);
 }
 
 static const struct of_device_id lpass_cc_sdm845_match_table[] = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
