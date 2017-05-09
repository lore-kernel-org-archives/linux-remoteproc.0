Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: Make rpmsg_create_ept() propagate error
Date: Mon,  8 May 2017 21:56:06 -0700
Message-Id: <20170509045606.6064-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Make the rpmsg_create_ept() return an ERR_PTR() rather than NULL, as
this is common practice throughout the kernel and I got the first two
clients of this API wrong.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_smd.c         | 8 ++++----
 drivers/rpmsg/rpmsg_char.c       | 4 ++--
 drivers/rpmsg/rpmsg_core.c       | 6 +++---
 drivers/rpmsg/virtio_rpmsg_bus.c | 4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index a0a39a8821a3..cbc20ebba0a3 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -860,16 +860,16 @@ static struct rpmsg_endpoint *qcom_smd_create_ept(struct rpmsg_device *rpdev,
 			(channel = qcom_smd_find_channel(edge, name)) != NULL,
 			HZ);
 	if (!ret)
-		return NULL;
+		return ERR_PTR(-ETIMEDOUT);
 
 	if (channel->state != SMD_CHANNEL_CLOSED) {
 		dev_err(&rpdev->dev, "channel %s is busy\n", channel->name);
-		return NULL;
+		return ERR_PTR(-EBUSY);
 	}
 
 	qsept = kzalloc(sizeof(*qsept), GFP_KERNEL);
 	if (!qsept)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ept = &qsept->ept;
 
@@ -892,7 +892,7 @@ static struct rpmsg_endpoint *qcom_smd_create_ept(struct rpmsg_device *rpdev,
 free_ept:
 	channel->qsept = NULL;
 	kref_put(&ept->refcount, __ept_release);
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 static void qcom_smd_destroy_ept(struct rpmsg_endpoint *ept)
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 0ca2ccc09ca6..35918866d3fa 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -138,10 +138,10 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 	get_device(dev);
 
 	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
-	if (!ept) {
+	if (IS_ERR(ept)) {
 		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
 		put_device(dev);
-		return -EINVAL;
+		return PTR_ERR(ept);
 	}
 
 	eptdev->ept = ept;
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 600f5f9f7431..91dc76f250fa 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -65,7 +65,7 @@
  * dynamically assign them an available rpmsg address (drivers should have
  * a very good reason why not to always use RPMSG_ADDR_ANY here).
  *
- * Returns a pointer to the endpoint on success, or NULL on error.
+ * Returns a pointer to the endpoint on success, or ERR_PTR() on error.
  */
 struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
 					rpmsg_rx_cb_t cb, void *priv,
@@ -411,9 +411,9 @@ static int rpmsg_dev_probe(struct device *dev)
 		chinfo.dst = RPMSG_ADDR_ANY;
 
 		ept = rpmsg_create_ept(rpdev, rpdrv->callback, NULL, chinfo);
-		if (!ept) {
+		if (IS_ERR(ept)) {
 			dev_err(dev, "failed to create endpoint\n");
-			err = -ENOMEM;
+			err = PTR_ERR(ept);
 			goto out;
 		}
 
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 4848da89431f..7fd49ed4847a 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -224,7 +224,7 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
 
 	ept = kzalloc(sizeof(*ept), GFP_KERNEL);
 	if (!ept)
-		return NULL;
+		return PTR_ERR(-ENOMEM);
 
 	kref_init(&ept->refcount);
 	mutex_init(&ept->cb_lock);
@@ -260,7 +260,7 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
 free_ept:
 	mutex_unlock(&vrp->endpoints_lock);
 	kref_put(&ept->refcount, __ept_release);
-	return NULL;
+	return ERR_PTR(id);
 }
 
 static struct rpmsg_endpoint *virtio_rpmsg_create_ept(struct rpmsg_device *rpdev,
-- 
2.12.0
