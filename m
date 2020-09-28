Return-Path: <SRS0=pvyB=DF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B00C2D0A8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Sep 2020 23:12:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0DC623A5A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Sep 2020 23:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="rqPpHxG0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgI1XM5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Sep 2020 19:12:57 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:61694 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726064AbgI1XM5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Sep 2020 19:12:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601334775; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Jp2gsWi6s/o74F0XHkp2qi6LFuommnCdwk87KdIJ9Kw=; b=rqPpHxG04tmOsCehzwxEdUxN2yMn22jl2QArWFi1CQaS6B8dizeAu7aPHGxTRWb9HJyoeFQ2
 VHrSC4DVJzCsAAcKbH84wHylLkPZPzbi6OLaCYZodVyoQAMlEkleiUG03R6/G590W59AOPT/
 P3jzEaegSxFkwY535jaeWkuTaSo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f7261122892e2043e87ad51 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 22:17:54
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB24AC433F1; Mon, 28 Sep 2020 22:17:53 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA85BC433C8;
        Mon, 28 Sep 2020 22:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DA85BC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Cc:     tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v6 3/3] remoteproc: Change default dump configuration to "disabled"
Date:   Mon, 28 Sep 2020 15:17:36 -0700
Message-Id: <1601331456-20432-4-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601331456-20432-1-git-send-email-rishabhb@codeaurora.org>
References: <1601331456-20432-1-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Disable the coredump collection by default as doing so makes sense
for production devices. Also rename the "default" configuration
option to "enabled" to avoid confusion.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 Documentation/ABI/testing/sysfs-class-remoteproc | 10 ++++++----
 drivers/remoteproc/remoteproc_coredump.c         |  6 +++---
 drivers/remoteproc/remoteproc_sysfs.c            | 10 +++++-----
 include/linux/remoteproc.h                       |  8 ++++----
 4 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc b/Documentation/ABI/testing/sysfs-class-remoteproc
index 7368b50..dec1686 100644
--- a/Documentation/ABI/testing/sysfs-class-remoteproc
+++ b/Documentation/ABI/testing/sysfs-class-remoteproc
@@ -67,11 +67,14 @@ Description:	Remote processor coredump configuration
 		Reports the coredump configuration of the remote processor,
 		which will be one of:
 
-		"default"
-		"inline"
 		"disabled"
+		"enabled"
+		"inline"
+
+		"disabled" means no dump will be collected. This is the
+		default remoteproc coredump configuration.
 
-		"default" means when the remote processor's coredump is
+		"enabled" means when the remote processor's coredump is
 		collected it will be copied to a separate buffer and that
 		buffer is exposed to userspace.
 
@@ -81,7 +84,6 @@ Description:	Remote processor coredump configuration
 		copy the dump. Also recovery process will not proceed until
 		all data is read by usersapce.
 
-		"disabled" means no dump will be collected.
 
 What:		/sys/class/remoteproc/.../recovery
 Date:		July 2020
diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index bb15a29..34530dc 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -257,7 +257,7 @@ void rproc_coredump(struct rproc *rproc)
 		 * directly read from device memory.
 		 */
 		data_size += elf_size_of_phdr(class);
-		if (dump_conf == RPROC_COREDUMP_DEFAULT)
+		if (dump_conf == RPROC_COREDUMP_ENABLED)
 			data_size += segment->size;
 
 		phnum++;
@@ -297,14 +297,14 @@ void rproc_coredump(struct rproc *rproc)
 		elf_phdr_set_p_flags(class, phdr, PF_R | PF_W | PF_X);
 		elf_phdr_set_p_align(class, phdr, 0);
 
-		if (dump_conf == RPROC_COREDUMP_DEFAULT)
+		if (dump_conf == RPROC_COREDUMP_ENABLED)
 			rproc_copy_segment(rproc, data + offset, segment, 0,
 					   segment->size);
 
 		offset += elf_phdr_get_p_filesz(class, phdr);
 		phdr += elf_size_of_phdr(class);
 	}
-	if (dump_conf == RPROC_COREDUMP_DEFAULT) {
+	if (dump_conf == RPROC_COREDUMP_ENABLED) {
 		dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
 		return;
 	}
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index e60a014..eb98ed2 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -68,12 +68,12 @@ static DEVICE_ATTR_RW(recovery);
 /*
  * A coredump-configuration-to-string lookup table, for exposing a
  * human readable configuration via sysfs. Always keep in sync with
- * enum rproc_coredump_mechanism
+ * enum rproc_dump_mechanism
  */
 static const char * const rproc_coredump_str[] = {
-	[RPROC_COREDUMP_DEFAULT]	= "default",
-	[RPROC_COREDUMP_INLINE]		= "inline",
 	[RPROC_COREDUMP_DISABLED]	= "disabled",
+	[RPROC_COREDUMP_ENABLED]	= "enabled",
+	[RPROC_COREDUMP_INLINE]		= "inline",
 };
 
 /* Expose the current coredump configuration via debugfs */
@@ -115,10 +115,10 @@ static ssize_t coredump_store(struct device *dev,
 
 	if (sysfs_streq(buf, "disabled")) {
 		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
+	} else if (sysfs_streq(buf, "enabled")) {
+		rproc->dump_conf = RPROC_COREDUMP_ENABLED;
 	} else if (sysfs_streq(buf, "inline")) {
 		rproc->dump_conf = RPROC_COREDUMP_INLINE;
-	} else if (sysfs_streq(buf, "default")) {
-		rproc->dump_conf = RPROC_COREDUMP_DEFAULT;
 	} else {
 		dev_err(&rproc->dev, "Invalid coredump configuration\n");
 		return -EINVAL;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 2fa68bf..3fa3ba6 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -442,16 +442,16 @@ enum rproc_crash_type {
 
 /**
  * enum rproc_dump_mechanism - Coredump options for core
- * @RPROC_COREDUMP_DEFAULT:	Copy dump to separate buffer and carry on with
+ * @RPROC_COREDUMP_DISABLED:	Don't perform any dump
+ * @RPROC_COREDUMP_ENABLED:	Copy dump to separate buffer and carry on with
 				recovery
  * @RPROC_COREDUMP_INLINE:	Read segments directly from device memory. Stall
 				recovery until all segments are read
- * @RPROC_COREDUMP_DISABLED:	Don't perform any dump
  */
 enum rproc_dump_mechanism {
-	RPROC_COREDUMP_DEFAULT,
-	RPROC_COREDUMP_INLINE,
 	RPROC_COREDUMP_DISABLED,
+	RPROC_COREDUMP_ENABLED,
+	RPROC_COREDUMP_INLINE,
 };
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

