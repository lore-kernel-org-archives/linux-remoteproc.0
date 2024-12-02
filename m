Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DD1DF74A;
	Mon,  2 Dec 2024 21:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733176305; cv=none; b=mSOKpV2Vcr8Vy9sEh9piXZH4nCi2LdBUc32GsIo7dJJS6oK0obpgSJKZ0Df5nQdk9iCnjeeex6y053Tei4uZjTBKl/6MJcSSvmYL6ebJdc2pm9//TjF/c8oGXhs0sFggszMBxhMiqQYrWHWN4ENmFi35oDcnyZJQHA75eLErtqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733176305; c=relaxed/simple;
	bh=xmVgz577XM7Jxim8cfCOfoYkpW5zmcQrRmdZjr2y5Do=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sRRWS90cpLQrv8XguzZ6t5jgS4G7hkziB2S1QiHus61x4pPhFGev2HP/7k60CGdUX90W2EPzxuIq3HRPCvBrIO1Ot4Futxp1Agvzl4Fzom6k9rWjecNJ3/skms7Wxqprw7sPFysvq5ael7+8OdUdjr4atz7JdksXJ14zyWBs5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G3Pw2J1T; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G3Pw2J1T"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LpbbN102316;
	Mon, 2 Dec 2024 15:51:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733176297;
	bh=bo7/Jkdt0VQZhJV3SJuxRxPMUAMd+zjH0yU88G/NtKM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=G3Pw2J1TAjy9vM+1JDLTolnkHcCrbh8Y7K0tWhtXrrkjkqu0HlnwsoiW9zUAQf2gV
	 BZtCFCrrftiHf2tb9OaJYStmKBRQeYVbWRz0ewMxjZ9pT8lBfLlj9mG7RMM17hb293
	 wWoNhgQUmbIY1IV9suJJajF5Xi/drABI4B2UGP8Y=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LpbYg009053;
	Mon, 2 Dec 2024 15:51:37 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 15:51:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 15:51:37 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LparL039277;
	Mon, 2 Dec 2024 15:51:37 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 3/5] remoteproc: keystone: Use devm action to call PM runtime put sync
Date: Mon, 2 Dec 2024 15:51:33 -0600
Message-ID: <20241202215135.294829-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202215135.294829-1-afd@ti.com>
References: <20241202215135.294829-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This helps prevent mistakes like putting out of order in cleanup functions
and forgetting to put sync on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 36 ++++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 2af3b64bc239c..1032f440426da 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -365,6 +365,13 @@ static void keystone_rproc_mem_release(void *data)
 	of_reserved_mem_device_release(dev);
 }
 
+static void keystone_rproc_pm_runtime_put(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put_sync(dev);
+}
+
 static int keystone_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -417,30 +424,26 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to enable clock\n");
+	ret = devm_add_action_or_reset(dev, keystone_rproc_pm_runtime_put, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add disable pm devm action\n");
 
 	ret = keystone_rproc_of_get_memories(pdev, ksproc);
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ksproc->irq_ring = platform_get_irq_byname(pdev, "vring");
-	if (ksproc->irq_ring < 0) {
-		ret = ksproc->irq_ring;
-		goto disable_clk;
-	}
+	if (ksproc->irq_ring < 0)
+		return ksproc->irq_ring;
 
 	ksproc->irq_fault = platform_get_irq_byname(pdev, "exception");
-	if (ksproc->irq_fault < 0) {
-		ret = ksproc->irq_fault;
-		goto disable_clk;
-	}
+	if (ksproc->irq_fault < 0)
+		return ksproc->irq_fault;
 
 	ksproc->kick_gpio = gpiod_get(dev, "kick", GPIOD_ASIS);
 	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
-	if (ret) {
-		dev_err(dev, "failed to get gpio for virtio kicks, status = %d\n",
-			ret);
-		goto disable_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
 
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
@@ -448,7 +451,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	} else {
 		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
 		if (ret)
-			goto disable_clk;
+			return ret;
 	}
 
 	/* ensure the DSP is in reset before loading firmware */
@@ -474,8 +477,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 
 release_mem:
 	gpiod_put(ksproc->kick_gpio);
-disable_clk:
-	pm_runtime_put_sync(dev);
 	return ret;
 }
 
@@ -485,7 +486,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 
 	rproc_del(ksproc->rproc);
 	gpiod_put(ksproc->kick_gpio);
-	pm_runtime_put_sync(&pdev->dev);
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
-- 
2.39.2

