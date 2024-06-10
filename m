Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E18152181;
	Mon, 10 Jun 2024 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032651; cv=none; b=sP0TGYD7Uf4v4g9DW0KP8yGhXqrDn5BOb4nzXQsUBT0kiL4mK2V60iyf3OYIRVJF7ngfPppQXgqmMvQemqdw4O4TKjpq8rRUAKni0R953Zu30D+c4D7zda62YhTBgpyRRQi9gT3vaNJNN9uE+4MB6LZXN9GkyEeOD7CzS1l0Ew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032651; c=relaxed/simple;
	bh=sOaNco+FLqlWFQZwJKUYmJayImHQHMM0GUxThvmlJUs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nUBktXT3RUjHj4eK5gwWRlPOnqskjYz4vI8V8mk6+cE2tI4CofWFFXrOZLc9QZURKvgsX7AnCU4zC3OQl7YbDkxWFojpu7KA4SCxWH1DOGMHZ4qMFTEjREMeR7me18jEkGtAtd5kjGKy6MfTzqY/+NhDmdecwgeNk1XuApBmfyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OiWlFA5D; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OiWlFA5D"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHN1V015717;
	Mon, 10 Jun 2024 10:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718032643;
	bh=eEAzozxKjD70xYuPAE4Mv+i/JZ3PrMZUw5jNNClYHAA=;
	h=From:To:CC:Subject:Date;
	b=OiWlFA5DsDXCAcwtaFMZtJMOljmffZ9i9sGbcjhXABKl3nIm5z3zbTqRedfSqLmib
	 eZRropmiqvuqv4eFrOmY5Yn1ruk30LZx6cQUAEwwWxoKbaqpOjP92B1uekPY/N/Z1V
	 EyDWGgfKAzzNUmZl8i2GaG1HxFPmfeWUu4TjCfzQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AFHNBj031333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 10:17:23 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 10:17:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 10:17:23 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHMqb017714;
	Mon, 10 Jun 2024 10:17:22 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 1/6] remoteproc: omap: Use devm_rproc_alloc() helper
Date: Mon, 10 Jun 2024 10:17:16 -0500
Message-ID: <20240610151721.189472-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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
 drivers/remoteproc/omap_remoteproc.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 8f50ab80e56f4..e91e016583802 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1305,8 +1305,8 @@ static int omap_rproc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	rproc = rproc_alloc(&pdev->dev, dev_name(&pdev->dev), &omap_rproc_ops,
-			    firmware, sizeof(*oproc));
+	rproc = devm_rproc_alloc(&pdev->dev, dev_name(&pdev->dev), &omap_rproc_ops,
+				 firmware, sizeof(*oproc));
 	if (!rproc)
 		return -ENOMEM;
 
@@ -1318,15 +1318,15 @@ static int omap_rproc_probe(struct platform_device *pdev)
 
 	ret = omap_rproc_of_get_internal_memories(pdev, rproc);
 	if (ret)
-		goto free_rproc;
+		return ret;
 
 	ret = omap_rproc_get_boot_data(pdev, rproc);
 	if (ret)
-		goto free_rproc;
+		return ret;
 
 	ret = omap_rproc_of_get_timers(pdev, rproc);
 	if (ret)
-		goto free_rproc;
+		return ret;
 
 	init_completion(&oproc->pm_comp);
 	oproc->autosuspend_delay = DEFAULT_AUTOSUSPEND_DELAY;
@@ -1337,10 +1337,8 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(&pdev->dev, oproc->autosuspend_delay);
 
 	oproc->fck = devm_clk_get(&pdev->dev, 0);
-	if (IS_ERR(oproc->fck)) {
-		ret = PTR_ERR(oproc->fck);
-		goto free_rproc;
-	}
+	if (IS_ERR(oproc->fck))
+		return PTR_ERR(oproc->fck);
 
 	ret = of_reserved_mem_device_init(&pdev->dev);
 	if (ret) {
@@ -1359,8 +1357,7 @@ static int omap_rproc_probe(struct platform_device *pdev)
 
 release_mem:
 	of_reserved_mem_device_release(&pdev->dev);
-free_rproc:
-	rproc_free(rproc);
+
 	return ret;
 }
 
@@ -1369,7 +1366,6 @@ static void omap_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_del(rproc);
-	rproc_free(rproc);
 	of_reserved_mem_device_release(&pdev->dev);
 }
 
-- 
2.39.2

