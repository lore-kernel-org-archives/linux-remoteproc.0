Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 4/6] clk: qcom: Add WCSS Q6DSP clock controller for QCS404
Date: Tue,  9 Oct 2018 18:35:55 +0530
Message-Id: <1539090357-20853-5-git-send-email-govinds@codeaurora.org>
In-Reply-To: <1539090357-20853-1-git-send-email-govinds@codeaurora.org>
References: <1539090357-20853-1-git-send-email-govinds@codeaurora.org>
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for the WCSS QDSP clock control used on qcs404
based devices. This would allow wcss remoteproc driver to
control the required WCSS QDSP clock/reset controls to
bring the subsystem out of reset and shutdown the WCSS QDSP.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/Kconfig         |   9 ++
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/wcsscc-qcs404.c | 290 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 300 insertions(+)
 create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 5cdcb37..9ffc003 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -253,6 +253,15 @@ config QCS_GCC_404
 	 Say Y if you want to use peripheral devices such as UART, SPI, I2C,
 	 USB, SD/eMMC, PCIe, etc.
 
+config QCS_WCSS_404
+	tristate "QCS404 WCSS Clock Controller"
+	depends on COMMON_CLK_QCOM
+	select QCS_GCC_404
+	help
+	  Support for the WCSS clock controller on QCS404 devices.
+	  Say Y if you want to use the WCSS branch clocks of the WCSS clock
+	  controller to reset the WCSS subsystem.
+
 config SDM_GCC_845
 	tristate "SDM845 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 0a4790e..d258d4f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
+obj-$(CONFIG_QCS_WCSS_404) += wcsscc-qcs404.o
 obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
 obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
diff --git a/drivers/clk/qcom/wcsscc-qcs404.c b/drivers/clk/qcom/wcsscc-qcs404.c
new file mode 100644
index 0000000..2cc6332
--- /dev/null
+++ b/drivers/clk/qcom/wcsscc-qcs404.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#include <dt-bindings/clock/qcom,wcss-qcs404.h>
+#include <linux/reset-controller.h>
+
+#include "clk-regmap.h"
+#include "clk-branch.h"
+#include "common.h"
+#include "reset.h"
+
+/* Q6SSTOP clocks */
+static struct clk_branch wcss_ahbfabric_cbcr_clk = {
+	.halt_reg = 0x1b004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x1b004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_ahbfabric_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch wcss_ahbs_cbcr_clk = {
+	.halt_reg = 0x22000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x22000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_ahbs_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch wcss_tcm_cbcr_clk = {
+	.halt_reg = 0x1c000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x1c000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_tcm_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch wcss_abhm_cbcr_clk = {
+	.halt_reg = 0x22004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x22004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_abhm_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch wcss_axim_cbcr_clk = {
+	.halt_reg = 0x1c004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x1c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_axim_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch wcss_bcr_sleep_cbcr_clk = {
+	.halt_reg = 0x6004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x6004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_bcr_sleep_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+/* TCSR clock */
+static struct clk_branch wcss_lcc_csr_cbcr_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_lcc_csr_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+/* Q6SSTOP_QDSP6SS clock */
+static struct clk_branch wcss_qdsp6ss_xo_cbcr_clk = {
+	.halt_reg = 0x38,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x38,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_qdsp6ss_xo_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch wcss_qdsp6ss_sleep_cbcr_clk = {
+	.halt_reg = 0x3c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x3c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_qdsp6ss_sleep_cbcr_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct clk_branch wcss_qdsp6ss_gfmux_clk = {
+	.halt_reg = 0x20,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x20,
+		.enable_mask = (BIT(1) | BIT(3) | BIT(8)),
+		.hw.init = &(struct clk_init_data){
+			.name = "wcss_qdsp6ss_gfmux_clk",
+			.ops = &clk_branch2_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+};
+
+static struct regmap_config wcss_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.fast_io	= true,
+};
+
+static struct clk_regmap *wcss_q6sstop_qcs405_clocks[] = {
+	[WCSS_AHBFABRIC_CBCR_CLK] = &wcss_ahbfabric_cbcr_clk.clkr,
+	[WCSS_AHBS_CBCR_CLK] = &wcss_ahbs_cbcr_clk.clkr,
+	[WCSS_TCM_CBCR_CLK] = &wcss_tcm_cbcr_clk.clkr,
+	[WCSS_AHBM_CBCR_CLK] = &wcss_abhm_cbcr_clk.clkr,
+	[WCSS_AXIM_CBCR_CLK] = &wcss_axim_cbcr_clk.clkr,
+	[WCSS_BCR_CBCR_CLK] = &wcss_bcr_sleep_cbcr_clk.clkr,
+};
+
+static const struct qcom_reset_map qdsp6ss_qcs405_resets[] = {
+	[Q6SSTOP_QDSP6SS_RESET] = {0x14, 0},
+	[Q6SSTOP_QDSP6SS_CORE_RESET] = {0x14, 1},
+	[Q6SSTOP_QDSP6SS_BUS_RESET] = {0x14, 2},
+};
+
+static const struct qcom_reset_map q6sstop_qcs405_resets[] = {
+	[Q6SSTOP_BCR_RESET] = {0x6000},
+};
+
+static const struct qcom_cc_desc wcss_q6sstop_qcs405_desc = {
+	.config = &wcss_regmap_config,
+	.clks = wcss_q6sstop_qcs405_clocks,
+	.num_clks = ARRAY_SIZE(wcss_q6sstop_qcs405_clocks),
+	.resets = q6sstop_qcs405_resets,
+	.num_resets = ARRAY_SIZE(q6sstop_qcs405_resets),
+};
+
+static struct clk_regmap *wcnss_tcsr_qcs405_clocks[] = {
+	[WCSS_LCC_CBCR_CLK] = &wcss_lcc_csr_cbcr_clk.clkr,
+};
+
+static const struct qcom_cc_desc wcnss_tcsr_qcs405_desc = {
+	.config = &wcss_regmap_config,
+	.clks = wcnss_tcsr_qcs405_clocks,
+	.num_clks = ARRAY_SIZE(wcnss_tcsr_qcs405_clocks),
+};
+
+static struct clk_regmap *wcnss_qdsp6ss_qcs405_clocks[] = {
+	[WCSS_QDSP6SS_XO_CBCR_CLK] = &wcss_qdsp6ss_xo_cbcr_clk.clkr,
+	[WCSS_QDSP6SS_SLEEP_CBCR_CLK] = &wcss_qdsp6ss_sleep_cbcr_clk.clkr,
+	[WCSS_QDSP6SS_GFMMUX_CLK] = &wcss_qdsp6ss_gfmux_clk.clkr,
+};
+
+static const struct qcom_cc_desc wcnss_qdsp6ss_qcs405_desc = {
+	.config = &wcss_regmap_config,
+	.clks = wcnss_qdsp6ss_qcs405_clocks,
+	.num_clks = ARRAY_SIZE(wcnss_qdsp6ss_qcs405_clocks),
+	.resets = qdsp6ss_qcs405_resets,
+	.num_resets = ARRAY_SIZE(qdsp6ss_qcs405_resets),
+};
+
+static int wcss_clocks_qcs405_probe(struct platform_device *pdev, int index,
+				     const struct qcom_cc_desc *desc)
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
+
+/* WCSS CC clock controller */
+static const struct of_device_id wcss_cc_qcs405_match_table[] = {
+	{ .compatible = "qcom,qcs405-wcsscc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wcss_cc_qcs405_match_table);
+
+static int wcss_cc_qcs405_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+	int ret;
+
+	wcss_regmap_config.name = "wcss_q6sstop";
+	desc = &wcss_q6sstop_qcs405_desc;
+
+	ret = wcss_clocks_qcs405_probe(pdev, 0, desc);
+	if (ret)
+		return ret;
+
+	wcss_regmap_config.name = "wcnss_tcsr";
+	desc = &wcnss_tcsr_qcs405_desc;
+
+	ret = wcss_clocks_qcs405_probe(pdev, 1, desc);
+	if (ret)
+		return ret;
+
+	wcss_regmap_config.name = "wcss_qdsp6ss";
+	desc = &wcnss_qdsp6ss_qcs405_desc;
+
+	return wcss_clocks_qcs405_probe(pdev, 2, desc);
+}
+
+static struct platform_driver wcss_cc_qcs405_driver = {
+	.probe		= wcss_cc_qcs405_probe,
+	.driver		= {
+		.name	= "qcs405-wcsscc",
+		.of_match_table = wcss_cc_qcs405_match_table,
+	},
+};
+
+static int __init wcss_cc_qcs405_init(void)
+{
+	return platform_driver_register(&wcss_cc_qcs405_driver);
+}
+subsys_initcall(wcss_cc_qcs405_init);
+
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
