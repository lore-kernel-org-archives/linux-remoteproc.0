Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D611420DD;
	Mon, 10 Jun 2024 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032650; cv=none; b=iwNqNeu3QY4SnOEQ6/3mjdIMhc3LGQnCXEQpcmxNe3E5+RyUEtuyuHJyDe67Uz89GQE5vGmAGKw3VZPBWiw40z7bZcIjAFIG22WbKLeLKI3zoJ9pIUJhvuglyH1G4zbq5jJB3v3lHCXze7/Wbt0G04HNQZ8qU8ImusaADne3mtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032650; c=relaxed/simple;
	bh=1+VmIOqLzP9/9IDW1FCErix7AzPjQR66MWqohWtZ9lc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUpIOQjAne8AsQcSVvpTto6EbTEbeuO7ezzcRBIjyQq8NfFmfaqLqcfwaNGGhUNgLlMk3BKbl0YlehR6YQWtymUD1aSNX3xcx6N4qpKJcolZWtpbaWCvWbjBn8QQLWWm/VYvJvc74bSVQZ2yvouhFHagYc2pphF4AZ0l+CCSSqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nlJLHuRH; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nlJLHuRH"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHOIa031242;
	Mon, 10 Jun 2024 10:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718032644;
	bh=S6CAbyqppimi4za1W8UTwhhlNLZYFkY8msmfDKM8H40=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nlJLHuRHVtECND7ftf8DJAwRs0ypOIgMSIN1UMiy8f649XLdiLQTr4dY9pxfvqM3y
	 Yb1vD2d9Xjw0znAfZav6Mu7tHimIa62krNnF+apZgGL9wR7FYP2UeTtBN9a61eZChP
	 swhZ5POZIun7tv7mT7kn4hd8pdjAokSbW0R5FDw8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AFHOAj031340
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 10:17:24 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 10:17:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 10:17:24 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHMqg017714;
	Mon, 10 Jun 2024 10:17:24 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 6/6] remoteproc: da8xx: Use devm_rproc_add() helper
Date: Mon, 10 Jun 2024 10:17:21 -0500
Message-ID: <20240610151721.189472-6-afd@ti.com>
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

Use the device lifecycle managed add function. This helps prevent mistakes
like deleting out of order in cleanup functions and forgetting to delete
on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 1ce91516fc6e5..c20cf33429da9 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -321,8 +321,6 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, rproc);
-
 	/* everything the ISR needs is now setup, so hook it up */
 	ret = devm_request_threaded_irq(dev, irq, da8xx_rproc_callback,
 					handle_event, 0, "da8xx-remoteproc",
@@ -347,7 +345,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	drproc->irq_data = irq_data;
 	drproc->irq = irq;
 
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed: %d\n", ret);
 		return ret;
@@ -356,22 +354,6 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void da8xx_rproc_remove(struct platform_device *pdev)
-{
-	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct da8xx_rproc *drproc = rproc->priv;
-	struct device *dev = &pdev->dev;
-
-	/*
-	 * The devm subsystem might end up releasing things before
-	 * freeing the irq, thus allowing an interrupt to sneak in while
-	 * the device is being removed.  This should prevent that.
-	 */
-	disable_irq(drproc->irq);
-
-	rproc_del(rproc);
-}
-
 static const struct of_device_id davinci_rproc_of_match[] __maybe_unused = {
 	{ .compatible = "ti,da850-dsp", },
 	{ /* sentinel */ },
@@ -380,7 +362,6 @@ MODULE_DEVICE_TABLE(of, davinci_rproc_of_match);
 
 static struct platform_driver da8xx_rproc_driver = {
 	.probe = da8xx_rproc_probe,
-	.remove_new = da8xx_rproc_remove,
 	.driver = {
 		.name = "davinci-rproc",
 		.of_match_table = of_match_ptr(davinci_rproc_of_match),
-- 
2.39.2

