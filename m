Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A891C43461
	for <linux-remoteproc@archiver.kernel.org>; Thu, 29 Apr 2021 13:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1031E61407
	for <linux-remoteproc@archiver.kernel.org>; Thu, 29 Apr 2021 13:55:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238314AbhD2N4a (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 29 Apr 2021 09:56:30 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7146 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233862AbhD2N42 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Apr 2021 09:56:28 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13TDqoVN016932;
        Thu, 29 Apr 2021 15:55:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=yeXYULP5eq2GnrpxLGe9gEWKJg3B6sUimAODK7td/bA=;
 b=0BehwF1+ETy3Pr3KP0/c6xQbmH3w6zFnXnag+cZWKtSZRPXDGEHZwe6KMuWey516zPjg
 ApRk2cZYYOUptzu7teaBtJHzjw6OoXueChi83dTVcjoame+Mr63rDtY0uW5tJizRpL0m
 XkP0sZijp0mWD6pP2LXjHiaJOsUlJ1sZ7XMvhTYRHRtiyvFIlaHqfFMgK9Tha5lbq3cV
 c1On3Tg+0+GsUKaOrCDFqy5zH53gSu2fjhxphT5VQW/ORgptmHhyEsPuKzpQMyP6wHGL
 kYOiqWUpm63ZkT4nFrjCqr/rPl8Z8gT7RQtsAx37wdNgjqRxMskD6J+wEXUPtK3UFK23 Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38735wt32j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 15:55:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 507D310002A;
        Thu, 29 Apr 2021 15:55:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45C72212FA0;
        Thu, 29 Apr 2021 15:55:36 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 15:55:35
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 4/6] rpmsg: char: Add possibility to create and reuse default endpoint
Date:   Thu, 29 Apr 2021 15:55:05 +0200
Message-ID: <20210429135507.8264-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_07:2021-04-28,2021-04-29 signatures=0
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
Update from V2

This patch is a merge of two patches proposed in V2
 rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
 rpmsg: char: No dynamic endpoint management for the default one

With the introduction of the use_default_ept to determine the behaviour
on  rpmsg_eptdev_open/release.
---
 drivers/rpmsg/rpmsg_char.c | 46 +++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 3b07a050b75e..5c6a7da6e4d7 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -38,6 +38,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
  * @queue_lock:	synchronization of @queue operations
  * @queue:	incoming message queue
  * @readq:	wait object for incoming queue
+ * @use_default_ept: specify if the endpoint has to be created at each device opening or
+ *                   if the default endpoint should be reused.
  */
 struct rpmsg_eptdev {
 	struct device dev;
@@ -52,6 +54,8 @@ struct rpmsg_eptdev {
 	spinlock_t queue_lock;
 	struct sk_buff_head queue;
 	wait_queue_head_t readq;
+
+	bool use_default_ept;
 };
 
 int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
@@ -109,11 +113,29 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 
 	get_device(dev);
 
-	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
-	if (!ept) {
-		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
-		put_device(dev);
-		return -EINVAL;
+	/*
+	 * If the rpmsg device default endpoint is used, create it only the first time then reuse
+	 * it. Else a new endpoint is created on open that will be destroyed on release.
+	 */
+	if (eptdev->use_default_ept && rpdev->ept) {
+		ept = rpdev->ept;
+	} else {
+		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+		if (!ept) {
+			dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
+			put_device(dev);
+			return -EINVAL;
+		}
+
+		if (eptdev->use_default_ept) {
+			/*
+			 * Assign the new endpoint as default endpoint and update the channel
+			 * info source to reflect the allocation in the rpmsg class.
+			 */
+			rpdev->ept = ept;
+			rpdev->src = ept->addr;
+			eptdev->chinfo.src = rpdev->src;
+		}
 	}
 
 	eptdev->ept = ept;
@@ -130,7 +152,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 	/* Close the endpoint, if it's not already destroyed by the parent */
 	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
-		rpmsg_destroy_ept(eptdev->ept);
+		if (!eptdev->use_default_ept)
+			rpmsg_destroy_ept(eptdev->ept);
 		eptdev->ept = NULL;
 	}
 	mutex_unlock(&eptdev->ept_lock);
@@ -316,8 +339,8 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
-			       struct rpmsg_channel_info chinfo)
+static int __rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+					struct rpmsg_channel_info chinfo, bool use_default_ept)
 {
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
@@ -330,6 +353,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 	dev = &eptdev->dev;
 	eptdev->rpdev = rpdev;
 	eptdev->chinfo = chinfo;
+	eptdev->use_default_ept = use_default_ept;
 
 	mutex_init(&eptdev->ept_lock);
 	spin_lock_init(&eptdev->queue_lock);
@@ -381,6 +405,12 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 
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

