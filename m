Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 4/7] clk: qcom: Add WCSS gcc clock control for QCS404
Date: Sat, 15 Dec 2018 16:05:54 +0530
Message-Id: <20181215103557.2748-5-govinds@codeaurora.org>
In-Reply-To: <20181215103557.2748-1-govinds@codeaurora.org>
References: <20181215103557.2748-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for the WCSS QDSP gcc clock control used on qcs404 based devices.
This would allow wcss remoteproc driver to control the required gcc clocks to
bring the subsystem out of reset.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 51 ++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index f5235cc2d3f1..efb28cff1102 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2520,6 +2520,32 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 	},
 };
 
+static struct clk_branch gcc_wdsp_q6ss_ahbs_clk = {
+	.halt_reg = 0x1e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wdsp_q6ss_ahbs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wdsp_q6ss_axim_clk = {
+	.halt_reg = 0x1e008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_wdsp_q6ss_axim_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_hw *gcc_qcs404_hws[] = {
 	&cxo.hw,
 };
@@ -2661,6 +2687,9 @@ static struct clk_regmap *gcc_qcs404_clocks[] = {
 	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
 	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
 	[GCC_DCC_XO_CLK] = &gcc_dcc_xo_clk.clkr,
+	[GCC_WCSS_Q6_AHB_CBCR_CLK] = NULL,
+	[GCC_WCSS_Q6_AXIM_CBCR_CLK] =  NULL,
+
 };
 
 static const struct qcom_reset_map gcc_qcs404_resets[] = {
@@ -2685,6 +2714,21 @@ static const struct qcom_reset_map gcc_qcs404_resets[] = {
 	[GCC_PCIE_0_SLEEP_ARES] = {0x3e040, 1},
 	[GCC_PCIE_0_PIPE_ARES] = {0x3e040, 0},
 	[GCC_EMAC_BCR] = { 0x4e000 },
+	[GCC_GENI_IR_BCR] = {0x0F000},
+	[GCC_USB_HS_BCR] = {0x41000},
+	[GCC_USB2_HS_PHY_ONLY_BCR] = {0x41034},
+	[GCC_QUSB2_PHY_BCR] = {0x4103C},
+	[GCC_USB_HS_PHY_CFG_AHB_BCR] = {0x0000C, 1},
+	[GCC_USB2A_PHY_BCR] = {0x0000C, 0},
+	[GCC_USB3_PHY_BCR] = {0x39004},
+	[GCC_USB_30_BCR] = {0x39000},
+	[GCC_USB3PHY_PHY_BCR] = {0x39008},
+	[GCC_PCIE_0_BCR] = {0x3E000},
+	[GCC_PCIE_0_PHY_BCR] = {0x3E004},
+	[GCC_PCIE_0_LINK_DOWN_BCR] = {0x3E038},
+	[GCC_PCIEPHY_0_PHY_BCR] = {0x3E03C},
+	[GCC_EMAC_BCR] = {0x4E000},
+	[GCC_WDSP_RESTART] = {0x19000},
 };
 
 static const struct regmap_config gcc_qcs404_regmap_config = {
@@ -2695,7 +2739,7 @@ static const struct regmap_config gcc_qcs404_regmap_config = {
 	.fast_io	= true,
 };
 
-static const struct qcom_cc_desc gcc_qcs404_desc = {
+static struct qcom_cc_desc gcc_qcs404_desc = {
 	.config = &gcc_qcs404_regmap_config,
 	.clks = gcc_qcs404_clocks,
 	.num_clks = ARRAY_SIZE(gcc_qcs404_clocks),
@@ -2726,6 +2770,11 @@ static int gcc_qcs404_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+#ifdef CONFIG_QCS_WCSSCC_404
+		gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CBCR_CLK] = &gcc_wdsp_q6ss_ahbs_clk.clkr;
+		gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CBCR_CLK] = &gcc_wdsp_q6ss_axim_clk.clkr;
+#endif
+
 	return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
