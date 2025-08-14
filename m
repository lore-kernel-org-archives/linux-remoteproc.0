Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074162FFDF8;
	Thu, 14 Aug 2025 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179741; cv=none; b=pyqNTLi7Ukq7fXOyoxlAfu1m4n79EIDxstiBXbd6qoe26sco1Wevy+8Rq+zO7YzxKuzhKftJrJXTS3aBQTkwmFFn1tUjyc0ezeN2d37UFAJygZQOVLzbZAXVEXBKkywALgNQgEMEQ3CRrk4WLTpzSS7CbG+VRD+0psBLUsHc50g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179741; c=relaxed/simple;
	bh=lNeZTqXkfqfM9HA3zRXANVYLc3uMzQ9PQBVTYVgCdis=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y6ERf6spishXoUJhId9gi8Mn937f3+0kdjACNaX8/rd/6Khlkqk6g/3xiAZ0tILfg90Xhepk7SLcA0AIsKQjD9Zb4Rj9gRjTW0vcdo4dlCEyiJQNtYehZ5xtbJmw/wV1YNRl34jBn4PQLNKuCEaCC2KsyCg0F7MrMV4uAd/B1k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BtkcfJ3P; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BtkcfJ3P"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EDtYoG1891693;
	Thu, 14 Aug 2025 08:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755179734;
	bh=gFYJ62qZ6u4sy+YYowtu8KgzFCONBw4gNh3rfgYNC1k=;
	h=From:To:CC:Subject:Date;
	b=BtkcfJ3P7pecduvN6FoAOm26vAX+9SbZ1NWwC9SGvNO0IXznLZrAtKolQSMBCTj7Z
	 FT64EHH7Z82ziM4PGMtudFUEzNct8UrA5YJVk0a02+eo9y6Yd+smNE1HEqbe+jaycL
	 sS3mvOnWAxwWF9xY0qIrMc9f/4dl3zzTsykiKqdU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EDtYq3879338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 08:55:34 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 08:55:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 08:55:33 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EDtX4C4004753;
	Thu, 14 Aug 2025 08:55:33 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 1/3] remoteproc: da8xx: Use devm_rproc_alloc() helper
Date: Thu, 14 Aug 2025 08:55:30 -0500
Message-ID: <20250814135532.638040-1-afd@ti.com>
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

