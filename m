Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6766CC07E9C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 13:19:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DDC560FE3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 13:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234275AbhGLNWh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 09:22:37 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:53701 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233992AbhGLNWg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 09:22:36 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16CDIFqO024205;
        Mon, 12 Jul 2021 15:19:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=nXd5hMhrsy3vVNfNzAUMx9HXsDLKHJe6cxddoW9dxyU=;
 b=5pAvQwJg0CmXJAf1cEq0CObNBDCN+RFgGBjzyT3MiJvMpEHckZrk22pe/uV6OICYQYbd
 NGjAtgKtEUkTuZQW89WqDbJOROuyoBR4NuVTWG/xp3x89soRfE9K/P1IbtPi3h+6Rfjd
 8LvRc23N/SszvgOLlhAG1dVetoI2eogIfNoJSSct5a0CAgrbiVwdCYJo2L2mX6B8BZvK
 Dpxw7uPkX8S29Bs+kdNZ2ZXShylyhxtqisPq9O3owLyWNnCriYwxMF8xcE554vEfh2aB
 FBbeIgHQs1oqnDKeXIiLGJe4XdFZQo5eTQkaapfsyyKEb82NuQzeD9FG/E6+NITSwUGj eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39rk1vh2k0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jul 2021 15:19:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE9B8100034;
        Mon, 12 Jul 2021 15:19:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B16C12291D5;
        Mon, 12 Jul 2021 15:19:36 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul 2021 15:19:36
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 4/4] rpmsg: char: Introduce the "rpmsg-raw" channel
Date:   Mon, 12 Jul 2021 15:19:00 +0200
Message-ID: <20210712131900.24752-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
References: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-12_08:2021-07-12,2021-07-12 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allows to probe the endpoint device on a remote name service announcement,
by registering a rpmsg_driverfor the "rpmsg-raw" channel.

With this patch the /dev/rpmsgX interface can be instantiated by the remote
firmware.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Tested-by: Julien Massot <julien.massot@iot.bzh>
---
 drivers/rpmsg/rpmsg_char.c | 75 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index bd728d90ba4c..1b7b610e113d 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -25,6 +25,8 @@
 
 #include "rpmsg_char.h"
 
+#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
+
 static dev_t rpmsg_major;
 static struct class *rpmsg_class;
 
@@ -421,6 +423,61 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
+static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_channel_info chinfo;
+	struct rpmsg_eptdev *eptdev;
+	struct rpmsg_endpoint *ept;
+
+	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
+	chinfo.src = rpdev->src;
+	chinfo.dst = rpdev->dst;
+
+	eptdev =  __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	/*
+	 * Create the default endpoint associated to the rpmsg device and provide rpmsg_eptdev
+	 * structure as callback private data.
+	 */
+	ept = rpmsg_create_default_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+	if (!ept) {
+		dev_err(&rpdev->dev, "failed to create %s\n", eptdev->chinfo.name);
+		put_device(&eptdev->dev);
+		return -EINVAL;
+	}
+
+	/*
+	 * Do not allow the creation and release of an endpoint on /dev/rpmsgX open and close,
+	 * reuse the default endpoint instead
+	 */
+	eptdev->static_ept = true;
+
+	return 0;
+}
+
+static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
+{
+	int ret;
+
+	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
+	if (ret)
+		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
+}
+
+static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
+	{ .name	= RPMSG_CHAR_DEVNAME },
+	{ },
+};
+
+static struct rpmsg_driver rpmsg_chrdev_driver = {
+	.probe = rpmsg_chrdev_probe,
+	.remove = rpmsg_chrdev_remove,
+	.id_table = rpmsg_chrdev_id_table,
+	.drv.name = "rpmsg_chrdev",
+};
+
 static int rpmsg_chrdev_init(void)
 {
 	int ret;
@@ -434,16 +491,30 @@ static int rpmsg_chrdev_init(void)
 	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
 	if (IS_ERR(rpmsg_class)) {
 		pr_err("failed to create rpmsg class\n");
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-		return PTR_ERR(rpmsg_class);
+		ret = PTR_ERR(rpmsg_class);
+		goto free_region;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg: failed to register rpmsg raw driver\n");
+		goto free_class;
 	}
 
 	return 0;
+
+free_class:
+	class_destroy(rpmsg_class);
+free_region:
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+
+	return ret;
 }
 postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
+	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
 	class_destroy(rpmsg_class);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
-- 
2.17.1

