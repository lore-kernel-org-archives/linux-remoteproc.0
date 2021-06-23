Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2660C4743C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 15:08:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA0956102A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 15:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbhFWPKk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Jun 2021 11:10:40 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45826 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229523AbhFWPKj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jun 2021 11:10:39 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15NF1rA8005711;
        Wed, 23 Jun 2021 17:08:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=WlwL5ztXWChpFycVBMo0Ty/Vdy7r4eJCRq1GkIG9V9Q=;
 b=xNqG2SRnzTwmHW7mFYubkgvPQAl5gA+bq1PXMm7r3GaZCOTigbGEAPBX2BdEdug7Nb8r
 JBc5oebWh+SOKfsJfRgkb8CNL08nYdXTLrfQ4MVTRa5PU4oFhjQN8Ws6QqxBEhgbURDj
 XM3f/BkeuyJCO4gfil3CgFZbcaHGDL30EIM9quG9e2jK87afQOxCUsuSk0r7eY14K1Nq
 Fk1mcJpPSnf2cx3o7KDcFlBAcZFORxEWkcUINbruYXwmBb/FUzXEe45wpq8FKr+Y1uN4
 N/RB9AHff+7x22GYALXf7GUi+q8pfwccM7/pZqeV7oS2eBOvnVgwToRgyQYoaJm32F4s tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39c18m2ph5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Jun 2021 17:08:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAEBA10002A;
        Wed, 23 Jun 2021 17:08:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAAC222D186;
        Wed, 23 Jun 2021 17:08:12 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Jun 2021 17:08:12
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 3/4] rpmsg: char: Add possibility to use default endpoint of the rpmsg device.
Date:   Wed, 23 Jun 2021 17:05:03 +0200
Message-ID: <20210623150504.14450-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
References: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-23_09:2021-06-23,2021-06-23 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Current implementation create/destroy a new endpoint on each
rpmsg_eptdev_open/rpmsg_eptdev_release calls.

For a rpmsg device created by the NS announcement mechanism we need to
use a unique static endpoint that is the default rpmsg device endpoint
associated to the channel.

This patch prepares the introduction of a rpmsg channel device for the
char device. The rpmsg channel device will require a default endpoint to
communicate to the remote processor.

Add the static_ept field in rpmsg_eptdev structure. This boolean
determines the behavior on rpmsg_eptdev_open and rpmsg_eptdev_release call.

- If static_ept == false:
  Use the legacy behavior by creating a new endpoint each time
  rpmsg_eptdev_open is called and release it when rpmsg_eptdev_release
  is called on /dev/rpmsgX device open/close.

- If static_ept == true:
  use the rpmsg device default endpoint for the communication.
- Address the update of _rpmsg_chrdev_eptdev_create in e separate patch for readability.

Add protection in rpmsg_eptdev_ioctl to prevent to destroy a default endpoint.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
update vs V1:
- remove the management of the default endpoint creation from rpmsg_eptdev_open.

---
 drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 50b7d4b00175..a75dce1e29d8 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -45,6 +45,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
  * @queue_lock:	synchronization of @queue operations
  * @queue:	incoming message queue
  * @readq:	wait object for incoming queue
+ * @static_ept: specify if the endpoint has to be created at each device opening or
+ *              if the default endpoint should be used.
  */
 struct rpmsg_eptdev {
 	struct device dev;
@@ -59,6 +61,8 @@ struct rpmsg_eptdev {
 	spinlock_t queue_lock;
 	struct sk_buff_head queue;
 	wait_queue_head_t readq;
+
+	bool static_ept;
 };
 
 int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
@@ -116,7 +120,15 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 
 	get_device(dev);
 
-	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+	/*
+	 * If the static_ept is set to true, the rpmsg device default endpoint is used.
+	 * Else a new endpoint is created on open that will be destroyed on release.
+	 */
+	if (eptdev->static_ept)
+		ept = rpdev->ept;
+	else
+		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+
 	if (!ept) {
 		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
 		put_device(dev);
@@ -137,7 +149,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 	/* Close the endpoint, if it's not already destroyed by the parent */
 	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
-		rpmsg_destroy_ept(eptdev->ept);
+		if (!eptdev->static_ept)
+			rpmsg_destroy_ept(eptdev->ept);
 		eptdev->ept = NULL;
 	}
 	mutex_unlock(&eptdev->ept_lock);
@@ -264,6 +277,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
 		return -EINVAL;
 
+	/* Don't allow to destroy a default endpoint. */
+	if (!eptdev->rpdev || eptdev->ept == eptdev->rpdev->ept)
+		return -EPERM;
+
 	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
 }
 
-- 
2.17.1

