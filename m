Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0753C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD66E61037
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhJVM5Y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Oct 2021 08:57:24 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:53832 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232796AbhJVM5M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Oct 2021 08:57:12 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19MApujK015788;
        Fri, 22 Oct 2021 14:54:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=3TX6WhgrADthuhyZ8GL5AE6fdHA7Bvh4XpDckNmaeKo=;
 b=Wo4tlDcc1hLkV8rsO9XBPxpGQNAkeRdbEBadCKPjnhRh4GYBuH1FAKz/yml75Wp6+4gW
 HSYQuLUjhqQPBEW8BC/9dso2gldjztx7hemlI8M+r+mDeBHkbkN+gPTXjeCvQOZzcZTZ
 SI5WjMnbUxZwcaVjtFr7Bi1Gg5RZAJG/SnfjK54W5SZ9ANab+dE7dMlFZ+feXbnm7YcV
 JKVV5niXJXailTiKy6nmfbBAEGiOJeCKkNTbL3GK3c7oaparr8puafDpuq0zDD/wqf/a
 Cmz/jMvqiIlKAHTaJxciMMt18OZjQ2NAGhTowBkV92jkHV8WOzraWzlf1EPt++XVTiDl CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3buqa0an1e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Oct 2021 14:54:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB63710002A;
        Fri, 22 Oct 2021 14:54:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A369721A226;
        Fri, 22 Oct 2021 14:54:45 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 14:54:45
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v6 08/10] rpmsg: char: Introduce the "rpmsg-raw" channel
Date:   Fri, 22 Oct 2021 14:54:24 +0200
Message-ID: <20211022125426.2579-9-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_03,2021-10-22_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allows to probe the endpoint device on a remote name service announcement,
by registering a rpmsg_driverfor the "rpmsg-raw" channel.

With this patch the /dev/rpmsgX interface can be instantiated by the remote
firmware.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
update from last version:
- rework the probe function to create the default endpoint before
 adding the eptdev.
- clean Reviewed-by and tested-by as code updated.
---
 drivers/rpmsg/rpmsg_char.c | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 632279cd6c97..aef628c6b57c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -429,6 +429,58 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
 
+static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_channel_info chinfo;
+	struct rpmsg_eptdev *eptdev;
+	struct device *dev = &rpdev->dev;
+
+	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
+	chinfo.src = rpdev->src;
+	chinfo.dst = rpdev->dst;
+
+	eptdev = rpmsg_chrdev_eptdev_alloc(rpdev, dev);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	/*
+	 * Create the default endpoint associated to the rpmsg device and provide rpmsg_eptdev
+	 * structure as callback private data.
+	 * Do not allow the creation and release of an endpoint on /dev/rpmsgX open and close,
+	 * reuse the default endpoint instead
+	 */
+	eptdev->default_ept = rpmsg_create_default_ept(rpdev, rpmsg_ept_cb, eptdev, chinfo);
+	if (!eptdev->default_ept) {
+		dev_err(&rpdev->dev, "failed to create %s\n", chinfo.name);
+		put_device(dev);
+		kfree(eptdev);
+		return -EINVAL;
+	}
+
+	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
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
+	{ .name	= "rpmsg-raw" },
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
@@ -439,12 +491,24 @@ static int rpmsg_chrdev_init(void)
 		return ret;
 	}
 
+	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg: failed to register rpmsg raw driver\n");
+		goto free_region;
+	}
+
 	return 0;
+
+free_region:
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+
+	return ret;
 }
 postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
+	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
 module_exit(rpmsg_chrdev_exit);
-- 
2.17.1

