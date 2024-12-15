Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25392442C;
	Sun, 15 Dec 2024 02:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734230845; cv=none; b=adwVprt3CldAn1uBHXdnxdi8tEdcZ0GgEfQsphPw+8p1WeSFxZOaHZ6zRPu8wYcxrFlOk+frqeMc50oKUxCcRZEZ879etQghrZd0FJ9XxGm3x2hr1LmxJE93JLsREKuqmto6SIfOHk/0xzfeHlQuPJom+L1s7JcPQEgiG3xcRak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734230845; c=relaxed/simple;
	bh=wp7OgfHVY9Y3CorqTuNlNgPka83XVrd0Zq1/l0O6Ru4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sv22E1sBlxDfawQvnzZsiFMqbvi8/Ym1Ov3IAxRADleonRsh8+HdA4ApirVNqc8gI2F9lNEO6ufxudq09Q7yzThDCDFpeUba6bwPrbv17a6nR+R6BAg2rJuLzbR60XJxnC5YB7tj9u3iOOtzcMK78IDe7Qr3gLs9HAT2mmNHBkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=nVaqjvLj; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="nVaqjvLj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=L5vMYFubsyGDtRUzS6YTga3Gt+vmg7NH1H30YZ43HGc=; b=nVaqjvLjuqueljvx
	Tju+S0l8rgqtoibhTue25y3xTW+7CJsll0zTGLFFk4qeOgKsu/LPx8odjCIcUjkdsoZqqu3FxrQbP
	mQOyufmiQdhfyI5iQSMoLw5isEeXxISm6nmz1bBAey60aJrdwSxAp857hjSggHlc0hRc0chw+sX2C
	0G2yEEGMXMiWqK1s5HnMcHUyG69Kg8c6FSEMbqcAW4IGU9L6hmDckXdwkDhwTWGjHbXniyUuOhQgy
	nlw1t0XIxJhXFo8jK6a54MLeVa2SlttgJUZ2/WQga36FUmtf3f5lLZ/eU/k2NyLU0DRSDMAwEjcqE
	ePrsg/L7KSWwk7A9bw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tMeF6-005RBp-1B;
	Sun, 15 Dec 2024 02:20:24 +0000
From: linux@treblig.org
To: andersson@kernel.org,
	baolin.wang@linux.alibaba.com
Cc: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] hwspinlock: Remove unused hwspin_lock_get_id
Date: Sun, 15 Dec 2024 02:20:23 +0000
Message-ID: <20241215022023.181435-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

hwspin_lock_get_id() has been unused since the original 2011
commit bd9a4c7df256 ("drivers: hwspinlock: add framework")

Remove it and the corresponding docs.

Note that the of_hwspin_lock_get_id() version is still in use,
so leave that alone.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 Documentation/locking/hwspinlock.rst | 11 -----------
 drivers/hwspinlock/hwspinlock_core.c | 17 -----------------
 include/linux/hwspinlock.h           |  6 ------
 3 files changed, 34 deletions(-)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index d482422d7a38..a737c702a7d1 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -301,17 +301,6 @@ The caller should **never** unlock an hwspinlock which is already unlocked.
 Doing so is considered a bug (there is no protection against this).
 This function will never sleep.
 
-::
-
-  int hwspin_lock_get_id(struct hwspinlock *hwlock);
-
-Retrieve id number of a given hwspinlock. This is needed when an
-hwspinlock is dynamically assigned: before it can be used to achieve
-mutual exclusion with a remote cpu, the id number should be communicated
-to the remote task with which we want to synchronize.
-
-Returns the hwspinlock id number, or -EINVAL if hwlock is null.
-
 Typical usage
 =============
 
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index f000432ce21d..cc8e952a6772 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -709,23 +709,6 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
 	return ret;
 }
 
-/**
- * hwspin_lock_get_id() - retrieve id number of a given hwspinlock
- * @hwlock: a valid hwspinlock instance
- *
- * Returns: the id number of a given @hwlock, or -EINVAL if @hwlock is invalid.
- */
-int hwspin_lock_get_id(struct hwspinlock *hwlock)
-{
-	if (!hwlock) {
-		pr_err("invalid hwlock\n");
-		return -EINVAL;
-	}
-
-	return hwlock_to_id(hwlock);
-}
-EXPORT_SYMBOL_GPL(hwspin_lock_get_id);
-
 /**
  * hwspin_lock_request_specific() - request for a specific hwspinlock
  * @id: index of the specific hwspinlock that is requested
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 2f32d768dfd9..f35b42e8c5de 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -61,7 +61,6 @@ int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
 int of_hwspin_lock_get_id(struct device_node *np, int index);
-int hwspin_lock_get_id(struct hwspinlock *hwlock);
 int __hwspin_lock_timeout(struct hwspinlock *, unsigned int, int,
 							unsigned long *);
 int __hwspin_trylock(struct hwspinlock *, int, unsigned long *);
@@ -131,11 +130,6 @@ static inline int of_hwspin_lock_get_id(struct device_node *np, int index)
 	return 0;
 }
 
-static inline int hwspin_lock_get_id(struct hwspinlock *hwlock)
-{
-	return 0;
-}
-
 static inline
 int of_hwspin_lock_get_id_byname(struct device_node *np, const char *name)
 {
-- 
2.47.1

