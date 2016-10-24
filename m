Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 3/5] remoteproc: Adding reset sequence and halt seq changes for q6v55
Date: Mon, 24 Oct 2016 21:25:57 +0530
Message-Id: <1477324559-24752-4-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
References: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, akdwived@codeaurora.org, kaushalk@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

q6v55 reset sequence is handled separately and removing idle check
before asserting reset as it has been observed it return idle some
time even without being in idle.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 103 +++++++++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index c7dca40..0fac8d8 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -536,6 +536,104 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 	return ret;
 }
 
+static int q6v6proc_reset(struct q6v5 *qproc)
+{
+	int ret, i, count;
+	u64 val;
+
+	/* Override the ACC value if required */
+	writel_relaxed(QDSP6SS_ACC_OVERRIDE_VAL,
+				qproc->reg_base + QDSP6SS_STRAP_ACC);
+
+	/* Assert resets, stop core */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_RESET_REG);
+	val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_RESET_REG);
+
+	/* BHS require xo cbcr to be enabled */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_XO_CBCR);
+	val |= 0x1;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_XO_CBCR);
+	for (count = HALT_CHECK_MAX_LOOPS; count > 0; count--) {
+		val = readl_relaxed(qproc->reg_base + QDSP6SS_XO_CBCR);
+		if (!(val & BIT(31)))
+			break;
+		udelay(1);
+	}
+
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_XO_CBCR);
+	if ((val & BIT(31)))
+		dev_err(qproc->dev, "Failed to enable xo branch clock.\n");
+
+	/* Enable power block headswitch, and wait for it to stabilize */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val |= QDSP6v55_BHS_ON;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	udelay(1);
+
+	/* Put LDO in bypass mode */
+	val |= QDSP6v55_LDO_BYP;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	/*
+	 * Turn on memories. L2 banks should be done individually
+	 * to minimize inrush current.
+	 */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val &= ~QDSP6v55_CLAMP_QMC_MEM;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+	/* Deassert memory peripheral sleep and L2 memory standby */
+	val |= (Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N);
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+	/* Turn on L1, L2, ETB and JU memories 1 at a time */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
+	for (i = 19; i >= 0; i--) {
+		val |= BIT(i);
+		writel_relaxed(val, qproc->reg_base +
+					QDSP6SS_MEM_PWR_CTL);
+		/*
+		 * Wait for 1us for both memory peripheral and
+		 * data array to turn on.
+		 */
+		 mb();
+		udelay(1);
+	}
+
+	/* Remove word line clamp */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val &= ~QDSP6v55_CLAMP_WL;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+	/* Remove IO clamp */
+	val &= ~Q6SS_CLAMP_IO;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+
+	/* Bring core out of reset */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_RESET_REG);
+	val &= ~(Q6SS_CORE_ARES | Q6SS_STOP_CORE);
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_RESET_REG);
+
+	/* Turn on core clock */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
+	val |= Q6SS_CLK_ENABLE;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
+
+
+	/* Wait for PBL status */
+	ret = q6v5_rmb_pbl_wait(qproc, 1000);
+	if (ret == -ETIMEDOUT) {
+		dev_err(qproc->dev, "PBL boot timed out\n");
+	} else if (ret != RMB_PBL_SUCCESS) {
+		dev_err(qproc->dev, "PBL returned unexpected status %d\n", ret);
+		ret = -EINVAL;
+	} else {
+		ret = 0;
+	}
+
+	return ret;
+}
+
 static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
 				   struct regmap *halt_map,
 				   u32 offset)
@@ -544,11 +642,6 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
 	unsigned int val;
 	int ret;
 
-	/* Check if we're already idle */
-	ret = regmap_read(halt_map, offset + AXI_IDLE_REG, &val);
-	if (!ret && val)
-		return;
-
 	/* Assert halt request */
 	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 1);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
