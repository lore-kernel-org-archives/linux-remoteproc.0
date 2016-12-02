Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 4/4] rpmsg: smd: Register rpmsg user space interface for edges
Date: Fri,  2 Dec 2016 14:03:37 -0800
Message-Id: <1480716217-23303-4-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1480716217-23303-1-git-send-email-bjorn.andersson@linaro.org>
References: <1480716217-23303-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Create and register a rpmsg device for use with the rpmsg user space
interface, allowing user space to access SMD channels.

Also provide the "rpmsg_name" device attribute to expose the edge name
in sysfs, allowing the user to write udev rules for specific rpmsg
devices and their children.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Moved rpmsg_name attribute to different patch

 drivers/rpmsg/qcom_smd.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 52c4ec570464..7552ef0e82ba 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1002,6 +1002,20 @@ static int qcom_smd_create_device(struct qcom_smd_channel *channel)
 	return rpmsg_register_device(rpdev);
 }
 
+static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
+{
+	struct qcom_smd_device *qsdev;
+
+	qsdev = kzalloc(sizeof(*qsdev), GFP_KERNEL);
+	if (!qsdev)
+		return -ENOMEM;
+
+	qsdev->edge = edge;
+	qsdev->rpdev.ops = &qcom_smd_device_ops;
+	qsdev->rpdev.dev.parent = &edge->dev;
+	return rpmsg_chrdev_register_device(&qsdev->rpdev);
+}
+
 /*
  * Allocate the qcom_smd_channel object for a newly found smd channel,
  * retrieving and validating the smem items involved.
@@ -1357,6 +1371,12 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 		goto unregister_dev;
 	}
 
+	ret = qcom_smd_create_chrdev(edge);
+	if (ret) {
+		dev_err(&edge->dev, "failed to register chrdev for edge\n");
+		goto unregister_dev;
+	}
+
 	schedule_work(&edge->scan_work);
 
 	return edge;
-- 
2.5.0
