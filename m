Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECAD389114
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566314; cv=none; b=e+Mvnv1gzsGaQIkkxH0jcevuqqafEFoy8EoO4FpDBFkTO/mN+pbj1yq0bTPXZpLDiOXpIVWICnyGJaqSxdK49HIkRXolt0VuIFRAYpGT7COBtRfFJprZrn45wuqmP1HCz5fa7Ld68dObLUPluOMZA4x80XfgmdBFyKboj49M2EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566314; c=relaxed/simple;
	bh=OEH3l5ojWMA/OYyQO8879NCGmmk7Y1mf0kCu8Rq9dKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1dhhKAooJyh1RRPDPD9ALH3YS+cWomHHlY0g97/W9UWpZMLxUmL8qv5qc4XIBVRy/OQoU4SsEAOYOdcD9GkEO4mpuYqVyMKa+Tnaww4BTrOzNJGm65Dzqux3U4mbmOYv8rwFw128kAj/+boScLJF+HLJqaVugoOxMBZ/SeXwlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GlweQzJj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GlweQzJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=cfGSgS8xrxtvLo0CzFzbdSrdEtwKeD6q3V5u52qRc1c=; b=GlweQz
	JjdFgbqgnM2YRaAN5ErA6fIuURTabWOa24CkwbYjc5tIRsY7dr/j6VhKtIgh/l7L
	4aFrb4PMC1lii+YahXo6k1wGeqb1U9ljT0o05f2PsVHIq7ce3sWleRBCheM+Co94
	rnIbjIijw9UEgrhW8XqFeE8eHKt+6sU7e8zYFoQMul9ymADPeUycXpB0rGt+vbU0
	ng3wm+c1u4Vzu+5zu7D9nHyIoiOFOBCN6CMcIjpOgZFuk+Ce+q4d4AmvnmkR0PR/
	QvymOOG3C7L18XqeSnR0bJQ1jS6hb7lmUcBYvsrgTeeJijAyT9PfYHlNfLd1nCBB
	IEkioe+nOrK7jSlQ==
Received: (qmail 430629 invoked from network); 3 Mar 2026 20:31:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 20:31:33 +0100
X-UD-Smtp-Session: l3s3148p1@N2BFwCNMXpEujnu+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 08/15] hwspinlock: stm32: use new callback to initialize hwspinlock priv
Date: Tue,  3 Mar 2026 20:26:00 +0100
Message-ID: <20260303192600.7224-25-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
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
 drivers/hwspinlock/stm32_hwspinlock.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 51e8e533ac31..02db950c9450 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -48,10 +48,18 @@ static void stm32_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(50);
 }
 
+static void *stm32_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	void __iomem *io_base = init_data;
+
+	return io_base + local_id * sizeof(u32);
+}
+
 static const struct hwspinlock_ops stm32_hwspinlock_ops = {
 	.trylock	= stm32_hwspinlock_trylock,
 	.unlock		= stm32_hwspinlock_unlock,
 	.relax		= stm32_hwspinlock_relax,
+	.init_priv	= stm32_hwspinlock_init_priv,
 };
 
 static void stm32_hwspinlock_disable_clk(void *data)
@@ -73,7 +81,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
-	int i, ret;
+	int ret;
 
 	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
@@ -106,11 +114,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for (i = 0; i < STM32_MUTEX_NUM_LOCKS; i++)
-		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
-
 	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
-					0, STM32_MUTEX_NUM_LOCKS, NULL);
+					0, STM32_MUTEX_NUM_LOCKS, io_base);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
-- 
2.51.0

