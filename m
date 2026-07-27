Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84553DC850
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146780; cv=none; b=AujI8s1FhlJ1qkOe9klCM+2HXET5jZoLa11nve8Ms+uxmfmXVVwKOXCb8H7eCgCNdEG+5pND4ItAEChKW/ucf5DJBy/1Zu1GPleJEleELQSHR8CevnMM8JDbpJkYuY7OrwC2PTBecvXNl7AEEavfk20oCcsjE6fvT6jrnOQmyGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146780; c=relaxed/simple;
	bh=2KbK2FVGPsLDHJ2VIebqljMoidoUWOBpHT5VDO/L70k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nqFC3ujrup/4XKL079FTovoPCNdQ+mbeV1YJVdycBTqXXOOleSUjaKevpyn96mqS4B834ey/J+pwMjRtO7+fAjiLftPxD24dHTf1zqvw2JByzDGgS5a9ki1rYTyz8w8Yk+Mme1dDW5zTCrP/O4Xlq5ZwVogcHHPeASCoBaiGEiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hQZjVTjI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hQZjVTjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=g6afELmfw9BmDNTdeODxmOE5yWipb6aHkBRlI+C4EzU=; b=hQZjVT
	jIzYiLSordLfoJtVD5e9QJOrwzH4kdZ+Jwhhu3BFtcsrVGFgImHhJ5A7zIg+fgWs
	FM2HNB5llHgh43cyvI1xo7FClNnflgTo+MYJ4K5PXseKAkj3wGFZFdE5Q/10H7Uz
	Dbn23L9jwleAoIAOAkvh5cSCqhn+NrlCNIWQ+GCsIEXmr3QzARdtbbhogqM0P5a0
	nTUwVQmiyZtv8BPnkdwh7G6x+ui+dyi2c4e0p5f1zujLfjUPYdcOV0y+kFcAg+kl
	F6xAzTra4t0Fd7Cztdle9PoEAY0thAHMnrF2ypLJ1bYQtzlnCOIneEEwRbYp1etG
	sj+NyIuXkAeF5gEw==
Received: (qmail 564038 invoked from network); 27 Jul 2026 12:06:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2026 12:06:13 +0200
X-UD-Smtp-Session: l3s3148p1@u0RG35RXupAujnuy
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v6 3/3] hwspinlock: add low level debug capabilities
Date: Mon, 27 Jul 2026 12:06:01 +0200
Message-ID: <20260727100559.3119-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727100559.3119-5-wsa+renesas@sang-engineering.com>
References: <20260727100559.3119-5-wsa+renesas@sang-engineering.com>
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

Changes since v5:
* use UINT_MAX instead of ULONG_MAX because
  hwspin_lock_request_specific() works with uint
* use raw variants of hwspin_trylock/unlock to actually test the
  underlying driver

 drivers/hwspinlock/hwspinlock_core.c | 132 +++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 947b4d4fa153..6fb2670873a2 100644
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
+static int fops_test_set(void *data, u64 id)
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

