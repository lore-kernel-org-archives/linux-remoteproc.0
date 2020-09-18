Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E07C43464
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 17:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B48621707
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 17:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="mudYaINx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgIRR10 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:27:26 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:36723 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgIRR10 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 13:27:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600450044; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=OmQ/jXDTAVjV38A/Lu4b53430/Pzcu9rzNvURr24rMs=; b=mudYaINxcuHVmpbo5dUYVZsCJJthhvZD3uMJWxz9Cp2U3gbD2gWWjLqR9zFmvtHoUsyKkdut
 cin994ns1h9qby9JnxYpsJcIY5+0VakRiWohxTDOFNoFEK/+FREnsl1ywg0lC1nS0V5OwlF/
 6w08w05vDW4KlV2HjThwaHRFLU8=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f64eccef1e3eb89c734c2ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 17:22:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84F5CC433FE; Fri, 18 Sep 2020 17:22:21 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57617C433CB;
        Fri, 18 Sep 2020 17:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57617C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v5 1/2] remoteproc: Move coredump configuration to sysfs
Date:   Fri, 18 Sep 2020 10:22:10 -0700
Message-Id: <1600449731-3056-2-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600449731-3056-1-git-send-email-rishabhb@codeaurora.org>
References: <1600449731-3056-1-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move coredump configuration from debugfs to sysfs.This will
allow usage of this configuration feature in production
devices where access to debugfs might be limited.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 Documentation/ABI/testing/sysfs-class-remoteproc | 24 +++++++
 drivers/remoteproc/remoteproc_debugfs.c          | 90 ------------------------
 drivers/remoteproc/remoteproc_sysfs.c            | 64 +++++++++++++++++
 3 files changed, 88 insertions(+), 90 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc b/Documentation/ABI/testing/sysfs-class-remoteproc
index 36094fb..f6c44fa 100644
--- a/Documentation/ABI/testing/sysfs-class-remoteproc
+++ b/Documentation/ABI/testing/sysfs-class-remoteproc
@@ -58,3 +58,27 @@ Description:	Remote processor name
 		Reports the name of the remote processor. This can be used by
 		userspace in exactly identifying a remote processor and ease
 		up the usage in modifying the 'firmware' or 'state' files.
+
+What:		/sys/class/remoteproc/.../coredump
+Date:		July 2020
+Contact:	Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
+Description:	Remote processor coredump configuration
+
+		Reports the coredump configuration of the remote processor,
+		which will be one of:
+
+		"default"
+		"inline"
+		"disabled"
+
+		"default" means when the remote processor's coredump is
+		collected it will be copied to a separate buffer and that
+		buffer is exposed to userspace.
+
+		"inline" means when the remote processor's coredump is
+		collected userspace will directly read from the remote
+		processor's device memory. Extra buffer will not be used to
+		copy the dump. Also recovery process will not proceed until
+		all data is read by usersapce.
+
+		"disabled" means no dump will be collected.
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 2e3b3e2..732770e 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -28,94 +28,6 @@
 static struct dentry *rproc_dbg;
 
 /*
- * A coredump-configuration-to-string lookup table, for exposing a
- * human readable configuration via debugfs. Always keep in sync with
- * enum rproc_coredump_mechanism
- */
-static const char * const rproc_coredump_str[] = {
-	[RPROC_COREDUMP_DEFAULT]	= "default",
-	[RPROC_COREDUMP_INLINE]		= "inline",
-	[RPROC_COREDUMP_DISABLED]	= "disabled",
-};
-
-/* Expose the current coredump configuration via debugfs */
-static ssize_t rproc_coredump_read(struct file *filp, char __user *userbuf,
-				   size_t count, loff_t *ppos)
-{
-	struct rproc *rproc = filp->private_data;
-	char buf[20];
-	int len;
-
-	len = scnprintf(buf, sizeof(buf), "%s\n",
-			rproc_coredump_str[rproc->dump_conf]);
-
-	return simple_read_from_buffer(userbuf, count, ppos, buf, len);
-}
-
-/*
- * By writing to the 'coredump' debugfs entry, we control the behavior of the
- * coredump mechanism dynamically. The default value of this entry is "default".
- *
- * The 'coredump' debugfs entry supports these commands:
- *
- * default:	This is the default coredump mechanism. When the remoteproc
- *		crashes the entire coredump will be copied to a separate buffer
- *		and exposed to userspace.
- *
- * inline:	The coredump will not be copied to a separate buffer and the
- *		recovery process will have to wait until data is read by
- *		userspace. But this avoid usage of extra memory.
- *
- * disabled:	This will disable coredump. Recovery will proceed without
- *		collecting any dump.
- */
-static ssize_t rproc_coredump_write(struct file *filp,
-				    const char __user *user_buf, size_t count,
-				    loff_t *ppos)
-{
-	struct rproc *rproc = filp->private_data;
-	int ret, err = 0;
-	char buf[20];
-
-	if (count > sizeof(buf))
-		return -EINVAL;
-
-	ret = copy_from_user(buf, user_buf, count);
-	if (ret)
-		return -EFAULT;
-
-	/* remove end of line */
-	if (buf[count - 1] == '\n')
-		buf[count - 1] = '\0';
-
-	if (rproc->state == RPROC_CRASHED) {
-		dev_err(&rproc->dev, "can't change coredump configuration\n");
-		err = -EBUSY;
-		goto out;
-	}
-
-	if (!strncmp(buf, "disable", count)) {
-		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
-	} else if (!strncmp(buf, "inline", count)) {
-		rproc->dump_conf = RPROC_COREDUMP_INLINE;
-	} else if (!strncmp(buf, "default", count)) {
-		rproc->dump_conf = RPROC_COREDUMP_DEFAULT;
-	} else {
-		dev_err(&rproc->dev, "Invalid coredump configuration\n");
-		err = -EINVAL;
-	}
-out:
-	return err ? err : count;
-}
-
-static const struct file_operations rproc_coredump_fops = {
-	.read = rproc_coredump_read,
-	.write = rproc_coredump_write,
-	.open = simple_open,
-	.llseek = generic_file_llseek,
-};
-
-/*
  * Some remote processors may support dumping trace logs into a shared
  * memory buffer. We expose this trace buffer using debugfs, so users
  * can easily tell what's going on remotely.
@@ -425,8 +337,6 @@ void rproc_create_debug_dir(struct rproc *rproc)
 			    rproc, &rproc_rsc_table_fops);
 	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
 			    rproc, &rproc_carveouts_fops);
-	debugfs_create_file("coredump", 0600, rproc->dbg_dir,
-			    rproc, &rproc_coredump_fops);
 }
 
 void __init rproc_init_debugfs(void)
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index eea514c..40949a0 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -10,6 +10,69 @@
 
 #define to_rproc(d) container_of(d, struct rproc, dev)
 
+/*
+ * A coredump-configuration-to-string lookup table, for exposing a
+ * human readable configuration via sysfs. Always keep in sync with
+ * enum rproc_coredump_mechanism
+ */
+static const char * const rproc_coredump_str[] = {
+	[RPROC_COREDUMP_DEFAULT]	= "default",
+	[RPROC_COREDUMP_INLINE]		= "inline",
+	[RPROC_COREDUMP_DISABLED]	= "disabled",
+};
+
+/* Expose the current coredump configuration via debugfs */
+static ssize_t coredump_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct rproc *rproc = to_rproc(dev);
+
+	return sprintf(buf, "%s\n", rproc_coredump_str[rproc->dump_conf]);
+}
+
+/*
+ * By writing to the 'coredump' sysfs entry, we control the behavior of the
+ * coredump mechanism dynamically. The default value of this entry is "default".
+ *
+ * The 'coredump' sysfs entry supports these commands:
+ *
+ * default:	This is the default coredump mechanism. When the remoteproc
+ *		crashes the entire coredump will be copied to a separate buffer
+ *		and exposed to userspace.
+ *
+ * inline:	The coredump will not be copied to a separate buffer and the
+ *		recovery process will have to wait until data is read by
+ *		userspace. But this avoid usage of extra memory.
+ *
+ * disabled:	This will disable coredump. Recovery will proceed without
+ *		collecting any dump.
+ */
+static ssize_t coredump_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct rproc *rproc = to_rproc(dev);
+
+	if (rproc->state == RPROC_CRASHED) {
+		dev_err(&rproc->dev, "can't change coredump configuration\n");
+		return -EBUSY;
+	}
+
+	if (sysfs_streq(buf, "disable")) {
+		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
+	} else if (sysfs_streq(buf, "inline")) {
+		rproc->dump_conf = RPROC_COREDUMP_INLINE;
+	} else if (sysfs_streq(buf, "default")) {
+		rproc->dump_conf = RPROC_COREDUMP_DEFAULT;
+	} else {
+		dev_err(&rproc->dev, "Invalid coredump configuration\n");
+		return -EINVAL;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_RW(coredump);
+
 /* Expose the loaded / running firmware name via sysfs */
 static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -138,6 +201,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RO(name);
 
 static struct attribute *rproc_attrs[] = {
+	&dev_attr_coredump.attr,
 	&dev_attr_firmware.attr,
 	&dev_attr_state.attr,
 	&dev_attr_name.attr,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

