Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE813932D8
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118340; cv=none; b=Zxi1uKfyabnHq3MTmT5UEe47u/Cs6Ra63sMRy+updDtC93c9ois7UYetO/uwGugaqmF823mwaDU7OkIkVhhuy+BslXFToPyz6RPDH3HyfSYdXtJXBi07BcOyLC9xaD/ASse9TThRrTEdf8KOtQ2XB89j9OkqdO6KWp/gQti3P8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118340; c=relaxed/simple;
	bh=xKEdTEh6LuRAwqI1e6jOQFfbGCwYSh7t1j8ReNZRSQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEvNHF1yRAqMjg/Nrcws5PWH2Fw6dLNa/k9qLhYzoudldYujBM+AsPSda4FG5wpqRlywOl+gJVIPvuS/8CZFuEheSO90iF4RGX7D7ojOUeZr6V1cYwuTK5d96kK49HrT9rcPiirpKY7Sz1X5wFF5xk0bLTxluKAJAIR/QFFVKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lxuqKcm4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lxuqKcm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3r1JsNWQPOwbbl0dLNXmqSlo1YhKZDJDei1uOqedRvc=; b=lxuqKc
	m4fS6NkjKrlZiH7B1jhS0X9BqTEMwXzZ8+OQvYX4mZc4OSBNgxMUq1kg6TiHtTCl
	xa5oZLaO7F1wYkAyIPhZLcXaaAUbhVAm/F5ZSUfaVPsb2VHQ2YsMfVevVEk3zahH
	xcvbgYXeXVYwS/HIrk2JT3QbhfB7gRNlfg7VJfjQRXDVw0DRI69xg+1fm7m5uBDF
	7ZaN6s+LrUiEssfi8T7eF64ndSFBSqclHxpWWix8G3uP2FLDHc3jWdpJwH4ptXki
	0WoSzAvWg5lFUoufI7Mzu8eqghOpEXFdTRUWDuJSxP/jCQu3xwoLHO61yG2h1sUB
	15xDOynUUm3BsTTw==
Received: (qmail 1894123 invoked from network); 22 Jun 2026 10:52:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 10:52:08 +0200
X-UD-Smtp-Session: l3s3148p1@s2/kwdNUBqUujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/4] radix-tree: allow more lock types with radix_tree_deref_slot_protected()
Date: Mon, 22 Jun 2026 10:52:01 +0200
Message-ID: <20260622085204.54248-3-wsa+renesas@sang-engineering.com>
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

The 'treelock' parameter is type-checked to be of spinlock_t. The lock
to protect the tree might be something else, though. E.g. the hwspinlock
subsystem uses a mutex. 'treelock' is simply passed onto
lockdep_is_held() which supports way more lock types by using a #define
instead of an inline function. Use the same approach for
radix_tree_deref_slot_protected() to support more lock types, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/radix-tree.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/linux/radix-tree.h b/include/linux/radix-tree.h
index b8997f07b2d4..a07e5a51eaf9 100644
--- a/include/linux/radix-tree.h
+++ b/include/linux/radix-tree.h
@@ -182,18 +182,16 @@ static inline void *radix_tree_deref_slot(void __rcu **slot)
 /**
  * radix_tree_deref_slot_protected - dereference a slot with tree lock held
  * @slot: slot pointer, returned by radix_tree_lookup_slot
- * @treelock: pointer to the spinlock protecting the tree
+ * @treelock: pointer to the lock protecting the tree. Any lock type supported
+ *            by lockdep_is_held() can be used
  *
  * Similar to radix_tree_deref_slot.  The caller does not hold the RCU read
  * lock but it must hold the tree lock to prevent parallel updates.
  *
  * Return: entry stored in that slot.
  */
-static inline void *radix_tree_deref_slot_protected(void __rcu **slot,
-							spinlock_t *treelock)
-{
-	return rcu_dereference_protected(*slot, lockdep_is_held(treelock));
-}
+#define radix_tree_deref_slot_protected(slot, treelock) \
+	rcu_dereference_protected(*(slot), lockdep_is_held(treelock))
 
 /**
  * radix_tree_deref_retry	- check radix_tree_deref_slot
-- 
2.47.3

