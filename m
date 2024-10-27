Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B161183CB0;
	Sun, 27 Oct 2024 20:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730062504; cv=none; b=fffywQ/PZbMKUnR5HNAtihZwMP/Pn9qb8qX1NOqMSsNWR9dikwkJxr0D3vjNTvm0Z8W87PrYVCvaUPABvsBpoSMqdUqzWHZ/yZW5Jl8k3Jbx5n4Q8A/Kgvfjuk3oNMdszHvLkmj2cZ4ArpgE7DR2a/zcZL90PA+5/PPdeofu0Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730062504; c=relaxed/simple;
	bh=QEtpj9cBI7l/rs/to7PvJu7JUM1/b4XuPlWR/raK0J4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZTaACDNNjWwP/9pEhuXUFxTQSI0YKKNHVj6vj/lT8GREkiC12MfTioMX9f+Y0SWsEz9yPpGvHSkb+FGygUD6C2vbVXADvcu4afPDItlQdiQgf/07l2l9+QX2RGnlXhVNH64ZSMUgmJ6edlj7POcQiVyaQU63/EhxF37kUiRlLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=YEH7JnEN; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="YEH7JnEN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=ghB1ilPjKBTrK8abIWyuqBZxb7d8USrDLJn8gVAXgUo=; b=YEH7JnENaDRyw6G4
	xfQ8e9VZPrc7YbAof6JAy2CHLxwa4Vq3722w3HtLyzfw7hVjfubZdFzYVuZ6enYReJBkOK6r6b5z+
	AcBRyCyh7AHVYLvyChL4+jMQ6Rzcs1/Fr1xlE5neWrrPnEGpNPfatuZd6mvSwSCzFryvBXhQ/dAJX
	8QPY4RIZOlWqhowQPkVWr929i3IEToo/0L0d8/Rz+p386piOJO6pKdcebH9KAil+C0RMkPJPF2ddc
	B4q7mPGMQKSEO1T8JvBpGuSzJRgrR5Kse9EzN4laysXsEuP0MPqqLzUjElnk9SrJtCqij4QalbKkH
	EW8bEdz+nI0xZ1UVOQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1t5AHe-00DoRg-2i;
	Sun, 27 Oct 2024 20:54:46 +0000
From: linux@treblig.org
To: andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org
Cc: longman@redhat.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] hwspinlock: Remove unused (devm_)hwspin_lock_request
Date: Sun, 27 Oct 2024 20:54:45 +0000
Message-ID: <20241027205445.239108-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

devm_hwspin_lock_request() was added by 2018's
commit 4f1acd758b08 ("hwspinlock: Add devm_xxx() APIs to request/free
hwlock") however, it's never been used, everyone uses the
devm_hwspin_lock_request_specific() call instead.

Remove it.

Similarly, the none-devm variant isn't used.
Remove it, and the referring documentation.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 Documentation/locking/hwspinlock.rst | 46 +----------------
 drivers/hwspinlock/hwspinlock_core.c | 77 ----------------------------
 include/linux/hwspinlock.h           | 12 -----
 3 files changed, 1 insertion(+), 134 deletions(-)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index 2ffaa3cbd63f..d482422d7a38 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -38,17 +38,6 @@ independent, drivers.
 User API
 ========
 
-::
-
-  struct hwspinlock *hwspin_lock_request(void);
-
-Dynamically assign an hwspinlock and return its address, or NULL
-in case an unused hwspinlock isn't available. Users of this
-API will usually want to communicate the lock's id to the remote core
-before it can be used to achieve synchronization.
-
-Should be called from a process context (might sleep).
-
 ::
 
   struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
@@ -331,40 +320,7 @@ Typical usage
 	#include <linux/hwspinlock.h>
 	#include <linux/err.h>
 
-	int hwspinlock_example1(void)
-	{
-		struct hwspinlock *hwlock;
-		int ret;
-
-		/* dynamically assign a hwspinlock */
-		hwlock = hwspin_lock_request();
-		if (!hwlock)
-			...
-
-		id = hwspin_lock_get_id(hwlock);
-		/* probably need to communicate id to a remote processor now */
-
-		/* take the lock, spin for 1 sec if it's already taken */
-		ret = hwspin_lock_timeout(hwlock, 1000);
-		if (ret)
-			...
-
-		/*
-		* we took the lock, do our thing now, but do NOT sleep
-		*/
-
-		/* release the lock */
-		hwspin_unlock(hwlock);
-
-		/* free the lock */
-		ret = hwspin_lock_free(hwlock);
-		if (ret)
-			...
-
-		return ret;
-	}
-
-	int hwspinlock_example2(void)
+	int hwspinlock_example(void)
 	{
 		struct hwspinlock *hwlock;
 		int ret;
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 6505261e6068..f000432ce21d 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -726,49 +726,6 @@ int hwspin_lock_get_id(struct hwspinlock *hwlock)
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_get_id);
 
-/**
- * hwspin_lock_request() - request an hwspinlock
- *
- * This function should be called by users of the hwspinlock device,
- * in order to dynamically assign them an unused hwspinlock.
- * Usually the user of this lock will then have to communicate the lock's id
- * to the remote core before it can be used for synchronization (to get the
- * id of a given hwlock, use hwspin_lock_get_id()).
- *
- * Should be called from a process context (might sleep)
- *
- * Returns: the address of the assigned hwspinlock, or %NULL on error
- */
-struct hwspinlock *hwspin_lock_request(void)
-{
-	struct hwspinlock *hwlock;
-	int ret;
-
-	mutex_lock(&hwspinlock_tree_lock);
-
-	/* look for an unused lock */
-	ret = radix_tree_gang_lookup_tag(&hwspinlock_tree, (void **)&hwlock,
-						0, 1, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
-		pr_warn("a free hwspinlock is not available\n");
-		hwlock = NULL;
-		goto out;
-	}
-
-	/* sanity check that should never fail */
-	WARN_ON(ret > 1);
-
-	/* mark as used and power up */
-	ret = __hwspin_lock_request(hwlock);
-	if (ret < 0)
-		hwlock = NULL;
-
-out:
-	mutex_unlock(&hwspinlock_tree_lock);
-	return hwlock;
-}
-EXPORT_SYMBOL_GPL(hwspin_lock_request);
-
 /**
  * hwspin_lock_request_specific() - request for a specific hwspinlock
  * @id: index of the specific hwspinlock that is requested
@@ -912,40 +869,6 @@ int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock)
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_free);
 
-/**
- * devm_hwspin_lock_request() - request an hwspinlock for a managed device
- * @dev: the device to request an hwspinlock
- *
- * This function should be called by users of the hwspinlock device,
- * in order to dynamically assign them an unused hwspinlock.
- * Usually the user of this lock will then have to communicate the lock's id
- * to the remote core before it can be used for synchronization (to get the
- * id of a given hwlock, use hwspin_lock_get_id()).
- *
- * Should be called from a process context (might sleep)
- *
- * Returns: the address of the assigned hwspinlock, or %NULL on error
- */
-struct hwspinlock *devm_hwspin_lock_request(struct device *dev)
-{
-	struct hwspinlock **ptr, *hwlock;
-
-	ptr = devres_alloc(devm_hwspin_lock_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return NULL;
-
-	hwlock = hwspin_lock_request();
-	if (hwlock) {
-		*ptr = hwlock;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return hwlock;
-}
-EXPORT_SYMBOL_GPL(devm_hwspin_lock_request);
-
 /**
  * devm_hwspin_lock_request_specific() - request for a specific hwspinlock for
  *					 a managed device
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index f0231dbc4777..2f32d768dfd9 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -58,7 +58,6 @@ struct hwspinlock_pdata {
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		const struct hwspinlock_ops *ops, int base_id, int num_locks);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
-struct hwspinlock *hwspin_lock_request(void);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
 int of_hwspin_lock_get_id(struct device_node *np, int index);
@@ -70,7 +69,6 @@ void __hwspin_unlock(struct hwspinlock *, int, unsigned long *);
 int of_hwspin_lock_get_id_byname(struct device_node *np, const char *name);
 int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
 int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock);
-struct hwspinlock *devm_hwspin_lock_request(struct device *dev);
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id);
 int devm_hwspin_lock_unregister(struct device *dev,
@@ -95,11 +93,6 @@ int devm_hwspin_lock_register(struct device *dev,
  * Note: ERR_PTR(-ENODEV) will still be considered a success for NULL-checking
  * users. Others, which care, can still check this with IS_ERR.
  */
-static inline struct hwspinlock *hwspin_lock_request(void)
-{
-	return ERR_PTR(-ENODEV);
-}
-
 static inline struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 {
 	return ERR_PTR(-ENODEV);
@@ -155,11 +148,6 @@ int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock)
 	return 0;
 }
 
-static inline struct hwspinlock *devm_hwspin_lock_request(struct device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-
 static inline
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id)
-- 
2.47.0

