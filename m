Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v2 3/3] remoteproc: qcom: Add msm8996 specific changes in mss rproc driver.
Date: Mon, 30 Jan 2017 16:14:04 +0530
Message-Id: <1485773044-31489-4-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
References: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add msm8996 support in existing mss rproc driver.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 178 ++++++++++++++++++---
 2 files changed, 154 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 674ebc6..06f51a6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -10,6 +10,7 @@ on the Qualcomm Hexagon core.
 		"qcom,q6v5-pil"
 		"qcom,msm8916-mss-pil"
 		"qcom,msm8974-mss-pil"
+		"qcom,msm8996-mss-pil"
 
 - reg:
 	Usage: required
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 35eee68..9c12a36 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -31,6 +31,7 @@
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/of_device.h>
+#include <linux/iopoll.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_mdt_loader.h"
@@ -65,6 +66,8 @@
 #define QDSP6SS_RESET_REG		0x014
 #define QDSP6SS_GFMUX_CTL_REG		0x020
 #define QDSP6SS_PWR_CTL_REG		0x030
+#define QDSP6SS_MEM_PWR_CTL		0x0B0
+#define QDSP6SS_STRAP_ACC		0x110
 
 /* AXI Halt Register Offsets */
 #define AXI_HALTREQ_REG			0x0
@@ -93,6 +96,15 @@
 #define QDSS_BHS_ON			BIT(21)
 #define QDSS_LDO_BYP			BIT(22)
 
+/* QDSP6v56 parameters */
+#define QDSP6v56_LDO_BYP		BIT(25)
+#define QDSP6v56_BHS_ON			BIT(24)
+#define QDSP6v56_CLAMP_WL		BIT(21)
+#define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
+#define HALT_CHECK_MAX_LOOPS		200
+#define QDSP6SS_XO_CBCR		0x0038
+#define QDSP6SS_ACC_OVERRIDE_VAL		0x20
+
 struct dest_vm_and_perm_info {
 	__le32 vm;
 	__le32 perm;
@@ -485,35 +497,99 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
 
 static int q6v5proc_reset(struct q6v5 *qproc)
 {
-	u32 val;
+	u64 val;
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
+			qproc->reg_base + QDSP6SS_STRAP_ACC);
+
+		/* Assert resets, stop core */
+		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
+		val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
+		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+
+		/* BHS require xo cbcr to be enabled */
+		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
+		val |= 0x1;
+		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
 
+		/* Read CLKOFF bit to go low indicating CLK is enabled */
+		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
+				val, !(val & BIT(31)), 1, HALT_CHECK_MAX_LOOPS);
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
+		val |= (Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N);
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
+		val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
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
@@ -849,6 +925,7 @@ static int q6v5_stop(struct rproc *rproc)
 {
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
 	int ret;
+	int val;
 
 	qproc->running = false;
 
@@ -866,6 +943,15 @@ static int q6v5_stop(struct rproc *rproc)
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
 	reset_control_assert(qproc->mss_restart);
 	q6v5_clk_disable(qproc->dev, qproc->active_clks,
 				qproc->active_clk_count);
@@ -1213,6 +1299,47 @@ static int q6v5_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rproc_hexagon_res msm8996_mss = {
+	.hexagon_mba_image = "mba.mbn",
+	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "vdd_mx",
+			.uV = 6,
+		},
+		{
+			.supply = "vdd_cx",
+			.uV = 7,
+			.uA = 100000,
+		},
+		{
+			.supply = "vdd_pll",
+			.uV = 1800000,
+			.uA = 100000,
+		},
+		{}
+	},
+	.active_supply = (struct qcom_mss_reg_res[]) {
+			{},
+			{}
+	},
+	.proxy_clk_names = (char*[]){
+			"xo",
+			"pnoc",
+			"qdss",
+			NULL
+	},
+	.active_clk_names = (char*[]){
+			"iface",
+			"bus",
+			"mem",
+			"gpll0_mss_clk",
+			"snoc_axi_clk",
+			"mnoc_axi_clk",
+			NULL
+	},
+	.version = MSS_MSM8996,
+};
+
 static const struct rproc_hexagon_res msm8916_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -1292,6 +1419,7 @@ static int q6v5_remove(struct platform_device *pdev)
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
