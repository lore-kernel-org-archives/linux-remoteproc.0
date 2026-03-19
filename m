Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC913C9423
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918024; cv=none; b=CakjbO/MNUajV//fjCFX8WXP8gCeZyOHFvQfe3kIkaWivbVio91vezOkLG8SsiQ8KHjTgB8N03HOFiB/YhKbs3cDLN4Aw7EGHbSnF/1Be/GpYMD3wEwXYnRO8fojh450Q48nz2Z//U386TPKaQFMhL31Du9+4YtII+u5jXZB2F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918024; c=relaxed/simple;
	bh=gKBddV9sinIqdmJCyXboDE9z9F21uQ+JueRqg5Hobo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHbvQh8YyYqLMiYFznGYCb05w5EpNmgjXO90VdvFsmPoHPH14I0xeeHaZ+dLyfm5ManLgYrAiemkZ+hhm4jrdG+NzceiV2DvE8L+SPZfhxU05TYNsQIIe1l0UQKsqLduJJ4KO6qp6eJjpjhVnDEXVwGomUbRZ/LbDqJ07wV5z9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AMU8FuT3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AMU8FuT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=w7ycEgeDr6Fe7llcfOqItjza7eOV0SfPJPxdSW1Pnro=; b=AMU8Fu
	T3bj6XGrPazpi52hVvnhjurfuvXSHk3c2ppTlcd+1CBNQwf0u9bhj/jPvMnDsKaZ
	CwKUJ2UX44jeM17ALXkvlxB4vAur1Q/waj6eUGfIhd+Y/q5uHloeDd6R9o5Y0tBY
	5oLcSI98Bc27vOukMDyuk6TdWdli/Hv8bLk9Lj9LBuAgnOWUyMwT7RuTzi8iDTnP
	Xgc25GRi57l7EuJTM6K/GG5JC0fq9ibNNlFdJq2cNtJweNrSfYVlRBFELv6Xdx1t
	jD7O6bsT2+EYHn5R+F4NlXuZPySl9GYpee3vLJAnlILu/KdfkOOYqIGW+svFKbve
	xJiqnTdywbm0XG6Q==
Received: (qmail 1099588 invoked from network); 19 Mar 2026 11:59:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 11:59:59 +0100
X-UD-Smtp-Session: l3s3148p1@XMUueF5NapsgAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 07/15] hwspinlock: sprd: use new callback to initialize hwspinlock priv
Date: Thu, 19 Mar 2026 11:59:29 +0100
Message-ID: <20260319105947.6237-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply the new helper to avoid using internal structures from the core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/sprd_hwspinlock.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 0b91bdd4303d..f906f5fa74ef 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -70,10 +70,16 @@ static void sprd_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(10);
 }
 
+static void *sprd_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + HWSPINLOCK_TOKEN(local_id);
+}
+
 static const struct hwspinlock_ops sprd_hwspinlock_ops = {
 	.trylock = sprd_hwspinlock_trylock,
 	.unlock = sprd_hwspinlock_unlock,
 	.relax = sprd_hwspinlock_relax,
+	.init_priv = sprd_hwspinlock_init_priv,
 };
 
 static void sprd_hwspinlock_disable(void *data)
@@ -86,8 +92,7 @@ static void sprd_hwspinlock_disable(void *data)
 static int sprd_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock;
-	struct hwspinlock *lock;
-	int i, ret;
+	int ret;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
@@ -123,16 +128,11 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 	/* set the hwspinlock to record user id to identify subsystems */
 	writel(HWSPINLOCK_USER_BITS, sprd_hwlock->base + HWSPINLOCK_RECCTRL);
 
-	for (i = 0; i < SPRD_HWLOCKS_NUM; i++) {
-		lock = &sprd_hwlock->bank.lock[i];
-		lock->priv = sprd_hwlock->base + HWSPINLOCK_TOKEN(i);
-	}
-
 	platform_set_drvdata(pdev, sprd_hwlock);
 
 	return devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
 					 &sprd_hwspinlock_ops, 0,
-					 SPRD_HWLOCKS_NUM, NULL);
+					 SPRD_HWLOCKS_NUM, sprd_hwlock->base);
 }
 
 static const struct of_device_id sprd_hwspinlock_of_match[] = {
-- 
2.51.0

