Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 6/6] remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
Date: Fri, 12 Oct 2018 15:10:44 +0530
Message-Id: <1539337244-9505-7-git-send-email-govinds@codeaurora.org>
In-Reply-To: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
References: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add non PAS WCSS remoteproc driver support for QCS404 SOC.
Add WCSS q6 bootup and shutdown sequence handled from
Application Processor SubSystem(APSS).

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss.c                | 638 +++++++++++++++++++--
 2 files changed, 601 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 601dd9f..cc83832 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -13,6 +13,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
 		    "qcom,sdm845-mss-pil"
+		    "qcom,qcs404-wcss-non-pas"
 
 - reg:
 	Usage: required
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 24e276d..5760554 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -4,14 +4,19 @@
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
  */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include "qcom_common.h"
@@ -19,10 +24,13 @@
 
 
 /* Q6SS Register Offsets */
-#define Q6SS_RESET_REG		0x014
+#define Q6SS_RESET_REG			0x014
 #define Q6SS_GFMUX_CTL_REG		0x020
 #define Q6SS_PWR_CTL_REG		0x030
 #define Q6SS_MEM_PWR_CTL		0x0B0
+#define Q6SS_STRAP_ACC			0x110
+#define Q6SS_CGC_OVERRIDE		0x034
+#define Q6SS_BCR_REG			0x6000
 
 /* AXI Halt Register Offsets */
 #define AXI_HALTREQ_REG			0x0
@@ -36,6 +44,9 @@
 #define Q6SS_CORE_ARES			BIT(1)
 #define Q6SS_BUS_ARES_ENABLE		BIT(2)
 
+/* Q6SS_BRC_RESET */
+#define Q6SS_BRC_BLK_ARES		BIT(0)
+
 /* Q6SS_GFMUX_CTL */
 #define Q6SS_CLK_ENABLE			BIT(1)
 
@@ -44,14 +55,15 @@
 #define Q6SS_SLP_RET_N			BIT(19)
 #define Q6SS_CLAMP_IO			BIT(20)
 #define QDSS_BHS_ON			BIT(21)
+#define QDSS_Q6_MEMORIES		GENMASK(15, 0)
 
 /* Q6SS parameters */
-#define Q6SS_LDO_BYP		BIT(25)
-#define Q6SS_BHS_ON		BIT(24)
-#define Q6SS_CLAMP_WL		BIT(21)
+#define Q6SS_LDO_BYP			BIT(25)
+#define Q6SS_BHS_ON			BIT(24)
+#define Q6SS_CLAMP_WL			BIT(21)
 #define Q6SS_CLAMP_QMC_MEM		BIT(22)
 #define HALT_CHECK_MAX_LOOPS		200
-#define Q6SS_XO_CBCR		GENMASK(5, 3)
+#define Q6SS_XO_CBCR			GENMASK(5, 3)
 
 /* Q6SS config/status registers */
 #define TCSR_GLOBAL_CFG0	0x0
@@ -70,12 +82,23 @@
 #define TCSR_WCSS_CLK_MASK	0x1F
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
+enum {
+	WCSS_IPQ8074,
+	WCSS_QCS404,
+};
+
 struct wcss_data {
-	void (*pas_handover)(struct qcom_q6v5 *q6v5);
 	const char *firmware_name;
 	int crash_reason_smem;
 	int version;
 	int pas_id;
+	bool has_aggre2_clk;
+	bool aon_reset_required;
+	const char *ssr_name;
+	const char *sysmon_name;
+	int ssctl_id;
+	const struct rproc_ops *ops;
+	void (*pas_handover)(struct qcom_q6v5 *q6v5);
 };
 
 struct q6v5_wcss {
@@ -83,12 +106,37 @@ struct q6v5_wcss {
 
 	void __iomem *reg_base;
 	void __iomem *rmb_base;
+	void __iomem *q6stop_base;
 
 	struct regmap *halt_map;
 	u32 halt_q6;
 	u32 halt_wcss;
 	u32 halt_nc;
 
+	struct clk *xo;
+	struct clk *aggre2_clk;
+	struct clk *ahbfabric_cbcr_clk;
+	struct clk *gcc_abhs_cbcr;
+	struct clk *gcc_axim_cbcr;
+	struct clk *lcc_csr_cbcr;
+	struct clk *ahbs_cbcr;
+	struct clk *tcm_slave_cbcr;
+	struct clk *qdsp6ss_abhm_cbcr;
+	struct clk *qdsp6ss_sleep_cbcr;
+	struct clk *qdsp6ss_axim_cbcr;
+	struct clk *qdsp6ss_xo_cbcr;
+	struct clk *qdsp6ss_core_gfmux;
+	struct clk *wcss_bcr_cbcr;
+	struct regulator *cx_supply;
+	struct regulator *px_supply;
+
+	bool has_aggre2_clk;
+	bool aon_reset_required;
+
+	struct qcom_rproc_glink glink_subdev;
+	struct qcom_rproc_ssr ssr_subdev;
+	struct qcom_sysmon *sysmon;
+
 	struct reset_control *wcss_aon_reset;
 	struct reset_control *wcss_reset;
 	struct reset_control *wcss_q6_reset;
@@ -99,7 +147,6 @@ struct q6v5_wcss {
 	phys_addr_t mem_reloc;
 	void *mem_region;
 	size_t mem_size;
-
 	int crash_reason_smem;
 	int pas_id;
 	int version;
@@ -245,6 +292,214 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	return ret;
 }
 
+static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
+{
+	unsigned long val;
+	int ret, idx;
+
+	/* Toggle the restart */
+	reset_control_assert(wcss->wcss_reset);
+	usleep_range(200, 300);
+	reset_control_deassert(wcss->wcss_reset);
+	usleep_range(200, 300);
+
+	/* Enable GCC_WDSP_Q6SS_AHBS_CBCR clock */
+	ret = clk_prepare_enable(wcss->gcc_abhs_cbcr);
+	if (ret)
+		return ret;
+
+	/* Remove reset to the WCNSS QDSP6SS */
+	val = readl(wcss->q6stop_base + Q6SS_BCR_REG);
+	val &= ~Q6SS_BRC_BLK_ARES;
+	writel(val, wcss->q6stop_base + Q6SS_BCR_REG);
+
+	/* Enable Q6SSTOP_AHBFABRIC_CBCR clock */
+	ret = clk_prepare_enable(wcss->ahbfabric_cbcr_clk);
+	if (ret)
+		goto disable_gcc_abhs_cbcr_clk;
+
+	/* Enable the LCCCSR CBC clock, Q6SSTOP_Q6SSTOP_LCC_CSR_CBCR clock */
+	ret = clk_prepare_enable(wcss->lcc_csr_cbcr);
+	if (ret)
+		goto disable_ahbfabric_cbcr_clk;
+
+	/* Enable the Q6AHBS CBC, Q6SSTOP_Q6SS_AHBS_CBCR clock */
+	ret = clk_prepare_enable(wcss->ahbs_cbcr);
+	if (ret)
+		goto disable_csr_cbcr_clk;
+
+	/* Enable the TCM slave CBC, Q6SSTOP_Q6SS_TCM_SLAVE_CBCR clock */
+	ret = clk_prepare_enable(wcss->tcm_slave_cbcr);
+	if (ret)
+		goto disable_ahbs_cbcr_clk;
+
+	/* Enable the Q6SS AHB master CBC, Q6SSTOP_Q6SS_AHBM_CBCR clock */
+	ret = clk_prepare_enable(wcss->qdsp6ss_abhm_cbcr);
+	if (ret)
+		goto disable_tcm_slave_cbcr_clk;
+
+	/* Enable the Q6SS AXI master CBC, Q6SSTOP_Q6SS_AXIM_CBCR clock */
+	ret = clk_prepare_enable(wcss->qdsp6ss_axim_cbcr);
+	if (ret)
+		goto disable_abhm_cbcr_clk;
+
+	/* Enable the Q6SS XO CBC */
+	ret = clk_prepare_enable(wcss->qdsp6ss_xo_cbcr);
+	if (ret)
+		goto disable_axim_cbcr_clk;
+
+	writel(0, wcss->reg_base + Q6SS_CGC_OVERRIDE);
+
+	/* Enable QDSP6 sleep clock clock */
+	ret = clk_prepare_enable(wcss->qdsp6ss_sleep_cbcr);
+	if (ret)
+		goto disable_xo_cbcr_clk;
+
+	/* Enable the Enable the Q6 AXI clock, GCC_WDSP_Q6SS_AXIM_CBCR*/
+	ret = clk_prepare_enable(wcss->gcc_axim_cbcr);
+	if (ret)
+		goto disable_sleep_cbcr_clk;
+
+	/* Assert resets, stop core */
+	val = readl(wcss->reg_base + Q6SS_RESET_REG);
+	val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
+	writel(val, wcss->reg_base + Q6SS_RESET_REG);
+
+	/* Program the QDSP6SS PWR_CTL register */
+	writel(0x01700000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	writel(0x03700000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	writel(0x03300000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	writel(0x033C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	/*
+	 * Enable memories by turning on the QDSP6 memory foot/head switch, one
+	 * bank at a time to avoid in-rush current
+	 */
+	for (idx = 28; idx >= 0; idx--) {
+		writel((readl(wcss->reg_base + Q6SS_MEM_PWR_CTL) |
+			(1 << idx)), wcss->reg_base + Q6SS_MEM_PWR_CTL);
+	}
+
+	writel(0x031C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+	writel(0x030C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	val = readl(wcss->reg_base + Q6SS_RESET_REG);
+	val &= ~Q6SS_CORE_ARES;
+	writel(val, wcss->reg_base + Q6SS_RESET_REG);
+
+	/* Enable the Q6 core clock at the GFM, Q6SSTOP_QDSP6SS_GFMUX_CTL */
+	ret = clk_prepare_enable(wcss->qdsp6ss_core_gfmux);
+	if (ret)
+		goto disable_gcc_axim_cbcr_clk;
+
+	/* Enable sleep clock branch needed for BCR circuit */
+	ret = clk_prepare_enable(wcss->wcss_bcr_cbcr);
+	if (ret)
+		goto disable_core_gfmux_clk;
+
+	return 0;
+
+disable_core_gfmux_clk:
+	clk_disable_unprepare(wcss->qdsp6ss_core_gfmux);
+disable_gcc_axim_cbcr_clk:
+	clk_disable_unprepare(wcss->gcc_axim_cbcr);
+disable_sleep_cbcr_clk:
+	clk_disable_unprepare(wcss->qdsp6ss_sleep_cbcr);
+disable_xo_cbcr_clk:
+	clk_disable_unprepare(wcss->qdsp6ss_xo_cbcr);
+disable_axim_cbcr_clk:
+	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
+disable_abhm_cbcr_clk:
+	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
+disable_tcm_slave_cbcr_clk:
+	clk_disable_unprepare(wcss->tcm_slave_cbcr);
+disable_ahbs_cbcr_clk:
+	clk_disable_unprepare(wcss->ahbs_cbcr);
+disable_csr_cbcr_clk:
+	clk_disable_unprepare(wcss->lcc_csr_cbcr);
+disable_ahbfabric_cbcr_clk:
+	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
+disable_gcc_abhs_cbcr_clk:
+	clk_disable_unprepare(wcss->gcc_abhs_cbcr);
+
+	return ret;
+}
+
+static int q6v5_wcss_qcs404_reset(struct q6v5_wcss *wcss)
+{
+	unsigned long val;
+
+	writel(0x80800000, wcss->reg_base + Q6SS_STRAP_ACC);
+
+	/* Start core execution */
+	val = readl(wcss->reg_base + Q6SS_RESET_REG);
+	val &= ~Q6SS_STOP_CORE;
+	writel(val, wcss->reg_base + Q6SS_RESET_REG);
+
+	return 0;
+}
+
+static int q6v5_qcs404_wcss_start(struct rproc *rproc)
+{
+	struct q6v5_wcss *wcss = rproc->priv;
+	int ret;
+
+	ret = clk_prepare_enable(wcss->xo);
+	if (ret)
+		return ret;
+
+	if (wcss->has_aggre2_clk) {
+		ret = clk_prepare_enable(wcss->aggre2_clk);
+		if (ret)
+			goto disable_xo_clk;
+	}
+
+	ret = regulator_enable(wcss->cx_supply);
+	if (ret)
+		goto disable_aggre2_clk;
+
+	ret = regulator_enable(wcss->px_supply);
+	if (ret)
+		goto disable_cx_supply;
+
+	qcom_q6v5_prepare(&wcss->q6v5);
+
+	ret = q6v5_wcss_qcs404_power_on(wcss);
+	if (ret) {
+		dev_err(wcss->dev, "wcss clk_enable failed\n");
+		goto disable_px_supply;
+	}
+
+	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
+
+	ret = q6v5_wcss_qcs404_reset(wcss);
+	if (ret)
+		dev_err(wcss->dev, "De-assert QDSP6 out of reset failed\n");
+
+	ret = qcom_q6v5_wait_for_start(&wcss->q6v5, 5 * HZ);
+	if (ret == -ETIMEDOUT) {
+		dev_err(wcss->dev, "start timed out\n");
+		goto disable_px_supply;
+	}
+
+	return 0;
+
+disable_px_supply:
+	regulator_disable(wcss->px_supply);
+disable_cx_supply:
+	regulator_disable(wcss->cx_supply);
+disable_aggre2_clk:
+	if (wcss->has_aggre2_clk)
+		clk_disable_unprepare(wcss->aggre2_clk);
+disable_xo_clk:
+	clk_disable_unprepare(wcss->xo);
+
+	return ret;
+}
+
 static void q6v5_wcss_halt_axi_port(struct q6v5_wcss *wcss,
 				    struct regmap *halt_map,
 				    u32 offset)
@@ -279,6 +534,77 @@ static void q6v5_wcss_halt_axi_port(struct q6v5_wcss *wcss,
 	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
 }
 
+static int q6v5_qcs404_wcss_shutdown(struct q6v5_wcss *wcss)
+{
+	unsigned long val;
+	int ret;
+
+	q6v5_wcss_halt_axi_port(wcss, wcss->halt_map, wcss->halt_wcss);
+
+	/* assert clamps to avoid MX current inrush */
+	val = readl(wcss->reg_base + Q6SS_PWR_CTL_REG);
+	val |= (Q6SS_CLAMP_IO | Q6SS_CLAMP_WL | Q6SS_CLAMP_QMC_MEM);
+	writel(val, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	/* Disable memories by turning off memory foot/headswitch */
+	writel((readl(wcss->reg_base + Q6SS_MEM_PWR_CTL) &
+		~QDSS_Q6_MEMORIES),
+		wcss->reg_base + Q6SS_MEM_PWR_CTL);
+
+	/* Clear the BHS_ON bit */
+	val = readl(wcss->reg_base + Q6SS_PWR_CTL_REG);
+	val &= ~Q6SS_BHS_ON;
+	writel(val, wcss->reg_base + Q6SS_PWR_CTL_REG);
+
+	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
+	clk_disable_unprepare(wcss->lcc_csr_cbcr);
+	clk_disable_unprepare(wcss->tcm_slave_cbcr);
+	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
+	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
+	clk_disable_unprepare(wcss->qdsp6ss_xo_cbcr);
+	clk_disable_unprepare(wcss->ahbs_cbcr);
+	clk_disable_unprepare(wcss->wcss_bcr_cbcr);
+	clk_disable_unprepare(wcss->qdsp6ss_core_gfmux);
+	clk_disable_unprepare(wcss->gcc_abhs_cbcr);
+
+	ret = reset_control_assert(wcss->wcss_reset);
+	if (ret) {
+		dev_err(wcss->dev, "wcss_reset failed\n");
+		return ret;
+	}
+	usleep_range(200, 300);
+
+	ret = reset_control_deassert(wcss->wcss_reset);
+	if (ret) {
+		dev_err(wcss->dev, "wcss_reset failed\n");
+		return ret;
+	}
+	usleep_range(200, 300);
+
+	clk_disable_unprepare(wcss->gcc_axim_cbcr);
+
+	return 0;
+}
+
+static int q6v5_qcs404_wcss_stop(struct rproc *rproc)
+{
+	struct q6v5_wcss *wcss = rproc->priv;
+	int ret;
+
+	/* WCSS powerdown */
+	ret = qcom_q6v5_request_stop(&wcss->q6v5);
+	if (ret == -ETIMEDOUT)
+		dev_err(wcss->dev, "timed out on wait\n");
+
+	ret = q6v5_qcs404_wcss_shutdown(wcss);
+	if (ret)
+		return ret;
+
+	qcom_q6v5_unprepare(&wcss->q6v5);
+
+	return 0;
+}
+
 static int q6v5_wcss_powerdown(struct q6v5_wcss *wcss)
 {
 	int ret;
@@ -312,7 +638,8 @@ static int q6v5_wcss_powerdown(struct q6v5_wcss *wcss)
 	}
 
 	/* 6 - De-assert WCSS_AON reset */
-	reset_control_assert(wcss->wcss_aon_reset);
+	if (wcss->aon_reset_required)
+		reset_control_assert(wcss->wcss_aon_reset);
 
 	/* 7 - Disable WCSSAON_CONFIG 13 */
 	val = readl(wcss->rmb_base + SSCAON_CONFIG);
@@ -392,6 +719,17 @@ static int q6v5_q6_powerdown(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static void q6v5_wcss_pas_handover(struct qcom_q6v5 *q6v5)
+{
+	struct q6v5_wcss *wcss = container_of(q6v5, struct q6v5_wcss, q6v5);
+
+	regulator_disable(wcss->px_supply);
+	regulator_disable(wcss->cx_supply);
+	if (wcss->has_aggre2_clk)
+		clk_disable_unprepare(wcss->aggre2_clk);
+	clk_disable_unprepare(wcss->xo);
+}
+
 static int q6v5_wcss_stop(struct rproc *rproc)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
@@ -439,7 +777,7 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 				     wcss->mem_size, &wcss->mem_reloc);
 }
 
-static const struct rproc_ops q6v5_wcss_ops = {
+static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
 	.start = q6v5_wcss_start,
 	.stop = q6v5_wcss_stop,
 	.da_to_va = q6v5_wcss_da_to_va,
@@ -447,23 +785,33 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 	.get_boot_addr = rproc_elf_get_boot_addr,
 };
 
+static const struct rproc_ops q6v5_wcss_qcs404_ops = {
+	.start = q6v5_qcs404_wcss_start,
+	.stop = q6v5_qcs404_wcss_stop,
+	.da_to_va = q6v5_wcss_da_to_va,
+	.load = q6v5_wcss_load,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+};
+
 static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss)
 {
 	struct device *dev = wcss->dev;
 
-	wcss->wcss_aon_reset = devm_reset_control_get(dev, "wcss_aon_reset");
-	if (IS_ERR(wcss->wcss_aon_reset)) {
-		dev_err(wcss->dev, "unable to acquire wcss_aon_reset\n");
-		return PTR_ERR(wcss->wcss_aon_reset);
+	if (wcss->aon_reset_required) {
+		wcss->wcss_aon_reset = devm_reset_control_get_exclusive(dev, "wcss_aon_reset");
+		if (IS_ERR(wcss->wcss_aon_reset)) {
+			dev_err(wcss->dev, "fail to acquire wcss_aon_reset\n");
+			return PTR_ERR(wcss->wcss_aon_reset);
+		}
 	}
 
-	wcss->wcss_reset = devm_reset_control_get(dev, "wcss_reset");
+	wcss->wcss_reset = devm_reset_control_get_exclusive(dev, "wcss_reset");
 	if (IS_ERR(wcss->wcss_reset)) {
 		dev_err(wcss->dev, "unable to acquire wcss_reset\n");
 		return PTR_ERR(wcss->wcss_reset);
 	}
 
-	wcss->wcss_q6_reset = devm_reset_control_get(dev, "wcss_q6_reset");
+	wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
 	if (IS_ERR(wcss->wcss_q6_reset)) {
 		dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
 		return PTR_ERR(wcss->wcss_q6_reset);
@@ -475,36 +823,73 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss)
 static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 			       struct platform_device *pdev)
 {
+	struct device_node *syscon;
 	struct of_phandle_args args;
 	struct resource *res;
 	int ret;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
-	wcss->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	wcss->reg_base = devm_ioremap(&pdev->dev, res->start,
+				      resource_size(res));
 	if (IS_ERR(wcss->reg_base))
 		return PTR_ERR(wcss->reg_base);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
-	wcss->rmb_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(wcss->rmb_base))
-		return PTR_ERR(wcss->rmb_base);
-
-	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
-					       "qcom,halt-regs", 3, 0, &args);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
-		return -EINVAL;
+	if (wcss->version == WCSS_QCS404) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   "q6stop");
+		if (!res) {
+			dev_err(&pdev->dev, "invalid q6stop_base resource\n");
+			return -EINVAL;
+		}
+
+		wcss->q6stop_base = devm_ioremap(&pdev->dev, res->start,
+						 resource_size(res));
+		if (IS_ERR(wcss->q6stop_base))
+			return PTR_ERR(wcss->q6stop_base);
+
+		syscon = of_parse_phandle(pdev->dev.of_node,
+					  "qcom,halt-regs", 0);
+		if (!syscon) {
+			dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
+			return -EINVAL;
+		}
+
+		wcss->halt_map = syscon_node_to_regmap(syscon);
+		of_node_put(syscon);
+		if (IS_ERR(wcss->halt_map))
+			return PTR_ERR(wcss->halt_map);
+
+		ret = of_property_read_u32_index(pdev->dev.of_node,
+						 "qcom,halt-regs",
+						 1, &wcss->halt_wcss);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "no offset in syscon\n");
+			return ret;
+		}
+	} else {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
+		wcss->rmb_base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(wcss->rmb_base))
+			return PTR_ERR(wcss->rmb_base);
+
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+						       "qcom,halt-regs", 3,
+							0, &args);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
+			return -EINVAL;
+		}
+
+		wcss->halt_map = syscon_node_to_regmap(args.np);
+		of_node_put(args.np);
+		if (IS_ERR(wcss->halt_map))
+			return PTR_ERR(wcss->halt_map);
+
+		wcss->halt_q6 = args.args[0];
+		wcss->halt_wcss = args.args[1];
+		wcss->halt_nc = args.args[2];
 	}
 
-	wcss->halt_map = syscon_node_to_regmap(args.np);
-	of_node_put(args.np);
-	if (IS_ERR(wcss->halt_map))
-		return PTR_ERR(wcss->halt_map);
-
-	wcss->halt_q6 = args.args[0];
-	wcss->halt_wcss = args.args[1];
-	wcss->halt_nc = args.args[2];
-
 	return 0;
 }
 
@@ -537,6 +922,144 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 	return 0;
 }
 
+static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
+{
+	int ret;
+
+	wcss->xo = devm_clk_get(wcss->dev, "xo");
+	if (IS_ERR(wcss->xo)) {
+		ret = PTR_ERR(wcss->xo);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get xo clock");
+		return ret;
+	}
+
+	if (wcss->has_aggre2_clk) {
+		wcss->aggre2_clk = devm_clk_get(wcss->dev, "aggre2");
+		if (IS_ERR(wcss->aggre2_clk)) {
+			ret = PTR_ERR(wcss->aggre2_clk);
+			if (ret != -EPROBE_DEFER)
+				dev_err(wcss->dev,
+					"failed to get aggre2 clock");
+			return ret;
+		}
+	}
+
+	wcss->gcc_abhs_cbcr = devm_clk_get(wcss->dev, "gcc_abhs_cbcr");
+	if (IS_ERR(wcss->gcc_abhs_cbcr)) {
+		ret = PTR_ERR(wcss->gcc_abhs_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get gcc_sway clock\n");
+		return PTR_ERR(wcss->gcc_abhs_cbcr);
+	}
+
+	wcss->gcc_axim_cbcr = devm_clk_get(wcss->dev, "gcc_axim_cbcr");
+	if (IS_ERR(wcss->gcc_axim_cbcr)) {
+		ret = PTR_ERR(wcss->gcc_axim_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get csr cbcr clk\n");
+		return PTR_ERR(wcss->gcc_axim_cbcr);
+	}
+
+	wcss->ahbfabric_cbcr_clk = devm_clk_get(wcss->dev,
+						"wcss_ahbfabric_cbcr");
+	if (IS_ERR(wcss->ahbfabric_cbcr_clk)) {
+		ret = PTR_ERR(wcss->ahbfabric_cbcr_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get gcc_sway clock\n");
+		return PTR_ERR(wcss->ahbfabric_cbcr_clk);
+	}
+
+	wcss->lcc_csr_cbcr = devm_clk_get(wcss->dev, "wcnss_csr_cbcr");
+	if (IS_ERR(wcss->lcc_csr_cbcr)) {
+		ret = PTR_ERR(wcss->lcc_csr_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get csr cbcr clk\n");
+		return PTR_ERR(wcss->lcc_csr_cbcr);
+	}
+
+	wcss->ahbs_cbcr = devm_clk_get(wcss->dev,
+				       "wcnss_ahbs_cbcr");
+	if (IS_ERR(wcss->ahbs_cbcr)) {
+		ret = PTR_ERR(wcss->ahbs_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get ahbs_cbcr clk\n");
+		return PTR_ERR(wcss->ahbs_cbcr);
+	}
+
+	wcss->tcm_slave_cbcr = devm_clk_get(wcss->dev,
+					    "wcnss_tcm_slave_cbcr");
+	if (IS_ERR(wcss->tcm_slave_cbcr)) {
+		ret = PTR_ERR(wcss->tcm_slave_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get tcm cbcr clk\n");
+		return PTR_ERR(wcss->tcm_slave_cbcr);
+	}
+
+	wcss->qdsp6ss_abhm_cbcr = devm_clk_get(wcss->dev, "wcnss_abhm_cbcr");
+	if (IS_ERR(wcss->qdsp6ss_abhm_cbcr)) {
+		ret = PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get abhm cbcr clk\n");
+		return PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
+	}
+
+	wcss->qdsp6ss_axim_cbcr = devm_clk_get(wcss->dev, "wcnss_axim_cbcr");
+	if (IS_ERR(wcss->qdsp6ss_axim_cbcr)) {
+		ret = PTR_ERR(wcss->qdsp6ss_axim_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get abhm cbcr clk\n");
+		return PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
+	}
+
+	wcss->qdsp6ss_sleep_cbcr = devm_clk_get(wcss->dev, "wcnss_sleep_cbcr");
+	if (IS_ERR(wcss->qdsp6ss_sleep_cbcr)) {
+		ret = PTR_ERR(wcss->qdsp6ss_sleep_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get qdsp6ss_sleep clk\n");
+		return PTR_ERR(wcss->qdsp6ss_sleep_cbcr);
+	}
+
+	wcss->qdsp6ss_xo_cbcr = devm_clk_get(wcss->dev,
+					     "wcnss_qdsp6ss_xo_cbcr");
+	if (IS_ERR(wcss->qdsp6ss_xo_cbcr)) {
+		ret = PTR_ERR(wcss->qdsp6ss_xo_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get qdsp6ss_xo_cbcr clk\n");
+		return PTR_ERR(wcss->qdsp6ss_xo_cbcr);
+	}
+
+	wcss->qdsp6ss_core_gfmux = devm_clk_get(wcss->dev, "wcnss_core_gfm");
+	if (IS_ERR(wcss->qdsp6ss_core_gfmux)) {
+		ret = PTR_ERR(wcss->qdsp6ss_core_gfmux);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get core gfm clk\n");
+		return PTR_ERR(wcss->qdsp6ss_core_gfmux);
+	}
+
+	wcss->wcss_bcr_cbcr = devm_clk_get(wcss->dev, "wcss_bcr_cbcr");
+	if (IS_ERR(wcss->wcss_bcr_cbcr)) {
+		ret = PTR_ERR(wcss->wcss_bcr_cbcr);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "failed to get bcr cbcr clk\n");
+		return PTR_ERR(wcss->wcss_bcr_cbcr);
+	}
+
+	return 0;
+}
+
+static int q6v5_wcss_init_regulator(struct q6v5_wcss *wcss)
+{
+	wcss->cx_supply = devm_regulator_get(wcss->dev, "cx");
+	if (IS_ERR(wcss->cx_supply))
+		return PTR_ERR(wcss->cx_supply);
+
+	regulator_set_load(wcss->cx_supply, 100000);
+
+	wcss->px_supply = devm_regulator_get(wcss->dev, "px");
+	return PTR_ERR_OR_ZERO(wcss->px_supply);
+}
+
 static int q6v5_wcss_probe(struct platform_device *pdev)
 {
 	const struct wcss_data *desc;
@@ -548,7 +1071,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
-	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ops,
+	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops,
 			    desc->firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
@@ -559,7 +1082,11 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	wcss->dev = &pdev->dev;
 	wcss->pas_id = desc->pas_id;
 	wcss->version = desc->version;
-	wcss->crash_reason_smem = desc->crash_reason_smem;
+	wcss->has_aggre2_clk = desc->has_aggre2_clk;
+	wcss->aon_reset_required = desc->aon_reset_required;
+	platform_set_drvdata(pdev, wcss);
+
+	wcss->version = desc->version;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -569,6 +1096,16 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	if (wcss->version == WCSS_QCS404) {
+		ret = q6v5_wcss_init_clock(wcss);
+		if (ret)
+			goto free_rproc;
+
+		ret = q6v5_wcss_init_regulator(wcss);
+		if (ret)
+			goto free_rproc;
+	}
+
 	ret = q6v5_wcss_init_reset(wcss);
 	if (ret)
 		goto free_rproc;
@@ -578,6 +1115,14 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	if (wcss->version == WCSS_QCS404) {
+		qcom_add_glink_subdev(rproc, &wcss->glink_subdev);
+		qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ssr_name);
+		wcss->sysmon = qcom_add_sysmon_subdev(rproc,
+						      desc->sysmon_name,
+						      desc->ssctl_id);
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto free_rproc;
@@ -605,11 +1150,28 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 static const struct wcss_data wcss_ipq8074_res_init = {
 	.firmware_name = "IPQ8074/q6_fw.mdt",
 	.crash_reason_smem = 421,
+	.aon_reset_required = true,
 	.pas_handover = NULL,
+	.ops = &q6v5_wcss_ipq8074_ops,
+};
+
+static const struct wcss_data wcss_qcs404_res_init = {
+	.crash_reason_smem = 421,
+	.firmware_name = "wcnss.mdt",
+	.pas_id = 6,
+	.version = WCSS_QCS404,
+	.has_aggre2_clk = false,
+	.aon_reset_required = false,
+	.ssr_name = "mpss",
+	.sysmon_name = "wcnss",
+	.ssctl_id = 0x12,
+	.ops = &q6v5_wcss_qcs404_ops,
+	.pas_handover = q6v5_wcss_pas_handover,
 };
 
 static const struct of_device_id q6v5_wcss_of_match[] = {
-	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
+	{ .compatible = "ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
+	{ .compatible = "qcom,qcs404-wcss-non-pas", .data = &wcss_qcs404_res_init },
 
 	{ },
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
