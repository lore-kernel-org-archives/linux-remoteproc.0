Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E61C43463
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 17:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7632621707
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 17:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="xTCu4FIB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgIRR1Z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:27:25 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:31661 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgIRR1Z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 13:27:25 -0400
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 13:27:23 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600450043; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Woj0sl3f7DtTsZsi48erw1OdygzAEhvADHrhiVWysRE=; b=xTCu4FIBv8y1bF1n3c3PF5yGZ/FXlIl3wbOea15DXVMDcGuLHjlFGfCi1IpgweLV3IF8dO/X
 6JTeWzffZzyGt0+aeq8VA6awqfGhpd9TDjewVD7grYLn+S5PdR6lo79A7EyGJ45lej8uHXcU
 tRPOTvSs1KKQAVxjaJWSH7+eR4g=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f64eccf6ace44cacc09c5ce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 17:22:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 56E65C43385; Fri, 18 Sep 2020 17:22:22 +0000 (UTC)
Received: from rishabhb-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F0C17C433C8;
        Fri, 18 Sep 2020 17:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F0C17C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rishabhb@codeaurora.org
From:   Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v5 2/2] remoteproc: Move recovery configuration to sysfs
Date:   Fri, 18 Sep 2020 10:22:11 -0700
Message-Id: <1600449731-3056-3-git-send-email-rishabhb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600449731-3056-1-git-send-email-rishabhb@codeaurora.org>
References: <1600449731-3056-1-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move recovery configuration from debugfs to sysfs.This will
allow usage of this configuration feature in production
devices where access to debugfs might be limited.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 Documentation/ABI/testing/sysfs-class-remoteproc | 20 ++++++
 drivers/remoteproc/remoteproc_debugfs.c          | 78 ------------------------
 drivers/remoteproc/remoteproc_sysfs.c            | 56 +++++++++++++++++
 3 files changed, 76 insertions(+), 78 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc b/Documentation/ABI/testing/sysfs-class-remoteproc
index f6c44fa..7368b50 100644
--- a/Documentation/ABI/testing/sysfs-class-remoteproc
+++ b/Documentation/ABI/testing/sysfs-class-remoteproc
@@ -82,3 +82,23 @@ Description:	Remote processor coredump configuration
 		all data is read by usersapce.
 
 		"disabled" means no dump will be collected.
+
+What:		/sys/class/remoteproc/.../recovery
+Date:		July 2020
+Contact:	Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
+Description:	Remote processor recovery mechanism
+
+		Reports the recovery mechanism of the remote processor,
+		which will be one of:
+
+		"enabled"
+		"disabled"
+
+		"enabled" means, the remote processor will be automatically
+		recovered whenever it crashes. Moreover, if the remote
+		processor crashes while recovery is disabled, it will
+		be automatically recovered too as soon as recovery is enabled.
+
+		"disabled" means, a remote processor will remain in a crashed
+		state if it crashes. This is useful for debugging purposes;
+		without it, debugging a crash is substantially harder.
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 732770e..c505f0e 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -84,82 +84,6 @@ static const struct file_operations rproc_name_ops = {
 	.llseek	= generic_file_llseek,
 };
 
-/* expose recovery flag via debugfs */
-static ssize_t rproc_recovery_read(struct file *filp, char __user *userbuf,
-				   size_t count, loff_t *ppos)
-{
-	struct rproc *rproc = filp->private_data;
-	char *buf = rproc->recovery_disabled ? "disabled\n" : "enabled\n";
-
-	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
-}
-
-/*
- * By writing to the 'recovery' debugfs entry, we control the behavior of the
- * recovery mechanism dynamically. The default value of this entry is "enabled".
- *
- * The 'recovery' debugfs entry supports these commands:
- *
- * enabled:	When enabled, the remote processor will be automatically
- *		recovered whenever it crashes. Moreover, if the remote
- *		processor crashes while recovery is disabled, it will
- *		be automatically recovered too as soon as recovery is enabled.
- *
- * disabled:	When disabled, a remote processor will remain in a crashed
- *		state if it crashes. This is useful for debugging purposes;
- *		without it, debugging a crash is substantially harder.
- *
- * recover:	This function will trigger an immediate recovery if the
- *		remote processor is in a crashed state, without changing
- *		or checking the recovery state (enabled/disabled).
- *		This is useful during debugging sessions, when one expects
- *		additional crashes to happen after enabling recovery. In this
- *		case, enabling recovery will make it hard to debug subsequent
- *		crashes, so it's recommended to keep recovery disabled, and
- *		instead use the "recover" command as needed.
- */
-static ssize_t
-rproc_recovery_write(struct file *filp, const char __user *user_buf,
-		     size_t count, loff_t *ppos)
-{
-	struct rproc *rproc = filp->private_data;
-	char buf[10];
-	int ret;
-
-	if (count < 1 || count > sizeof(buf))
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
-	if (!strncmp(buf, "enabled", count)) {
-		/* change the flag and begin the recovery process if needed */
-		rproc->recovery_disabled = false;
-		rproc_trigger_recovery(rproc);
-	} else if (!strncmp(buf, "disabled", count)) {
-		rproc->recovery_disabled = true;
-	} else if (!strncmp(buf, "recover", count)) {
-		/* begin the recovery process without changing the flag */
-		rproc_trigger_recovery(rproc);
-	} else {
-		return -EINVAL;
-	}
-
-	return count;
-}
-
-static const struct file_operations rproc_recovery_ops = {
-	.read = rproc_recovery_read,
-	.write = rproc_recovery_write,
-	.open = simple_open,
-	.llseek = generic_file_llseek,
-};
-
 /* expose the crash trigger via debugfs */
 static ssize_t
 rproc_crash_write(struct file *filp, const char __user *user_buf,
@@ -329,8 +253,6 @@ void rproc_create_debug_dir(struct rproc *rproc)
 
 	debugfs_create_file("name", 0400, rproc->dbg_dir,
 			    rproc, &rproc_name_ops);
-	debugfs_create_file("recovery", 0600, rproc->dbg_dir,
-			    rproc, &rproc_recovery_ops);
 	debugfs_create_file("crash", 0200, rproc->dbg_dir,
 			    rproc, &rproc_crash_ops);
 	debugfs_create_file("resource_table", 0400, rproc->dbg_dir,
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 40949a0..2508eca 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -10,6 +10,61 @@
 
 #define to_rproc(d) container_of(d, struct rproc, dev)
 
+static ssize_t recovery_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct rproc *rproc = to_rproc(dev);
+
+	return sprintf(buf, "%s", rproc->recovery_disabled ? "disabled\n" : "enabled\n");
+}
+
+/*
+ * By writing to the 'recovery' sysfs entry, we control the behavior of the
+ * recovery mechanism dynamically. The default value of this entry is "enabled".
+ *
+ * The 'recovery' sysfs entry supports these commands:
+ *
+ * enabled:	When enabled, the remote processor will be automatically
+ *		recovered whenever it crashes. Moreover, if the remote
+ *		processor crashes while recovery is disabled, it will
+ *		be automatically recovered too as soon as recovery is enabled.
+ *
+ * disabled:	When disabled, a remote processor will remain in a crashed
+ *		state if it crashes. This is useful for debugging purposes;
+ *		without it, debugging a crash is substantially harder.
+ *
+ * recover:	This function will trigger an immediate recovery if the
+ *		remote processor is in a crashed state, without changing
+ *		or checking the recovery state (enabled/disabled).
+ *		This is useful during debugging sessions, when one expects
+ *		additional crashes to happen after enabling recovery. In this
+ *		case, enabling recovery will make it hard to debug subsequent
+ *		crashes, so it's recommended to keep recovery disabled, and
+ *		instead use the "recover" command as needed.
+ */
+static ssize_t recovery_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct rproc *rproc = to_rproc(dev);
+
+	if (sysfs_streq(buf, "enabled")) {
+		/* change the flag and begin the recovery process if needed */
+		rproc->recovery_disabled = false;
+		rproc_trigger_recovery(rproc);
+	} else if (sysfs_streq(buf, "disabled")) {
+		rproc->recovery_disabled = true;
+	} else if (sysfs_streq(buf, "recover")) {
+		/* begin the recovery process without changing the flag */
+		rproc_trigger_recovery(rproc);
+	} else {
+		return -EINVAL;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_RW(recovery);
+
 /*
  * A coredump-configuration-to-string lookup table, for exposing a
  * human readable configuration via sysfs. Always keep in sync with
@@ -202,6 +257,7 @@ static DEVICE_ATTR_RO(name);
 
 static struct attribute *rproc_attrs[] = {
 	&dev_attr_coredump.attr,
+	&dev_attr_recovery.attr,
 	&dev_attr_firmware.attr,
 	&dev_attr_state.attr,
 	&dev_attr_name.attr,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

