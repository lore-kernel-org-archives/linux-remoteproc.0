Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EBE1D7E4A;
	Thu, 14 Aug 2025 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180525; cv=none; b=puCwkPIRvyxqM5Brz1nEW0WUB7SnKTOYe0MERNUnft7IOfCvkrhXK0/rq51ivLcpYrSlSgJeJe66DHToCWM/ECTLF0Uv9Pr5iW/UnO8SWeSEtjkrzasuQXwceSt7FaE7Am1nGm5o6ANubgULmVTXzk29z2ghJHzQovvKijd9k/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180525; c=relaxed/simple;
	bh=4k2FND7o2GW0Ckx7Nfn+0fjNIPReXr053V+wzGGJBk8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QGDuPAqJh6an9cnd23AqoqvnPe9eorK61JpqGM/n3Ed42C5BBM+AbeAU6DgTWWO0ifGYjTkIb6RVuQWDioBQRmWSsB67DkvuvbEom3+fPvKl8RvNPBGCzAb7zSNRxNsd2u5HkIwTRJgHh0BEOaylHLT2bRgphtsghcxtRrQcmAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dKvh5a20; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dKvh5a20"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EE8bhV2319017;
	Thu, 14 Aug 2025 09:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755180517;
	bh=R3YNV+IBO7H54y+b9+nTnyvo2mBN0Ie9atB4iCW9FbI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dKvh5a20NAqEU6VI3NnS8dpAmexjqAMgEptf7G4UqcasO/fbILzt/N4f9lXTn9VE6
	 SlKecGlvHflKX9VV4XqYh/NFv0uxUmnIZLUQX31mxIpfCcsYIhSK2gqlTrmxMlXPsh
	 TiFw2BNjcHrP+AEtWlheQ9KmoByaYb4f5zWY/oqo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EE8bfs1198879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 09:08:37 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 09:08:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 09:08:37 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EE8anf3715732;
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
Subject: [PATCH 2/5] remoteproc: keystone: Use devm_pm_runtime_enable() helper
Date: Thu, 14 Aug 2025 09:08:32 -0500
Message-ID: <20250814140835.651652-2-afd@ti.com>
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

Use device life-cycle managed runtime enable function to simplify probe
and exit paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 6fc27e0d7b3de..558678d793b0d 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -401,12 +401,13 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 		return PTR_ERR(ksproc->reset);
 
 	/* enable clock for accessing DSP internal memories */
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable clock, status = %d\n", ret);
-		goto disable_rpm;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
 
 	ret = keystone_rproc_of_get_memories(pdev, ksproc);
 	if (ret)
@@ -466,8 +467,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	gpiod_put(ksproc->kick_gpio);
 disable_clk:
 	pm_runtime_put_sync(dev);
-disable_rpm:
-	pm_runtime_disable(dev);
 	return ret;
 }
 
@@ -478,7 +477,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 	rproc_del(ksproc->rproc);
 	gpiod_put(ksproc->kick_gpio);
 	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
-- 
2.39.2

