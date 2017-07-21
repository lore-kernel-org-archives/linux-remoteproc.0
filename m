Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v7 4/4] remoteproc: qcom: Add support for mss remoteproc on msm8996
Date: Fri, 21 Jul 2017 16:19:33 +0530
Message-Id: <1500634173-24416-5-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1500634173-24416-1-git-send-email-akdwived@codeaurora.org>
References: <1500634173-24416-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add support for mss boot on msm8996. Major changes
include initializing mss rproc for msm8996, making appropriate
change for executing mss reset sequence etc.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 164 ++++++++++++++++++---
 2 files changed, 141 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 92347fe..87a8e51 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -11,6 +11,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8916-mss-pil",
 		    "qcom,msm8974-mss-pil"
 
+		    "qcom,msm8996-mss-pil"
 - reg:
 	Usage: required
 	Value type: <prop-encoded-array>
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index a82b62a..808ee45 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -32,6 +32,7 @@
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/iopoll.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
@@ -64,6 +65,8 @@
 #define QDSP6SS_RESET_REG		0x014
 #define QDSP6SS_GFMUX_CTL_REG		0x020
 #define QDSP6SS_PWR_CTL_REG		0x030
+#define QDSP6SS_MEM_PWR_CTL		0x0B0
+#define QDSP6SS_STRAP_ACC		0x110
 
 /* AXI Halt Register Offsets */
 #define AXI_HALTREQ_REG			0x0
@@ -92,6 +95,15 @@
 #define QDSS_BHS_ON			BIT(21)
 #define QDSS_LDO_BYP			BIT(22)
 
+/* QDSP6v56 parameters */
+#define QDSP6v56_LDO_BYP		BIT(25)
+#define QDSP6v56_BHS_ON		BIT(24)
+#define QDSP6v56_CLAMP_WL		BIT(21)
+#define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
+#define HALT_CHECK_MAX_LOOPS		200
+#define QDSP6SS_XO_CBCR		0x0038
+#define QDSP6SS_ACC_OVERRIDE_VAL		0x20
+
 struct reg_info {
 	struct regulator *reg;
 	int uV;
@@ -110,6 +122,7 @@ struct rproc_hexagon_res {
 	struct qcom_mss_reg_res *active_supply;
 	char **proxy_clk_names;
 	char **active_clk_names;
+	int version;
 	bool need_mem_protection;
 };
 
@@ -157,6 +170,13 @@ struct q6v5 {
 	struct qcom_rproc_subdev smd_subdev;
 	int mpss_perm;
 	int mba_perm;
+	int version;
+};
+
+enum {
+	MSS_MSM8916,
+	MSS_MSM8974,
+	MSS_MSM8996,
 };
 
 static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
@@ -386,33 +406,98 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 {
 	u32 val;
 	int ret;
+	int i;
 
-	/* Assert resets, stop core */
-	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
-	val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
-	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
 
-	/* Enable power block headswitch, and wait for it to stabilize */
-	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= QDSS_BHS_ON | QDSS_LDO_BYP;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	udelay(1);
-
-	/*
-	 * Turn on memories. L2 banks should be done individually
-	 * to minimize inrush current.
-	 */
-	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= Q6SS_SLP_RET_N | Q6SS_L2TAG_SLP_NRET_N |
-		Q6SS_ETB_SLP_NRET_N | Q6SS_L2DATA_STBY_N;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= Q6SS_L2DATA_SLP_NRET_N_2;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= Q6SS_L2DATA_SLP_NRET_N_1;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= Q6SS_L2DATA_SLP_NRET_N_0;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	if (qproc->version == MSS_MSM8996) {
+		/* Override the ACC value if required */
+		writel(QDSP6SS_ACC_OVERRIDE_VAL,
+		       qproc->reg_base + QDSP6SS_STRAP_ACC);
+
+		/* Assert resets, stop core */
+		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
+		val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
+		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+
+		/* BHS require xo cbcr to be enabled */
+		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
+		val |= 0x1;
+		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
 
+		/* Read CLKOFF bit to go low indicating CLK is enabled */
+		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
+					 val, !(val & BIT(31)), 1,
+					 HALT_CHECK_MAX_LOOPS);
+		if (ret) {
+			dev_err(qproc->dev,
+				"xo cbcr enabling timed out (rc:%d)\n", ret);
+			return ret;
+		}
+		/* Enable power block headswitch and wait for it to stabilize */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= QDSP6v56_BHS_ON;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		udelay(1);
+
+		/* Put LDO in bypass mode */
+		val |= QDSP6v56_LDO_BYP;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+		/* Deassert QDSP6 compiler memory clamp */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val &= ~QDSP6v56_CLAMP_QMC_MEM;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+		/* Deassert memory peripheral sleep and L2 memory standby */
+		val |= Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+		/* Turn on L1, L2, ETB and JU memories 1 at a time */
+		val = readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
+		for (i = 19; i >= 0; i--) {
+			val |= BIT(i);
+			writel(val, qproc->reg_base +
+						QDSP6SS_MEM_PWR_CTL);
+			/*
+			 * Read back value to ensure the write is done then
+			 * wait for 1us for both memory peripheral and data
+			 * array to turn on.
+			 */
+			val |= readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
+			udelay(1);
+		}
+		/* Remove word line clamp */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val &= ~QDSP6v56_CLAMP_WL;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	} else {
+		/* Assert resets, stop core */
+		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
+		val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
+		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+
+		/* Enable power block headswitch and wait for it to stabilize */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= QDSS_BHS_ON | QDSS_LDO_BYP;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		udelay(1);
+		/*
+		 * Turn on memories. L2 banks should be done individually
+		 * to minimize inrush current.
+		 */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= Q6SS_SLP_RET_N | Q6SS_L2TAG_SLP_NRET_N |
+			Q6SS_ETB_SLP_NRET_N | Q6SS_L2DATA_STBY_N;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= Q6SS_L2DATA_SLP_NRET_N_2;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= Q6SS_L2DATA_SLP_NRET_N_1;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= Q6SS_L2DATA_SLP_NRET_N_0;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	}
 	/* Remove IO clamp */
 	val &= ~Q6SS_CLAMP_IO;
 	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
@@ -792,6 +877,15 @@ static int q6v5_stop(struct rproc *rproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 
+	if (qproc->version == MSS_MSM8996) {
+		/*
+		 * To avoid high MX current during LPASS/MSS restart.
+		 */
+		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+		val |= Q6SS_CLAMP_IO | QDSP6v56_CLAMP_WL |
+			QDSP6v56_CLAMP_QMC_MEM;
+		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	}
 	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, 0,
 				      qproc->mpss_phys, qproc->mpss_size);
 	WARN_ON(ret);
@@ -1092,6 +1186,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	qproc->version = desc->version;
 	qproc->need_mem_protection = desc->need_mem_protection;
 	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
 	if (ret < 0)
@@ -1142,6 +1237,24 @@ static int q6v5_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rproc_hexagon_res msm8996_mss = {
+	.hexagon_mba_image = "mba.mbn",
+	.proxy_clk_names = (char*[]){
+			"xo",
+			"pnoc",
+			NULL
+	},
+	.active_clk_names = (char*[]){
+			"iface",
+			"bus",
+			"mem",
+			"gpll0_mss_clk",
+			NULL
+	},
+	.need_mem_protection = true,
+	.version = MSS_MSM8996,
+};
+
 static const struct rproc_hexagon_res msm8916_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -1170,6 +1283,7 @@ static int q6v5_remove(struct platform_device *pdev)
 		NULL
 	},
 	.need_mem_protection = false,
+	.version = MSS_MSM8916,
 };
 
 static const struct rproc_hexagon_res msm8974_mss = {
@@ -1208,12 +1322,14 @@ static int q6v5_remove(struct platform_device *pdev)
 		NULL
 	},
 	.need_mem_protection = false,
+	.version = MSS_MSM8974,
 };
 
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
+	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, q6v5_of_match);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
