Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1FAC433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:21:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D411D610A8
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239233AbhKHOXo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 09:23:44 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:48914 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239235AbhKHOXi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 09:23:38 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8B5AiB024564;
        Mon, 8 Nov 2021 15:20:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=YOXMnEgE0PBqohRgz/w+Cor88xWaieeK1tGjwcF9Q50=;
 b=JE+FV/KYCi14W1FhPmCIk+ldH1ej0s4HL7Yv/8IKBiL3GBmQgwLfgiLUSupzsWk1kbmZ
 rSuqLiHmZkGAisZijjdTUodyg42NWRYW/7ILEXiWt0Z9FGCApZ5uZi7Li/8gJPCKgyzU
 keErKGc+FnmtlBQKDjxME7M8GZcg/eYbDCe7gpjlICT9OZ8OXw7KXFuzUrEwrMsRtLKV
 RBA8LEijrN7YIhjEqnJ3tcmdI4f4a8ijUWfXrssMU0p6gphtuaQVzgHGaJ9bc2PuPvcP
 RufbVCRl7wPWsshP6Bu/N5YsHrOOBZLI+KdPnzvg6l/yoJz4y2DirguoJiTpi9KFqsIo MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c6u5vcmbd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Nov 2021 15:20:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9ECC2100034;
        Mon,  8 Nov 2021 15:20:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9671B22FA38;
        Mon,  8 Nov 2021 15:20:50 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:20:50
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v7 11/12] rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
Date:   Mon, 8 Nov 2021 15:19:36 +0100
Message-ID: <20211108141937.13016-12-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allow the user space application to create and release an rpmsg device
by adding RPMSG_CREATE_DEV_IOCTL and RPMSG_RELEASE_DEV_IOCTL ioctrls to
the /dev/rpmsg_ctrl interface

The RPMSG_CREATE_DEV_IOCTL Ioctl can be used to instantiate a local rpmsg
device.
Depending on the back-end implementation, the associated rpmsg driver is
probed and a NS announcement can be sent to the remote processor.

The RPMSG_RELEASE_DEV_IOCTL allows the user application to release a
rpmsg device created either by the remote processor or with the
RPMSG_CREATE_DEV_IOCTL call.
Depending on the back-end implementation, the associated rpmsg driver is
removed and a NS destroy rpmsg can be sent to the remote processor.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/rpmsg_ctrl.c | 36 ++++++++++++++++++++++++++++++++----
 include/uapi/linux/rpmsg.h | 10 ++++++++++
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 298e75dc7774..c5ccc5bedde2 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -43,11 +43,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
  * @rpdev:	underlaying rpmsg device
  * @cdev:	cdev for the ctrl device
  * @dev:	device for the ctrl device
+ * @ctrl_lock:	serialize the ioctrls.
  */
 struct rpmsg_ctrldev {
 	struct rpmsg_device *rpdev;
 	struct cdev cdev;
 	struct device dev;
+	struct mutex ctrl_lock;
 };
 
 static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
@@ -76,9 +78,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	void __user *argp = (void __user *)arg;
 	struct rpmsg_endpoint_info eptinfo;
 	struct rpmsg_channel_info chinfo;
-
-	if (cmd != RPMSG_CREATE_EPT_IOCTL)
-		return -EINVAL;
+	struct rpmsg_device *rpdev;
+	int ret = 0;
 
 	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
 		return -EFAULT;
@@ -88,7 +89,33 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	chinfo.src = eptinfo.src;
 	chinfo.dst = eptinfo.dst;
 
-	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
+	mutex_lock(&ctrldev->ctrl_lock);
+	switch (cmd) {
+	case RPMSG_CREATE_EPT_IOCTL:
+		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
+		break;
+
+	case RPMSG_CREATE_DEV_IOCTL:
+		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
+		if (!rpdev) {
+			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
+			ret = -ENXIO;
+		}
+		break;
+
+	case RPMSG_RELEASE_DEV_IOCTL:
+		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
+		if (ret)
+			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
+				chinfo.name, ret);
+		break;
+
+	default:
+		ret = -EINVAL;
+	}
+	mutex_unlock(&ctrldev->ctrl_lock);
+
+	return ret;
 };
 
 static const struct file_operations rpmsg_ctrldev_fops = {
@@ -126,6 +153,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
 	dev->parent = &rpdev->dev;
 	dev->class = rpmsg_class;
 
+	mutex_init(&ctrldev->ctrl_lock);
 	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
 	ctrldev->cdev.owner = THIS_MODULE;
 
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index f5ca8740f3fb..1637e68177d9 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -33,4 +33,14 @@ struct rpmsg_endpoint_info {
  */
 #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
 
+/**
+ * Instantiate a new local rpmsg service device.
+ */
+#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
+
+/**
+ * Release a local rpmsg device.
+ */
+#define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
+
 #endif
-- 
2.17.1

