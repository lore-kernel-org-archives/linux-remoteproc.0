Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/2] remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
Date: Thu, 23 Jan 2020 18:42:35 +0530
Message-Id: <20200123131236.1078-2-sibis@codeaurora.org>
In-Reply-To: <20200123131236.1078-1-sibis@codeaurora.org>
References: <20200123131236.1078-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, evgreen@chromium.org, p.zabel@pengutronix.de
Cc: ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Replace the loop for HALT_ACK detection with regmap_read_poll_timeout.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 899ed769a343b..89ab96c21a44a 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -72,7 +72,8 @@
 #define NAV_AXI_HALTACK_BIT		BIT(1)
 #define NAV_AXI_IDLE_BIT		BIT(2)
 
-#define HALT_ACK_TIMEOUT_MS		100
+#define HALT_ACK_TIMEOUT_US		100000
+#define NAV_HALT_ACK_TIMEOUT_US		200
 
 /* QDSP6SS_RESET */
 #define Q6SS_STOP_CORE			BIT(0)
@@ -716,7 +717,6 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
 				   struct regmap *halt_map,
 				   u32 offset)
 {
-	unsigned long timeout;
 	unsigned int val;
 	int ret;
 
@@ -729,14 +729,8 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
 	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 1);
 
 	/* Wait for halt */
-	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
-	for (;;) {
-		ret = regmap_read(halt_map, offset + AXI_HALTACK_REG, &val);
-		if (ret || val || time_after(jiffies, timeout))
-			break;
-
-		msleep(1);
-	}
+	regmap_read_poll_timeout(halt_map, offset + AXI_HALTACK_REG, val,
+				 val, 1000, HALT_ACK_TIMEOUT_US);
 
 	ret = regmap_read(halt_map, offset + AXI_IDLE_REG, &val);
 	if (ret || !val)
@@ -750,7 +744,6 @@ static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
 				       struct regmap *halt_map,
 				       u32 offset)
 {
-	unsigned long timeout;
 	unsigned int val;
 	int ret;
 
@@ -764,15 +757,9 @@ static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
 			   NAV_AXI_HALTREQ_BIT);
 
 	/* Wait for halt ack*/
-	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
-	for (;;) {
-		ret = regmap_read(halt_map, offset, &val);
-		if (ret || (val & NAV_AXI_HALTACK_BIT) ||
-		    time_after(jiffies, timeout))
-			break;
-
-		udelay(5);
-	}
+	regmap_read_poll_timeout(halt_map, offset, val,
+				 (val & NAV_AXI_HALTACK_BIT),
+				 5, NAV_HALT_ACK_TIMEOUT_US);
 
 	ret = regmap_read(halt_map, offset, &val);
 	if (ret || !(val & NAV_AXI_IDLE_BIT))
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
