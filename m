Return-Path: <khoroshilov@ispras.ru>
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: [PATCH] rpmsg: glink: keep balance of mutex locks in qcom_glink_request_intent()
Date: Sat,  7 Oct 2017 00:23:57 +0300
Message-Id: <1507325037-20889-1-git-send-email-khoroshilov@ispras.ru>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
List-ID: <linux-remoteproc@vger.kernel.org>

If qcom_glink_tx() fails in qcom_glink_request_intent(),
it returns immediately leaving intent_req_lock mutex locked.
So the next tries to send intent request lead to deadlock.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/rpmsg/qcom_glink_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.7.4
