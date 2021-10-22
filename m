Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F23C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7164C61163
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhJVM5I (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Oct 2021 08:57:08 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:33422 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231837AbhJVM5G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Oct 2021 08:57:06 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M9Kh6E026255;
        Fri, 22 Oct 2021 14:54:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=pf6U8gqGv3Tceu209NTDJTGLRzoqh8aC02EhIztTiYw=;
 b=AjNxkZ40799o+ugMBKK8K56KxkHbZvgDIARyxgn9xgnyIy2WrH9/TKiKN685hGYCAIHy
 63MoSocREuQ71Id8CpTXRbWRTMzLqw55XloC/R2FmuXic+RY7BDxNrjQaJn22qPP0rCe
 r0kLMy6AfRvqG2mOheaqPIPudNeperTJdEnAz5kfTce/07xpUsNbs/UH1hcC+4e7kDSZ
 Aco6FPam2E+vp+efPd22saIvj2QAi1c9GIfpTV5/C+HTz4laATvG3LOTfkT/bGdQOHCf
 7jmL12OdFdIz17ftNMRTIuJMbMAGDsYtwbg9KYElpUYxbdszVU1SrmE3RBvaX6UxhXWg tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3butka180k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Oct 2021 14:54:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B713100038;
        Fri, 22 Oct 2021 14:54:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 423B021A228;
        Fri, 22 Oct 2021 14:54:40 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 14:54:39
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v6 02/10] rpmsg: create the rpmsg class in core instead of in rpmsg char
Date:   Fri, 22 Oct 2021 14:54:18 +0200
Message-ID: <20211022125426.2579-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_03,2021-10-22_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Migrate the creation of the rpmsg class from the rpmsg_char
to the core that the class is usable by all rpmsg services.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 14 ++------------
 drivers/rpmsg/rpmsg_core.c | 26 ++++++++++++++++++++++++--
 include/linux/rpmsg.h      | 10 ++++++++++
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 941c5c54dd72..327ed739a3a7 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -28,7 +28,6 @@
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
 
 static dev_t rpmsg_major;
-static struct class *rpmsg_class;
 
 static DEFINE_IDA(rpmsg_ctrl_ida);
 static DEFINE_IDA(rpmsg_ept_ida);
@@ -362,7 +361,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 	init_waitqueue_head(&eptdev->readq);
 
 	device_initialize(dev);
-	dev->class = rpmsg_class;
+	dev->class = rpmsg_get_class();
 	dev->parent = parent;
 	dev->groups = rpmsg_eptdev_groups;
 	dev_set_drvdata(dev, eptdev);
@@ -482,7 +481,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	dev = &ctrldev->dev;
 	device_initialize(dev);
 	dev->parent = &rpdev->dev;
-	dev->class = rpmsg_class;
+	dev->class = rpmsg_get_class();
 
 	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
 	ctrldev->cdev.owner = THIS_MODULE;
@@ -558,17 +557,9 @@ static int rpmsg_chrdev_init(void)
 		return ret;
 	}
 
-	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
-	if (IS_ERR(rpmsg_class)) {
-		pr_err("failed to create rpmsg class\n");
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-		return PTR_ERR(rpmsg_class);
-	}
-
 	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
 	if (ret < 0) {
 		pr_err("rpmsgchr: failed to register rpmsg driver\n");
-		class_destroy(rpmsg_class);
 		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 	}
 
@@ -579,7 +570,6 @@ postcore_initcall(rpmsg_chrdev_init);
 static void rpmsg_chrdev_exit(void)
 {
 	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
-	class_destroy(rpmsg_class);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
 module_exit(rpmsg_chrdev_exit);
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 9151836190ce..53162038254d 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -20,6 +20,8 @@
 
 #include "rpmsg_internal.h"
 
+static struct class *rpmsg_class;
+
 /**
  * rpmsg_create_channel() - create a new rpmsg channel
  * using its name and address info.
@@ -296,6 +298,19 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 }
 EXPORT_SYMBOL(rpmsg_poll);
 
+/**
+ * rpmsg_get_class() - get reference to the sysfs rpmsg class
+ *
+ * This function return the pointer to the "rpmsg" class created by the rpmsg core.
+ *
+ * Returns the struct class pointer
+ */
+struct class *rpmsg_get_class(void)
+{
+	return rpmsg_class;
+}
+EXPORT_SYMBOL(rpmsg_get_class);
+
 /**
  * rpmsg_trysend_offchannel() - send a message using explicit src/dst addresses
  * @ept: the rpmsg endpoint
@@ -629,10 +644,17 @@ static int __init rpmsg_init(void)
 {
 	int ret;
 
+	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
+	if (IS_ERR(rpmsg_class)) {
+		pr_err("failed to create rpmsg class\n");
+		return PTR_ERR(rpmsg_class);
+	}
+
 	ret = bus_register(&rpmsg_bus);
-	if (ret)
+	if (ret) {
 		pr_err("failed to register rpmsg bus: %d\n", ret);
-
+		class_destroy(rpmsg_class);
+	}
 	return ret;
 }
 postcore_initcall(rpmsg_init);
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index a8dcf8a9ae88..6fe51549d931 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -186,6 +186,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
 
+struct class *rpmsg_get_class(void);
+
 #else
 
 static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
@@ -296,6 +298,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
 	return 0;
 }
 
+static inline struct class *rpmsg_get_class(void)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return NULL;
+}
+
 #endif /* IS_ENABLED(CONFIG_RPMSG) */
 
 /* use a macro to avoid include chaining to get THIS_MODULE */
-- 
2.17.1

