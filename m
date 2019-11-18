Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:52312
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726647AbfKRVnL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:11 -0500
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 01/16] remoteproc: q6v5-mss: fixup MSM8998 MSS out of reset sequence
Date: Mon, 18 Nov 2019 21:43:10 +0000
Message-ID: <0101016e80782dd7-2617455b-7d73-4e68-8a9a-b63c29e9ad76-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Fixup the following in the MSS out of reset sequence on MSM8998:
* skip ACC override on MSM8998.
* wait for BHS_EN_REST_ACK to be set before setting the LDO to bypass.
* remove "mem" clock from the active pool.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 471128a2e7239..2becf6dade936 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -100,6 +100,11 @@
 #define QDSP6SS_XO_CBCR		0x0038
 #define QDSP6SS_ACC_OVERRIDE_VAL		0x20
 
+/* QDSP6v62 parameters */
+#define QDSP6SS_BHS_EN_REST_ACK		BIT(0)
+#define BHS_CHECK_MAX_LOOPS		200
+#define QDSP6SS_BHS_STATUS		0x0C4
+
 /* QDSP6v65 parameters */
 #define QDSP6SS_SLEEP                   0x3C
 #define QDSP6SS_BOOT_CORE_START         0x400
@@ -505,8 +510,9 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		int mem_pwr_ctl;
 
 		/* Override the ACC value if required */
-		writel(QDSP6SS_ACC_OVERRIDE_VAL,
-		       qproc->reg_base + QDSP6SS_STRAP_ACC);
+		if (qproc->version == MSS_MSM8996)
+			writel(QDSP6SS_ACC_OVERRIDE_VAL,
+			       qproc->reg_base + QDSP6SS_STRAP_ACC);
 
 		/* Assert resets, stop core */
 		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
@@ -534,6 +540,18 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 		udelay(1);
 
+		/* wait for BHS_EN_REST_ACK to be set */
+		if (qproc->version == MSS_MSM8998) {
+			ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BHS_STATUS,
+						 val, (val & QDSP6SS_BHS_EN_REST_ACK),
+						 1, BHS_CHECK_MAX_LOOPS);
+			if (ret) {
+				dev_err(qproc->dev,
+					"QDSP6SS_BHS_EN_REST_ACK timedout\n");
+				return -ETIMEDOUT;
+			}
+		}
+
 		/* Put LDO in bypass mode */
 		val |= QDSP6v56_LDO_BYP;
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
@@ -1594,7 +1612,6 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.active_clk_names = (char*[]){
 			"iface",
 			"bus",
-			"mem",
 			"gpll0_mss",
 			"mnoc_axi",
 			"snoc_axi",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
