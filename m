Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 3/8] remoteproc: Move proxy unvote to handover irq handler
Date: Mon, 21 May 2018 22:57:09 +0530
Message-Id: <20180521172714.8551-4-sibis@codeaurora.org>
In-Reply-To: <20180521172714.8551-1-sibis@codeaurora.org>
References: <20180521172714.8551-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce interrupt handler for smp2p ready interrupt to
handle start completion. Move the proxy votes for clocks
and regulators to the handover interrupt context.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 76a0c00aa04a..6333bdcd9448 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -809,11 +809,6 @@ static int q6v5_start(struct rproc *rproc)
 			"Failed to reclaim mba buffer system may become unstable\n");
 	qproc->running = true;
 
-	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
-			 qproc->proxy_clk_count);
-	q6v5_regulator_disable(qproc, qproc->proxy_regs,
-			       qproc->proxy_reg_count);
-
 	return 0;
 
 reclaim_mpss:
@@ -892,6 +887,12 @@ static int q6v5_stop(struct rproc *rproc)
 	WARN_ON(ret);
 
 	reset_control_assert(qproc->mss_restart);
+
+	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
+			 qproc->proxy_clk_count);
+	q6v5_regulator_disable(qproc, qproc->proxy_regs,
+			       qproc->proxy_reg_count);
+
 	q6v5_clk_disable(qproc->dev, qproc->active_clks,
 			 qproc->active_clk_count);
 	q6v5_regulator_disable(qproc, qproc->active_regs,
@@ -959,7 +960,7 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t q6v5_handover_interrupt(int irq, void *dev)
+static irqreturn_t q6v5_ready_interrupt(int irq, void *dev)
 {
 	struct q6v5 *qproc = dev;
 
@@ -967,6 +968,18 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t q6v5_handover_interrupt(int irq, void *dev)
+{
+	struct q6v5 *qproc = dev;
+
+	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
+			 qproc->proxy_clk_count);
+	q6v5_regulator_disable(qproc, qproc->proxy_regs,
+			       qproc->proxy_reg_count);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t q6v5_stop_ack_interrupt(int irq, void *dev)
 {
 	struct q6v5 *qproc = dev;
@@ -1194,6 +1207,10 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto free_rproc;
 
+	ret = q6v5_request_irq(qproc, pdev, "ready", q6v5_ready_interrupt);
+	if (ret < 0)
+		goto free_rproc;
+
 	ret = q6v5_request_irq(qproc, pdev, "handover", q6v5_handover_interrupt);
 	if (ret < 0)
 		goto free_rproc;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
