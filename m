Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ECF38837C
	for <linux-remoteproc@vger.kernel.org>; Sat, 12 Sep 2026 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240496; cv=none; b=ADnLgrUd05OjXH957KxD9F5mW3N2ljEBdlGuY1Bj3zdBhU3t/e2osaoyG0PLL8Ej3gzRP9IQodymnc5047BRkysdd3oed7y9lTppnkNfQIQe3/W2IvvzAEQuCYuKmQcrv5uhL90e+M6xzknhZu+wEawrIxzH3fuYqUvIKLI4z+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240496; c=relaxed/simple;
	bh=g2OlAyGIZhV1BsjkNZjWxvFvD5hfEZl+LPj+baHDxvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRCpydR/XJ5RT3hSWYZrd32MLyYYaaYev3icmkAPLaBqK17Ey87SeK7mfEi1GltJTsrHVs+OB9GtDpkv5H4EswIrNAeGKS2n30NatYw6uXzrN9MAJ7ZxJ94hPPMq510q2EUTMV56tb8ZFUOgqOQ0yC6HTk9lvHulP5H7+rdEJAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VtHzbjHt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VtHzbjHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=oKNzB0ykC78dixpgq9ZZ5mFwGGg9bDpNVa6wSyleTuY=; b=VtHzbj
	HtWpozsqVKGRWSyoeMFNnIOLMe8/WEIynp+5BacS/ZjLszPaA7YJmWoWgHvqB+0M
	QVHtCUs/GzDpoGMHPgVQ3k71paePFiizKlUoQWoZB91xGVWKanM8KleVeKVozm/j
	Ow0n28u1fUAfhi3C4kM1mTVW1EymA/8hTrSYh0MXGDrbx6w72CWqwJ98D7wyYd3C
	/0zvZlfVOfX8wHy8riL3Bj7njPEVwyc6XwOCdRkc5oDWVWt4qmEhFtZVDKuYvFNu
	xSoc0YzLStxXOF7FHQag+o/kpwABg8z7ZR+mDCAFO5QK4qLXW+VBkH+UiHO07LUb
	tMVjoFFtrmEtfivA==
Received: (qmail 105222 invoked from network); 12 Sep 2026 21:14:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2026 21:14:50 +0200
X-UD-Smtp-Session: l3s3148p1@szXYA05bqrYujnsz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v7 1/3] hwspinlock: Convert to XArray
Date: Sat, 12 Sep 2026 21:14:39 +0200
Message-ID: <20260912191442.99453-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

The radix tree is deprecated.  The XArray uses the same data structure
with a nicer interface.  The hwspinlock_tree_lock is not needed as the
spinlock built into the XArray is sufficient for all these cases after
we split a larger critical section in hwspin_lock_request_specific()
into two smaller ones.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Co-developed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 170 +++++++++++----------------
 1 file changed, 71 insertions(+), 99 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index a509b73da190..22e6c7690f1a 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -16,7 +16,7 @@
 #include <linux/types.h>
 #include <linux/err.h>
 #include <linux/jiffies.h>
-#include <linux/radix-tree.h>
+#include <linux/xarray.h>
 #include <linux/hwspinlock.h>
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
@@ -27,35 +27,21 @@
 /* retry delay used in atomic context */
 #define HWSPINLOCK_RETRY_DELAY_US	100
 
-/* radix tree tags */
-#define HWSPINLOCK_UNUSED	(0) /* tags an hwspinlock as unused */
+/* XArray search mark */
+#define HWSPINLOCK_UNUSED	XA_MARK_0 /* marks a hwspinlock as unused */
 
 /*
- * A radix tree is used to maintain the available hwspinlock instances.
+ * An XArray is used to maintain the available hwspinlock instances.
  * The tree associates hwspinlock pointers with their integer key id,
  * and provides easy-to-use API which makes the hwspinlock core code simple
  * and easy to read.
  *
- * Radix trees are quick on lookups, and reasonably efficient in terms of
+ * XArrays are quick on lookups, and reasonably efficient in terms of
  * storage, especially with high density usages such as this framework
  * requires (a continuous range of integer keys, beginning with zero, is
- * used as the ID's of the hwspinlock instances).
- *
- * The radix tree API supports tagging items in the tree, which this
- * framework uses to mark unused hwspinlock instances (see the
- * HWSPINLOCK_UNUSED tag above). As a result, the process of querying the
- * tree, looking for an unused hwspinlock instance, is now reduced to a
- * single radix tree API call.
+ * used as the ID of the hwspinlock instances).
  */
-static RADIX_TREE(hwspinlock_tree, GFP_KERNEL);
-
-/*
- * Synchronization of access to the tree is achieved using this mutex,
- * as the radix-tree API requires that users provide all synchronisation.
- * A mutex is needed because we're using non-atomic radix tree allocations.
- */
-static DEFINE_MUTEX(hwspinlock_tree_lock);
-
+static DEFINE_XARRAY(hwspinlocks);
 
 /**
  * __hwspin_trylock() - attempt to lock a specific hwspinlock
@@ -369,10 +355,9 @@ of_hwspin_lock_simple_xlate(const struct of_phandle_args *hwlock_spec)
  */
 int of_hwspin_lock_get_id(struct device_node *np, int index)
 {
+	XA_STATE(xas, &hwspinlocks, 0);
 	struct of_phandle_args args;
 	struct hwspinlock *hwlock;
-	struct radix_tree_iter iter;
-	void **slot;
 	int id;
 	int ret;
 
@@ -389,15 +374,9 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
 	/* Find the hwspinlock device: we need its base_id */
 	ret = -EPROBE_DEFER;
 	rcu_read_lock();
-	radix_tree_for_each_slot(slot, &hwspinlock_tree, &iter, 0) {
-		hwlock = radix_tree_deref_slot(slot);
-		if (unlikely(!hwlock))
+	xas_for_each(&xas, hwlock, ULONG_MAX) {
+		if (xas_retry(&xas, hwlock))
 			continue;
-		if (radix_tree_deref_retry(hwlock)) {
-			slot = radix_tree_iter_retry(&iter);
-			continue;
-		}
-
 		if (device_match_of_node(hwlock->bank->dev, args.np)) {
 			ret = 0;
 			break;
@@ -452,51 +431,50 @@ EXPORT_SYMBOL_GPL(of_hwspin_lock_get_id_byname);
 
 static int hwspin_lock_register_single(struct hwspinlock *hwlock, int id)
 {
-	struct hwspinlock *tmp;
+	XA_STATE(xas, &hwspinlocks, id);
+	struct hwspinlock *existing;
 	int ret;
 
-	mutex_lock(&hwspinlock_tree_lock);
-
-	ret = radix_tree_insert(&hwspinlock_tree, id, hwlock);
-	if (ret) {
-		if (ret == -EEXIST)
+	do {
+		xas_lock(&xas);
+		existing = xas_load(&xas);
+		if (existing) {
 			pr_err("hwspinlock id %d already exists!\n", id);
-		goto out;
-	}
-
-	/* mark this hwspinlock as available */
-	tmp = radix_tree_tag_set(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
+			xas_set_err(&xas, -EBUSY);
+		}
+		xas_store(&xas, hwlock);
 
-	/* self-sanity check which should never fail */
-	WARN_ON(tmp != hwlock);
+		/* mark this hwspinlock as available */
+		xas_set_mark(&xas, HWSPINLOCK_UNUSED);
+		ret = xas_error(&xas);
+		xas_unlock(&xas);
+	} while (xas_nomem(&xas, GFP_KERNEL));
 
-out:
-	mutex_unlock(&hwspinlock_tree_lock);
 	return ret;
 }
 
 static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
 {
+	XA_STATE(xas, &hwspinlocks, id);
 	struct hwspinlock *hwlock = NULL;
-	int ret;
+	bool unused;
 
-	mutex_lock(&hwspinlock_tree_lock);
+	xas_lock(&xas);
+	xas_load(&xas);
 
-	/* make sure the hwspinlock is not in use (tag is set) */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
+	/* make sure the hwspinlock is not in use (mark is set) */
+	unused = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
+	if (!unused) {
 		pr_err("hwspinlock %d still in use (or not present)\n", id);
 		goto out;
 	}
 
-	hwlock = radix_tree_delete(&hwspinlock_tree, id);
-	if (!hwlock) {
-		pr_err("failed to delete hwspinlock %d\n", id);
-		goto out;
-	}
+	hwlock = xas_store(&xas, NULL);
+	if (!hwlock)
+		pr_err("hwspinlock %d already deleted\n", id);
 
 out:
-	mutex_unlock(&hwspinlock_tree_lock);
+	xas_unlock(&xas);
 	return hwlock;
 }
 
@@ -666,20 +644,18 @@ int devm_hwspin_lock_register(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_register);
 
 /**
- * __hwspin_lock_request() - tag an hwspinlock as used and power it up
+ * hwspin_lock_prepare() - prepare a hwspinlock
  * @hwlock: the target hwspinlock
  *
  * This is an internal function that prepares an hwspinlock instance
- * before it is given to the user. The function assumes that
- * hwspinlock_tree_lock is taken.
+ * before it is given to the user.
  *
  * Returns: %0 or positive to indicate success, and a negative value to
  * indicate an error (with the appropriate error code)
  */
-static int __hwspin_lock_request(struct hwspinlock *hwlock)
+static int hwspin_lock_prepare(struct hwspinlock *hwlock)
 {
 	struct device *dev = hwlock->bank->dev;
-	struct hwspinlock *tmp;
 	int ret;
 
 	/* prevent underlying implementation from being removed */
@@ -697,16 +673,7 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
 		return ret;
 	}
 
-	ret = 0;
-
-	/* mark hwspinlock as used, should not fail */
-	tmp = radix_tree_tag_clear(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
-
-	/* self-sanity check that should never fail */
-	WARN_ON(tmp != hwlock);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -724,36 +691,43 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
  */
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 {
+	XA_STATE(xas, &hwspinlocks, id);
 	struct hwspinlock *hwlock;
+	bool unused;
 	int ret;
 
-	mutex_lock(&hwspinlock_tree_lock);
+	xas_lock(&xas);
 
-	/* make sure this hwspinlock exists */
-	hwlock = radix_tree_lookup(&hwspinlock_tree, id);
+	hwlock = xas_load(&xas);
 	if (!hwlock) {
+		xas_unlock(&xas);
 		pr_warn("hwspinlock %u does not exist\n", id);
-		goto out;
+		return NULL;
 	}
 
 	/* sanity check (this shouldn't happen) */
 	WARN_ON(hwlock_to_id(hwlock) != id);
 
-	/* make sure this hwspinlock is unused */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
+	unused = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
+	if (!unused) {
+		xas_unlock(&xas);
 		pr_warn("hwspinlock %u is already in use\n", id);
-		hwlock = NULL;
-		goto out;
+		return NULL;
 	}
 
-	/* mark as used and power up */
-	ret = __hwspin_lock_request(hwlock);
-	if (ret < 0)
-		hwlock = NULL;
+	xas_clear_mark(&xas, HWSPINLOCK_UNUSED);
+	xas_unlock(&xas);
+
+	ret = hwspin_lock_prepare(hwlock);
+	if (ret < 0) {
+		xas_lock(&xas);
+		xas_set(&xas, hwlock_to_id(hwlock));
+		xas_load(&xas);
+		xas_set_mark(&xas, HWSPINLOCK_UNUSED);
+		xas_unlock(&xas);
+		return NULL;
+	}
 
-out:
-	mutex_unlock(&hwspinlock_tree_lock);
 	return hwlock;
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_request_specific);
@@ -772,9 +746,10 @@ EXPORT_SYMBOL_GPL(hwspin_lock_request_specific);
  */
 int hwspin_lock_free(struct hwspinlock *hwlock)
 {
+	XA_STATE(xas, &hwspinlocks, 0);
 	struct device *dev;
-	struct hwspinlock *tmp;
-	int ret;
+	bool unused;
+	int ret = 0;
 
 	if (!hwlock) {
 		pr_err("invalid hwlock\n");
@@ -782,12 +757,13 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	}
 
 	dev = hwlock->bank->dev;
-	mutex_lock(&hwspinlock_tree_lock);
+	xas_lock(&xas);
+	xas_set(&xas, hwlock_to_id(hwlock));
+	xas_load(&xas);
 
 	/* make sure the hwspinlock is used */
-	ret = radix_tree_tag_get(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
-	if (ret == 1) {
+	unused = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
+	if (unused) {
 		dev_err(dev, "%s: hwlock is already free\n", __func__);
 		dump_stack();
 		ret = -EINVAL;
@@ -798,16 +774,12 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	pm_runtime_put(dev);
 
 	/* mark this hwspinlock as available */
-	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
-
-	/* sanity check (this shouldn't happen) */
-	WARN_ON(tmp != hwlock);
+	xas_set_mark(&xas, HWSPINLOCK_UNUSED);
 
 	module_put(dev->driver->owner);
 
 out:
-	mutex_unlock(&hwspinlock_tree_lock);
+	xas_unlock(&xas);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_free);
-- 
2.53.0

