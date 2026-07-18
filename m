Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CF23DDB19
	for <linux-remoteproc@vger.kernel.org>; Sat, 18 Jul 2026 16:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784392244; cv=none; b=pYMCTFm3wZkfz3ftavwUavIoepgV2TBmUOPMbHlWA1boQavPiBRtMf+/tOsVyHmkTIR5vYMdb1cC2VKMsGlD60eytxAZK7Kn+JqAVQqB7h9ZbIYSdm/a9JYxZSF8H+E2CW2Ro6nl15tN3FFFZoSHgC86JiPhaxSVMHSycAtwB5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784392244; c=relaxed/simple;
	bh=Lk0wHwpMctVi3g53dFX1WZLpEkGHY4JTmAb6KBR6f+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RukXAn2jwieYYC1xXgfQbAlGHJFhtxz8hFmn+RVF7AguFGUZwHWzxj5tCEfpTZUhSXGm3P007+Sa+HgXIoMZAr7afqicaB7GB3u3tsKJ1AgeznyPGmu9dTa0HLNfxW+iMO4kAbRLmkn0ZgNfLpXuVi0d2fPF2VcULKxtl8KY0Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QzW/2PSo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QzW/2PSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1Pl172FVFj5opAt6Zg77g7wc2kZredW5bXE1qf5TaBk=; b=QzW/2P
	SoxHNiUg7fVRvfhophUslxFYbtUEVSyQCnSvi4CYs705OmJlwdfoHPwntGKX4nPD
	nhB0JrweqsMAr4ec2p5tyXP5JzgAoj3R8Z9X0UmbemkChvgSdtoL8H+OLVy0dCcp
	JvXhMaezFBA72Quw7of3ffIqlz9aYHcB9e59g0XkzAsPeEkUIKxRySJ4Iaq4NvYC
	763qhuESRAcxPICmIK8YLlvFdlbaw96XKCtKH5gDO5YZDGuZLnpiPufoHbxqcqK0
	al7GF/kqu9RlnyVyo+kqjkbIVPHnpEDs6ZVyGxZgTb4iuO+YXcc+9eL4L9SFP2sV
	tluHP6vuO+IOI68w==
Received: (qmail 1800012 invoked from network); 18 Jul 2026 18:30:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jul 2026 18:30:33 +0200
X-UD-Smtp-Session: l3s3148p1@hLs3MeVW6FdtKXE8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 3/3] hwspinlock: add low level debug capabilities
Date: Sat, 18 Jul 2026 18:30:23 +0200
Message-ID: <20260718163024.1726-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260718163024.1726-1-wsa+renesas@sang-engineering.com>
References: <20260718163024.1726-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While developing the hwspinlock core or a device driver, it can be
really helpful to change states from userspace. Add a debugsfs interface
to request, free, lock, unlock, and test hwspinlocks. Because this is a
potentially dangerous interface, it can only be enabled via source code.
Similar to writeable attributes for clocks where this idea stems from.
The created files take a single id for a single lock. To test all locks
in a system, one could use this oneliner while in the debugfs directory:

for l in $(cut -d: -f1 hwspinlock_summary); do echo $l > test_lock; done

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 122 +++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 84e9aae6ef44..052dea7e4850 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -908,6 +908,110 @@ static const struct seq_operations hwspinlock_sops = {
 };
 DEFINE_SEQ_ATTRIBUTE(hwspinlock);
 
+/*
+ * This can be dangerous, therefore don't provide any real compile time
+ * configuration option for this feature.
+ * People who want to use this will need to modify the source code directly.
+ */
+#undef HWSPINLOCK_LOW_LEVEL_DEBUG
+#ifdef HWSPINLOCK_LOW_LEVEL_DEBUG
+
+static struct hwspinlock *hwspin_lock_ll_debug_get(u64 id)
+{
+	struct hwspinlock *hwlock;
+	unsigned long index = id;
+
+	rcu_read_lock();
+	hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
+	rcu_read_unlock();
+
+	return hwlock;
+}
+
+static int fops_request_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock = hwspin_lock_request_specific(id);
+
+	return hwlock ? 0 : -ENOENT;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_request, NULL, fops_request_set, "%llu\n");
+
+static int fops_free_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock = hwspin_lock_ll_debug_get(id);
+
+	return hwlock ? hwspin_lock_free(hwlock) : -ENOENT;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_free, NULL, fops_free_set, "%llu\n");
+
+/*
+ * It is intentionally allowed to lock/free hwspinlocks which have not been
+ * requested before. Like error injection, these inconsistent states can be
+ * very useful for debugging.
+ */
+static int fops_trylock_raw_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock = hwspin_lock_ll_debug_get(id);
+
+	return hwlock ? hwspin_trylock_raw(hwlock) : -ENOENT;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_trylock_raw, NULL, fops_trylock_raw_set, "%llu\n");
+
+static int fops_unlock_raw_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock = hwspin_lock_ll_debug_get(id);
+
+	if (hwlock)
+		hwspin_unlock_raw(hwlock);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_unlock_raw, NULL, fops_unlock_raw_set, "%llu\n");
+
+static int fops_test_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock = hwspin_lock_request_specific(id);
+	int ret;
+
+	if (!hwlock)
+		return -ENOENT;
+
+	/* Try twice to see if unlocking was also successful */
+	for (int i = 0; i < 2; i++) {
+		ret = hwspin_trylock(hwlock);
+		if (ret) {
+			hwspin_lock_free(hwlock);
+			return ret;
+		}
+
+		ret = hwspin_trylock(hwlock);
+		if (ret != -EBUSY) {
+			hwspin_lock_free(hwlock);
+			return -EACCES;
+		}
+
+		hwspin_unlock(hwlock);
+	}
+
+	ret = hwspin_lock_free(hwlock);
+	if (ret)
+		return ret;
+
+	pr_info("Successfully tested lock %llu\n", id);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_test, NULL, fops_test_set, "%llu\n");
+
+static void hwspin_lock_low_level_debug_init(struct dentry *rootdir)
+{
+	debugfs_create_file("request", 0200, rootdir, NULL, &fops_request);
+	debugfs_create_file("free", 0200, rootdir, NULL, &fops_free);
+	debugfs_create_file("lock", 0200, rootdir, NULL, &fops_trylock_raw);
+	debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_unlock_raw);
+	debugfs_create_file("test_lock", 0200, rootdir, NULL, &fops_test);
+}
+#endif
+
 /*
  * subsys_initcall() is used here but controllers may already have been
  * registered earlier or will be later. The rationale is that debugfs is
@@ -920,6 +1024,24 @@ static int __init hwspin_lock_init(void)
 
 	debugfs_create_file("hwspinlock_summary", 0444, hwspinlock_debugfs,
 			    NULL, &hwspinlock_fops);
+
+#ifdef HWSPINLOCK_LOW_LEVEL_DEBUG
+	pr_warn("**********************************************************\n");
+	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
+	pr_warn("**                                                      **\n");
+	pr_warn("**    Low Level Debug for hwspinlocks is compiled in!   **\n");
+	pr_warn("**                                                      **\n");
+	pr_warn("** This means safety, security, stability can be easily **\n");
+	pr_warn("** compromised from userspace!                          **\n");
+	pr_warn("**                                                      **\n");
+	pr_warn("** If you see this message and you are not debugging    **\n");
+	pr_warn("** the kernel, report this immediately to your vendor!  **\n");
+	pr_warn("**                                                      **\n");
+	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
+	pr_warn("**********************************************************\n");
+	hwspin_lock_low_level_debug_init(hwspinlock_debugfs);
+#endif
+
 	return 0;
 }
 subsys_initcall(hwspin_lock_init);
-- 
2.51.0

