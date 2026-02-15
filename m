Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31393043B2
	for <linux-remoteproc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196128; cv=none; b=I4bDfXuVdFA7rybT0r3C+5WSXuI5dikQ5TuaJFIRuFXPDI/6Y+7fUpgmUX1mu9XNgOiMdD8YU4UOjf9+9TM81UvYls2Y/DpEzkLKtllvB2vwHpozDVMEdGQBtfin+ZEDyCqU/NS5ejJo6tw9mcw8g/8tPtQdtUgId1DxH3l1Nsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196128; c=relaxed/simple;
	bh=VukyizN5s8Xg6BMLWVsVk0nzABJr4WcCejfQG89ONY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4VLgi0Cd3NVQCLYoS5faKfclhjX+AtHFIm1Lu3ZQDiGpy/RaO6g9gCJw5u6umush6rz26DuUuGLoOCyXcMVnoFoPZp9coVPcspNgDsEXJnnLkJfDpHkvsZ0z3JLHM27/qGlrvfrNs7+nATRSFITAR2kJiqzxpxgsC/sU6wVLZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C7JCQ9xI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C7JCQ9xI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0Mnv5asIBgC16zhxO0+XRgGoOGoi/I6OSdCNLF9zGEg=; b=C7JCQ9
	xIFW2wc3Y10PJ5E7MEYeu4mHIB8vW5LmsPMOaLIMCjrsfZI/OKwH7H+ieKF37W+t
	ZbSxEccxuWlkuT176kNsGBtUle3s7yGihWOs+gO13w1Wcd42FeXpSf3iA0oBhz6p
	3sAvaxt0fIF2mao8thJHgokDRqbZtE+Mvy/0SRBNw513XM/7XJ3JJ/Dp4pgdFwUi
	TnP0v8EmzQiUzyqGbSRiwzEONJYkbAyz3u9CuaHiFh9T5kqbg/XjVmdE8Pou3NjL
	rEWd4cpI7Si9c59mTIhZlYwaVxBIOrvR4/zrB6SKWv9S6/SB3gzy7VdEdlP3YV1B
	H30t+FfC+OcHVuwA==
Received: (qmail 3011446 invoked from network); 15 Feb 2026 23:55:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:11 +0100
X-UD-Smtp-Session: l3s3148p1@EaEGu+RK1sAujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH v2 06/13] hwspinlock: stm32: use new callback to initialize hwspinlock priv
Date: Sun, 15 Feb 2026 23:54:46 +0100
Message-ID: <20260215225501.6365-7-wsa+renesas@sang-engineering.com>
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
 drivers/hwspinlock/stm32_hwspinlock.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 1d75dc03f4ad..02db950c9450 100644
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
-					0, STM32_MUTEX_NUM_LOCKS);
+					0, STM32_MUTEX_NUM_LOCKS, io_base);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
-- 
2.51.0

