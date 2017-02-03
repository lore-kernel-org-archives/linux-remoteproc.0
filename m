Return-Path: <spjoshi@codeaurora.org>
From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: [PATCH] remoteproc: Drop qcom_scm_pas_supported() from adsp_probe()
Date: Thu,  2 Feb 2017 16:04:37 -0800
Message-Id: <1486080277-17055-1-git-send-email-spjoshi@codeaurora.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

SCM call to check whether Peripheral Authentication Service (PAS)
is supported returns false for ADSP. Drop this call from the driver
so that the probe() function succeeds for ADSP PIL device.

Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
---
 drivers/remoteproc/qcom_adsp_pil.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 43a4ed2..94cd4b8 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -318,11 +318,6 @@ static int adsp_probe(struct platform_device *pdev)
 	if (!qcom_scm_is_available())
 		return -EPROBE_DEFER;
 
-	if (!qcom_scm_pas_supported(ADSP_PAS_ID)) {
-		dev_err(&pdev->dev, "PAS is not available for ADSP\n");
-		return -ENXIO;
-	}
-
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
 			    ADSP_FIRMWARE_NAME, sizeof(*adsp));
 	if (!rproc) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
