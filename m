Return-Path: <jeffrey.l.hugo@gmail.com>
Return-Path: <jeffrey.l.hugo@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Add support for MSM8998
Date: Thu, 31 Oct 2019 19:45:01 -0700
Message-Id: <20191101024501.22026-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
References: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
To: agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

MSM8998 sits between MSM8996 and SDM845 in terms of functionality needed to
boot the modem subsystem.  Booting mss allows for servicing the traditional
cellular usecases along with the wireless usecases such as wifi.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 52 ++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index bdf1dd00b89b..685182368aa7 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -61,6 +61,7 @@
 #define QDSP6SS_GFMUX_CTL_REG		0x020
 #define QDSP6SS_PWR_CTL_REG		0x030
 #define QDSP6SS_MEM_PWR_CTL		0x0B0
+#define QDSP6V6SS_MEM_PWR_CTL		0x034
 #define QDSP6SS_STRAP_ACC		0x110
 
 /* AXI Halt Register Offsets */
@@ -196,6 +197,7 @@ enum {
 	MSS_MSM8916,
 	MSS_MSM8974,
 	MSS_MSM8996,
+	MSS_MSM8998,
 	MSS_SDM845,
 };
 
@@ -504,7 +506,10 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		}
 
 		goto pbl_wait;
-	} else if (qproc->version == MSS_MSM8996) {
+	} else if (qproc->version == MSS_MSM8996 ||
+		   qproc->version == MSS_MSM8998) {
+		int mem_pwr_ctl;
+
 		/* Override the ACC value if required */
 		writel(QDSP6SS_ACC_OVERRIDE_VAL,
 		       qproc->reg_base + QDSP6SS_STRAP_ACC);
@@ -549,17 +554,24 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
 		/* Turn on L1, L2, ETB and JU memories 1 at a time */
-		val = readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
-		for (i = 19; i >= 0; i--) {
+		if (qproc->version == MSS_MSM8996) {
+			mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
+			i = 19;
+		} else {
+			/* MSS_MSM8998 */
+			mem_pwr_ctl = QDSP6V6SS_MEM_PWR_CTL;
+			i = 28;
+		}
+		val = readl(qproc->reg_base + mem_pwr_ctl);
+		for (; i >= 0; i--) {
 			val |= BIT(i);
-			writel(val, qproc->reg_base +
-						QDSP6SS_MEM_PWR_CTL);
+			writel(val, qproc->reg_base + mem_pwr_ctl);
 			/*
 			 * Read back value to ensure the write is done then
 			 * wait for 1us for both memory peripheral and data
 			 * array to turn on.
 			 */
-			val |= readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
+			val |= readl(qproc->reg_base + mem_pwr_ctl);
 			udelay(1);
 		}
 		/* Remove word line clamp */
@@ -1592,6 +1604,33 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.version = MSS_SDM845,
 };
 
+static const struct rproc_hexagon_res msm8998_mss = {
+	.hexagon_mba_image = "mba.mbn",
+	.proxy_clk_names = (char*[]){
+			"xo",
+			"qdss",
+			"mem",
+			NULL
+	},
+	.active_clk_names = (char*[]){
+			"iface",
+			"bus",
+			"mem",
+			"gpll0_mss",
+			"mnoc_axi",
+			"snoc_axi",
+			NULL
+	},
+	.proxy_pd_names = (char*[]){
+			"cx",
+			"mx",
+			NULL
+	},
+	.need_mem_protection = true,
+	.has_alt_reset = false,
+	.version = MSS_MSM8998,
+};
+
 static const struct rproc_hexagon_res msm8996_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_supply = (struct qcom_mss_reg_res[]) {
@@ -1698,6 +1737,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
+	{ .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss},
 	{ .compatible = "qcom,sdm845-mss-pil", .data = &sdm845_mss},
 	{ },
 };
-- 
2.17.1
