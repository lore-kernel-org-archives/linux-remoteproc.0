Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6ED4C07E94
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 09:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90E866142C
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 09:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhFDJQI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:16:08 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57392 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229981AbhFDJQH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 05:16:07 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15496lI2028502;
        Fri, 4 Jun 2021 11:14:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=YzOrkrkHZq0r60g/e950hTfN5Vx2FE30j84KKoiKa8s=;
 b=iDxCxwmPHj4pe1jtp8nuWXAad7WC3SPcSo3FptZS6yD4N+qKTGRkxvQdm0J/iHzZk4pg
 Tv4v2vx6XBaC7imMqdQoUJYoxzg7UixstbifU56ULokajqbDCaPZoeqtR32qKrv9eM83
 Ntz0XLDiCPuQ5EzBcoey904lFI1zYU/creVoHamtcC0cpigTn5A26UC8QKgpMKL3xRjk
 Ub+gkA4Ly6hS1y/S0l2CH8btWs5uAgQFG1E7WXu4gOsUDzKwveX1FSGBbpCXTGEgTP4S
 8tfc2k6yutyaDJfRih3oLxZaEHPeQgCdjUtudP2MzJiG5uJWWdpJvAoJ5k84ZYaMS1Vz Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38yg960grh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Jun 2021 11:14:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BC7310002A;
        Fri,  4 Jun 2021 11:14:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F8A4216EEF;
        Fri,  4 Jun 2021 11:14:19 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun 2021 11:14:18
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 3/4] rpmsg: ctrl: Add check on rpmsg device removability from user space
Date:   Fri, 4 Jun 2021 11:14:05 +0200
Message-ID: <20210604091406.15901-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-04_05:2021-06-04,2021-06-04 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Using the RPMSG_RELEASE_DEV_IOCTL is possible to remove any
rpmsg device (such as the rpmsg ns or the rpmsg ctrldev).

Add a new field to store the removability of the device.

By default the rpmsg device can not be removed by user space. It is
set to 1 by the rpmsg ctrl on RPMSG_CREATE_DEV_IOCTL request, but
could also be set by an rpmsg driver during probe.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 17 ++++++++++++++++-
 include/linux/rpmsg.h      |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index cb19e32d05e1..e93c6ec49038 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -74,6 +74,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	struct rpmsg_endpoint_info eptinfo;
 	struct rpmsg_channel_info chinfo;
 	struct rpmsg_device *rpdev;
+	struct device *dev;
 	int ret = 0;
 
 	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
@@ -95,11 +96,25 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 		if (!rpdev) {
 			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
 			ret = -ENXIO;
+		} else {
+			/* Allow user space to release the device. */
+			rpdev->us_removable = 1;
 		}
 		break;
 
 	case RPMSG_RELEASE_DEV_IOCTL:
-		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
+		dev = rpmsg_find_device(ctrldev->rpdev->dev.parent, &chinfo);
+		if (!dev)
+			ret =  -ENXIO;
+
+		/* Verify that rpmsg device removal is allowed. */
+		if (!ret) {
+			rpdev = to_rpmsg_device(dev);
+			if (!rpdev->us_removable)
+				ret = -EACCES;
+		}
+		if (!ret)
+			ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
 		if (ret)
 			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
 				chinfo.name, ret);
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index d97dcd049f18..3642aad1a789 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -47,6 +47,7 @@ struct rpmsg_channel_info {
  * @ept: the rpmsg endpoint of this channel
  * @announce: if set, rpmsg will announce the creation/removal of this channel
  * @little_endian: True if transport is using little endian byte representation
+ * @us_removable: True if userspace application has permission to remove the rpmsg device
  */
 struct rpmsg_device {
 	struct device dev;
@@ -57,6 +58,7 @@ struct rpmsg_device {
 	struct rpmsg_endpoint *ept;
 	bool announce;
 	bool little_endian;
+	bool us_removable;
 
 	const struct rpmsg_device_ops *ops;
 };
-- 
2.17.1

