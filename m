Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CE9C07E99
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 13:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8CCB60FE3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 13:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbhGLNWa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 09:22:30 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45786 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230004AbhGLNW3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 09:22:29 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16CDHgMP024624;
        Mon, 12 Jul 2021 15:19:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=HNFqYn5P+/mkBKYrBCDkF4nmQRrjvSWGyN6gND9vc2c=;
 b=7di772L4eGCIPK8Cfa5dsEHYk46N546T7ubzAX5g6WQ/COz7p6Fr7GHWzW8bR2zhvf36
 Bbxs5D3ad0ZXaLWOmGBVr+jgVZBh7Sxb5Hd0CBJ1WN1xflxY8NOXfLWbykZ2pRJKxG6p
 KesGfGWixOK7Loi4l6eTw0ITrMSHOpchGOG+Jb87YGapr0a3N/pKBViSU86K88rwue/6
 BN8elUF0bDFluZCM9++U/zoswbSf2g4aP1Z9rER4nYpo4uc/csS3kt05I/ZUXCfVBFId
 C5TFdowxcW3VOLSPnAML+QsS+Z1gEOSBzY06p4v2x+uQToe+3XDyGT7vrZNM7c2oWZXA yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39rm34grsq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jul 2021 15:19:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42008100038;
        Mon, 12 Jul 2021 15:19:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 338BD2291D5;
        Mon, 12 Jul 2021 15:19:35 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul 2021 15:19:34
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 2/4] rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
Date:   Mon, 12 Jul 2021 15:18:58 +0200
Message-ID: <20210712131900.24752-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
References: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-12_08:2021-07-12,2021-07-12 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
the rpmsg_eptdev context structure.

This patch prepares the introduction of a rpmsg channel device for the
char device. The rpmsg device will need a reference to the context.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Tested-by: Julien Massot <julien.massot@iot.bzh>
---
 drivers/rpmsg/rpmsg_char.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index fbe10d527c5c..50b7d4b00175 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -323,8 +323,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
-			       struct rpmsg_channel_info chinfo)
+static struct rpmsg_eptdev *__rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev,
+							 struct device *parent,
+							 struct rpmsg_channel_info chinfo)
 {
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
@@ -332,7 +333,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 
 	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
 	if (!eptdev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dev = &eptdev->dev;
 	eptdev->rpdev = rpdev;
@@ -374,9 +375,10 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 	if (ret) {
 		dev_err(dev, "device_add failed: %d\n", ret);
 		put_device(dev);
+		return ERR_PTR(ret);
 	}
 
-	return ret;
+	return eptdev;
 
 free_ept_ida:
 	ida_simple_remove(&rpmsg_ept_ida, dev->id);
@@ -386,7 +388,19 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 	put_device(dev);
 	kfree(eptdev);
 
-	return ret;
+	return ERR_PTR(ret);
+}
+
+int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo)
+{
+	struct rpmsg_eptdev *eptdev;
+
+	eptdev = __rpmsg_chrdev_eptdev_create(rpdev, parent, chinfo);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	return 0;
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
-- 
2.17.1

