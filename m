Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520D835B645
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118339; cv=none; b=TBjPXCI1bn/bYgiGFfS+og17bTuJLE+ySF4iwiGvHcYVPfnjisgBUWwRUfc5fMjKZTs6cAOUsaCVFeEXRheZcMikvNt2rA/vfIITUEz+RYkvSg5Ce4OSMuHm6ZqzApqKixdlLzsEtaRUHeKqKk+am00ylecx3NqwmizBeK1eoRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118339; c=relaxed/simple;
	bh=eW5CEjp5oPCLohwGPhaXYx2BqS8El6bS1qdPHFb+TfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqH2+yOsiZblA82o751IqPJI+46+HFjwAi0V6oZNuGyWX/a7+OPliPFKTD7kqYEpqpQL/C/3qtvyEuPBpdrrXb2cdobaLHVnItrz99fke12WuK1mk9ZteQlKWZKSX0g0MqbBo5qICJWWGM3Qq+pi/gd10zco1o8N9WYw6wNLvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WNYuxsEF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WNYuxsEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=5jyOYvvpYirIPQNjSrR9lQ6VjRePGmcGcXwKDCTXjrg=; b=WNYuxs
	EFrfWP2NjYb9M69i9gZo7UOqgqfGX8oxp9sfL6zPcj8F+eFna8B6yX86yAG/oxEu
	qjDaP4xUUs6RjsL908FmwQ2nmJJI//kFgrHu2P3eXbBBNYj2rktTukZQyw38xzp1
	8ACHwz1hs2faMN4Jsimt+o6WmNJCyanYADFVT875qqmdSfz1UATPrWa1FqwJanpc
	PT3uRWGsrN+PlBHTJmBU8FvUceKGWMl72LAsOHSBpFBWZdOcrsmjugrLCIcCnYvg
	xsP2sVVg61IFV9pvu+FkAle6mrzQQ5IfqiECFzjkkfPgkhT29kmUI0AUEz9/W0fN
	+b0/16kbA/kUwSbg==
Received: (qmail 1894161 invoked from network); 22 Jun 2026 10:52:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 10:52:08 +0200
X-UD-Smtp-Session: l3s3148p1@zR7uwdNUFKUujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [PATCH v2 3/4] hwspinlock: annotate slot pointer as RCU sensitive
Date: Mon, 22 Jun 2026 10:52:02 +0200
Message-ID: <20260622085204.54248-4-wsa+renesas@sang-engineering.com>
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

Because 'slot' is used within an RCU read-lock, it must not be accessed
directly but with RCU helpers. Annotate the pointer to enforce checking
this. Sparse confirms the missing annotation:

drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:393:48: warning: incorrect type in argument 1 (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:393:48:    expected void [noderef] __rcu **slot
drivers/hwspinlock/hwspinlock_core.c:393:48:    got void **slot
drivers/hwspinlock/hwspinlock_core.c:397:30: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:397:30:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:397:30:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in argument 1 (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void [noderef] __rcu **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index a509b73da190..c97d68050102 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -372,7 +372,7 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
 	struct of_phandle_args args;
 	struct hwspinlock *hwlock;
 	struct radix_tree_iter iter;
-	void **slot;
+	void __rcu **slot;
 	int id;
 	int ret;
 
-- 
2.47.3

