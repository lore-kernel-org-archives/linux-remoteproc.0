Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06C1AE05A;
	Fri,  2 Aug 2024 18:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622994; cv=none; b=aTkY/Hcnut8xQ2hbE7zH0x3XwjudhHIKCRPec0LxQi20QDg6tzsaTqtaBWDi0vNCnYmpI68xDc4zqvhCQZQP23IcyqP9Fl1AVmu59MnW/RO6fciLkz8vLoTBZ+ixkR2m16VL1P0Ue9PJTr3/w6iuGJTuTDsc4bMx++BzwmzL0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622994; c=relaxed/simple;
	bh=rJgAl2O0ZJO8rgCPEVw0NiLl953Q04lQpcEyBNjYPy0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COcNKIe2dW8ihcbfKrT+fzwMejrYYpqMTEzKHMSdx7nqyai55mCQ0N+YSy6K5B2PDr0ABwQk6xH99cPRT7y20BqtnAV4/znaLoq5A9d4EVaxCbnWQRSHCwhb1ZglpQXZM7scThk6gUc8WhBhMKn/gKCXUwbR3J9nWm7soMSFc9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pCuVmrDp; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pCuVmrDp"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472IN3gv091693;
	Fri, 2 Aug 2024 13:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722622983;
	bh=D05ogUP7M3NPmfc18cqNc7y1c0EOJJTWkiJt31qgICE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pCuVmrDpyhHkx0Csty94/qIB79/4dVAT1wmwas05G02d5Vaipmj9L5OjRxHGfuv5+
	 SH2MDFLoaQon5z/QqsziFJMCuT1bDILbeLUo3Rfm10rGSmH1sLNssxPTJ/zUkBRAxN
	 gdVhGIjFmmVcDNKEypF63UWRMQ6tLPRfEfLoyLVo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472IN3fK071359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 13:23:03 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 13:23:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 13:23:02 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472IN0BU039524;
	Fri, 2 Aug 2024 13:23:02 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 5/7] remoteproc: keystone: Use devm action to call PM runtime put sync
Date: Fri, 2 Aug 2024 13:22:58 -0500
Message-ID: <20240802182300.244055-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802182300.244055-1-afd@ti.com>
References: <20240802182300.244055-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

This helps prevent mistakes like putting out of order in cleanup functions
and forgetting to put sync on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 34 ++++++++++++------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index f457cadc1fae0..e65f99b1bf379 100644
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

