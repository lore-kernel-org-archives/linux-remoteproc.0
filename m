Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B513D8B6
	for <linux-remoteproc@vger.kernel.org>; Sat,  3 Aug 2024 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722665695; cv=none; b=bfAtn1lz3vynMzMVrMrsXT5OKXReh6JUXbqO8JFWdbUyuUAx9gDu1FUxcfJOnlaiys0WrlRjwvsv1d8bBiGO9r9h0KpLdf7Ue/vqaGQEjk5kraAKwNWi1+K8HSn/kr0mIxz/sE8ovna6yantJLfnW1vwwuE/1ey3GjR6xpfYN1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722665695; c=relaxed/simple;
	bh=eW+DUt+e9wF9uB0sTe3VDHN6cI3P0dPyibjjUWpL4l0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n0EmoYKXlu8GEQInWmM7jEtdziT3PHpuitGAxMP+CB7c3DAv8YQlZ+U7WDjqRkwHERbTYObynQyGcS9BLnx+uLxohT8DO/5KZZhFCqtM3isOZXpVDnW87odaNg+1oYH4Ek1apa38HKVJLUPMwpoupqPKp6xBOgq9c962Ry1nUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WbXTx3mkxzxWBj;
	Sat,  3 Aug 2024 14:14:29 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id C9ABD18007C;
	Sat,  3 Aug 2024 14:14:44 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 3 Aug 2024 14:14:44 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <andersson@kernel.org>, <baolin.wang@linux.alibaba.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<cuigaosheng1@huawei.com>
CC: <linux-remoteproc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] hwspinlock: stm32: Add missing clk_disable_unprepare in stm32_hwspinlock_probe
Date: Sat, 3 Aug 2024 14:14:43 +0800
Message-ID: <20240803061443.287117-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)

Add the missing clk_disable_unprepare() before return in
stm32_hwspinlock_probe().

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index bb5c7e5f7a80..a4e3b9a9e29d 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -103,6 +103,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	ret = devm_add_action_or_reset(dev, stm32_hwspinlock_disable_clk, pdev);
 	if (ret) {
 		dev_err(dev, "Failed to register action\n");
+		clk_disable_unprepare(hw->clk);
 		return ret;
 	}
 
@@ -112,8 +113,10 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
 					0, STM32_MUTEX_NUM_LOCKS);
 
-	if (ret)
+	if (ret) {
 		dev_err(dev, "Failed to register hwspinlock\n");
+		clk_disable_unprepare(hw->clk);
+	}
 
 	return ret;
 }
-- 
2.25.1

