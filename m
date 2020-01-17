Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/4] remoteproc: qcom: q6v5-mss: Improve readability across clk handling
Date: Fri, 17 Jan 2020 19:21:28 +0530
Message-Id: <20200117135130.3605-3-sibis@codeaurora.org>
In-Reply-To: <20200117135130.3605-1-sibis@codeaurora.org>
References: <20200117135130.3605-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, evgreen@chromium.org, p.zabel@pengutronix.de
Cc: ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Define CLKEN and CLKOFF for improving readability of Q6SS clock
handling.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 32 +++++++++++++++++-------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index f20b39c6ff0ed..e1784446d3da3 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -80,6 +80,11 @@
 #define Q6SS_CORE_ARES			BIT(1)
 #define Q6SS_BUS_ARES_ENABLE		BIT(2)
 
+/* QDSP6SS CBCR */
+#define Q6SS_CBCR_CLKEN			BIT(0)
+#define Q6SS_CBCR_CLKOFF		BIT(31)
+#define Q6SS_CBCR_TIMEOUT_US		200
+
 /* QDSP6SS_GFMUX_CTL */
 #define Q6SS_CLK_ENABLE			BIT(1)
 
@@ -100,7 +105,6 @@
 #define QDSP6v56_BHS_ON		BIT(24)
 #define QDSP6v56_CLAMP_WL		BIT(21)
 #define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
-#define HALT_CHECK_MAX_LOOPS		200
 #define QDSP6SS_XO_CBCR		0x0038
 #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
 
@@ -502,12 +506,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 	if (qproc->version == MSS_SDM845) {
 		val = readl(qproc->reg_base + QDSP6SS_SLEEP);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_SLEEP);
 
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_SLEEP,
-					 val, !(val & BIT(31)), 1,
-					 SLEEP_CHECK_MAX_LOOPS);
+					 val, !(val & Q6SS_CBCR_CLKOFF), 1,
+					 Q6SS_CBCR_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev, "QDSP6SS Sleep clock timed out\n");
 			return -ETIMEDOUT;
@@ -530,12 +534,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		goto pbl_wait;
 	} else if (qproc->version == MSS_SC7180) {
 		val = readl(qproc->reg_base + QDSP6SS_SLEEP);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_SLEEP);
 
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_SLEEP,
-					 val, !(val & BIT(31)), 1,
-					 SLEEP_CHECK_MAX_LOOPS);
+					 val, !(val & Q6SS_CBCR_CLKOFF), 1,
+					 Q6SS_CBCR_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev, "QDSP6SS Sleep clock timed out\n");
 			return -ETIMEDOUT;
@@ -543,12 +547,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 		/* Turn on the XO clock needed for PLL setup */
 		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
 
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
-					 val, !(val & BIT(31)), 1,
-					 SLEEP_CHECK_MAX_LOOPS);
+					 val, !(val & Q6SS_CBCR_CLKOFF), 1,
+					 Q6SS_CBCR_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev, "QDSP6SS XO clock timed out\n");
 			return -ETIMEDOUT;
@@ -556,7 +560,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 		/* Configure Q6 core CBCR to auto-enable after reset sequence */
 		val = readl(qproc->reg_base + QDSP6SS_CORE_CBCR);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_CORE_CBCR);
 
 		/* De-assert the Q6 stop core signal */
@@ -591,13 +595,13 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 
 		/* BHS require xo cbcr to be enabled */
 		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
-		val |= 0x1;
+		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
 
 		/* Read CLKOFF bit to go low indicating CLK is enabled */
 		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
-					 val, !(val & BIT(31)), 1,
-					 HALT_CHECK_MAX_LOOPS);
+					 val, !(val & Q6SS_CBCR_CLKOFF), 1,
+					 Q6SS_CBCR_TIMEOUT_US);
 		if (ret) {
 			dev_err(qproc->dev,
 				"xo cbcr enabling timed out (rc:%d)\n", ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
