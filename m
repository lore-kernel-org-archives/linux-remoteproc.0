Return-Path: <0101016e9292b563-1744c327-8e21-4e61-8f26-51f89c3f04aa-000000@us-west-2.amazonses.com>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V5 3/5] rpmsg: glink: Add support for rpmsg glink chrdev
Date: Fri, 22 Nov 2019 10:05:18 +0000
Message-ID: <0101016e9292b563-1744c327-8e21-4e61-8f26-51f89c3f04aa-000000@us-west-2.amazonses.com>
In-Reply-To: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
References: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>, Andy Gross <agross@kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Chris Lew <clew@codeaurora.org>

RPMSG provides a char device interface to userspace. Probe the rpmsg
chrdev channel to enable the rpmsg_ctrl device creation on glink
transports.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 609a150f..c838c19 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1158,7 +1158,7 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
 	__be32 *val = defaults;
 	int size;
 
-	if (glink->intentless)
+	if (glink->intentless || !completion_done(&channel->open_ack))
 		return 0;
 
 	prop = of_find_property(np, "qcom,intents", NULL);
@@ -1544,6 +1544,40 @@ static void qcom_glink_work(struct work_struct *work)
 	}
 }
 
+static void qcom_glink_device_release(struct device *dev)
+{
+	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
+	struct glink_channel *channel = to_glink_channel(rpdev->ept);
+
+	/* Release qcom_glink_alloc_channel() reference */
+	kref_put(&channel->refcount, qcom_glink_channel_release);
+	kfree(rpdev);
+}
+
+static int qcom_glink_create_chrdev(struct qcom_glink *glink)
+{
+	struct rpmsg_device *rpdev;
+	struct glink_channel *channel;
+
+	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
+	if (!rpdev)
+		return -ENOMEM;
+
+	channel = qcom_glink_alloc_channel(glink, "rpmsg_chrdev");
+	if (IS_ERR(channel)) {
+		kfree(rpdev);
+		return PTR_ERR(channel);
+	}
+	channel->rpdev = rpdev;
+
+	rpdev->ept = &channel->ept;
+	rpdev->ops = &glink_device_ops;
+	rpdev->dev.parent = glink->dev;
+	rpdev->dev.release = qcom_glink_device_release;
+
+	return rpmsg_chrdev_register_device(rpdev);
+}
+
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   unsigned long features,
 					   struct qcom_glink_pipe *rx,
@@ -1603,6 +1637,10 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = qcom_glink_create_chrdev(glink);
+	if (ret)
+		dev_err(glink->dev, "failed to register chrdev\n");
+
 	return glink;
 }
 EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
-- 
1.9.1
