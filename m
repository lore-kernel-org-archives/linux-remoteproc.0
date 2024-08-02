Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17741A83DC;
	Fri,  2 Aug 2024 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622999; cv=none; b=kgijWyPGaB/RP1p5gNdMkEUR/Jkh1QbYvcwlv0EQnIWDQWIZlPMu1DLEv8lWleOj1nRaKegEhn7RpH6AQQmtU+vthtkIHSqNf4WDWMxlXUwc21pOFMov6PbZr3ALJZJANQqG+oMc3ms583v55mGrHVnOrGJHRG1a2HitUtngf2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622999; c=relaxed/simple;
	bh=ADsp1gcUXs+epZoFjGKNfe+dK2qep7UY7Cac/z7UTNs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VM/kSFgMer/Ke3V+ZkFJ41HZD9ev2Vxx9+o3tXzBHheXXRzF0qgFS35OyQqrUqagGk90fq/iHNt8AhFCPM6Vw1lM/yltKPpdkejUkXvRKctqco59OsgPSrQ0zfVUyVw6YhPGSq8ibye9TJKrnfFij1vIOU8scR/bFCJLHvFuf68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cd+WFdRn; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cd+WFdRn"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472IN22f082436;
	Fri, 2 Aug 2024 13:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722622982;
	bh=O86ORrK+0y3u81QYelnOZffrcXvpfH/Knc6HX3fOFCs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cd+WFdRnfosezt54GJVRnhjrMiyVQ+2P7sZkMOL3CUAEOdctKV73/jlYwfjB8bxaX
	 LWAHwXvyH8EXzJfEx2FF9Wt0lmB61bqQnWYlySvAbYpNXQJykzj2iPvSXaWI6oygDy
	 JPx4K0WZMOjL0qegTf21lheZOLgAP+mbGVTW7tss=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472IN15J071286
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 13:23:02 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 13:23:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 13:23:01 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472IN0BR039524;
	Fri, 2 Aug 2024 13:23:01 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 2/7] remoteproc: keystone: Use devm_rproc_alloc() helper
Date: Fri, 2 Aug 2024 13:22:55 -0500
Message-ID: <20240802182300.244055-2-afd@ti.com>
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

Use the device lifecycle managed allocation function. This helps prevent
mistakes like freeing out of order in cleanup functions and forgetting to
free on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 81b179e269a1e..8f0f7a4cfef26 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -384,8 +384,8 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (!fw_name)
 		return -ENOMEM;
 
-	rproc = rproc_alloc(dev, dev_name(dev), &keystone_rproc_ops, fw_name,
-			    sizeof(*ksproc));
+	rproc = devm_rproc_alloc(dev, dev_name(dev), &keystone_rproc_ops,
+				 fw_name, sizeof(*ksproc));
 	if (!rproc)
 		return -ENOMEM;
 
@@ -396,13 +396,11 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 
 	ret = keystone_rproc_of_get_dev_syscon(pdev, ksproc);
 	if (ret)
-		goto free_rproc;
+		return ret;
 
 	ksproc->reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(ksproc->reset)) {
-		ret = PTR_ERR(ksproc->reset);
-		goto free_rproc;
-	}
+	if (IS_ERR(ksproc->reset))
+		return PTR_ERR(ksproc->reset);
 
 	/* enable clock for accessing DSP internal memories */
 	pm_runtime_enable(dev);
@@ -467,8 +465,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(dev);
 disable_rpm:
 	pm_runtime_disable(dev);
-free_rproc:
-	rproc_free(rproc);
 	return ret;
 }
 
@@ -480,7 +476,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 	gpiod_put(ksproc->kick_gpio);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	rproc_free(ksproc->rproc);
 	of_reserved_mem_device_release(&pdev->dev);
 }
 
-- 
2.39.2

