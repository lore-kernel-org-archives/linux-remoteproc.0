Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DA41DF736;
	Mon,  2 Dec 2024 22:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177954; cv=none; b=P3fAbJo9W2wXERDvWHpdXqFjFaUemTqRNOAYscC/43mP5sqSEOzP42HYdsVzVdef249DFgwvHJJY8KVsZHlg9qSSfcljDu32A7uggRpBzpzA814mpeD71HCJVfU9HXXajsYXUazF2RlfTlSN65BQenSANFWu/U6OT5pO+ftquLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177954; c=relaxed/simple;
	bh=xfVBfiWfnPdfbo7oL4bmU8o7tWGrbWTr6ffKKL+/KC8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpF6vEM84PmvwIs7XrcQftrTQJDTVkw9VXM2FqTOSiUm83CvbDcbPqFVm8dkYOGQA/Eo5Mg4pj4BlucfurRjpjXS6/X13PgkgAauGxRSIeqlsesj6adoXHAV+QdXY+uAtcc2vLNJ6aYjLtayymZBaFoXjiNf+b0GpTVbhm3DB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=T/pC7r0y; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T/pC7r0y"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MJ6fb1541635
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 16:19:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733177946;
	bh=/LsO65kz1SCEM0N55F/Nhheb7zuetzWFF4u+9VmIrbo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T/pC7r0yTZKhjCaZ8ob05dKUTf8wE60N5LdUfNjzlsyoI0EM646Bf4CH5N4dvNvV4
	 eHLiBO9iZbVdKnj+mc9idJ0q958dbPYJ/9zjaga0EReLt+YuahiLrQHEP3oqRhiQrQ
	 URJKXMeiBRCL15Z7ffW3Tj9j4O+KkmjQuaaeWRe4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MJ6pp059136
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 16:19:06 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 16:19:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 16:19:06 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2MJ5Uu068468;
	Mon, 2 Dec 2024 16:19:06 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 3/4] remoteproc: wkup_m3: Use devm_rproc_alloc() helper
Date: Mon, 2 Dec 2024 16:19:03 -0600
Message-ID: <20241202221904.319149-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202221904.319149-1-afd@ti.com>
References: <20241202221904.319149-1-afd@ti.com>
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

