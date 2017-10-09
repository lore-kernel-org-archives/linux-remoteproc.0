Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:57998 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751241AbdJIMma (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Oct 2017 08:42:30 -0400
From: Colin King <colin.king@canonical.com>
Subject: [PATCH] rpmsg: glink: fix memory leak on intent and intent->data
Date: Mon,  9 Oct 2017 13:42:14 +0100
Message-Id: <20171009124214.17206-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

Detected by CoverityScan, CID#1455255 ("Resource Leak")

Fixes: 933b45da5d1d ("rpmsg: glink: Add support for TX intents")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rpmsg/qcom_glink_native.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 5a5e927ea50f..53e0dd13ca3d 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -635,19 +635,18 @@ qcom_glink_alloc_intent(struct qcom_glink *glink,
 	unsigned long flags;
 
 	intent = kzalloc(sizeof(*intent), GFP_KERNEL);
-
 	if (!intent)
 		return NULL;
 
 	intent->data = kzalloc(size, GFP_KERNEL);
 	if (!intent->data)
-		return NULL;
+		goto free_intent;
 
 	spin_lock_irqsave(&channel->intent_lock, flags);
 	ret = idr_alloc_cyclic(&channel->liids, intent, 1, -1, GFP_ATOMIC);
 	if (ret < 0) {
 		spin_unlock_irqrestore(&channel->intent_lock, flags);
-		return NULL;
+		goto free_data;
 	}
 	spin_unlock_irqrestore(&channel->intent_lock, flags);
 
@@ -656,6 +655,12 @@ qcom_glink_alloc_intent(struct qcom_glink *glink,
 	intent->reuse = reuseable;
 
 	return intent;
+
+free_data:
+	kfree(intent->data);
+free_intent:
+	kfree(intent);
+	return NULL;
 }
 
 static void qcom_glink_handle_rx_done(struct qcom_glink *glink,
-- 
2.14.1

