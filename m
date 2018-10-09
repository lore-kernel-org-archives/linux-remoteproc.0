Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 2/6] clk: qcom: Add WCSS gcc clock control for QCS404
Date: Tue,  9 Oct 2018 18:35:53 +0530
Message-Id: <1539090357-20853-3-git-send-email-govinds@codeaurora.org>
In-Reply-To: <1539090357-20853-1-git-send-email-govinds@codeaurora.org>
References: <1539090357-20853-1-git-send-email-govinds@codeaurora.org>
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for the WCSS QDSP gcc clock control used on qcs404 based devices.
This would allow wcss remoteproc driver to control the required gcc clocks to
bring the subsystem out of reset.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 6d1387e..bcbfe19 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2505,6 +2505,34 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_ahbs_cbcr_clk = {
+	.halt_reg = 0x1e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ahb_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch gcc_axim_cbcr_clk = {
+	.halt_reg = 0x1e008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_axim_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
 static struct clk_regmap *gcc_qcs404_clocks[] = {
 	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
 	[BLSP1_QUP0_I2C_APPS_CLK_SRC] = &blsp1_qup0_i2c_apps_clk_src.clkr,
@@ -2642,6 +2670,9 @@ enum {
 	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
 	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
 	[GCC_DCC_XO_CLK] = &gcc_dcc_xo_clk.clkr,
+	[GCC_WCSS_Q6_AHB_CBCR_CLK] = NULL,
+	[GCC_WCSS_Q6_AXIM_CBCR_CLK] =  NULL,
+
 };
 
 static const struct qcom_reset_map gcc_qcs404_resets[] = {
@@ -2659,6 +2690,7 @@ enum {
 	[GCC_PCIE_0_LINK_DOWN_BCR] = {0x3E038},
 	[GCC_PCIEPHY_0_PHY_BCR] = {0x3E03C},
 	[GCC_EMAC_BCR] = {0x4E000},
+	[GCC_WDSP_RESTART] = {0x19000},
 };
 
 static const struct regmap_config gcc_qcs404_regmap_config = {
@@ -2669,7 +2701,7 @@ enum {
 	.fast_io	= true,
 };
 
-static const struct qcom_cc_desc gcc_qcs404_desc = {
+static struct qcom_cc_desc gcc_qcs404_desc = {
 	.config = &gcc_qcs404_regmap_config,
 	.clks = gcc_qcs404_clocks,
 	.num_clks = ARRAY_SIZE(gcc_qcs404_clocks),
@@ -2702,6 +2734,11 @@ static int gcc_qcs404_probe(struct platform_device *pdev)
 	clk_prepare_enable(apss_ahb_clk_src.clkr.hw.clk);
 	clk_prepare_enable(gpll0_ao_out_main.clkr.hw.clk);
 
+	if (of_property_read_bool(pdev->dev.of_node, "qcom,wcss-protected")) {
+		gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CBCR_CLK] = &gcc_ahbs_cbcr_clk.clkr;
+		gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CBCR_CLK] = &gcc_axim_cbcr_clk.clkr;
+	}
+
 	return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
