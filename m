Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D1813E8AF;
	Mon, 10 Jun 2024 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032651; cv=none; b=P6SqSd2fsFyUrN3oYIM7zwyYWfUXcvWrCqV/9rk+b0TYUecR3cMycuGQUZ86M9NP1u9fJtKGj88Sa+j8/0Z6mB0H+LX42UvEGmJXjYrqqEmwbQ6gST5il2ou5maOEAB7Po4bltML2VOozzSAju//D8MheRde6TR2j7HE/fXXdbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032651; c=relaxed/simple;
	bh=JAyHEY+j18HTYSYl1Aztg6T0nMyvI/Xbze+2yOXq6bQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHq7IeHB0XtUDZ/RpcZWJtNHfascvp0B3/iyTQmt685yuuOvk9s4i1p2ZHcnr4zsjrGhzkvi4eVnTcxNLujZTV03yqduUwbRVE39wj+BJ9it1HOEaTSoooPbPXkQ/QTFOcgXIJfJfYdGbBEHEQAc1b6Hb16USOJa3dsvwZ5kTSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cHpSipvY; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cHpSipvY"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHOZc031194;
	Mon, 10 Jun 2024 10:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718032644;
	bh=UytDmNmxyZC8MU+aqCgHNCsUlOhqj7U+hI6dXupZkKo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cHpSipvYBMjdnsJn7DCQFrE9iK1sO6RP8bBJI35DJpZuYwIYFyFf+v1xMJbsA0/9k
	 ETkc2CJfKkZtIKHTLJikjEWo+NIU3ZTKTQeKqx0O7VDm+D8Eu6TgLjISzFtrrlOnh7
	 sr8qZxvYCHMomreV/2GJfCP0OoPVcOW+hoRg2KHM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AFHOId017909
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 10:17:24 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 10:17:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 10:17:23 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHMqe017714;
	Mon, 10 Jun 2024 10:17:23 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 4/6] remoteproc: da8xx: Use devm_rproc_alloc() helper
Date: Mon, 10 Jun 2024 10:17:19 -0500
Message-ID: <20240610151721.189472-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610151721.189472-1-afd@ti.com>
References: <20240610151721.189472-1-afd@ti.com>
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
 drivers/remoteproc/da8xx_remoteproc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 9041a0e07fb25..c8b7576937733 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -295,8 +295,8 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 		}
 	}
 
-	rproc = rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
-		sizeof(*drproc));
+	rproc = devm_rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
+				 sizeof(*drproc));
 	if (!rproc) {
 		ret = -ENOMEM;
 		goto free_mem;
@@ -313,7 +313,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
 	if (ret)
-		goto free_rproc;
+		goto free_mem;
 
 	platform_set_drvdata(pdev, rproc);
 
@@ -323,7 +323,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 					rproc);
 	if (ret) {
 		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
-		goto free_rproc;
+		goto free_mem;
 	}
 
 	/*
@@ -333,7 +333,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	 */
 	ret = reset_control_assert(dsp_reset);
 	if (ret)
-		goto free_rproc;
+		goto free_mem;
 
 	drproc->chipsig = chipsig;
 	drproc->bootreg = bootreg;
@@ -344,13 +344,11 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed: %d\n", ret);
-		goto free_rproc;
+		goto free_mem;
 	}
 
 	return 0;
 
-free_rproc:
-	rproc_free(rproc);
 free_mem:
 	if (dev->of_node)
 		of_reserved_mem_device_release(dev);
@@ -371,7 +369,6 @@ static void da8xx_rproc_remove(struct platform_device *pdev)
 	disable_irq(drproc->irq);
 
 	rproc_del(rproc);
-	rproc_free(rproc);
 	if (dev->of_node)
 		of_reserved_mem_device_release(dev);
 }
-- 
2.39.2

