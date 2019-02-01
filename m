Return-Path: <xiaoxiang781216@gmail.com>
Return-Path: <xiaoxiang781216@gmail.com>
From: Xiang Xiao <xiaoxiang781216@gmail.com>
Subject: [PATCH] rpmsg: add match optional callback to rpmsg_driver
Date: Fri,  1 Feb 2019 11:24:19 +0800
Message-Id: <1548991459-12515-1-git-send-email-xiaoxiang@xiaomi.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

so the driver could decide whether support a particular device at runtime

Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
---
 drivers/rpmsg/rpmsg_core.c | 3 +++
 include/linux/rpmsg.h      | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index ea88fd4..afdd1c6 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -413,6 +413,9 @@ static int rpmsg_dev_match(struct device *dev, struct device_driver *drv)
 	if (rpdev->driver_override)
 		return !strcmp(rpdev->driver_override, drv->name);
 
+	if (rpdrv->match)
+		return rpdrv->match(rpdev, rpdrv);
+
 	if (ids)
 		for (i = 0; ids[i].name[0]; i++)
 			if (rpmsg_id_match(rpdev, &ids[i]))
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 9fe156d..7a5a342 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -109,6 +109,7 @@ struct rpmsg_driver {
 	int (*probe)(struct rpmsg_device *dev);
 	void (*remove)(struct rpmsg_device *dev);
 	int (*callback)(struct rpmsg_device *, void *, int, void *, u32);
+	int (*match)(struct rpmsg_device *dev, struct rpmsg_driver *drv);
 };
 
 #if IS_ENABLED(CONFIG_RPMSG)
-- 
2.7.4
