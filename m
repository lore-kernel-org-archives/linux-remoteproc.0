Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E10AC4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:19:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CE14610C8
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240375AbhKHOWi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 09:22:38 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:35548 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240361AbhKHOWh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 09:22:37 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8DPSMQ020779;
        Mon, 8 Nov 2021 15:19:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5MQAuBL3ANE3J3uXb3hWMTijFY0SUx6iyvKYJNgBuUc=;
 b=x+kpwNMoVoaxYEqi/lBrp5GdAsnUQ6q2gmWNm6RAW/km4AajeTpclkxn1U/kXwAeUX+G
 b0H9d7aPCq/fQ4TyDEyLG1HDGRJiyC2kZM3ZYx5Js/dmZlZ/iU+2w5bJbIR9peGhi7Gi
 BmBLd82vTjnJxXMuq8OEgXKxhv6/6JpsHCHi77hgKBhAwyUnVREIwe3PI8Wdu+agAJDr
 eLsuXxN9aAKMtFaYM2GQrQf+4uJtWLOFrXm/61Bcen8rBJpjlfvQsXy2FUHI8NIrb6GX
 6plo68pAg8Gt9cIIhb4aezOdi4e0ob5mvbwNlqr8r3dGRSa6OvTSI623OB1K0oytU5Ul WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c709q2a3y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Nov 2021 15:19:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C9D910002A;
        Mon,  8 Nov 2021 15:19:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85B8121BF6B;
        Mon,  8 Nov 2021 15:19:43 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:19:43
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v7 02/12] rpmsg: Create the rpmsg class in core instead of in rpmsg char
Date:   Mon, 8 Nov 2021 15:19:27 +0100
Message-ID: <20211108141937.13016-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
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

Migrate the creation of the rpmsg class from the rpmsg_char
to the core that the class is usable by the rpmsg_char and
the futur rpmsg_ctrl module.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update vs previous revision:
- remove rpmsg_get_class API and export the rpmsg_class in rpmsg_internal.h
---
 drivers/rpmsg/rpmsg_char.c     | 10 ----------
 drivers/rpmsg/rpmsg_core.c     | 15 +++++++++++++--
 drivers/rpmsg/rpmsg_internal.h |  2 ++
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 44934d7fa3c4..8ab5ac23850c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -29,7 +29,6 @@
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
 
 static dev_t rpmsg_major;
-static struct class *rpmsg_class;
 
 static DEFINE_IDA(rpmsg_ctrl_ida);
 static DEFINE_IDA(rpmsg_ept_ida);
@@ -559,17 +558,9 @@ static int rpmsg_chrdev_init(void)
 		return ret;
 	}
 
-	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
-	if (IS_ERR(rpmsg_class)) {
-		pr_err("failed to create rpmsg class\n");
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-		return PTR_ERR(rpmsg_class);
-	}
-
 	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
 	if (ret < 0) {
 		pr_err("rpmsgchr: failed to register rpmsg driver\n");
-		class_destroy(rpmsg_class);
 		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 	}
 
@@ -580,7 +571,6 @@ postcore_initcall(rpmsg_chrdev_init);
 static void rpmsg_chrdev_exit(void)
 {
 	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
-	class_destroy(rpmsg_class);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
 module_exit(rpmsg_chrdev_exit);
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 9151836190ce..45227c864aa2 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -20,6 +20,9 @@
 
 #include "rpmsg_internal.h"
 
+struct class *rpmsg_class;
+EXPORT_SYMBOL(rpmsg_class);
+
 /**
  * rpmsg_create_channel() - create a new rpmsg channel
  * using its name and address info.
@@ -629,10 +632,17 @@ static int __init rpmsg_init(void)
 {
 	int ret;
 
+	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
+	if (IS_ERR(rpmsg_class)) {
+		pr_err("failed to create rpmsg class\n");
+		return PTR_ERR(rpmsg_class);
+	}
+
 	ret = bus_register(&rpmsg_bus);
-	if (ret)
+	if (ret) {
 		pr_err("failed to register rpmsg bus: %d\n", ret);
-
+		class_destroy(rpmsg_class);
+	}
 	return ret;
 }
 postcore_initcall(rpmsg_init);
@@ -640,6 +650,7 @@ postcore_initcall(rpmsg_init);
 static void __exit rpmsg_fini(void)
 {
 	bus_unregister(&rpmsg_bus);
+	class_destroy(rpmsg_class);
 }
 module_exit(rpmsg_fini);
 
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index a76c344253bf..1b6f998e1a4a 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -18,6 +18,8 @@
 #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
 #define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
 
+extern struct class *rpmsg_class;
+
 /**
  * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
  * @create_channel:	create backend-specific channel, optional
-- 
2.17.1

