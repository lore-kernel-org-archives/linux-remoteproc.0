Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6368C4332F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 May 2022 07:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbiE0HaI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 27 May 2022 03:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347099AbiE0HaG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 May 2022 03:30:06 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71B2F68B6;
        Fri, 27 May 2022 00:30:02 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L8byf1kn7zjX8L;
        Fri, 27 May 2022 15:28:58 +0800 (CST)
Received: from dggpemm500018.china.huawei.com (7.185.36.111) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 15:30:00 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500018.china.huawei.com (7.185.36.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 15:30:00 +0800
From:   keliu <liuke94@huawei.com>
To:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     keliu <liuke94@huawei.com>
Subject: [PATCH] rpmsg: Directly use ida_alloc()/free()
Date:   Fri, 27 May 2022 07:51:29 +0000
Message-ID: <20220527075129.2475594-1-liuke94@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500018.china.huawei.com (7.185.36.111)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use ida_alloc()/ida_free() instead of deprecated
ida_simple_get()/ida_simple_remove() .

Signed-off-by: keliu <liuke94@huawei.com>
---
 drivers/rpmsg/rpmsg_char.c | 10 +++++-----
 drivers/rpmsg/rpmsg_ctrl.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index b6183d4f62a2..7daa21d92f20 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -342,8 +342,8 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 {
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
 
-	ida_simple_remove(&rpmsg_ept_ida, dev->id);
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
+	ida_free(&rpmsg_ept_ida, dev->id);
+	ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
 	kfree(eptdev);
 }
 
@@ -389,7 +389,7 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
 		goto free_eptdev;
 	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
 
-	ret = ida_simple_get(&rpmsg_ept_ida, 0, 0, GFP_KERNEL);
+	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
 	if (ret < 0)
 		goto free_minor_ida;
 	dev->id = ret;
@@ -405,9 +405,9 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
 	return ret;
 
 free_ept_ida:
-	ida_simple_remove(&rpmsg_ept_ida, dev->id);
+	ida_free(&rpmsg_ept_ida, dev->id);
 free_minor_ida:
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+	ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
 free_eptdev:
 	put_device(dev);
 	kfree(eptdev);
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 107da70fdbaa..8418e2ea0716 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -130,8 +130,8 @@ static void rpmsg_ctrldev_release_device(struct device *dev)
 {
 	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
 
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+	ida_free(&rpmsg_ctrl_ida, dev->id);
+	ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
 	kfree(ctrldev);
 }
 
@@ -161,7 +161,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
 		goto free_ctrldev;
 	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
 
-	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
+	ret = ida_alloc(&rpmsg_ctrl_ida, GFP_KERNEL);
 	if (ret < 0)
 		goto free_minor_ida;
 	dev->id = ret;
@@ -179,9 +179,9 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
 	return ret;
 
 free_ctrl_ida:
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+	ida_free(&rpmsg_ctrl_ida, dev->id);
 free_minor_ida:
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+	ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
 free_ctrldev:
 	put_device(dev);
 	kfree(ctrldev);
-- 
2.25.1

