Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66762C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4606660F4B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhJVM5G (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Oct 2021 08:57:06 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:55300 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231771AbhJVM5F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Oct 2021 08:57:05 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M8o6nT015517;
        Fri, 22 Oct 2021 14:54:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=JGyE3BqSrOLbQuareZJPaI/kQrZYD8r1cbyBKDqXMzo=;
 b=RvUwRv/YedluUzTEo+2EwRR6Yp+cO52FQS6n0Qw52jwJuuWSOreyVucfw/rcksZa6J+H
 mKQFE/sikUKVtpDOfjkfYCqH190K/iG7i4lS9e1rhWMBkx+zkUoXmzVpouWUTxQFQH0L
 EXMGF23I2vcnG8DyabdDnYMu5mp6sUTcqUHVbHE9CsjWs53mJZ/u8BpPXbKAwPX6wRj3
 32mXIXvO1OO4Ge8R3olrm3dfPRMARkTmpo0dkdmCDeUxCcaLEYdXYEK9GJIPGkL0EeCs
 +a0HQyCgNDLwCIjh1IOHhrxik5p5/6oGyhBaGh5pysvyPbbKuBOLqklYPpb7W7bDDu+6 Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3but4y1eut-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Oct 2021 14:54:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD8E9100034;
        Fri, 22 Oct 2021 14:54:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D538B21A226;
        Fri, 22 Oct 2021 14:54:44 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 14:54:44
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v6 07/10] rpmsg: char: Add possibility to use default endpoint of the rpmsg device.
Date:   Fri, 22 Oct 2021 14:54:23 +0200
Message-ID: <20211022125426.2579-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_03,2021-10-22_01,2020-04-07_01
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

Add the default_ept field in rpmsg_eptdev structure.This pointer
determines the behavior on rpmsg_eptdev_open and rpmsg_eptdev_release call.

- If default_ept == NULL:
  Use the legacy behavior by creating a new endpoint each time
  rpmsg_eptdev_open is called and release it when rpmsg_eptdev_release
  is called on /dev/rpmsgX device open/close.

- If default_ept is set:
  use the rpmsg device default endpoint for the communication.

Address the update of _rpmsg_chrdev_eptdev_create in a separate patch for readability.

Add protection in rpmsg_eptdev_ioctl to prevent to destroy a default endpoint.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
update vs previous version
 - replace static_ept boolean by default_ept endpoint pointer which
   can point to the default channel endpoint.
 - clean Reviewed-by and tested-by as code updated.
---
 drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 74c96a8d33aa..632279cd6c97 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -44,6 +44,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
  * @queue_lock:	synchronization of @queue operations
  * @queue:	incoming message queue
  * @readq:	wait object for incoming queue
+ * @default_ept: set to channel default endpoint if the default endpoint should be re-used
+ *              on device open to prevent endpoint address update.
  */
 struct rpmsg_eptdev {
 	struct device dev;
@@ -54,10 +56,12 @@ struct rpmsg_eptdev {
 
 	struct mutex ept_lock;
 	struct rpmsg_endpoint *ept;
+	struct rpmsg_endpoint *default_ept;
 
 	spinlock_t queue_lock;
 	struct sk_buff_head queue;
 	wait_queue_head_t readq;
+
 };
 
 int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
@@ -115,7 +119,15 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 
 	get_device(dev);
 
-	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+	/*
+	 * If the default_ept is set to true, the rpmsg device default endpoint is used.
+	 * Else a new endpoint is created on open that will be destroyed on release.
+	 */
+	if (eptdev->default_ept)
+		ept = eptdev->default_ept;
+	else
+		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+
 	if (!ept) {
 		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
 		put_device(dev);
@@ -136,7 +148,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 	/* Close the endpoint, if it's not already destroyed by the parent */
 	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
-		rpmsg_destroy_ept(eptdev->ept);
+		if (!eptdev->default_ept)
+			rpmsg_destroy_ept(eptdev->ept);
 		eptdev->ept = NULL;
 	}
 	mutex_unlock(&eptdev->ept_lock);
@@ -263,6 +276,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
 		return -EINVAL;
 
+	/* Don't allow to destroy a default endpoint. */
+	if (eptdev->default_ept)
+		return -EINVAL;
+
 	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
 }
 
-- 
2.17.1

