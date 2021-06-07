Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945F5C48BCD
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 17:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DF6D610A1
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 17:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhFGRcq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Jun 2021 13:32:46 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57316 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230494AbhFGRcn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Jun 2021 13:32:43 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157HNTSd001040;
        Mon, 7 Jun 2021 19:30:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=ZeIO3Cc0S1hABO0odB2cYv3cAGsbmXGy84RGjGQN5f8=;
 b=Rub9MYxqU+RK8JJbmUG13km9oL9EcsVtuGpbIRMm2fRty4DW0k3xIgJsKjdA0KzxFNlF
 9L3TOyUWF/TYuka/GuvgSXPKuz9xBUyZtTxnvfJ6iG+FJXzc73Vle0JUJM8Eoy+UJYf6
 s8Tld4MohFoicdWmacKP5Vez9+mNeGEMhGv6Lqsu1WONjmOvHhtLcz3BGJRtEEI423tW
 uVrvCb4mU4PfmF++SKOohNEv3RyLSXiA0yJsokB/+uNgmP1rBxv82pNQHFSpyjHnC1Ae
 I1+WcdGbRcGxbuAMkRuzyEkuL2JOGeqhT7Ctqz2Urri5nmE9pf0rinG662OVS3FJZhr/ uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 391fg0b7dv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Jun 2021 19:30:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28A5A100038;
        Mon,  7 Jun 2021 19:30:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10EBF2142B6;
        Mon,  7 Jun 2021 19:30:39 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun 2021 19:30:38
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 2/4] rpmsg: char: Add possibility to create and reuse default endpoint
Date:   Mon, 7 Jun 2021 19:30:30 +0200
Message-ID: <20210607173032.30133-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-07_14:2021-06-04,2021-06-07 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch prepares the introduction of a rpmsg channel device for the
char device. The rpmsg channel device will require a default endpoint to
communicate to the remote processor.

Add the use_default_ept field in rpmsg_eptdev structure. This boolean
determines the behavior on rpmsg_eptdev_open and rpmsg_eptdev_release call.

- If use_default_ept == false:
  Use the legacy behavior by creating a new endpoint each time
  rpmsg_eptdev_open is called and release it when rpmsg_eptdev_release
  is called on /dev/rpmsgX device open/close.

- if use_default_ept == true:
  create a endpoint only on first rpmsg_eptdev_open call (if no default
  endpoint already exists) and associate it to the default endpoint.
  The endpoint is released when the rpmsg device is removed.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index fbe10d527c5c..4199ac1bee10 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -45,6 +45,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
  * @queue_lock:	synchronization of @queue operations
  * @queue:	incoming message queue
  * @readq:	wait object for incoming queue
+ * @use_default_ept: specify if the endpoint has to be created at each device opening or
+ *                   if the default endpoint should be reused.
  */
 struct rpmsg_eptdev {
 	struct device dev;
@@ -59,6 +61,8 @@ struct rpmsg_eptdev {
 	spinlock_t queue_lock;
 	struct sk_buff_head queue;
 	wait_queue_head_t readq;
+
+	bool use_default_ept;
 };
 
 int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
@@ -116,7 +120,21 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 
 	get_device(dev);
 
-	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+	/*
+	 * If the rpmsg device default endpoint is used, create it only the first time then reuse
+	 * it. Else a new endpoint is created on open that will be destroyed on release.
+	 */
+	if (eptdev->use_default_ept) {
+		ept = rpdev->ept;
+		if (!ept) {
+			ept = rpmsg_create_default_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+			if (ept)
+				eptdev->chinfo.src = rpdev->src;
+		}
+	} else {
+		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+	}
+
 	if (!ept) {
 		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
 		put_device(dev);
@@ -137,7 +155,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 	/* Close the endpoint, if it's not already destroyed by the parent */
 	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
-		rpmsg_destroy_ept(eptdev->ept);
+		if (!eptdev->use_default_ept)
+			rpmsg_destroy_ept(eptdev->ept);
 		eptdev->ept = NULL;
 	}
 	mutex_unlock(&eptdev->ept_lock);
@@ -323,8 +342,8 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
-			       struct rpmsg_channel_info chinfo)
+static int __rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+					struct rpmsg_channel_info chinfo, bool use_default_ept)
 {
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
@@ -337,6 +356,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 	dev = &eptdev->dev;
 	eptdev->rpdev = rpdev;
 	eptdev->chinfo = chinfo;
+	eptdev->use_default_ept = use_default_ept;
 
 	mutex_init(&eptdev->ept_lock);
 	spin_lock_init(&eptdev->queue_lock);
@@ -388,6 +408,12 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 
 	return ret;
 }
+
+int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo)
+{
+	return __rpmsg_chrdev_eptdev_create(rpdev, parent, chinfo, false);
+}
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
 static int rpmsg_chrdev_init(void)
-- 
2.17.1

