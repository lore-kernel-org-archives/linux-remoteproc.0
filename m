Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH] rpmsg: glink: Initialize the "intent_req_comp" completion variable
Date: Fri, 27 Oct 2017 16:15:52 +0530
Message-Id: <1509101152-1340-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The "intent_req_comp" variable is used without initialization which
results in NULL pointer derefernce in qcom_glink_request_intent().

we need to initialize the completion variable before using it.

Fixes: 27b9c5b66b23 ("rpmsg: glink: Request for intents when unavailable")
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 5dcc9bf..fcd46ab 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -227,6 +227,7 @@ static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
 
 	init_completion(&channel->open_req);
 	init_completion(&channel->open_ack);
+	init_completion(&channel->intent_req_comp);
 
 	INIT_LIST_HEAD(&channel->done_intents);
 	INIT_WORK(&channel->intent_work, qcom_glink_rx_done_work);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
