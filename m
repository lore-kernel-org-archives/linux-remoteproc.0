Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EC8C4707F
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84655613FE
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhEVAFB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 May 2021 20:05:01 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58072 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbhEVAE7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 May 2021 20:04:59 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14M03LMi026979;
        Fri, 21 May 2021 19:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621641801;
        bh=z6AkuI6I7UPsQ1o2vpsJ3AtMMR+drDArH+1kW4nfjfo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rkI9Wo6LUK6En9OkSxYb/WLk+MB/MIUXL5HU7BDFmzGfcD8cnXIWhEMdQL4KaqkSo
         o/vIAPXnxWaREe5+mu8bMuaiDvY0CaSzta8q9sG5blrSopncNJzgH/UbZXL0xnS+/9
         rnNtv0iVY2ZrrZ9L0Eqo9+l3U8DEcDkfrc2lzNMs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14M03Lvm062729
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 19:03:21 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 19:03:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 19:03:21 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14M03LYX089888;
        Fri, 21 May 2021 19:03:21 -0500
Received: from localhost ([10.250.35.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14M03LB1091516;
        Fri, 21 May 2021 19:03:21 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/6] remoteproc: Add support for detach-only during shutdown
Date:   Fri, 21 May 2021 19:03:05 -0500
Message-ID: <20210522000309.26134-3-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210522000309.26134-1-s-anna@ti.com>
References: <20210522000309.26134-1-s-anna@ti.com>
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

Introduce a new rproc state flag 'detach_on_shutdown' that individual
remoteproc drivers can set to only allow detach in rproc_shutdown()
that would have been invoked when the driver is uninstalled, so that
remote processor continues to run undisturbed even after the driver
removal.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
 drivers/remoteproc/remoteproc_core.c  | 5 ++++-
 drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
 include/linux/remoteproc.h            | 3 +++
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 0b8a84c04f76..473467711a09 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
+		if (rproc->state == RPROC_ATTACHED &&
+		    rproc->detach_on_shutdown) {
+			dev_err(&rproc->dev,
+				"stop not supported for this rproc, use detach\n");
+			return -EINVAL;
+		}
+
 		rproc_shutdown(rproc);
 	} else if (!strncmp(cmd, "detach", len)) {
 		if (rproc->state != RPROC_ATTACHED)
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 6019f46001c8..e8ab3eb41f00 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2074,7 +2074,10 @@ void rproc_shutdown(struct rproc *rproc)
 	if (!atomic_dec_and_test(&rproc->power))
 		goto out;
 
-	ret = rproc_stop(rproc, false);
+	if (rproc->detach_on_shutdown && rproc->state == RPROC_ATTACHED)
+		ret = __rproc_detach(rproc);
+	else
+		ret = rproc_stop(rproc, false);
 	if (ret) {
 		atomic_inc(&rproc->power);
 		goto out;
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index ea8b89f97d7b..1785fbcb1075 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
 		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
+		if (rproc->state == RPROC_ATTACHED &&
+		    rproc->detach_on_shutdown) {
+			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
+			return -EINVAL;
+		}
+
 		rproc_shutdown(rproc);
 	} else if (sysfs_streq(buf, "detach")) {
 		if (rproc->state != RPROC_ATTACHED)
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 42a1f30e33a7..35ef921676a1 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -530,6 +530,8 @@ struct rproc_dump_segment {
  * @elf_machine: firmware ELF machine
  * @cdev: character device of the rproc
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
+ * @detach_on_shutdown: flag to indicate if remoteproc cannot be shutdown in
+ *			attached state and _only_ support detach
  */
 struct rproc {
 	struct list_head node;
@@ -569,6 +571,7 @@ struct rproc {
 	u16 elf_machine;
 	struct cdev cdev;
 	bool cdev_put_on_release;
+	bool detach_on_shutdown;
 };
 
 /**
-- 
2.30.1

