Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714F715219B;
	Mon, 10 Jun 2024 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032651; cv=none; b=S7+M/NHxEYYFsNAGWrQB8tbEuP0LIbbbZXiz8T4EowQuodJvWTcxpbxXfDB7QspqnUw/Xn5yPx30SXz/skGZVxinMC4szkRMBvadH8MIRmFn1gXYo6vredRrtGczfo+f534F9zP6rFIV5bWAMEYszA4Z+2b5v2XkDJXf5k0ObAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032651; c=relaxed/simple;
	bh=ZnwOh+9SPYsIoCA0Yw7ACXIruoaK3rUWGSzsDVyR7ag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ckoWLJFZqsbiBGRhaMdssdt3Es+KWIn21Kz7MhRFnT2zNJYE6s+oJ4yjYe4UMPflZwSItfqolqD43pAY2FK5xHJ20fhzgwQ3E/gQBarn8RqMBJbEcdCrkasV3mteI7ib/nwmszfMFeoJDgBG0CeFDNYbam/OcweAPJuQv6ArYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LWCto1tM; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LWCto1tM"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHOXj031236;
	Mon, 10 Jun 2024 10:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718032644;
	bh=zeFCvWKCEuu/FkgeqrdnamocS3kKPOcvswqy8fT7eUE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LWCto1tM0uSB7Atzu3REJRKvTGpRw+IqgRx7z+9Ti0HvvcpO/5ooyrTUqitBCzqaL
	 8UqHQ1ZfVaGynR/ghWoEXWl07vc5ewKPtTWUmfuDPR5ymFPLdxdlje+5ITUtzu62Cy
	 fuU6CDaC+KWcDCz8jzn5ZUOgEuBN1rwaSy4Df7HQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AFHOlq031337
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 10:17:24 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 10:17:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 10:17:24 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHMqf017714;
	Mon, 10 Jun 2024 10:17:23 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 5/6] remoteproc: da8xx: Use devm action to release reserved memory
Date: Mon, 10 Jun 2024 10:17:20 -0500
Message-ID: <20240610151721.189472-5-afd@ti.com>
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

This helps prevent mistakes like freeing out of order in cleanup functions
and forgetting to free on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 29 +++++++++++++--------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index c8b7576937733..1ce91516fc6e5 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -233,6 +233,13 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
 	return 0;
 }
 
+static void da8xx_rproc_mem_release(void *data)
+{
+	struct device *dev = data;
+
+	of_reserved_mem_device_release(dev);
+}
+
 static int da8xx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -293,14 +300,13 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 				ret);
 			return ret;
 		}
+		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
 	}
 
 	rproc = devm_rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
 				 sizeof(*drproc));
-	if (!rproc) {
-		ret = -ENOMEM;
-		goto free_mem;
-	}
+	if (!rproc)
+		return -ENOMEM;
 
 	/* error recovery is not supported at present */
 	rproc->recovery_disabled = true;
@@ -313,7 +319,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
 	if (ret)
-		goto free_mem;
+		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
@@ -323,7 +329,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 					rproc);
 	if (ret) {
 		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
-		goto free_mem;
+		return ret;
 	}
 
 	/*
@@ -333,7 +339,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	 */
 	ret = reset_control_assert(dsp_reset);
 	if (ret)
-		goto free_mem;
+		return ret;
 
 	drproc->chipsig = chipsig;
 	drproc->bootreg = bootreg;
@@ -344,15 +350,10 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed: %d\n", ret);
-		goto free_mem;
+		return ret;
 	}
 
 	return 0;
-
-free_mem:
-	if (dev->of_node)
-		of_reserved_mem_device_release(dev);
-	return ret;
 }
 
 static void da8xx_rproc_remove(struct platform_device *pdev)
@@ -369,8 +370,6 @@ static void da8xx_rproc_remove(struct platform_device *pdev)
 	disable_irq(drproc->irq);
 
 	rproc_del(rproc);
-	if (dev->of_node)
-		of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id davinci_rproc_of_match[] __maybe_unused = {
-- 
2.39.2

