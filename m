Return-Path: <SRS0=nrb/=DJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8E3C35257
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Oct 2020 18:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 638BE208B6
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Oct 2020 18:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="F08csxG2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388034AbgJBSJt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 2 Oct 2020 14:09:49 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:27933 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388427AbgJBSJs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Oct 2020 14:09:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601662187; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=iIUxmbhf7Vym7GxKLNUziWQKQu4gQmlsgBDqcF8IeDc=; b=F08csxG2LmB4+dDn48C0rma1bZUIv+pKxZJzxaRdqaO9aWl6K5gz4Z142ApdZteyyl7qSgu+
 ZZTYnoTAvyyXFj18Dt1JSYNZrMS7MMkwGZQNlmJF3tqTWE5tEq9FN7GGGDWk2J3z3B5cag4+
 MKr4YCcV+7TvB+0wp/ZC4HT4+V8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f776cd9f9168450eaa7ab3b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Oct 2020 18:09:29
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6E95C433FF; Fri,  2 Oct 2020 18:09:29 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11A41C433CB;
        Fri,  2 Oct 2020 18:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 11A41C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Cc:     tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v7 1/3] remoteproc: Change default dump configuration to "disabled"
Date:   Fri,  2 Oct 2020 11:09:02 -0700
Message-Id: <1601662144-5964-2-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601662144-5964-1-git-send-email-rishabhb@codeaurora.org>
References: <1601662144-5964-1-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Currently "default" configuration option means coredumps are
enabled. To avoid confusion rename the "default" configuration
option to "enabled" and disable collection of dumps by default
as doing so makes sense for production devices.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/remoteproc_coredump.c |  6 +++---
 drivers/remoteproc/remoteproc_debugfs.c  | 23 +++++++++++------------
 include/linux/remoteproc.h               |  8 ++++----
 3 files changed, 18 insertions(+), 19 deletions(-)

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
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 2e3b3e2..7e58453 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -33,9 +33,9 @@ static struct dentry *rproc_dbg;
  * enum rproc_coredump_mechanism
  */
 static const char * const rproc_coredump_str[] = {
-	[RPROC_COREDUMP_DEFAULT]	= "default",
-	[RPROC_COREDUMP_INLINE]		= "inline",
 	[RPROC_COREDUMP_DISABLED]	= "disabled",
+	[RPROC_COREDUMP_ENABLED]	= "enabled",
+	[RPROC_COREDUMP_INLINE]		= "inline",
 };
 
 /* Expose the current coredump configuration via debugfs */
@@ -54,20 +54,19 @@ static ssize_t rproc_coredump_read(struct file *filp, char __user *userbuf,
 
 /*
  * By writing to the 'coredump' debugfs entry, we control the behavior of the
- * coredump mechanism dynamically. The default value of this entry is "default".
+ * coredump mechanism dynamically. The default value of this entry is "disabled".
  *
  * The 'coredump' debugfs entry supports these commands:
  *
- * default:	This is the default coredump mechanism. When the remoteproc
- *		crashes the entire coredump will be copied to a separate buffer
- *		and exposed to userspace.
+ * disabled:	By default coredump collection is disabled. Recovery will
+ *		proceed without collecting any dump.
+ *
+ * enabled:	When the remoteproc crashes the entire coredump will be copied
+ *		to a separate buffer and exposed to userspace.
  *
  * inline:	The coredump will not be copied to a separate buffer and the
  *		recovery process will have to wait until data is read by
  *		userspace. But this avoid usage of extra memory.
- *
- * disabled:	This will disable coredump. Recovery will proceed without
- *		collecting any dump.
  */
 static ssize_t rproc_coredump_write(struct file *filp,
 				    const char __user *user_buf, size_t count,
@@ -94,12 +93,12 @@ static ssize_t rproc_coredump_write(struct file *filp,
 		goto out;
 	}
 
-	if (!strncmp(buf, "disable", count)) {
+	if (!strncmp(buf, "disabled", count)) {
 		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
+	} else if (!strncmp(buf, "enabled", count)) {
+		rproc->dump_conf = RPROC_COREDUMP_ENABLED;
 	} else if (!strncmp(buf, "inline", count)) {
 		rproc->dump_conf = RPROC_COREDUMP_INLINE;
-	} else if (!strncmp(buf, "default", count)) {
-		rproc->dump_conf = RPROC_COREDUMP_DEFAULT;
 	} else {
 		dev_err(&rproc->dev, "Invalid coredump configuration\n");
 		err = -EINVAL;
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

