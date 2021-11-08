Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765D7C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 518E06125F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:00:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238244AbhKHODA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 09:03:00 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:40848 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235902AbhKHODA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 09:03:00 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8DUtvD020848;
        Mon, 8 Nov 2021 15:00:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=FulIKCVrxDMWmfwJoAOsNNUnoxSxCD68JFDi4I0W9R8=;
 b=CKOjiaRgF5V3A9wXHLDUuXRQ0ZQ8w0jDQE3mKrLb+QFdj90N2U1f8gSR8SeSb/k3iOq4
 lt71qpbBGR73Nd9SLnosQKdzZ5a4P+bMdHhTcMAxj6vBC3MOpfeP03HZtKHtp4AXdmfH
 a/z4g1wNz1j3AkfShqeakGjYZbhq65X2LimJ2mP5/iCWug/kxvsfMBzMyUJZsvk2Db2f
 gxeltnholhpcUDM5o4oYamLCtWQYyJvp6wosQgSwpOv33Mxrl7nNVxQ20794xFj2Ow8h
 gRIkLMWdRjYZLshYt+oEFtWdwH+YfCKsbwnDhD8JCyb9mQanBQy7ecp2zz9vryuEeios dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c74uk86re-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Nov 2021 15:00:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1AC610002A;
        Mon,  8 Nov 2021 15:00:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E443922D195;
        Mon,  8 Nov 2021 15:00:11 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:00:11
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH] rpmsg: char: Add pr_fmt() to prefix messages
Date:   Mon, 8 Nov 2021 14:59:45 +0100
Message-ID: <20211108135945.3364-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Make all messages to be prefixed in a unified way.
Add pr_fmt() to achieve this.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index b5907b80727c..d6214cb66026 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -9,6 +9,9 @@
  * Based on rpmsg performance statistics driver by Michal Simek, which in turn
  * was based on TI & Google OMX rpmsg driver.
  */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
 #include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/fs.h>
@@ -550,7 +553,7 @@ static int rpmsg_chrdev_init(void)
 
 	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
 	if (ret < 0) {
-		pr_err("rpmsg: failed to allocate char dev region\n");
+		pr_err("failed to allocate char dev region\n");
 		return ret;
 	}
 
@@ -563,7 +566,7 @@ static int rpmsg_chrdev_init(void)
 
 	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
 	if (ret < 0) {
-		pr_err("rpmsgchr: failed to register rpmsg driver\n");
+		pr_err("failed to register rpmsg driver\n");
 		class_destroy(rpmsg_class);
 		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 	}
-- 
2.17.1

