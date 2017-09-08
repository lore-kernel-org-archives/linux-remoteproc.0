Return-Path: <dan.carpenter@oracle.com>
Date: Fri, 8 Sep 2017 13:33:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 1/2] rpmsg: glink: Unlock on error in
 qcom_glink_request_intent()
Message-ID: <20170908103345.brf5wcj5yg6zpslz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Ohad Ben-Cohen <ohad@wizery.com>, Sricharan R <sricharan@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

If qcom_glink_tx() fails, then we need to unlock before returning the
error code.

Fixes: 27b9c5b66b23 ("rpmsg: glink: Request for intents when unavailable")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 5a5e927ea50f..fecb1dafa8f3 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1197,7 +1197,7 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 
 	ret = qcom_glink_tx(glink, &cmd, sizeof(cmd), NULL, 0, true);
 	if (ret)
-		return ret;
+		goto unlock;
 
 	ret = wait_for_completion_timeout(&channel->intent_req_comp, 10 * HZ);
 	if (!ret) {
@@ -1207,6 +1207,7 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 		ret = channel->intent_req_result ? 0 : -ECANCELED;
 	}
 
+unlock:
 	mutex_unlock(&channel->intent_req_lock);
 	return ret;
 }
