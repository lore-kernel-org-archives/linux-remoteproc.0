Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2563DAAB5
	for <linux-remoteproc@vger.kernel.org>; Sun, 26 Jul 2026 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785102164; cv=none; b=NvejCzLmJbMQtorw9td5PvCDGbV750SbNkxURruAojFl9rVuhHNgezq/f64U3ZPTQnGCNHyid1NeuDVS+PTKTrPWgLainSN7JUMAFzQApOANzimqLo9AwVJZ/FYmMGJrBacgkru3xE+wVV9cfHkoCFB1gJMSjDrVbCVZpo+1j+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785102164; c=relaxed/simple;
	bh=2gvSTrZsnYvbSP1CDaoJ9CnSuuG5eOC6nCW2VpsSqjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFJcFYUYgT/mhXjh7prX1Vbb8m83iumWi1XELJOrj7sB9oqnOxCRJHGKh5G5eVYoc430h9guPTYj5FzBo+EbORwtIMNfw4F0hAy36axW8a6YmrRBavZY3B08KG/UxvQ6mPTDKZq6JSZRNoXzPvYK7+dUjrkN6eoRh8rvWGZty8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M3qQVeOp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M3qQVeOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=+kyx9J4g1BRLkyvElM35nh3/+hlYGbAHFxsFZtAcgEQ=; b=M3qQVe
	OpQvAZcJzeXPkO7yizks3dl8SNkguMKVDVchh3sPcA67AkvWJeWwHHxZY+ANNFgT
	dy0vJGpFx/N5GqNSdArGTQP7Dg4DRgNS1llSs96sAU9CMqwN2i+ILkvkaJhXgnf+
	aC7tTIOX3+3uLrwZt1qR5l9qST4MCvw5TEYYrRx46iSYSRm/ttZ0juevjxhV3HfY
	T/nYRIXq2erRrdh+ra9mzCq9zTFYzN8KFHKF0TOqaFx5xkh525heonzzYICJeUaO
	5i5HzsWxZQr0D++0atqE+d8+0+BJCPN6ENk+Hb7Z4pZIvtCZZ3COtcxoyjdaI0FM
	JKLcx0gPwOBpu9ZA==
Received: (qmail 384242 invoked from network); 26 Jul 2026 23:42:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2026 23:42:38 +0200
X-UD-Smtp-Session: l3s3148p1@QoMPfIpXmp4ujnsw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 3/3] hwspinlock: add low level debug capabilities
Date: Sun, 26 Jul 2026 23:42:22 +0200
Message-ID: <20260726214219.17703-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260726214219.17703-5-wsa+renesas@sang-engineering.com>
References: <20260726214219.17703-5-wsa+renesas@sang-engineering.com>
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

Changes since v4:

* prefer xa_load() over xa_find() because we want a specific id
* check if u64 exceeds unsigned long
* when testing, unlock if the second lock operation unexpectedly succeeded
* updated a comment pointing out that taking a lock without requesting
  it may need another requested lock to have the provider fully prepared

 drivers/hwspinlock/hwspinlock_core.c | 132 +++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 947b4d4fa153..5d56ee9539bc 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -910,6 +910,120 @@ static const struct seq_operations hwspinlock_sops = {
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
+static int fops_request_set(void *data, u64 id)
+{
+	if (id > ULONG_MAX)
+		return -EINVAL;
+
+	return hwspin_lock_request_specific(id) ? 0 : -ENOENT;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_request, NULL, fops_request_set, "%llu\n");
+
+static int fops_free_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock;
+
+	if (id > ULONG_MAX)
+		return -EINVAL;
+
+	hwlock = xa_load(&hwspinlocks, id);
+
+	return hwlock ? hwspin_lock_free(hwlock) : -ENOENT;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_free, NULL, fops_free_set, "%llu\n");
+
+/*
+ * It is intentionally allowed to lock/free hwspinlocks which have not been
+ * requested before. Like error injection, these inconsistent states can be
+ * very useful for debugging. Be aware that you might need another properly
+ * requested lock on a provider to ensure that its clocks etc are enabled!
+ */
+static int fops_trylock_raw_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock;
+
+	if (id > ULONG_MAX)
+		return -EINVAL;
+
+	hwlock = xa_load(&hwspinlocks, id);
+
+	return hwlock ? hwspin_trylock_raw(hwlock) : -ENOENT;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_trylock_raw, NULL, fops_trylock_raw_set, "%llu\n");
+
+static int fops_unlock_raw_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock;
+
+	if (id > ULONG_MAX)
+		return -EINVAL;
+
+	hwlock = xa_load(&hwspinlocks, id);
+	if (hwlock)
+		hwspin_unlock_raw(hwlock);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_unlock_raw, NULL, fops_unlock_raw_set, "%llu\n");
+
+static int fops_test_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock;
+	int ret;
+
+	if (id > ULONG_MAX)
+		return -EINVAL;
+
+	hwlock = hwspin_lock_request_specific(id);
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
+			if (ret == 0)
+				hwspin_unlock(hwlock);
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
@@ -922,6 +1036,24 @@ static int __init hwspin_lock_init(void)
 
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
2.47.3

