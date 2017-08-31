Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:37696 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751736AbdHaEqX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 31 Aug 2017 00:46:23 -0400
From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH v3 4/6] remoteproc: qcom: Split the head and tail of the  q6v5-pil rproc start function
Date: Thu, 31 Aug 2017 10:15:32 +0530
Message-Id: <1504154734-12175-5-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1504154734-12175-1-git-send-email-sricharan@codeaurora.org>
References: <1504154734-12175-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Most of the q6v5-pil start function is same for the q6v5-wcss rproc
that will be added later. So split and move out the common pieces
so that the same code can be reused.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 166 ++++++++++++++++++++-----------------
 1 file changed, 91 insertions(+), 75 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 5b5811d..19f453f 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -405,75 +405,107 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
 	return val;
 }
 
-static int q6v5proc_reset(struct q6v5 *qproc)
+static int q6v5_reset(struct q6v5 *qproc)
 {
-	u32 val;
-	int ret;
-	int i;
+	u32 ret;
+	int val, i;
 
+	/* Assert resets, stop core */
+	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
+	val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
+	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
 
-	if (qproc->version == MSS_MSM8996) {
-		/* Override the ACC value if required */
-		writel(QDSP6SS_ACC_OVERRIDE_VAL,
-		       qproc->reg_base + QDSP6SS_STRAP_ACC);
+	/* BHS require xo cbcr to be enabled */
+	val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
+	val |= 0x1;
+	writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
 
-		/* Assert resets, stop core */
-		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
-		val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
-		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+	/* Read CLKOFF bit to go low indicating CLK is enabled */
+	ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
+				 val, !(val & BIT(31)), 1,
+				 HALT_CHECK_MAX_LOOPS);
+	if (ret) {
+		dev_err(qproc->dev,
+			"xo cbcr enabling timed out (rc:%d)\n", ret);
+		return ret;
+	}
+	/* Enable power block headswitch and wait for it to stabilize */
+	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val |= QDSP6v56_BHS_ON;
+	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	udelay(1);
 
-		/* BHS require xo cbcr to be enabled */
-		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
-		val |= 0x1;
-		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
+	/* Put LDO in bypass mode */
+	val |= QDSP6v56_LDO_BYP;
+	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
-		/* Read CLKOFF bit to go low indicating CLK is enabled */
-		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
-					 val, !(val & BIT(31)), 1,
-					 HALT_CHECK_MAX_LOOPS);
-		if (ret) {
-			dev_err(qproc->dev,
-				"xo cbcr enabling timed out (rc:%d)\n", ret);
-			return ret;
-		}
-		/* Enable power block headswitch and wait for it to stabilize */
-		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		val |= QDSP6v56_BHS_ON;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	/* Deassert QDSP6 compiler memory clamp */
+	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val &= ~QDSP6v56_CLAMP_QMC_MEM;
+	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+	/* Deassert memory peripheral sleep and L2 memory standby */
+	val |= Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N;
+	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+	/* Turn on L1, L2, ETB and JU memories 1 at a time */
+	val = readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
+	for (i = 19; i >= 0; i--) {
+		val |= BIT(i);
+		writel(val, qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
+		/*
+		 * Read back value to ensure the write is done then
+		 * wait for 1us for both memory peripheral and data
+		 * array to turn on.
+		 */
+		val |= readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
 		udelay(1);
+	}
+	/* Remove word line clamp */
+	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val &= ~QDSP6v56_CLAMP_WL;
+	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
-		/* Put LDO in bypass mode */
-		val |= QDSP6v56_LDO_BYP;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	return 0;
+}
 
-		/* Deassert QDSP6 compiler memory clamp */
-		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		val &= ~QDSP6v56_CLAMP_QMC_MEM;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+static void q6v5_reset_rest(struct q6v5 *qproc)
+{
+	u32 val;
 
-		/* Deassert memory peripheral sleep and L2 memory standby */
-		val |= Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 
-		/* Turn on L1, L2, ETB and JU memories 1 at a time */
-		val = readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
-		for (i = 19; i >= 0; i--) {
-			val |= BIT(i);
-			writel(val, qproc->reg_base +
-						QDSP6SS_MEM_PWR_CTL);
-			/*
-			 * Read back value to ensure the write is done then
-			 * wait for 1us for both memory peripheral and data
-			 * array to turn on.
-			 */
-			val |= readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
-			udelay(1);
-		}
-		/* Remove word line clamp */
-		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-		val &= ~QDSP6v56_CLAMP_WL;
-		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	/* Remove IO clamp */
+	val &= ~Q6SS_CLAMP_IO;
+	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+	/* Bring core out of reset */
+	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
+	val &= ~Q6SS_CORE_ARES;
+	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+
+	/* Turn on core clock */
+	val = readl(qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
+	val |= Q6SS_CLK_ENABLE;
+	writel(val, qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
+
+	/* Start core execution */
+	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
+	val &= ~Q6SS_STOP_CORE;
+	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+}
+
+static int q6v5proc_reset(struct q6v5 *qproc)
+{
+	u32 val;
+	int ret;
+
+	if (qproc->version == MSS_MSM8996) {
+		/* Override the ACC value if required */
+		writel(QDSP6SS_ACC_OVERRIDE_VAL,
+		       qproc->reg_base + QDSP6SS_STRAP_ACC);
+		q6v5_reset(qproc);
 	} else {
 		/* Assert resets, stop core */
 		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
@@ -501,24 +533,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		val |= Q6SS_L2DATA_SLP_NRET_N_0;
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 	}
-	/* Remove IO clamp */
-	val &= ~Q6SS_CLAMP_IO;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-
-	/* Bring core out of reset */
-	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
-	val &= ~Q6SS_CORE_ARES;
-	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
 
-	/* Turn on core clock */
-	val = readl(qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
-	val |= Q6SS_CLK_ENABLE;
-	writel(val, qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
-
-	/* Start core execution */
-	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
-	val &= ~Q6SS_STOP_CORE;
-	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+	q6v5_reset_rest(qproc);
 
 	/* Wait for PBL status */
 	ret = q6v5_rmb_pbl_wait(qproc, 1000);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

