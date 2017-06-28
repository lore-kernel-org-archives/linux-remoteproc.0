Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] rpmsg: Make modalias work for DeviceTree based devices
Date: Wed, 28 Jun 2017 14:53:23 -0700
Message-Id: <20170628215323.5658-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

When rpmsg devices are expected to be matched based on their compatible
the modalias should reflect this, so that module autoloading has a
chance to match and load the appropriate module.

Tested-by: Rob Clark <robdclark@gmail.com>
Reported-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Also update rpmsg_uevent()

 drivers/rpmsg/rpmsg_core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index ad3d2a9df287..067650c5bcb6 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -343,6 +343,11 @@ static ssize_t modalias_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
+	ssize_t len;
+
+	len = of_device_modalias(dev, buf, PAGE_SIZE);
+	if (len != -ENODEV)
+		return len;
 
 	return sprintf(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.name);
 }
@@ -387,6 +392,11 @@ static int rpmsg_dev_match(struct device *dev, struct device_driver *drv)
 static int rpmsg_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
+	int ret;
+
+	ret = of_device_uevent_modalias(dev, env);
+	if (ret != -ENODEV)
+		return ret;
 
 	return add_uevent_var(env, "MODALIAS=" RPMSG_DEVICE_MODALIAS_FMT,
 					rpdev->id.name);
-- 
2.12.0
