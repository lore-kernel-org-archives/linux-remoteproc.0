Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC089C4332F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9367C6103E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbhJVM5H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Oct 2021 08:57:07 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:55302 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231808AbhJVM5F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Oct 2021 08:57:05 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M8o97s015566;
        Fri, 22 Oct 2021 14:54:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=SlrDz6b8o3GDsNrr2++j/fK0EUKLMQ2X++9r+bBU4R0=;
 b=B05npWqa+/wk8sXoT1qEXjaKVfW/Sb2ujjNl6mzCif8C+SDRoptXZ+rhmVuaG3e8+cpQ
 5/JP++2CvPtIiR5XHbELS8m786+PIjuXrr7wFEoCxwbH+R72bPUek4DqLGzf6ScgVa9+
 MrpCPxJV1gbMgzCyEXPncMtm409HsjFApZzYnbbWppOKGe97oTHTA5VlEFfirVG1i4Nj
 Od46daR0yOS737MQzFdO0Zx6ngCovYCig3tnjPAJtFpT4rNdt5v0eRj6XKn6+i5dbnTE
 gSDnmWjNsPyTQM/SXIr8CVaeWQSBg7mFhQtFxiegKNHjC2xlicFp0blB9/x4cdBMFgtM 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3but4y1eu9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Oct 2021 14:54:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DCDB100034;
        Fri, 22 Oct 2021 14:54:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74AB421A226;
        Fri, 22 Oct 2021 14:54:39 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 14:54:38
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v6 01/10] rpmsg: char: Export eptdev create an destroy functions
Date:   Fri, 22 Oct 2021 14:54:17 +0200
Message-ID: <20211022125426.2579-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_03,2021-10-22_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

To prepare the split of the code related to the control (ctrldev)
and the endpoint (eptdev) devices in 2 separate files:

- Rename and export the functions in rpmsg_char.h.

- Suppress the dependency with the rpmsg_ctrldev struct in the
  rpmsg_eptdev_create function.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 update vs previous revision:
  - add comment to explain the IS_REACHABLE usage
  - remove Mathieu Poirier reviewed-by as patch updated
---
 drivers/rpmsg/rpmsg_char.c | 18 +++++++-----
 drivers/rpmsg/rpmsg_char.h | 57 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 7 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index b5907b80727c..941c5c54dd72 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (C) 2021, STMicroelectronics
  * Copyright (c) 2016, Linaro Ltd.
  * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
  * Copyright (c) 2012, PetaLogix
@@ -22,6 +23,8 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/rpmsg.h>
 
+#include "rpmsg_char.h"
+
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
 
 static dev_t rpmsg_major;
@@ -76,7 +79,7 @@ struct rpmsg_eptdev {
 	wait_queue_head_t readq;
 };
 
-static int rpmsg_eptdev_destroy(struct device *dev, void *data)
+int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
 {
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
 
@@ -95,6 +98,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
 
 	return 0;
 }
+EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
 
 static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 			void *priv, u32 addr)
@@ -278,7 +282,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
 		return -EINVAL;
 
-	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
+	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
 }
 
 static const struct file_operations rpmsg_eptdev_fops = {
@@ -337,10 +341,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
+int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
 			       struct rpmsg_channel_info chinfo)
 {
-	struct rpmsg_device *rpdev = ctrldev->rpdev;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
 	int ret;
@@ -360,7 +363,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	device_initialize(dev);
 	dev->class = rpmsg_class;
-	dev->parent = &ctrldev->dev;
+	dev->parent = parent;
 	dev->groups = rpmsg_eptdev_groups;
 	dev_set_drvdata(dev, eptdev);
 
@@ -403,6 +406,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	return ret;
 }
+EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
 static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
 {
@@ -442,7 +446,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	chinfo.src = eptinfo.src;
 	chinfo.dst = eptinfo.dst;
 
-	return rpmsg_eptdev_create(ctrldev, chinfo);
+	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
 };
 
 static const struct file_operations rpmsg_ctrldev_fops = {
@@ -528,7 +532,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
 	int ret;
 
 	/* Destroy all endpoints */
-	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
+	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
 	if (ret)
 		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
 
diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
new file mode 100644
index 000000000000..109c2c43005f
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_char.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) STMicroelectronics 2021.
+ */
+
+#ifndef __RPMSG_CHRDEV_H__
+#define __RPMSG_CHRDEV_H__
+
+/*
+ * The IS_REACHABLE macro is used here to prevent unresolved symbol error during link,
+ * building with RPMSG_CHAR=m and RPMSG_CTRL=y configuration.
+ * In such case a kernel warning is printed to help develloper to fix the issue.
+ */
+
+#if IS_REACHABLE(CONFIG_RPMSG_CHAR)
+/**
+ * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
+ * @rpdev:  prepared rpdev to be used for creating endpoints
+ * @parent: parent device
+ * @chinfo: associated endpoint channel information.
+ *
+ * This function create a new rpmsg char endpoint device to instantiate a new
+ * endpoint based on chinfo information.
+ */
+int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo);
+
+/**
+ * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
+ * @data: private data associated to the endpoint device
+ *
+ * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
+ * control.
+ */
+int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
+
+#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
+
+static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+					     struct rpmsg_channel_info chinfo)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+	return -EINVAL;
+}
+
+static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
+
+#endif /*__RPMSG_CHRDEV_H__ */
-- 
2.17.1

