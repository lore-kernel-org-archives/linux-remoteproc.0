Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: Don't overwrite release op of rpdev
Date: Sun, 25 Jun 2017 15:05:15 -0700
Message-Id: <20170625220515.4061-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Henri Roosen <henri.roosen@ginzinger.com>
List-ID: <linux-remoteproc@vger.kernel.org>

b0b03b811963 ("rpmsg: Release rpmsg devices in backends") attempted to
correct the ownership of freeing rpmsg device memory. But the patch
is not complete, in that the rpmsg core will overwrite the release op as
the device is being registered.

Fixes: b0b03b811963 ("rpmsg: Release rpmsg devices in backends")
Reported-by: Henri Roosen <henri.roosen@ginzinger.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 600f5f9f7431..c89edaf6133b 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -461,13 +461,6 @@ static struct bus_type rpmsg_bus = {
 	.remove		= rpmsg_dev_remove,
 };
 
-static void rpmsg_release_device(struct device *dev)
-{
-	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
-
-	kfree(rpdev);
-}
-
 int rpmsg_register_device(struct rpmsg_device *rpdev)
 {
 	struct device *dev = &rpdev->dev;
@@ -477,7 +470,6 @@ int rpmsg_register_device(struct rpmsg_device *rpdev)
 		     rpdev->id.name, rpdev->src, rpdev->dst);
 
 	rpdev->dev.bus = &rpmsg_bus;
-	rpdev->dev.release = rpmsg_release_device;
 
 	ret = device_register(&rpdev->dev);
 	if (ret) {
-- 
2.12.0
