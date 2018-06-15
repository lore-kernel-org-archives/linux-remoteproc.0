Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] rpmsg: core: add support to power domains for devices
Date: Fri, 15 Jun 2018 10:59:39 +0100
Message-Id: <20180615095939.1331-1-srinivas.kandagatla@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Some of the rpmsg devices need to switch on power domains to communicate
with remote processor. For example on Qualcomm DB820c platform LPASS
power domain needs to switched on for any kind of audio services.
This patch adds the missing power domain support in rpmsg core.

Without this patch attempting to play audio via QDSP on DB820c would
reboot the system.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index b714a543a91d..8122807db380 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/rpmsg.h>
 #include <linux/of_device.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 
 #include "rpmsg_internal.h"
@@ -449,6 +450,10 @@ static int rpmsg_dev_probe(struct device *dev)
 	struct rpmsg_endpoint *ept = NULL;
 	int err;
 
+	err = dev_pm_domain_attach(dev, true);
+	if (err)
+		goto out;
+
 	if (rpdrv->callback) {
 		strncpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
 		chinfo.src = rpdev->src;
@@ -490,6 +495,8 @@ static int rpmsg_dev_remove(struct device *dev)
 
 	rpdrv->remove(rpdev);
 
+	dev_pm_domain_detach(dev, true);
+
 	if (rpdev->ept)
 		rpmsg_destroy_ept(rpdev->ept);
 
-- 
2.16.2
