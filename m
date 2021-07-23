Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426E0C4338F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Jul 2021 22:03:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2406A60EB2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Jul 2021 22:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbhGWVXU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 23 Jul 2021 17:23:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46722 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhGWVXU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 23 Jul 2021 17:23:20 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16NM3oap057061;
        Fri, 23 Jul 2021 17:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627077830;
        bh=uZZ1RqyhqZ7imMA6Ex9lJr6p4A4y139cey6GLoCZEOk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=H52/RvYbw78aQGyxNpvlpYU/aSAo52ApmKSq3P4W/FO1MRcFyfrvH20Oak5UxZhSF
         ceIq3kZ/SoRF7hn9CcE/QA7GilCKn3iM3SeMMvVmgphEGCyhw21I3YqIyDiYhqEyAa
         LHcnmeytHJPHDngVivtTjQt4dnhdhlTsNFH9oyo8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16NM3oiG038452
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Jul 2021 17:03:50 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 23
 Jul 2021 17:02:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 23 Jul 2021 17:02:50 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16NM2owY025364;
        Fri, 23 Jul 2021 17:02:50 -0500
Received: from localhost ([10.250.38.176])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 16NM2nf0126728;
        Fri, 23 Jul 2021 17:02:50 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 1/5] remoteproc: Add support for detach-only during shutdown
Date:   Fri, 23 Jul 2021 17:02:44 -0500
Message-ID: <20210723220248.6554-2-s-anna@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723220248.6554-1-s-anna@ti.com>
References: <20210723220248.6554-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The remoteproc core has support for both stopping and detaching a
remote processor that was attached to previously, through both the
remoteproc sysfs and cdev interfaces. The rproc_shutdown() though
unconditionally only uses the stop functionality at present. This
may not be the default desired functionality for all the remoteproc
platform drivers.

Enhance the remoteproc core logic to key off the presence of the
.stop() ops and allow the individual remoteproc drivers to continue
to use the standard rproc_add() and rproc_del() API. This allows
the remoteproc drivers to only do detach if supported when the driver
is uninstalled, and the remote processor continues to run undisturbed
even after the driver removal.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: Addressed various review comments from v1
 - Reworked the logic to not use remoteproc detach_on_shutdown and
   rely only on rproc callback ops
 - Updated the last para of the patch description
v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210522000309.26134-3-s-anna@ti.com/

 drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
 drivers/remoteproc/remoteproc_core.c  | 5 ++++-
 drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 4ad98b0b8caa..16c932beed88 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
+		if (rproc->state == RPROC_ATTACHED &&
+		    !rproc->ops->stop) {
+			dev_err(&rproc->dev,
+				"stop not supported for this rproc, use detach\n");
+			return -EINVAL;
+		}
+
 		rproc_shutdown(rproc);
 	} else if (!strncmp(cmd, "detach", len)) {
 		if (rproc->state != RPROC_ATTACHED)
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7de5905d276a..ab9e52180b04 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2075,7 +2075,10 @@ void rproc_shutdown(struct rproc *rproc)
 	if (!atomic_dec_and_test(&rproc->power))
 		goto out;
 
-	ret = rproc_stop(rproc, false);
+	if (rproc->state == RPROC_ATTACHED && !rproc->ops->stop)
+		ret = __rproc_detach(rproc);
+	else
+		ret = rproc_stop(rproc, false);
 	if (ret) {
 		atomic_inc(&rproc->power);
 		goto out;
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index ea8b89f97d7b..133e766f38d4 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
 		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
+		if (rproc->state == RPROC_ATTACHED &&
+		    !rproc->ops->stop) {
+			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
+			return -EINVAL;
+		}
+
 		rproc_shutdown(rproc);
 	} else if (sysfs_streq(buf, "detach")) {
 		if (rproc->state != RPROC_ATTACHED)
-- 
2.32.0

