Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24A3939DE
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118355; cv=none; b=ogx+vAhzvOddSApvLIokQdUXA4hzHU2GalvG5ylC6ijagWY8Kb+I5Z87sqtRq+3JS7DWkXEMl8dART/CCEtrd/vqUgb2HbigkUoItx1RDW6TSJsD103lCP9Pgnn2X5YjCu6ZKwP2fbSueOkBDJsa+mmcqVylv44PNOTiAMWhkcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118355; c=relaxed/simple;
	bh=urBPbNPSEu6r+TlIuPTbebh8BOd6n0TvN+82G33xDKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqtPyJHWsNbKaxTkvS1PaulNpqB9Ba3i6babJru6Rv0R3I3/hMUSI6Cxv1S7yQ3aT84GWpxkOg6deAPm6zA1qel/MOKt8UX7OcLj8qETKyV6MTEDHB3C7ndbDZ9iY+TOCNelJ7Hfrj9zgI/QnTlDGBSN/VUyhE9Ilg7X161pKbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DdYWaPDX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DdYWaPDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jMyNgVfXv+gmZGUo6VXSRLs5JKLNA3FFCa+JaslcS30=; b=DdYWaP
	DXUJp++ruuC66KUwclxlVcVcmWWMHczxfgEZ1ylA9WCV5GVvO+ZfGdpCjYdP7xvG
	W+Fyu0gEKagb5Rl01CAITlj5FUCQSkHLqV9Ool2Mn86Oenevh+qhO6UZTiP5kTPA
	SBhJ/yFIRIX+FQhzevC1hIpxzwMGhPLhjNeylLG1nYLBbrqhxAxWKHzcTWonmZpO
	cRyO4ph/jyc5jum3UUb7FrD/95nLRWOnpYrgWcdwmZ8z/tD14ZI0NcQgtv/QzCoK
	b8ZG5LT5bUsdDCVM5TyAF4T5zk1/Lb6qt9iDO0z5peDdIGwwdXF7hUopyPO1vUIj
	8eCqZnIlPDp+QOtw==
Received: (qmail 1894196 invoked from network); 22 Jun 2026 10:52:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 10:52:09 +0200
X-UD-Smtp-Session: l3s3148p1@CwT5wdNUtN0ujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [PATCH v2 4/4] hwspinlock: add summary in debugfs
Date: Mon, 22 Jun 2026 10:52:03 +0200
Message-ID: <20260622085204.54248-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a subsystem entry in debugfs and place a summary file there. It
informs about registered locks, if they are in use, and to which device
they belong. The state of the lock itself is usually not accessible
without modifying the state, so there is no support for that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 89 ++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index c97d68050102..b4789b0c2150 100644
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
 
@@ -888,5 +890,92 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
 
+#ifdef CONFIG_DEBUG_FS
+struct hwspinlock_seq_iterator {
+	void __rcu **slot;
+	struct radix_tree_iter iter;
+};
+
+static void *hwspinlock_seq_start(struct seq_file *s, loff_t *ppos)
+{
+	struct hwspinlock_seq_iterator *hwsp_seq_iter;
+
+	mutex_lock(&hwspinlock_tree_lock);
+
+	hwsp_seq_iter = kzalloc_obj(*hwsp_seq_iter);
+	if (!hwsp_seq_iter)
+		return ERR_PTR(-ENOMEM);
+
+	hwsp_seq_iter->slot = radix_tree_iter_lookup(&hwspinlock_tree,
+						     &hwsp_seq_iter->iter, *ppos);
+
+	return hwsp_seq_iter->slot ? hwsp_seq_iter : NULL;
+}
+
+static void *hwspinlock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
+{
+	struct hwspinlock_seq_iterator *hwsp_seq_iter = v;
+
+	hwsp_seq_iter->slot = radix_tree_next_slot(hwsp_seq_iter->slot,
+						   &hwsp_seq_iter->iter, 0);
+	if (!hwsp_seq_iter->slot)
+		hwsp_seq_iter->slot = radix_tree_next_chunk(&hwspinlock_tree,
+							    &hwsp_seq_iter->iter, 0);
+
+	if (!hwsp_seq_iter->slot) {
+		kfree(hwsp_seq_iter);
+		++*ppos;
+		return NULL;
+	}
+
+	*ppos = hwsp_seq_iter->iter.index;
+	return hwsp_seq_iter;
+}
+
+static void hwspinlock_seq_stop(struct seq_file *s, void *v)
+{
+	mutex_unlock(&hwspinlock_tree_lock);
+}
+
+static int hwspinlock_seq_show(struct seq_file *s, void *v)
+{
+	struct hwspinlock_seq_iterator *hwsp_seq_iter = v;
+	unsigned long id = hwsp_seq_iter->iter.index;
+	struct hwspinlock *hwlock;
+	int used;
+
+	used = !radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
+	hwlock = radix_tree_deref_slot_protected(hwsp_seq_iter->slot,
+						 &hwspinlock_tree_lock);
+	seq_printf(s, "%4lu:\t%s\t%s\n", id, used ? "in use" : "free",
+		   dev_name(hwlock->bank->dev));
+	return 0;
+}
+
+static const struct seq_operations hwspinlock_sops = {
+	.start = hwspinlock_seq_start,
+	.next = hwspinlock_seq_next,
+	.stop = hwspinlock_seq_stop,
+	.show = hwspinlock_seq_show,
+};
+DEFINE_SEQ_ATTRIBUTE(hwspinlock);
+
+/*
+ * subsys_initcall() is used here but controllers may already have been
+ * registered earlier or will be later. The rationale is that debugfs is
+ * accessed only late, i.e. from userspace. So, files created here must make no
+ * assumptions about initcall ordering.
+ */
+static int __init hwspinlock_init(void)
+{
+	struct dentry *hwspinlock_debugfs = debugfs_create_dir("hwspinlock", NULL);
+
+	debugfs_create_file("hwspinlock_summary", 0444, hwspinlock_debugfs,
+			    NULL, &hwspinlock_fops);
+	return 0;
+}
+subsys_initcall(hwspinlock_init);
+#endif	/* DEBUG_FS */
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
-- 
2.47.3

