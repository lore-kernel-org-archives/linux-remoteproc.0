Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 5/5] remoteproc: Modifying probe for initializing q6v55 specific resources
Date: Mon, 24 Oct 2016 21:25:59 +0530
Message-Id: <1477324559-24752-6-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
References: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, akdwived@codeaurora.org, kaushalk@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Probe is being modified to save q6 version and invoke appropriate
init functions to accommodate q6v55 remoteproc driver.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 43 ++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index dd19d41..c65c904 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -1370,6 +1370,9 @@ static int q6v5_probe(struct platform_device *pdev)
 	init_completion(&qproc->start_done);
 	init_completion(&qproc->stop_done);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,q6v55-pil"))
+		qproc->is_q6v55 = true;
+
 	ret = q6v5_init_mem(qproc, pdev);
 	if (ret)
 		goto free_rproc;
@@ -1378,17 +1381,39 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = q6v5_init_clocks(qproc);
-	if (ret)
-		goto free_rproc;
+	if (qproc->is_q6v55) {
+		ret = q6v55_init_clocks(qproc);
+		if (ret)
+			goto free_rproc;
+	} else {
+		ret = q6v5_init_clocks(qproc);
+		if (ret)
+			goto free_rproc;
+	}
 
-	ret = q6v5_regulator_init(qproc);
-	if (ret)
-		goto free_rproc;
+	if (qproc->is_q6v55) {
+		ret = q6v55_init_reset(qproc, pdev);
+		if (ret)
+			goto free_rproc;
+	} else {
+		ret = q6v5_init_reset(qproc);
+		if (ret)
+			goto free_rproc;
+	}
 
-	ret = q6v5_init_reset(qproc);
-	if (ret)
-		goto free_rproc;
+	if (qproc->is_q6v55) {
+		ret = q6v55_regulator_init(qproc);
+		if (ret)
+			goto free_rproc;
+	} else {
+		ret = q6v5_regulator_init(qproc);
+		if (ret)
+			goto free_rproc;
+	}
+
+	qproc->ahb_clk_vote = of_property_read_bool(pdev->dev.of_node,
+			"qcom,ahb-clk-vote");
+	mutex_init(&qproc->q6_lock);
 
 	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
 	if (ret < 0)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
