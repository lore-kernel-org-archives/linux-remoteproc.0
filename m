Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: qcom_smd: Correct return value for O_NONBLOCK
Date: Thu,  1 Dec 2016 16:59:55 -0800
Message-Id: <1480640395-19661-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

qcom_smd_send() should return -EAGAIN for non-blocking channels with
insufficient space, so that we can propagate this event to user space.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7552ef0e82ba..beaef5dd973e 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -742,7 +742,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
 
 	while (qcom_smd_get_tx_avail(channel) < tlen) {
 		if (!wait) {
-			ret = -ENOMEM;
+			ret = -EAGAIN;
 			goto out;
 		}
 
-- 
2.5.0
