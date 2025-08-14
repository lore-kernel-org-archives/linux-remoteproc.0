Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5A822FF22;
	Thu, 14 Aug 2025 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755185989; cv=none; b=CzTgCRa/XJBi9kkxHKbFvUjNCfGNWecnPpBgyFyscGBRo5XfxLEh4ZmYbCfj2Zec45VJXxCbjUvGM21s5RIZKDxM876ZkbTFnGvOUfx9yyUwsjM4zJsuqYdUrb3L0rmUi+p5u1ss40OELH+WbS9l7F0v+cZaq5dYcN9M/cAug6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755185989; c=relaxed/simple;
	bh=xfVBfiWfnPdfbo7oL4bmU8o7tWGrbWTr6ffKKL+/KC8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hH8DK1++KyLgHLaqDBjdiSyBX9wZbq9cYRdUDfQ7yS9qaPcAvFdNAOesPb4yqG4yUtA087F9aaXuquNWY59m3DXW8+qzc7tvuBpQ+nvsO3MALqAY3OkXwdOtYLj+UEi9VQvQX7kUZgg5F4j7XaQIBZSMYmlfaCVkOeCAiAmQCKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=w/E7cqa0; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w/E7cqa0"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EFdhSA2415810;
	Thu, 14 Aug 2025 10:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755185983;
	bh=/LsO65kz1SCEM0N55F/Nhheb7zuetzWFF4u+9VmIrbo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=w/E7cqa0akq+In8QVOTh0nTtzkDTP+SMaFl6I4xUj1pvLFQbxGXSWE3HNo263si0u
	 wTTKLVzPfRy1GMOiIE21FO1d4ohc23nPtceMvF/MQNKk54BiXct+fHum4g/rWtaJ9F
	 MrJWJAmIL6Vj0jbTenYlNH4zQBK88rC0mNyji3gY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EFdhml1807103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 10:39:43 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 10:39:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 10:39:42 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EFdfKg3826763;
	Thu, 14 Aug 2025 10:39:42 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 3/4] remoteproc: wkup_m3: Use devm_rproc_alloc() helper
Date: Thu, 14 Aug 2025 10:39:39 -0500
Message-ID: <20250814153940.670564-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814153940.670564-1-afd@ti.com>
References: <20250814153940.670564-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use the device lifecycle managed allocation function. This helps prevent
mistakes like freeing out of order in cleanup functions and forgetting to
free on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/wkup_m3_rproc.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 2569f041d9cab..30e9ecd75657f 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -165,8 +165,8 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add disable pm devm action\n");
 
-	rproc = rproc_alloc(dev, "wkup_m3", &wkup_m3_rproc_ops,
-			    fw_name, sizeof(*wkupm3));
+	rproc = devm_rproc_alloc(dev, "wkup_m3", &wkup_m3_rproc_ops,
+				 fw_name, sizeof(*wkupm3));
 	if (!rproc)
 		return -ENOMEM;
 
@@ -183,9 +183,7 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	if (!wkupm3->rsts) {
 		if (!(pdata && pdata->deassert_reset && pdata->assert_reset &&
 		      pdata->reset_name)) {
-			dev_err(dev, "Platform data missing!\n");
-			ret = -ENODEV;
-			goto err_put_rproc;
+			return dev_err_probe(dev, -ENODEV, "Platform data missing!\n");
 		}
 	}
 
@@ -193,12 +191,9 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						   mem_names[i]);
 		wkupm3->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
-		if (IS_ERR(wkupm3->mem[i].cpu_addr)) {
-			dev_err(&pdev->dev, "devm_ioremap_resource failed for resource %d\n",
-				i);
-			ret = PTR_ERR(wkupm3->mem[i].cpu_addr);
-			goto err_put_rproc;
-		}
+		if (IS_ERR(wkupm3->mem[i].cpu_addr))
+			return dev_err_probe(dev, PTR_ERR(wkupm3->mem[i].cpu_addr),
+					     "devm_ioremap_resource failed for resource %d\n", i);
 		wkupm3->mem[i].bus_addr = res->start;
 		wkupm3->mem[i].size = resource_size(res);
 		addrp = of_get_address(dev->of_node, i, &size, NULL);
@@ -216,16 +211,10 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, rproc);
 
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err(dev, "rproc_add failed\n");
-		goto err_put_rproc;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	return 0;
-
-err_put_rproc:
-	rproc_free(rproc);
-	return ret;
 }
 
 static void wkup_m3_rproc_remove(struct platform_device *pdev)
@@ -233,7 +222,6 @@ static void wkup_m3_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_del(rproc);
-	rproc_free(rproc);
 }
 
 #ifdef CONFIG_PM
-- 
2.39.2

