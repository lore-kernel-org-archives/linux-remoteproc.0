Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE933C43462
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 13:45:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91A7D611F0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 13:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346094AbhDMNpr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 09:45:47 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:47860 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1344847AbhDMNpo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 09:45:44 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13DDhR9L031734;
        Tue, 13 Apr 2021 15:45:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=LbWU4onpq2aSk9qGhMd1jmGLODJWR/qdj5uSusGKCJg=;
 b=I3Fr75ODtk6qstVfdPPwaf7fm0mvaJOb9ePk00mH/VnlA+bYpOj4+cQPQwLl/kEpgUAu
 6EPEeBwTmU0GHiczgeRCXtEY+nuEFwkmvHj6F0eD8pMhqW2Om16xVs7nyhzo8kLdyW4e
 7DV7UsKwJFYWjh0ug4CVkT3dMTxxkBEoBmHe/n0yV8d/Pnl8H6NTu++Nk83ApVgRSY1B
 OeHYEuB38J7LTdd54g5hXTUeDE4MzLua66GS9yNTqaXLYAFS+slGPbR8o+LCSwl2aYDI
 FakFmFzUs05dzC7Xzsm6CMyl4s4LsXjW6WjPIw6ea0xrQ1ngKwrsAkP6VcljjZNTYyd6 bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37vu4e52sq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Apr 2021 15:45:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 764C0100034;
        Tue, 13 Apr 2021 15:45:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 694A3226C5A;
        Tue, 13 Apr 2021 15:45:22 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 15:45:22
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 4/7] rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
Date:   Tue, 13 Apr 2021 15:44:55 +0200
Message-ID: <20210413134458.17912-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-13_07:2021-04-13,2021-04-13 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
the rpmsg_eptdev context structure.

This patch prepares the introduction of a rpmsg channel device for the
char device. The rpmsg device will need a reference to the context.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
update from V1
- fix __rpmsg_chrdev_create_eptdev function header indentation.

---
 drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 21ef9d9eccd7..a64249d83172 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -323,8 +323,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
-			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
+static struct rpmsg_eptdev *
+__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+			     struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
 {
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
@@ -332,7 +333,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 
 	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
 	if (!eptdev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dev = &eptdev->dev;
 	eptdev->rpdev = rpdev;
@@ -376,7 +377,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 		put_device(dev);
 	}
 
-	return ret;
+	return eptdev;
 
 free_ept_ida:
 	ida_simple_remove(&rpmsg_ept_ida, dev->id);
@@ -386,7 +387,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 	put_device(dev);
 	kfree(eptdev);
 
-	return ret;
+	return ERR_PTR(ret);
+}
+
+int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo,  struct class *rpmsg_class)
+{
+	struct rpmsg_eptdev *eptdev;
+
+	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, parent, chinfo, rpmsg_class);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	return 0;
 }
 EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
-- 
2.17.1

