Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9970E3128D7
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Feb 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721267; cv=none; b=AqvJ3SF7jyc1aXnA30O01hLdd5UN0zL6Nz7+Y/BykWpVqZIHRjUjIAuEnu/a0P0xE/4f4MtL6suuW0k3W3og9c4vkWoYqzNIrBOuSgd+GB2LVB+Ysz6MlPWs5GILlrRJvgVJE5wP4ftXW/Zo0UmmvC4RDmQafPaMgarwPZqYwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721267; c=relaxed/simple;
	bh=wpQXoiGf6xuFOCX29KtA+mYn9kZEMHmil09SNGf3Hi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IF3c41y4XVJqE+iRu5OF4zx5B+QZqWx+AcTaHuecO3CVaNTWs/k+DfvS5LsZDYmYAVRdeL7CkF+9SLagJMQ1IoDp49SlA82wHTCAOyNlqOicNG5AQzMDHjEQAfUorlueKLV4GfEAltJFDTiAhitstGZRpwKyolhL9UvaR8otCTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MU7konWC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MU7konWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=wwshHZNadT8HUjInGzJyUY51Bs+OpL0yMVN+dJVHkmU=; b=MU7kon
	WCxEAs3u8KAZ6m5PnGDsM2e4nJbiS/mqLydPqTj/ytwLxnPZT2rL8L5QmiZ+hnXs
	r8wiD/S85ZbCm2erZ2+EARpxQVeR3hBKCimCEwrymGi99yupyoLo0X8JoVKNi8DD
	x2xpgpj8+n8Gmdh7r5tJHXuENfIs6YSkZlmsHI4LbaANXzJtVlO3f7FvPLGOGiUC
	Mz1ceIPwvoUFFqTZhJXFbiwAE0fezHv3J2e1mzJ2T1+UvW5WNOc3QSTO+aVIYNG+
	hunE3Rx8vbHbr6XcnClVdAFzKbbhecRe23lTz1SZ4071wtWdnMGkV+l+qB60pH2Z
	DSh+FbjLMK1VIBFQ==
Received: (qmail 353891 invoked from network); 10 Feb 2026 12:01:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2026 12:01:02 +0100
X-UD-Smtp-Session: l3s3148p1@K7TYK3ZKopkujnuT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 2/2] hwspinlock: remove now unused pdata from header file
Date: Tue, 10 Feb 2026 12:00:56 +0100
Message-ID: <20260210110057.10869-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
References: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last user turned out to be obsolete and was removed. Remove the
unused struct now, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/hwspinlock.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index f35b42e8c5de..74b91244fe0e 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -25,34 +25,6 @@ struct hwspinlock;
 struct hwspinlock_device;
 struct hwspinlock_ops;
 
-/**
- * struct hwspinlock_pdata - platform data for hwspinlock drivers
- * @base_id: base id for this hwspinlock device
- *
- * hwspinlock devices provide system-wide hardware locks that are used
- * by remote processors that have no other way to achieve synchronization.
- *
- * To achieve that, each physical lock must have a system-wide id number
- * that is agreed upon, otherwise remote processors can't possibly assume
- * they're using the same hardware lock.
- *
- * Usually boards have a single hwspinlock device, which provides several
- * hwspinlocks, and in this case, they can be trivially numbered 0 to
- * (num-of-locks - 1).
- *
- * In case boards have several hwspinlocks devices, a different base id
- * should be used for each hwspinlock device (they can't all use 0 as
- * a starting id!).
- *
- * This platform data structure should be used to provide the base id
- * for each device (which is trivially 0 when only a single hwspinlock
- * device exists). It can be shared between different platforms, hence
- * its location.
- */
-struct hwspinlock_pdata {
-	int base_id;
-};
-
 #ifdef CONFIG_HWSPINLOCK
 
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-- 
2.51.0

