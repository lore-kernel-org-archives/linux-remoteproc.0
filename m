Return-Path: <dan.carpenter@oracle.com>
Date: Fri, 8 Sep 2017 13:34:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 2/2] rpmsg: glink: Fix memory leak in
 qcom_glink_alloc_intent()
Message-ID: <20170908103440.junitv63lrzc5ih5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170908103345.brf5wcj5yg6zpslz@mwanda>
To: Ohad Ben-Cohen <ohad@wizery.com>, Sricharan R <sricharan@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

We need to free "intent" and "intent->data" on a couple error paths.

Fixes: 933b45da5d1d ("rpmsg: glink: Add support for TX intents")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index fecb1dafa8f3..5dcc9bf1c5bc 100644
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
