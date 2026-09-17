Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF749E5F9
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639033; cv=none; b=P/i2j0k5BUBwnpa0g45PREJeuW464gGet/DEwwqhWge6jmtzTFnNV97ZB2cGsI7HxWxk5W5AS66RGDZapigjkCsvO/T7gnfyvLC9iZn6udmIvQSdv/MlDp+51t1UUZqYe/bIe51B0VLxymeecYRgkbxF5JVPFpBs4FEUDsMc4qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639033; c=relaxed/simple;
	bh=CLiP9/kDGXOzeKIuPXZ0RXt5Ssq4Yljq44kyp1FA34I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RojWBak3zEhfH0dYJT8SftZr8t6a2RtCsLUFEQOFs4cLr9DOPTT6PJw5yMFd89qzDz9IQ9tOFn/l2zMo43dJyg1kW2mb/Icd5Z+zKvne/bDJrM2HYET4opYRNjLXdsMpa/I+cp0s+YGNbEpY0XTLJAPptKtZRMcux0YMiajm7+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GiGRVhp/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GiGRVhp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=LCK9bALcJzzVqBgULfcDBOozSh+yYdmo3dnW3cb5QTA=; b=GiGRVh
	p/zAyvCD2XeuEtZGLpsNqa2pmbTM9u7KkbnRpIFnzyFdSVDCEfGBQIKSVe1oHsXK
	MZeN077CF2Fbd1hyTu8cs+Ekt+JXBlqBcm2caBQ8/pFIED6Ye8iuEQ3Ldjk2KNPc
	+opzA+expYJG+5bpGSyEbTMJTGJnx/jr5vQ6FFsKjR1nymn+IIWxj7ATz0xZGTHa
	EI2TW61ZXWyBNdnU6HKZqeOEoexMH3AAJ7ggcK6tFghOnCsrXfDV1Yya0Msu89On
	6+jG9qnD3PrUn+6YlbRo/ThAcqDlezP9/Lu0bkd9OS2CV6wjPRC2TX8oe+5IswqE
	Hef2xqEZsm6Zor4A==
Received: (qmail 1948070 invoked from network); 17 Sep 2026 11:56:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 11:56:53 +0200
X-UD-Smtp-Session: l3s3148p1@ogGozapbqp4ujnsL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v8 2/3] hwspinlock: add list of locks to debugfs
Date: Thu, 17 Sep 2026 11:56:37 +0200
Message-ID: <20260917095639.44159-3-wsa+renesas@sang-engineering.com>
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

To help debugging, offer a list of registered hwspinlocks in debugfs. It
will also print the responsible hwspinlock_device and if the spinlock is
currently used. It does not show if the lock is taken because of
side-effects. Often, reading a lock means actually taking it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since v7:
* clarified comment why xa_find_after() cannot be used
* prefer "used" over "in use" in printout to avoid the whitespace
* added tags

Thanks to Geert for the comments!

 drivers/hwspinlock/hwspinlock_core.c | 71 ++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 22e6c7690f1a..79eb23183434 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -21,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/seq_file.h>
 
 #include "hwspinlock_internal.h"
 
@@ -860,5 +862,74 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
 
+#ifdef CONFIG_DEBUG_FS
+static void *hwspin_lock_seq_start(struct seq_file *s, loff_t *ppos)
+{
+	unsigned long index = *ppos;
+	struct hwspinlock *hwlock;
+
+	rcu_read_lock();
+	hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
+	*ppos = index;
+
+	return hwlock;
+}
+
+static void *hwspin_lock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
+{
+	/*
+	 * Increase ppos here always to avoid endless loops. Don't use
+	 * xa_find_after() because it only updates the index iff an entry has
+	 * been found.
+	 */
+	unsigned long index = *ppos + 1;
+	struct hwspinlock *hwlock;
+
+	hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
+	*ppos = index;
+
+	return hwlock;
+}
+
+static void hwspin_lock_seq_stop(struct seq_file *s, void *v)
+{
+	rcu_read_unlock();
+}
+
+static int hwspin_lock_seq_show(struct seq_file *s, void *v)
+{
+	struct hwspinlock *hwlock = v;
+	bool unused = xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_UNUSED);
+
+	seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "used",
+		   dev_name(hwlock->bank->dev));
+	return 0;
+}
+
+static const struct seq_operations hwspinlock_sops = {
+	.start = hwspin_lock_seq_start,
+	.next = hwspin_lock_seq_next,
+	.stop = hwspin_lock_seq_stop,
+	.show = hwspin_lock_seq_show,
+};
+DEFINE_SEQ_ATTRIBUTE(hwspinlock);
+
+/*
+ * subsys_initcall() is used here but controllers may already have been
+ * registered earlier or will be later. The rationale is that debugfs is
+ * accessed only late, i.e. from userspace. So, files created here must make no
+ * assumptions about initcall ordering.
+ */
+static int __init hwspin_lock_init(void)
+{
+	struct dentry *hwspinlock_debugfs = debugfs_create_dir("hwspinlock", NULL);
+
+	debugfs_create_file("hwspinlock_summary", 0444, hwspinlock_debugfs,
+			    NULL, &hwspinlock_fops);
+	return 0;
+}
+subsys_initcall(hwspin_lock_init);
+#endif	/* DEBUG_FS */
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
-- 
2.53.0

