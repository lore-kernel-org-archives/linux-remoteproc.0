Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78884BD347
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639036; cv=none; b=CVrMOZtpLzs9sh/PALEzgtieqKfKpPkegqaFZv3AY4trKCbLGn1S+3TWrKOHTL+n2oxoFn8bAfSJoEJCQpDjB5N5gF0V+rWD8UtXbhKx0ypzpbuQuP9lqxQQ5ibweRNV9NV5UkCgWNnlav95x4gnaKHv0YW5cbFHq+Vb95Bs/GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639036; c=relaxed/simple;
	bh=QrEVwjvs7fO+BkqEew5rNLSt7NNfzrYXGFuk/Uz0Jv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1wLS+qTEj4Bfs6fJ6af12tQkFme+FDWKm8RsoTc7fOvTpXHY14vorssg5FTFzCNlNIGjg6lbEDpxLbqYFZd/YfXW26GDvqj/szY0TLZAdZZNBkmoyDqKxjDhr6nMEWBZBPYoUeKHKXGQ9WMJReLmy/rQqAfa7XS21/z+Pdc0U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Dp3n1ZHy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Dp3n1ZHy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Wpp81Bz8sDGovwTbUmuvcIw1BIOkhoyUJQlO9hr+mhA=; b=Dp3n1Z
	Hydi4nzAA60DpGwJoI9yR9nzAj2RSROHs1U0xw8HmDuTHQp5xJSd4PJYRkqgsZew
	VXllS5QbYuM5NQJVPU+Z34ccXgnjT/+NI4/BeHRoqyCTXUb14ERVk0RLcIBY2VpA
	15aEo9y35zs0lErFakwI1m0D4KHUlzB+SGFblizecJPfZPbN0yb3QiY/V4tBMDed
	t7FrmAQlZtXKHq+eI7Hc0XXWwK9nz/pVlOa9Yvczwr4c2kVooBooAfNHVG/4DH1i
	nq91MllTA2Behffw7Fa2Qrl2wVfIhDu1Mr1YqnnEkF2XxL6gYJa20crcol/2Cnsm
	YEIflliYod8XYX0A==
Received: (qmail 1948111 invoked from network); 17 Sep 2026 11:56:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 11:56:54 +0200
X-UD-Smtp-Session: l3s3148p1@HRuzzapbrJ4ujnsL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v8 3/3] hwspinlock: add low level debug capabilities
Date: Thu, 17 Sep 2026 11:56:38 +0200
Message-ID: <20260917095639.44159-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917095639.44159-1-wsa+renesas@sang-engineering.com>
References: <20260917095639.44159-1-wsa+renesas@sang-engineering.com>
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
potentially dangerous interface, it can only be enabled via source code,
similar to writeable attributes for clocks where this idea stems from.
The created files take a single id for a single lock. To test all locks
in a system, one could use this oneliner while in the debugfs directory:

for l in $(cut -d: -f1 hwspinlock_summary); do echo $l > test_single_lock; done

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v7:
* renamed debugfs-files to be more specific
* reworded commit message slightly
* added tag

Thanks to Geert for the comments!


 drivers/hwspinlock/hwspinlock_core.c | 131 +++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 79eb23183434..d5570c21ac12 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -914,6 +914,120 @@ static const struct seq_operations hwspinlock_sops = {
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
+	if (id > UINT_MAX)
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
+	if (id > UINT_MAX)
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
+	if (id > UINT_MAX)
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
+	if (id > UINT_MAX)
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
+static int fops_test_single_lock_set(void *data, u64 id)
+{
+	struct hwspinlock *hwlock;
+	int ret;
+
+	if (id > UINT_MAX)
+		return -EINVAL;
+
+	hwlock = hwspin_lock_request_specific(id);
+	if (!hwlock)
+		return -ENOENT;
+
+	/* Try twice to see if unlocking was also successful */
+	for (int i = 0; i < 2; i++) {
+		ret = hwspin_trylock_raw(hwlock);
+		if (ret) {
+			hwspin_lock_free(hwlock);
+			return ret;
+		}
+
+		ret = hwspin_trylock_raw(hwlock);
+		if (ret != -EBUSY) {
+			if (ret == 0)
+				hwspin_unlock_raw(hwlock);
+			hwspin_lock_free(hwlock);
+			return -EACCES;
+		}
+
+		hwspin_unlock_raw(hwlock);
+	}
+
+	ret = hwspin_lock_free(hwlock);
+	if (ret)
+		return ret;
+
+	pr_info("Successfully tested lock %llu\n", id);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_test_single_lock, NULL, fops_test_single_lock_set, "%llu\n");
+
+static void hwspin_lock_low_level_debug_init(struct dentry *rootdir)
+{
+	debugfs_create_file("request_lock", 0200, rootdir, NULL, &fops_request);
+	debugfs_create_file("free_lock", 0200, rootdir, NULL, &fops_free);
+	debugfs_create_file("lock", 0200, rootdir, NULL, &fops_trylock_raw);
+	debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_unlock_raw);
+	debugfs_create_file("test_single_lock", 0200, rootdir, NULL, &fops_test_single_lock);
+}
+#endif
+
 /*
  * subsys_initcall() is used here but controllers may already have been
  * registered earlier or will be later. The rationale is that debugfs is
@@ -926,6 +1040,23 @@ static int __init hwspin_lock_init(void)
 
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
 	return 0;
 }
 subsys_initcall(hwspin_lock_init);
-- 
2.53.0

