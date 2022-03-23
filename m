Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121BCC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Mar 2022 09:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbiCWJwj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Mar 2022 05:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiCWJwi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Mar 2022 05:52:38 -0400
X-Greylist: delayed 510 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 23 Mar 2022 02:51:09 PDT
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC374130B
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Mar 2022 02:51:09 -0700 (PDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D0D17201A57;
        Wed, 23 Mar 2022 10:42:37 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 97F50201A41;
        Wed, 23 Mar 2022 10:42:37 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 805A1183AC96;
        Wed, 23 Mar 2022 17:42:36 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: [PATCH] remoteproc: core: Remove state checking before changing state
Date:   Wed, 23 Mar 2022 17:32:50 +0800
Message-Id: <1648027970-11488-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

There is no mutex protecting of these state checking, which
can't garantee there is no another instance is trying to do
same operation.

The reference counter rproc->power is used to manage state
changing and there is mutex protection in each operation
function for multi instance case.

So remove this state checking in rproc_cdev_write() and
state_store(), just let reference counter rproc->power to
manage the behaviors.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 11 -----------
 drivers/remoteproc/remoteproc_sysfs.c | 11 -----------
 2 files changed, 22 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 906ff3c4dfdd..687f205fd70a 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -32,21 +32,10 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 		return -EFAULT;
 
 	if (!strncmp(cmd, "start", len)) {
-		if (rproc->state == RPROC_RUNNING ||
-		    rproc->state == RPROC_ATTACHED)
-			return -EBUSY;
-
 		ret = rproc_boot(rproc);
 	} else if (!strncmp(cmd, "stop", len)) {
-		if (rproc->state != RPROC_RUNNING &&
-		    rproc->state != RPROC_ATTACHED)
-			return -EINVAL;
-
 		ret = rproc_shutdown(rproc);
 	} else if (!strncmp(cmd, "detach", len)) {
-		if (rproc->state != RPROC_ATTACHED)
-			return -EINVAL;
-
 		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognized option\n");
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 51a04bc6ba7a..8c7ea8922638 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -194,23 +194,12 @@ static ssize_t state_store(struct device *dev,
 	int ret = 0;
 
 	if (sysfs_streq(buf, "start")) {
-		if (rproc->state == RPROC_RUNNING ||
-		    rproc->state == RPROC_ATTACHED)
-			return -EBUSY;
-
 		ret = rproc_boot(rproc);
 		if (ret)
 			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
 	} else if (sysfs_streq(buf, "stop")) {
-		if (rproc->state != RPROC_RUNNING &&
-		    rproc->state != RPROC_ATTACHED)
-			return -EINVAL;
-
 		ret = rproc_shutdown(rproc);
 	} else if (sysfs_streq(buf, "detach")) {
-		if (rproc->state != RPROC_ATTACHED)
-			return -EINVAL;
-
 		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
-- 
2.17.1

