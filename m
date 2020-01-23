Return-Path: <linux-arm-msm-owner@vger.kernel.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/2] remoteproc: qcom: q6v5-mss: Improve readability of reset_assert
Date: Thu, 23 Jan 2020 18:42:36 +0530
Message-Id: <20200123131236.1078-3-sibis@codeaurora.org>
In-Reply-To: <20200123131236.1078-1-sibis@codeaurora.org>
References: <20200123131236.1078-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, evgreen@chromium.org, p.zabel@pengutronix.de
Cc: ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Define AXI_GATING_VALID_OVERRIDE and fixup comments to improve readability
of Q6 modem reset sequence on SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 89ab96c21a44a..a1cc9cbe038f1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -71,6 +71,7 @@
 #define NAV_AXI_HALTREQ_BIT		BIT(0)
 #define NAV_AXI_HALTACK_BIT		BIT(1)
 #define NAV_AXI_IDLE_BIT		BIT(2)
+#define AXI_GATING_VALID_OVERRIDE	BIT(0)
 
 #define HALT_ACK_TIMEOUT_US		100000
 #define NAV_HALT_ACK_TIMEOUT_US		200
@@ -415,16 +416,24 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
 		ret = reset_control_reset(qproc->mss_restart);
 		reset_control_deassert(qproc->pdc_reset);
 	} else if (qproc->has_halt_nav) {
-		/* SWAR using CONN_BOX_SPARE_0 for pipeline glitch issue */
+		/*
+		 * When the AXI pipeline is being reset with the Q6 modem partly
+		 * operational there is possibility of AXI valid signal to
+		 * glitch, leading to spurious transactions and Q6 hangs. A work
+		 * around is employed by asserting the AXI_GATING_VALID_OVERRIDE
+		 * BIT before triggering Q6 MSS reset. Both the HALTREQ and
+		 * AXI_GATING_VALID_OVERRIDE are withdrawn post MSS assert
+		 * followed by a MSS deassert, while holding the PDC reset.
+		 */
 		reset_control_assert(qproc->pdc_reset);
 		regmap_update_bits(qproc->conn_map, qproc->conn_box,
-				   BIT(0), BIT(0));
+				   AXI_GATING_VALID_OVERRIDE, 1);
 		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
 				   NAV_AXI_HALTREQ_BIT, 0);
 		reset_control_assert(qproc->mss_restart);
 		reset_control_deassert(qproc->pdc_reset);
 		regmap_update_bits(qproc->conn_map, qproc->conn_box,
-				   BIT(0), 0);
+				   AXI_GATING_VALID_OVERRIDE, 0);
 		ret = reset_control_deassert(qproc->mss_restart);
 	} else {
 		ret = reset_control_assert(qproc->mss_restart);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
