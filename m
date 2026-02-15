Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD58A30BB9E
	for <linux-remoteproc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196127; cv=none; b=PfEy6A++49HdEFSm8UPlhwMAGwBV4l1tkN7OE9ZVixohGjxKg007qOcPdJfMTvqin55TJeb9wEYW7BUaxAiU1XYrA5+RHJrZoZAlaIHNum9OXNlI8SjatoCkUmCkn1IYVVLCzvR4A3BSp3+hUKc8WepE4qTrrr2ZCfaVY7aIgZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196127; c=relaxed/simple;
	bh=QPoKtcXFnRaaZw53W4hzO/yeRCpUDmDGURUH2pS9ACA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQ/8uAk5xg8IRz9QBF6UwXku9t0r9gvINgbNa4KYwNx4OH3cZ8Lryh/Q1PCtekCFT+7A6arbZ0gXf3hyWWMXthvjeGnDO+8AbwvzAI0hymLlHTla1iPLe7tL4qJcIx0PQmN9aj/QbGIEjJUuXLBnpznw2/NiP4R3Ml/Rtg6UJro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z6oNoOnz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z6oNoOnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=peOWO7x8XxQV4Leh2i0Qv0Qk6Bk/W2PHAwv2rBI0g+Q=; b=Z6oNoO
	nzyyeFBxwFj+eweOFydcDR5vKSFCHUOhjUWUgt12QGWokvBkBmh/7/vgOWz8gtBB
	liAhwJjk115siWH7dowrX2CTFKn4w25I0sp+2hVPAnJbjwV1w/5Ix2pmVNN+uTz6
	nLns++LShebafSyWBVSV/+guGDijF2ACZ+OwzjX5tjo6npP0Fm4apC3c97BGO6xK
	zZXAJEzyyjJNVV6TPCjv2wubcZZOy9zaaNWEt5CvRaVYlhX5Qg81WsS43fLTTV3J
	pFYUnmRga+6ZZ94HLVn8Vp73BtomH1tXbz0UAxW7nElpJBBgIWbshouZTxhYA3tc
	IsSLxZvfkFX5V2Sg==
Received: (qmail 3011428 invoked from network); 15 Feb 2026 23:55:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:10 +0100
X-UD-Smtp-Session: l3s3148p1@4ST1uuRKzsAujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 05/13] hwspinlock: sprd: use new callback to initialize hwspinlock priv
Date: Sun, 15 Feb 2026 23:54:45 +0100
Message-ID: <20260215225501.6365-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
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
 drivers/hwspinlock/sprd_hwspinlock.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 0d08efbdfb07..c19b680d5fdf 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -70,10 +70,18 @@ static void sprd_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(10);
 }
 
+static void *sprd_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	void __iomem *base = init_data;
+
+	return base + HWSPINLOCK_TOKEN(local_id);
+}
+
 static const struct hwspinlock_ops sprd_hwspinlock_ops = {
 	.trylock = sprd_hwspinlock_trylock,
 	.unlock = sprd_hwspinlock_unlock,
 	.relax = sprd_hwspinlock_relax,
+	.init_priv = sprd_hwspinlock_init_priv,
 };
 
 static void sprd_hwspinlock_disable(void *data)
@@ -86,8 +94,7 @@ static void sprd_hwspinlock_disable(void *data)
 static int sprd_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock;
-	struct hwspinlock *lock;
-	int i, ret;
+	int ret;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
@@ -123,16 +130,11 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
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
-					 SPRD_HWLOCKS_NUM);
+					 SPRD_HWLOCKS_NUM, sprd_hwlock->base);
 }
 
 static const struct of_device_id sprd_hwspinlock_of_match[] = {
-- 
2.51.0

