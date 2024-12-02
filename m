Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA170800;
	Mon,  2 Dec 2024 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733174985; cv=none; b=e7noPlgTvcg9rVhDakm/Pmh+2JztfXJPvMpg3xEq0+coXD9qqV/HGFkV0hViVAJzSMPm/iZnTsohtWC0iaBbfQjotVvyGFA7Vm0q3Cz+AkMQ9aYSxu5E1V3A/4jKke9liF+8oxUKVb54EmEDO+R7UplJpT3LvF4/oet7wJmNfNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733174985; c=relaxed/simple;
	bh=lNeZTqXkfqfM9HA3zRXANVYLc3uMzQ9PQBVTYVgCdis=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N+fm4/o6GdaqMmwgC3/fJlzs27r9SAV+ZrXJNjs5xUVsvW69mQfsSHST3pP8FbrC5TccvHg0JB3BJopWVGgdetn9IpX9TehzM7UfkRCX6bhYUP9PIJPAPlyVTf5pb7cfcb4kyd/6TXdjdgj45mwkls5UvACia2PQiPzy7paAcaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=r2Laxahm; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="r2Laxahm"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2LTdDF1536611
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 15:29:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733174979;
	bh=gFYJ62qZ6u4sy+YYowtu8KgzFCONBw4gNh3rfgYNC1k=;
	h=From:To:CC:Subject:Date;
	b=r2Laxahm4GoAQYYKPGDA+81teyesqoasHkZV3yVdOfGZpXfZyEnwSkL4p21O6hGiM
	 NLcOWTAgI/fhROzpz+syrWNxa6VNUjfvu1RIwPwL/PNu/tn+eaBHYIN7t471YPdHBA
	 l4QlN2o0h7TZbGFCdT1XYdc/NQRnHDQmnosBLXrk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2LTdRH023894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 15:29:39 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 15:29:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 15:29:39 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LTcFJ014672;
	Mon, 2 Dec 2024 15:29:38 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 1/3] remoteproc: da8xx: Use devm_rproc_alloc() helper
Date: Mon, 2 Dec 2024 15:29:36 -0600
Message-ID: <20241202212938.219964-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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
 drivers/remoteproc/da8xx_remoteproc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 93031f0867d10..47df21bea5254 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -276,8 +276,8 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
 	}
 
-	rproc = rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
-		sizeof(*drproc));
+	rproc = devm_rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
+				 sizeof(*drproc));
 	if (!rproc) {
 		ret = -ENOMEM;
 		goto free_mem;
@@ -294,7 +294,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
 	if (ret)
-		goto free_rproc;
+		goto free_mem;
 
 	platform_set_drvdata(pdev, rproc);
 
@@ -304,7 +304,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 					rproc);
 	if (ret) {
 		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
-		goto free_rproc;
+		goto free_mem;
 	}
 
 	/*
@@ -314,7 +314,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	 */
 	ret = reset_control_assert(dsp_reset);
 	if (ret)
-		goto free_rproc;
+		goto free_mem;
 
 	drproc->chipsig = chipsig;
 	drproc->bootreg = bootreg;
@@ -325,13 +325,11 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
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
@@ -352,7 +350,6 @@ static void da8xx_rproc_remove(struct platform_device *pdev)
 	disable_irq(drproc->irq);
 
 	rproc_del(rproc);
-	rproc_free(rproc);
 	if (dev->of_node)
 		of_reserved_mem_device_release(dev);
 }
-- 
2.39.2

