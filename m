Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail26.static.mailgun.info ([104.130.122.26]:25793 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729162AbgAQNwA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Jan 2020 08:52:00 -0500
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 4/4] remoteproc: qcom: q6v5-mss: Improve readability of reset_assert
Date: Fri, 17 Jan 2020 19:21:30 +0530
Message-Id: <20200117135130.3605-5-sibis@codeaurora.org>
In-Reply-To: <20200117135130.3605-1-sibis@codeaurora.org>
References: <20200117135130.3605-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, evgreen@chromium.org, p.zabel@pengutronix.de
Cc: ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Define CONN_BOX_SPARE_0_EN and fixup comments to improve readability of
Q6 modem reset_assert sequence on SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 6a98e9029c70b..8c9cfc213d5ff 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -71,6 +71,7 @@
 #define NAV_AXI_HALTREQ_BIT		BIT(0)
 #define NAV_AXI_HALTACK_BIT		BIT(1)
 #define NAV_AXI_IDLE_BIT		BIT(2)
+#define CONN_BOX_SPARE_0_EN		BIT(0)
 
 #define HALT_ACK_TIMEOUT_MS		100
 #define NAV_HALT_ACK_TIMEOUT_US		200
@@ -415,16 +416,26 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
 		ret = reset_control_reset(qproc->mss_restart);
 		reset_control_deassert(qproc->pdc_reset);
 	} else if (qproc->has_halt_nav) {
-		/* SWAR using CONN_BOX_SPARE_0 for pipeline glitch issue */
+		/*
+		 * SWWA for the pipeline glitch issue seen while
+		 * putting the Q6 modem on SC7180 into reset:
+		 * 1 - Assert PDC reset
+		 * 2 - Set CONN_BOX_SPARE_0_EN
+		 * 3 - Withdraw the halt requests
+		 * 4 - Assert MSS reset
+		 * 5 - Deassert PDC reset
+		 * 6 - Clear CONN_BOX_SPARE_0_EN
+		 * 7 - Deassert MSS reset
+		 */
 		reset_control_assert(qproc->pdc_reset);
 		regmap_update_bits(qproc->conn_map, qproc->conn_box,
-				   BIT(0), BIT(0));
+				   CONN_BOX_SPARE_0_EN, 1);
 		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
 				   NAV_AXI_HALTREQ_BIT, 0);
 		reset_control_assert(qproc->mss_restart);
 		reset_control_deassert(qproc->pdc_reset);
 		regmap_update_bits(qproc->conn_map, qproc->conn_box,
-				   BIT(0), 0);
+				   CONN_BOX_SPARE_0_EN, 0);
 		ret = reset_control_deassert(qproc->mss_restart);
 	} else {
 		ret = reset_control_assert(qproc->mss_restart);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
