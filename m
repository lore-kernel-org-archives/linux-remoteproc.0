Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: Make modalias work for DeviceTree based devices
Date: Wed, 28 Jun 2017 11:48:16 -0700
Message-Id: <20170628184816.28300-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

When rpmsg devices are expected to be matched based on their compatible
the modalias should reflect this, so that module autoloading has a
chance to match and load the appropriate module.

Reported-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index ad3d2a9df287..b7e16fc3a6c7 100644
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
-- 
2.12.0
