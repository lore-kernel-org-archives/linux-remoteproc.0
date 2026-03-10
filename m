Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0853B895D
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129376; cv=none; b=lIwX8V9OBJH8WeBtr31j0TaW5Uxxa6hRHvOJZPZuQ7SIZS3sYkcosepj8YA23XW1jyKBd1A/M+oLTZIEdg86azq1okOQvh+Z1xC5io5DOz1xAyDP2rYHy6Q5iRbONQ7M9K0PBBh27AfjQndzXekfgzakkggTJnsdZecPLwAX7ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129376; c=relaxed/simple;
	bh=UXawvM/5ghyvuCTf9RumFTnoPGsX/4pCNQpBlbuHXI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKHEJNTgftMeNhq9yoV/cwPuscrf2bwdvjrULjV5HuXjvpaPXwRxIkLQz7qYRSeI7peWh7RGzbqFSBYFIvZ9MrU+mvlFXn1M9MhnevlImQS4s/NY6b2TmcRI0MV8dpwZxPYbXbec1OFfjEpkp01bGEzxpJKhsidTUnlBOZsnQ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FPvv7T6C; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FPvv7T6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Z1ZYQaSGEP80w9qRTwVgX2BTs1CF8gzc4bx6qr/pC8E=; b=FPvv7T
	6CnqNmHizNqAhVpK4Zejt0JUPuhPsakIURNoENAsRVX8IrOGgemdiJiqR4L+j/Iu
	/HOYVme8RZ8PPpWIiC5xEhYGO1GS6BJO5gVbenAXSXlLV6sjkT6G6afWCZz1zzkC
	+qAxvEyvAWBMvKTZn2ISh0jmawL8LMzTIf0ukHbKwlIrrA5+7kjBljDMecDS6sze
	YlxwpVpb6GsNx5LoyBZVTAF/eXukUsTSKUsOMCMlqsRAeMwMrd6MRI8N+45Zpgmd
	4/bFOvejjTnKH6as5n2afXE6mCsGont+mr9pDc7RogopXiIJbLDOOHaAYWUDizzc
	7naeIQK+XuWjtBig==
Received: (qmail 3112703 invoked from network); 10 Mar 2026 08:55:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:54 +0100
X-UD-Smtp-Session: l3s3148p1@+SRI2aZMwtIujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 07/15] hwspinlock: sprd: use new callback to initialize hwspinlock priv
Date: Tue, 10 Mar 2026 08:55:22 +0100
Message-ID: <20260310075539.11701-8-wsa+renesas@sang-engineering.com>
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
2.47.3

