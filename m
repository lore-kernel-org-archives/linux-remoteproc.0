Return-Path: <shajit@codeaurora.org>
From: Jitendra Sharma <shajit@codeaurora.org>
Subject: [PATCH v1] remoteproc: Remove null character write of shared mem
Date: Thu,  8 Feb 2018 17:11:02 +0530
Message-Id: <1518090062-20877-1-git-send-email-shajit@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Jitendra Sharma <shajit@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

remoteproc is writing '\0' in the shared mem region. This
region is shared among multiple clients that are also trying
to read. Hence they miss first character.

Remove this null character write, as this mem area is
supposed to be Read only.

Further during every subsystem reboot, this region is
initialized with default, hence no need to write this
region.

Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
---
 drivers/remoteproc/qcom_adsp_pil.c | 3 ---
 drivers/remoteproc/qcom_q6v5_pil.c | 6 ------
 drivers/remoteproc/qcom_wcnss.c    | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 373c167..4a2ee6c 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -201,9 +201,6 @@ static irqreturn_t adsp_fatal_interrupt(int irq, void *dev)
 
 	rproc_report_crash(adsp->rproc, RPROC_FATAL_ERROR);
 
-	if (!IS_ERR(msg))
-		msg[0] = '\0';
-
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index b4e5e72..7293d45 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -939,9 +939,6 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *dev)
 
 	rproc_report_crash(qproc->rproc, RPROC_WATCHDOG);
 
-	if (!IS_ERR(msg))
-		msg[0] = '\0';
-
 	return IRQ_HANDLED;
 }
 
@@ -959,9 +956,6 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *dev)
 
 	rproc_report_crash(qproc->rproc, RPROC_FATAL_ERROR);
 
-	if (!IS_ERR(msg))
-		msg[0] = '\0';
-
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 3f06092..043f3d3 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -332,9 +332,6 @@ static irqreturn_t wcnss_fatal_interrupt(int irq, void *dev)
 
 	rproc_report_crash(wcnss->rproc, RPROC_FATAL_ERROR);
 
-	if (!IS_ERR(msg))
-		msg[0] = '\0';
-
 	return IRQ_HANDLED;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
