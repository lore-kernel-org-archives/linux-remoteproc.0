Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCECC433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CE37610F7
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240408AbhKHOWo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 09:22:44 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:35576 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240370AbhKHOWi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 09:22:38 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8DKfa5021025;
        Mon, 8 Nov 2021 15:19:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=2CzcKN9ckpmQLizw65tXtWXpjlZRgWtIc/RaW+nQvu4=;
 b=fO3JA/x/rm1om+eRk5r6Or0AnEIQ1+27WV+uNM/FZPgj/TZAo35UfPPPsC1eItL0XGhV
 defaTqhKXexF3cKYo4Yp1keSP05Npy8sk+DKdy1FZfS5rRCu0dH+rg2z7GPLoVKM7ezP
 YmcsMUI73y0BgHirdamQLU8DyYilk0li2ZlR+0GqiIOEvGjAHPdawUSUAOZboecO8Gdl
 FlScWzuSID+PwuYH3OAAXMuoFUPV66bH9ijMd5WKgOiMxWr0Z4GPgQGi+tzLStssSn7x
 5g76+5GpkErD5hc3xTxVbapA7KeHlqYg3mudwHI13vNHQvoa5ww3Zzn9vxqPV5/eVV2S ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c709q2a41-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Nov 2021 15:19:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6438610002A;
        Mon,  8 Nov 2021 15:19:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BCA321BF6B;
        Mon,  8 Nov 2021 15:19:44 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:19:43
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v7 03/12] rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
Date:   Mon, 8 Nov 2021 15:19:28 +0100
Message-ID: <20211108141937.13016-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Create the rpmsg_ctrl.c module and move the code related to the
rpmsg_ctrldev device in this new module.

Add the dependency between rpmsg_char and rpmsg_ctrl in the
kconfig file:

1) RPMSG_CTRL can set as module or built-in if
  RPMSG=y || RPMSG_CHAR=y || RPMSG_CHAR=n

2) RPMSG_CTRL can not be set as built-in if
   RPMSG=m || RPMSG_CHAR=m

Note that RPMGH_CHAR and RPMSG_CTRL can be activated separately.
Therefore, the RPMSG_CTRL configuration must be set for backwards compatibility.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
update vs previous version
 - suppress the "select RPMSG_CTRL" for RPMSG_CHAR config
 - add dependency on RPMSG_CHAR in RPMSG_CTRL to handle the use case
   where RPMSG_CHAR is built as a module.
---
 drivers/rpmsg/Kconfig      |   8 ++
 drivers/rpmsg/Makefile     |   1 +
 drivers/rpmsg/rpmsg_char.c | 167 +---------------------------
 drivers/rpmsg/rpmsg_ctrl.c | 219 +++++++++++++++++++++++++++++++++++++
 4 files changed, 230 insertions(+), 165 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0b4407abdf13..d3795860f5c0 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -15,6 +15,14 @@ config RPMSG_CHAR
 	  in /dev. They make it possible for user-space programs to send and
 	  receive rpmsg packets.
 
+config RPMSG_CTRL
+	tristate "RPMSG control interface"
+	depends on RPMSG && ( RPMSG_CHAR || RPMSG_CHAR=n )
+	help
+	  Say Y here to enable the support of the /dev/rpmsg_ctrlX API. This API
+	  allows user-space programs to create endpoints with specific service name,
+	  source and destination addresses.
+
 config RPMSG_NS
 	tristate "RPMSG name service announcement"
 	depends on RPMSG
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 8d452656f0ee..58e3b382e316 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
+obj-$(CONFIG_RPMSG_CTRL)	+= rpmsg_ctrl.o
 obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
 qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 8ab5ac23850c..29c4d2c3aea9 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -30,28 +30,12 @@
 
 static dev_t rpmsg_major;
 
-static DEFINE_IDA(rpmsg_ctrl_ida);
 static DEFINE_IDA(rpmsg_ept_ida);
 static DEFINE_IDA(rpmsg_minor_ida);
 
 #define dev_to_eptdev(dev) container_of(dev, struct rpmsg_eptdev, dev)
 #define cdev_to_eptdev(i_cdev) container_of(i_cdev, struct rpmsg_eptdev, cdev)
 
-#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
-#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
-
-/**
- * struct rpmsg_ctrldev - control device for instantiating endpoint devices
- * @rpdev:	underlaying rpmsg device
- * @cdev:	cdev for the ctrl device
- * @dev:	device for the ctrl device
- */
-struct rpmsg_ctrldev {
-	struct rpmsg_device *rpdev;
-	struct cdev cdev;
-	struct device dev;
-};
-
 /**
  * struct rpmsg_eptdev - endpoint device context
  * @dev:	endpoint device
@@ -408,169 +392,22 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
-static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
-{
-	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
-
-	get_device(&ctrldev->dev);
-	filp->private_data = ctrldev;
-
-	return 0;
-}
-
-static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
-{
-	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
-
-	put_device(&ctrldev->dev);
-
-	return 0;
-}
-
-static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
-				unsigned long arg)
-{
-	struct rpmsg_ctrldev *ctrldev = fp->private_data;
-	void __user *argp = (void __user *)arg;
-	struct rpmsg_endpoint_info eptinfo;
-	struct rpmsg_channel_info chinfo;
-
-	if (cmd != RPMSG_CREATE_EPT_IOCTL)
-		return -EINVAL;
-
-	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
-		return -EFAULT;
-
-	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
-	chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
-	chinfo.src = eptinfo.src;
-	chinfo.dst = eptinfo.dst;
-
-	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
-};
-
-static const struct file_operations rpmsg_ctrldev_fops = {
-	.owner = THIS_MODULE,
-	.open = rpmsg_ctrldev_open,
-	.release = rpmsg_ctrldev_release,
-	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
-	.compat_ioctl = compat_ptr_ioctl,
-};
-
-static void rpmsg_ctrldev_release_device(struct device *dev)
-{
-	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
-
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
-	cdev_del(&ctrldev->cdev);
-	kfree(ctrldev);
-}
-
-static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
-{
-	struct rpmsg_ctrldev *ctrldev;
-	struct device *dev;
-	int ret;
-
-	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
-	if (!ctrldev)
-		return -ENOMEM;
-
-	ctrldev->rpdev = rpdev;
-
-	dev = &ctrldev->dev;
-	device_initialize(dev);
-	dev->parent = &rpdev->dev;
-	dev->class = rpmsg_class;
-
-	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
-	ctrldev->cdev.owner = THIS_MODULE;
-
-	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
-	if (ret < 0)
-		goto free_ctrldev;
-	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
-
-	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
-	if (ret < 0)
-		goto free_minor_ida;
-	dev->id = ret;
-	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
-
-	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
-	if (ret)
-		goto free_ctrl_ida;
-
-	/* We can now rely on the release function for cleanup */
-	dev->release = rpmsg_ctrldev_release_device;
-
-	ret = device_add(dev);
-	if (ret) {
-		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
-		put_device(dev);
-	}
-
-	dev_set_drvdata(&rpdev->dev, ctrldev);
-
-	return ret;
-
-free_ctrl_ida:
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
-free_minor_ida:
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
-free_ctrldev:
-	put_device(dev);
-	kfree(ctrldev);
-
-	return ret;
-}
-
-static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
-{
-	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
-	int ret;
-
-	/* Destroy all endpoints */
-	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
-	if (ret)
-		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
-
-	device_del(&ctrldev->dev);
-	put_device(&ctrldev->dev);
-}
-
-static struct rpmsg_driver rpmsg_chrdev_driver = {
-	.probe = rpmsg_chrdev_probe,
-	.remove = rpmsg_chrdev_remove,
-	.drv = {
-		.name = "rpmsg_chrdev",
-	},
-};
-
 static int rpmsg_chrdev_init(void)
 {
 	int ret;
 
-	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
+	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
 	if (ret < 0) {
 		pr_err("rpmsg: failed to allocate char dev region\n");
 		return ret;
 	}
 
-	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
-	if (ret < 0) {
-		pr_err("rpmsgchr: failed to register rpmsg driver\n");
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-	}
-
-	return ret;
+	return 0;
 }
 postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
-	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
 module_exit(rpmsg_chrdev_exit);
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
new file mode 100644
index 000000000000..33c38cbf2b83
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021, STMicroelectronics
+ * Copyright (c) 2016, Linaro Ltd.
+ * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
+ * Copyright (c) 2012, PetaLogix
+ * Copyright (c) 2011, Texas Instruments, Inc.
+ * Copyright (c) 2011, Google, Inc.
+ *
+ * Based on rpmsg performance statistics driver by Michal Simek, which in turn
+ * was based on TI & Google OMX rpmsg driver.
+ */
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+#include <linux/skbuff.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/rpmsg.h>
+
+#include "rpmsg_char.h"
+#include "rpmsg_internal.h"
+
+#define RPMSG_DEV_MAX	(MINORMASK + 1)
+
+static dev_t rpmsg_major;
+
+static DEFINE_IDA(rpmsg_ctrl_ida);
+static DEFINE_IDA(rpmsg_minor_ida);
+
+#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
+#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
+
+/**
+ * struct rpmsg_ctrldev - control device for instantiating endpoint devices
+ * @rpdev:	underlaying rpmsg device
+ * @cdev:	cdev for the ctrl device
+ * @dev:	device for the ctrl device
+ */
+struct rpmsg_ctrldev {
+	struct rpmsg_device *rpdev;
+	struct cdev cdev;
+	struct device dev;
+};
+
+static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	get_device(&ctrldev->dev);
+	filp->private_data = ctrldev;
+
+	return 0;
+}
+
+static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	put_device(&ctrldev->dev);
+
+	return 0;
+}
+
+static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
+				unsigned long arg)
+{
+	struct rpmsg_ctrldev *ctrldev = fp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct rpmsg_endpoint_info eptinfo;
+	struct rpmsg_channel_info chinfo;
+
+	if (cmd != RPMSG_CREATE_EPT_IOCTL)
+		return -EINVAL;
+
+	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
+		return -EFAULT;
+
+	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
+	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
+	chinfo.src = eptinfo.src;
+	chinfo.dst = eptinfo.dst;
+
+	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
+};
+
+static const struct file_operations rpmsg_ctrldev_fops = {
+	.owner = THIS_MODULE,
+	.open = rpmsg_ctrldev_open,
+	.release = rpmsg_ctrldev_release,
+	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+};
+
+static void rpmsg_ctrldev_release_device(struct device *dev)
+{
+	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
+
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+	cdev_del(&ctrldev->cdev);
+	kfree(ctrldev);
+}
+
+static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrldev *ctrldev;
+	struct device *dev;
+	int ret;
+
+	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
+	if (!ctrldev)
+		return -ENOMEM;
+
+	ctrldev->rpdev = rpdev;
+
+	dev = &ctrldev->dev;
+	device_initialize(dev);
+	dev->parent = &rpdev->dev;
+	dev->class = rpmsg_class;
+
+	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
+	ctrldev->cdev.owner = THIS_MODULE;
+
+	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
+	if (ret < 0)
+		goto free_ctrldev;
+	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+
+	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
+	if (ret < 0)
+		goto free_minor_ida;
+	dev->id = ret;
+	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
+
+	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
+	if (ret)
+		goto free_ctrl_ida;
+
+	/* We can now rely on the release function for cleanup */
+	dev->release = rpmsg_ctrldev_release_device;
+
+	ret = device_add(dev);
+	if (ret) {
+		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
+		put_device(dev);
+	}
+
+	dev_set_drvdata(&rpdev->dev, ctrldev);
+
+	return ret;
+
+free_ctrl_ida:
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+free_minor_ida:
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+free_ctrldev:
+	put_device(dev);
+	kfree(ctrldev);
+
+	return ret;
+}
+
+static void rpmsg_ctrldev_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
+	int ret;
+
+	/* Destroy all endpoints */
+	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
+	if (ret)
+		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
+
+	device_del(&ctrldev->dev);
+	put_device(&ctrldev->dev);
+}
+
+static struct rpmsg_driver rpmsg_ctrldev_driver = {
+	.probe = rpmsg_ctrldev_probe,
+	.remove = rpmsg_ctrldev_remove,
+	.drv = {
+		.name = "rpmsg_chrdev",
+	},
+};
+
+static int rpmsg_ctrldev_init(void)
+{
+	int ret;
+
+	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
+	if (ret < 0) {
+		pr_err("rpmsg: failed to allocate char dev region\n");
+		return ret;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
+		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+	}
+
+	return ret;
+}
+postcore_initcall(rpmsg_ctrldev_init);
+
+static void rpmsg_ctrldev_exit(void)
+{
+	unregister_rpmsg_driver(&rpmsg_ctrldev_driver);
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+}
+module_exit(rpmsg_ctrldev_exit);
+
+MODULE_DESCRIPTION("rpmsg control interface");
+MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

