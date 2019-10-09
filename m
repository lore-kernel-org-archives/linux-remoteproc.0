Return-Path: <clew@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH] rpmsg: glink: Remove channel decouple from rpdev release
Date: Tue,  8 Oct 2019 18:33:45 -0700
Message-Id: <20191009013345.17192-1-clew@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

If a channel is being rapidly restarted and the kobj release worker is
busy, there is a chance the the rpdev_release function will run after
the channel struct itself has been released.

There should not be a need to decouple the channel from rpdev in the
rpdev release since that should only happen from the channel close
commands.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 621f1afd4d6b..836a0bd99d11 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1350,9 +1350,7 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 static void qcom_glink_rpdev_release(struct device *dev)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
-	struct glink_channel *channel = to_glink_channel(rpdev->ept);
 
-	channel->rpdev = NULL;
 	kfree(rpdev);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
