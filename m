Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] rpmsg: glink: fix memory leak
Date: Sun, 17 Sep 2017 13:14:38 +0100
Message-Id: <1505650478-4638-1-git-send-email-sudipm.mukherjee@gmail.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

We missed freeing intent and intent->data on error conditions.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/rpmsg/qcom_glink_native.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 5a5e927..2e64c4d 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -640,13 +640,17 @@ qcom_glink_alloc_intent(struct qcom_glink *glink,
 		return NULL;
 
 	intent->data = kzalloc(size, GFP_KERNEL);
-	if (!intent->data)
+	if (!intent->data) {
+		kfree(intent);
 		return NULL;
+	}
 
 	spin_lock_irqsave(&channel->intent_lock, flags);
 	ret = idr_alloc_cyclic(&channel->liids, intent, 1, -1, GFP_ATOMIC);
 	if (ret < 0) {
 		spin_unlock_irqrestore(&channel->intent_lock, flags);
+		kfree(intent->data);
+		kfree(intent);
 		return NULL;
 	}
 	spin_unlock_irqrestore(&channel->intent_lock, flags);
-- 
2.7.4
