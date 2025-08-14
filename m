Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3221DF994;
	Thu, 14 Aug 2025 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180525; cv=none; b=FuT7/yGYJqsafhwoDymEQFxUev/N9rA0QemrDwBBVKa64otYS0H88A5iuPjmti0DXOXQej4izBG5s92rnBpRYWGAVWIW03RA0VA5/e6B5EhpYGqkUFnfjZ+WCdgN6R7NQmvVVsPYro2WKgk6Dnpi9lGgatI60diwfcshiCSlnkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180525; c=relaxed/simple;
	bh=zsXE8W//sk1bYjhAkNpZ+vj27jHNbIAj/YF1rfF4LGE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtQuPs/KtM0zpkQbW4IVPohLPqCs0V5pTjYzNOCGY7ZfF/oaxpN+I4BNsS5gF7EnEuj4pG+aLaSXQNkK6AA4ue2sHaOpYcGPJYC7LWvIE+pH2nKy5vqNbpfqAxSkEXxURZVyhQBrDP0N9joWgabxOx/53zmPmyuy8CtGikXXS78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eDPQH6o3; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eDPQH6o3"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EE8cjA2395133;
	Thu, 14 Aug 2025 09:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755180518;
	bh=J0EjW3IKA/IXyHa1VjrxkLBWgN5kmB9XOzxA2buNDwA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eDPQH6o3Cr8gBj19rN6lbxZpgYYXe6dtKA4Q7Oyv2McmjK+8xLD9q0omnrkAnMo2q
	 UuiUmCX74BhIobXxs+qzhCHN0/5XocEvxeQ3PnT8tAVNimRXVZ7Pt0nGgPkosGCsh8
	 57a5WDOjkwISuF3P2hI/PG128Px+IHYWcyh7Erdc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EE8cAY887960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 09:08:38 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 09:08:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 09:08:37 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EE8anh3715732;
	Thu, 14 Aug 2025 09:08:37 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 4/5] remoteproc: keystone: Use devm_gpiod_get() helper
Date: Thu, 14 Aug 2025 09:08:34 -0500
Message-ID: <20250814140835.651652-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814140835.651652-1-afd@ti.com>
References: <20250814140835.651652-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use device life-cycle managed GPIO get function to simplify probe
and exit paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 1c7437094c4dc..f2972123ac453 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -431,7 +431,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (ksproc->irq_fault < 0)
 		return ksproc->irq_fault;
 
-	ksproc->kick_gpio = gpiod_get(dev, "kick", GPIOD_ASIS);
+	ksproc->kick_gpio = devm_gpiod_get(dev, "kick", GPIOD_ASIS);
 	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
@@ -448,27 +448,19 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
 	if (ret < 0) {
-		dev_err(dev, "failed to get reset status, status = %d\n", ret);
-		goto release_mem;
+		return dev_err_probe(dev, ret, "failed to get reset status\n");
 	} else if (ret == 0) {
 		WARN(1, "device is not in reset\n");
 		keystone_rproc_dsp_reset(ksproc);
 	}
 
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err(dev, "failed to add register device with remoteproc core, status = %d\n",
-			ret);
-		goto release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register device with remoteproc core\n");
 
 	platform_set_drvdata(pdev, ksproc);
 
 	return 0;
-
-release_mem:
-	gpiod_put(ksproc->kick_gpio);
-	return ret;
 }
 
 static void keystone_rproc_remove(struct platform_device *pdev)
@@ -476,7 +468,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 	struct keystone_rproc *ksproc = platform_get_drvdata(pdev);
 
 	rproc_del(ksproc->rproc);
-	gpiod_put(ksproc->kick_gpio);
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
-- 
2.39.2

