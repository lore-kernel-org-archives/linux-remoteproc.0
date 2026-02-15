Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB923370F
	for <linux-remoteproc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196125; cv=none; b=tGtVHGFWo8m0TKjqNL7FKMOTSvNXJKz+eP3moGJVeItONTWqEvOm0of68cOcQA+QQQYCPjenRTf8Wk7+ERydR9GWOjZ318FaAdFrAZNOtiIVgzQ9lj0E3zKDtzs6V+/WA70kMHVzHbOqnhWScFI/RTdQCtLCasymVEQvBEO33Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196125; c=relaxed/simple;
	bh=DuOERFsBgQ+aHKjVuk0X+m/mW0ONbIAqg889aAbveTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ad2BqjNq8xuJPCa+iKqJ0hl+qCdwCwINzCKuf57l96tFppyAnbNSRC/a+bAiSBS0tQ5pmDDeRTHyNQD3iGQmTbdub/oTf3zN3oESfhs2fb8OrNl4MiQlJ0NNcPawyiKRt+SWy6w+hTLN/Jy9JoQU40F+i165Sh/xn0wOs8N+mJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jiHHIM0g; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jiHHIM0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SDAWD+zXkHF7Q8/oCAKsBHT7FMcHCuAatg0ikwgt6m8=; b=jiHHIM
	0g2VazD677OIuKJnrkDs9QTq075LxIUEGl7auRt5XCEkbLh7pCGYGQkjCWO/cI2I
	/9x8BZJU1UCOEDZHM7hxHxvnSV/f0F/01uPhq2C0jY/RFuyNKPzaiyyBD7sht3BT
	6k8jTfPQVozUmN+W8AWeLKBStxGcLF6muxeUi6cLELGQqeWJHjkmKwQK68evPqO0
	ps3xTEXQ6cc7ETtsO3cIX0RGNWHkE/SbUrixKZQGLHaXoFDJnZcrnGV4im6235pc
	WuAiRpiUlTAiCGTSCOGuFDzxp7a2rHvwok3kh18fuHMg7q7rglZ6Xjr3AQuFEhux
	Eh/7AfYm4s9gJkyA==
Received: (qmail 3011406 invoked from network); 15 Feb 2026 23:55:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:09 +0100
X-UD-Smtp-Session: l3s3148p1@SF/juuRKeoQujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 04/13] hwspinlock: qcom: use new callback to initialize hwspinlock priv
Date: Sun, 15 Feb 2026 23:54:44 +0100
Message-ID: <20260215225501.6365-5-wsa+renesas@sang-engineering.com>
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
Remove superfluous setting of drvdata while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 45 ++++++++++++++++------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 7ff89c3e8c6b..73b280988109 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -25,6 +25,13 @@ struct qcom_hwspinlock_of_data {
 	const struct regmap_config *regmap_config;
 };
 
+struct qcom_hwspinlock_priv_init_data {
+	struct device *dev;
+	struct regmap *regmap;
+	u32 base;
+	u32 stride;
+};
+
 static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 {
 	struct regmap_field *field = hwspin_lock_get_priv(lock);
@@ -89,10 +96,23 @@ static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 	return 0;
 }
 
+static void *qcom_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	struct qcom_hwspinlock_priv_init_data *init = init_data;
+	struct reg_field field;
+
+	field.reg = init->base + local_id * init->stride;
+	field.lsb = 0;
+	field.msb = 31;
+
+	return devm_regmap_field_alloc(init->dev, init->regmap, field);
+}
+
 static const struct hwspinlock_ops qcom_hwspinlock_ops = {
 	.trylock	= qcom_hwspinlock_trylock,
 	.unlock		= qcom_hwspinlock_unlock,
 	.bust		= qcom_hwspinlock_bust,
+	.init_priv	= qcom_hwspinlock_init_priv,
 };
 
 static const struct regmap_config sfpb_mutex_config = {
@@ -202,17 +222,14 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 
 static int qcom_hwspinlock_probe(struct platform_device *pdev)
 {
+	struct qcom_hwspinlock_priv_init_data init;
 	struct hwspinlock_device *bank;
-	struct reg_field field;
 	struct regmap *regmap;
 	size_t array_size;
-	u32 stride;
-	u32 base;
-	int i;
 
-	regmap = qcom_hwspinlock_probe_syscon(pdev, &base, &stride);
+	regmap = qcom_hwspinlock_probe_syscon(pdev, &init.base, &init.stride);
 	if (IS_ERR(regmap) && PTR_ERR(regmap) == -ENODEV)
-		regmap = qcom_hwspinlock_probe_mmio(pdev, &base, &stride);
+		regmap = qcom_hwspinlock_probe_mmio(pdev, &init.base, &init.stride);
 
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
@@ -222,21 +239,11 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 	if (!bank)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, bank);
-
-	for (i = 0; i < QCOM_MUTEX_NUM_LOCKS; i++) {
-		field.reg = base + i * stride;
-		field.lsb = 0;
-		field.msb = 31;
-
-		bank->lock[i].priv = devm_regmap_field_alloc(&pdev->dev,
-							     regmap, field);
-		if (IS_ERR(bank->lock[i].priv))
-			return PTR_ERR(bank->lock[i].priv);
-	}
+	init.dev = &pdev->dev;
+	init.regmap = regmap;
 
 	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
-					 0, QCOM_MUTEX_NUM_LOCKS);
+					 0, QCOM_MUTEX_NUM_LOCKS, &init);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
-- 
2.51.0

