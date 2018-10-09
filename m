Return-Path: <briannorris@chromium.org>
Return-Path: <briannorris@chromium.org>
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] remoteproc: qcom: q6v5: shore up resource probe handling
Date: Tue,  9 Oct 2018 15:25:27 -0700
Message-Id: <20181009222527.74260-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Commit d5269c4553a6 ("remoteproc: qcom: q6v5: Propagate EPROBE_DEFER")
fixed up our probe code to handle -EPROBE_DEFER, but it ignored one of
our interrupts, and it also didn't really handle all the other error
codes you might get (e.g., with a bad DT definition). Handle those all
explicitly.

Fixes: d5269c4553a6 ("remoteproc: qcom: q6v5: Propagate EPROBE_DEFER")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/remoteproc/qcom_q6v5.c | 44 +++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index edeb2e43209e..7d6a98072b21 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -187,6 +187,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	init_completion(&q6v5->stop_done);
 
 	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
+	if (q6v5->wdog_irq < 0) {
+		if (q6v5->wdog_irq != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"failed to retrieve wdog IRQ: %d\n",
+				q6v5->wdog_irq);
+		return q6v5->wdog_irq;
+	}
+
 	ret = devm_request_threaded_irq(&pdev->dev, q6v5->wdog_irq,
 					NULL, q6v5_wdog_interrupt,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
@@ -197,8 +205,13 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	}
 
 	q6v5->fatal_irq = platform_get_irq_byname(pdev, "fatal");
-	if (q6v5->fatal_irq == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	if (q6v5->fatal_irq < 0) {
+		if (q6v5->fatal_irq != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"failed to retrieve fatal IRQ: %d\n",
+				q6v5->fatal_irq);
+		return q6v5->fatal_irq;
+	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, q6v5->fatal_irq,
 					NULL, q6v5_fatal_interrupt,
@@ -210,8 +223,13 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	}
 
 	q6v5->ready_irq = platform_get_irq_byname(pdev, "ready");
-	if (q6v5->ready_irq == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	if (q6v5->ready_irq < 0) {
+		if (q6v5->ready_irq != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"failed to retrieve ready IRQ: %d\n",
+				q6v5->ready_irq);
+		return q6v5->ready_irq;
+	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, q6v5->ready_irq,
 					NULL, q6v5_ready_interrupt,
@@ -223,8 +241,13 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	}
 
 	q6v5->handover_irq = platform_get_irq_byname(pdev, "handover");
-	if (q6v5->handover_irq == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	if (q6v5->handover_irq < 0) {
+		if (q6v5->handover_irq != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"failed to retrieve handover IRQ: %d\n",
+				q6v5->handover_irq);
+		return q6v5->handover_irq;
+	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, q6v5->handover_irq,
 					NULL, q6v5_handover_interrupt,
@@ -237,8 +260,13 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	disable_irq(q6v5->handover_irq);
 
 	q6v5->stop_irq = platform_get_irq_byname(pdev, "stop-ack");
-	if (q6v5->stop_irq == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	if (q6v5->stop_irq < 0) {
+		if (q6v5->stop_irq != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"failed to retrieve stop IRQ: %d\n",
+				q6v5->stop_irq);
+		return q6v5->stop_irq;
+	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, q6v5->stop_irq,
 					NULL, q6v5_stop_interrupt,
-- 
2.19.0.605.g01d371f741-goog
