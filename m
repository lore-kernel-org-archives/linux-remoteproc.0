Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2822EC433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0968D6101C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbhJVM5K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Oct 2021 08:57:10 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:55370 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232168AbhJVM5J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Oct 2021 08:57:09 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M8o97u015566;
        Fri, 22 Oct 2021 14:54:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=9RVK8HoSopt/aYH2qzgA/E7I0VA3OupNlY5WwJpJ1nM=;
 b=e5bFzQiGrfVprpQ2GRL9OIxsRSr/lu+Xyj4TO0n/7t+IaReKG0tXHN+IJZvmAwPfeUWa
 W82IE1qQ1S470P08QjvmEUg90wzTX2bxHA1+LwG6AtYzM0m3Um2RSi3vf47clCJtnofL
 dDizOfi2RYo9T7tFBMFD6g74+WVn7nAMh80OgU/RPhZhejj7jI4dHNvtnEs8NOs9p4wJ
 feY0E61l14uXUlm+FDTE5/WiEbNSPPdHn6se33RIS0z7d/m2zM9irdgirSoWA+f3AZhu
 dTsfA5izRf+T8dvLE9mGQCh7P47KxbmmLgGgGlEBM1rxwSoJ7ONV18PsoMXPcMxVEvfm ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3but4y1eum-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Oct 2021 14:54:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 797BA100034;
        Fri, 22 Oct 2021 14:54:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7118321A226;
        Fri, 22 Oct 2021 14:54:43 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 14:54:43
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v6 05/10] rpmsg: char: Refactor rpmsg_chrdev_eptdev_create function
Date:   Fri, 22 Oct 2021 14:54:21 +0200
Message-ID: <20211022125426.2579-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_03,2021-10-22_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce the rpmsg_chrdev_eptdev_alloc and  rpmsg_chrdev_eptdev_add
internal function to split the allocation part from the device add.

This patch prepares the introduction of a rpmsg channel device for the
char device. An default endpoint will be created,
referenced in the rpmsg_eptdev structure before adding the devices.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
delta vs previous revision
- re-split in two functions to avoid race condition  with uevent,
  described by Born here: https://lkml.org/lkml/2021/10/8/1158
- clean Reviewed-by and Tested-by due to non-minor update
---
 drivers/rpmsg/rpmsg_char.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 3607865d7be7..74c96a8d33aa 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -322,20 +322,18 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
-			       struct rpmsg_channel_info chinfo)
+static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
+						      struct device *parent)
 {
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
-	int ret;
 
 	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
 	if (!eptdev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dev = &eptdev->dev;
 	eptdev->rpdev = rpdev;
-	eptdev->chinfo = chinfo;
 
 	mutex_init(&eptdev->ept_lock);
 	spin_lock_init(&eptdev->queue_lock);
@@ -351,6 +349,16 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
 	eptdev->cdev.owner = THIS_MODULE;
 
+	return eptdev;
+}
+
+static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
+{
+	struct device *dev = &eptdev->dev;
+	int ret;
+
+	eptdev->chinfo = chinfo;
+
 	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
 	if (ret < 0)
 		goto free_eptdev;
@@ -387,6 +395,21 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 
 	return ret;
 }
+
+int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo)
+{
+	struct rpmsg_eptdev *eptdev;
+	int ret;
+
+	eptdev = rpmsg_chrdev_eptdev_alloc(rpdev, parent);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+
+	return ret;
+}
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
 static int rpmsg_chrdev_init(void)
-- 
2.17.1

