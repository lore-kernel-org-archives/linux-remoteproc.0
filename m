Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83889C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:21:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63615610A8
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240376AbhKHOXn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 09:23:43 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:39704 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236270AbhKHOXh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 09:23:37 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8Dgf6L012096;
        Mon, 8 Nov 2021 15:20:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=nIXD1POBmLH8QLg3K3bcExTDFqn4NO1Xf2Ky89ryiZk=;
 b=bsn9sIClsM1Ai5dFSAgoXbcrQCAsOTPSkr0CtCbd+Hv7xco6XAq1meQL+FgAe2coOHTk
 fEkRD9OUYac2YU8iZisJySyWdi3GuaN9Kggk24++ui2HeFwHQEtoG/KrNe/hXSj0c7VW
 ETV6xCPDNnzB4s/iPvTCX7hwcSHzx1tCqb0U8BE4A3hyGGOc0tHjTHlZxh9iP35YsLDL
 D8bsVnRqQn5tk7FtODKarbnP+fpTUqwmCNfMOfcCMyd+3hiptq4WQdj3YxaHQ/5dOpm/
 midjKe9QbokRIZANEG+PYd7krVchwTN68KAmJcZG3UPcXPhRLvOGzMswchZv0n0IPtTx 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c70ym2c0b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Nov 2021 15:20:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 605C910002A;
        Mon,  8 Nov 2021 15:20:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57AEB22FA38;
        Mon,  8 Nov 2021 15:20:51 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:20:50
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v7 12/12] rpmsg: core: send a ns announcement when a default endpoint is created
Date:   Mon, 8 Nov 2021 15:19:37 +0100
Message-ID: <20211108141937.13016-13-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

When a channel is created by user space application with the
RPMSG_CREATE_DEV_IOCTL controls, a ns announcement has to be sent
(depending on backend) to inform the remote side that a new service
is available.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index bdcde57c22f6..63227279397d 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -145,6 +145,9 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
  *
  * This function returns a pointer to an endpoint created and assigned as the default
  * endpoint of the rpmsg device.
+ * If we need to, we also announce about this channel to the remote
+ * processor. This announcement is needed in case the driver is exposing an rpmsg service that has
+ * been created locally.
  *
  * Drivers should provide their @rpdev channel (so the new endpoint would belong
  * to the same remote processor their channel belongs to), an rx callback
@@ -161,6 +164,7 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
 						struct rpmsg_channel_info chinfo)
 {
 	struct rpmsg_endpoint *ept;
+	int err = 0;
 
 	if (WARN_ON(!rpdev))
 		return NULL;
@@ -183,6 +187,16 @@ struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
 	rpdev->ept = ept;
 	rpdev->src = ept->addr;
 
+	if (rpdev->ops->announce_create)
+		err = rpdev->ops->announce_create(rpdev);
+	if (err) {
+		rpmsg_destroy_ept(ept);
+		rpdev->ept = NULL;
+		rpdev->src = RPMSG_ADDR_ANY;
+
+		return NULL;
+	}
+
 	return ept;
 }
 EXPORT_SYMBOL(rpmsg_create_default_ept);
-- 
2.17.1

