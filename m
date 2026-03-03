Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496C338425D
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566313; cv=none; b=kKy6r4Br5eypmad2he8860XHF3AxKR7CylJdhtITVWqKkLL++lDYuj4nznf1ko3J84FGdyf27FTPlBhi/AZ6o6lWsJg1u/I+luTEItCZynFfVdy/ZUqvDF274m1Nb8FxfvbFDD7XWG7GNUmE9Fng2m/nwMKfEcF6TKj2w6wshu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566313; c=relaxed/simple;
	bh=/1cbgksQYnpQdqsuiaDN8CTqGmtGzHh2xs447+54z6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxjX4fzXb/xvs+KOoDl6KoUDPyighSyMly93to7gkyEYBaFNeistP+ZsH7XLPe4huAcICh20G9BPbM8YE7aTwJTQ/ucjJWrBYu5jvqIx3/VTQk1wwiIgXbeR3YvjOxqChA+iwFSxSGe4PtnVZnABR6qAcTZ4JHO+XXuCv9aGGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R+if6qCr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R+if6qCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=BkzS5MMTcRUoTLKVBHcqxBVibx16YDc4gVsxZLobojk=; b=R+if6q
	CrnQuj5/h6Wp3xxa5QgaO7d/8TM00nyMgAUaZ8eth16mBelf4GR9/LTioDwOhGo1
	VaI+bkpg93+3ecthYGheqNak9SlCLTSDh9ZndX39N1alVGkyr+ZLh1g9+uft+sdj
	H2us7u99ZNlWsl9Pqr67TbqZEXx4VzEN809PIAh76LDLUBPiC3f90uvTcBrRP910
	isIwlwC2g42Pmyw8T7+y9/sw57K2R8ttLoBUwq0W+P+ke8STcoGnNyrRVZXIDCKM
	WYE4qgEbtxj4lNo1FfVKJLRstfhTrYG4QV54wCt6COdEotBA3lFOGmHCUZRpnWk0
	P5b1bPwf6FdziPNg==
Received: (qmail 430583 invoked from network); 3 Mar 2026 20:31:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 20:31:32 +0100
X-UD-Smtp-Session: l3s3148p1@HvsqwCNMUpEujnu+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 06/15] hwspinlock: qcom: use new callback to initialize hwspinlock priv
Date: Tue,  3 Mar 2026 20:25:58 +0100
Message-ID: <20260303192600.7224-23-wsa+renesas@sang-engineering.com>
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
Remove superfluous setting of drvdata while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 45 ++++++++++++++++------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 7960a4972eab..73b280988109 100644
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
-					 0, QCOM_MUTEX_NUM_LOCKS, NULL);
+					 0, QCOM_MUTEX_NUM_LOCKS, &init);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
-- 
2.51.0

