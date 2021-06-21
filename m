Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DC2C49EA2
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 12:58:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 099F86112D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 12:58:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFUNA2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Jun 2021 09:00:28 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:25902 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229699AbhFUNA2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jun 2021 09:00:28 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15LCvdif005533;
        Mon, 21 Jun 2021 14:58:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=ZS59bYC4aUi1YxcSyEGS5r1fG3dLdhBS7vHIOlXq2T4=;
 b=m6sqSxCCFUnROg60Oe8xpqVpHMxwZUZPiTcL4LuodsiYXcEc4E1Z0Hm+2DDBO/i43dLT
 y4FBgY0SbWHnGBnGiIJV+PTNZXPjNVj/1oobAA5FCGcbcpg4tOYFQ+Igw7sIpZC+XrAR
 3fRtiFRcmIUgAA6h9EOZGOrU60hytC11c+ZlX4xugvPVGtxsgGago+N0ZFdX1m7nSkEf
 oB67UmPXXaIFHr1mnpmUao2gWr/PVFc/SYxXpbH3GTa/9rdK3wpRa0y6953OU2LfNaoh
 50QWS19J2im0wmUitHmWUuPr9dqFDeMUjIuqodNfVzloAKIxmR9D6jVI4bhQQlHMtjBV Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39amg22dsn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Jun 2021 14:58:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A635C100038;
        Mon, 21 Jun 2021 14:58:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 96BC522B9C4;
        Mon, 21 Jun 2021 14:58:11 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Jun 2021 14:58:11
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 1/1] rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
Date:   Mon, 21 Jun 2021 14:58:00 +0200
Message-ID: <20210621125800.27696-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621125800.27696-1-arnaud.pouliquen@foss.st.com>
References: <20210621125800.27696-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-21_06:2021-06-21,2021-06-21 signatures=0
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
---
 drivers/rpmsg/rpmsg_ctrl.c | 37 +++++++++++++++++++++++++++++++++----
 include/uapi/linux/rpmsg.h | 10 ++++++++++
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index eeb1708548c1..cb19e32d05e1 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -23,6 +23,7 @@
 #include <uapi/linux/rpmsg.h>
 
 #include "rpmsg_char.h"
+#include "rpmsg_internal.h"
 
 static dev_t rpmsg_major;
 
@@ -37,11 +38,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
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
@@ -70,9 +73,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
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
@@ -82,7 +84,33 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
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
@@ -119,6 +147,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
 	device_initialize(dev);
 	dev->parent = &rpdev->dev;
 
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

