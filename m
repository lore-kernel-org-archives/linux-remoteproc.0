Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79043659E7
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129382; cv=none; b=USRXJVNvmlinVVycxJiroAWt+vGzOEo7M4C7aAepJwKwciEFyKm3T9MAFBzJ4AXkaGkp2Dl9Jw1zPauPXu56g7x4tm0ed7bD7l0I8NRkcwffdnt+/SwurKrXQUuaKxAS5pwRIa1pFfOErn050zw94jDxJMiAPQNGKqwK/X2At9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129382; c=relaxed/simple;
	bh=42u90bGiuD4aeqHVuUHXKa5boniiN0wJ3UdVXzh+u7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8njMhbFvbJyfIi8zky+zTA2MdBEYpuZKD5tHXNwdErADiYdQaMs7hdwgkW8uIG63DG/JSRkC4RaJeyGETAmt7tlZRWDb7DSoK7FuZP2kpiMqUyQ/c3FlOd6mb5qTN64bso6kGgFB+FuArBRCcGV2QpcoCHR1bB1dxK1iBH8LsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XA4+C49x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XA4+C49x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=V811ZnR3+6B2X2veFZsr6SS9lD2yc+/nKwkhuTtKc88=; b=XA4+C4
	9xPLCLeAkef9lQ4nB92JMnoImim/26HnCm8q+lVdPdrRZDgFN00qJWJlQGZ5JYee
	4JUtrw0jBAlyvTJZOfwtPRncKcPpbHxTHYa61KfrYNVzJAt9coLRDdsvMfop4HIC
	uIMXHkIbBEdc8i0Tag25QnJvqULhZp4qupUIJ/Vso1wp/0diZ35PSnzWxc9utRs/
	gJdj8J7cQgzRN/YwcAmzxfUgOwVPgz5IcLiR9pXc2usd+ymJvFIsocI3OgCI8HvL
	NNkUveh+mAOAYqyGnqkBb3UGlbSW5QoErXXVUci4jQsAEisIPRX+S6t0gQ0ddTs/
	osHX73I95y75ecHw==
Received: (qmail 3112731 invoked from network); 10 Mar 2026 08:55:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:55 +0100
X-UD-Smtp-Session: l3s3148p1@LcRc2aZM2NIujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to initialize hwspinlock priv
Date: Tue, 10 Mar 2026 08:55:24 +0100
Message-ID: <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply the new helper to avoid using internal structures from the core.
Remove superfluous setting of drvdata while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/hwspinlock/sun6i_hwspinlock.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index a0c76bba3f05..c3db81cb1793 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -74,9 +74,15 @@ static void sun6i_hwspinlock_unlock(struct hwspinlock *lock)
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
 }
 
+static void *sun6i_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + sizeof(u32) * local_id;
+}
+
 static const struct hwspinlock_ops sun6i_hwspinlock_ops = {
 	.trylock	= sun6i_hwspinlock_trylock,
 	.unlock		= sun6i_hwspinlock_unlock,
+	.init_priv	= sun6i_hwspinlock_init_priv,
 };
 
 static void sun6i_hwspinlock_disable(void *data)
@@ -91,10 +97,9 @@ static void sun6i_hwspinlock_disable(void *data)
 static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sun6i_hwspinlock_data *priv;
-	struct hwspinlock *hwlock;
 	void __iomem *io_base;
 	u32 num_banks;
-	int err, i;
+	int err;
 
 	io_base = devm_platform_ioremap_resource(pdev, SPINLOCK_BASE_ID);
 	if (IS_ERR(io_base))
@@ -161,11 +166,6 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	for (i = 0; i < priv->nlocks; ++i) {
-		hwlock = &priv->bank->lock[i];
-		hwlock->priv = io_base + SPINLOCK_LOCK_REGN + sizeof(u32) * i;
-	}
-
 	/* failure of debugfs is considered non-fatal */
 	sun6i_hwspinlock_debugfs_init(priv);
 	if (IS_ERR(priv->debugfs))
@@ -177,10 +177,8 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	platform_set_drvdata(pdev, priv);
-
 	return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_hwspinlock_ops,
-					 SPINLOCK_BASE_ID, priv->nlocks, NULL);
+					 SPINLOCK_BASE_ID, priv->nlocks, io_base + SPINLOCK_LOCK_REGN);
 
 bank_fail:
 	clk_disable_unprepare(priv->ahb_clk);
-- 
2.47.3

