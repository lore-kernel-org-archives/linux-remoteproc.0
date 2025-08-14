Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C993002DC;
	Thu, 14 Aug 2025 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179743; cv=none; b=J7BhyJZCwKghExOBxu+tZgtSdQZr+sGfTUp9s+36IlNnhSM6vGBmQP0+rPExAS/0KICRiDILHl3umMSlGko39c3HS37eThvNS6Kf6GIMSo0tT7N+oQjF/zJCGshkEAFjSxP7LyLj5ZE5/qSwE+QDKVUxrrnxfNl7a6XiN1jjam8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179743; c=relaxed/simple;
	bh=7JzL3Ns20W8JlBQbpJ32kWh4gyRkykl+6/gLUYxEY3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=niIWJi+2OgeD70pYaubmYNZJtVjygQ0Bf2tqSMRMar+OmJeUvBZTX9BnfRGkklKIFHZ7XwZ4cnYJKRMmCD7ll10GPLAk5gbuaW3hI8qYaDGQwkAgC0CsvvTx8ZtO2wuqXgLxJXIZijUasXG5cDfOc9ywRPcaCeSzFQ5zJAUPO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AKOCZK3X; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AKOCZK3X"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EDtYGd2392931;
	Thu, 14 Aug 2025 08:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755179734;
	bh=i0GvU8yXRcaO2Y4NEKTLzJjcr67hga2PE/48KWK3328=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AKOCZK3XG2RHK4KkfW2OnGKYAQ7P7wIU1yF72WMDSySWBFxTiBa0OB2KnUh9aHtpn
	 xCA6Hy7OZDk9FXgkHsbMCBiiqkQO9PD1+O1RUA/QbMEto6D6/q3klRH9US5/muwWht
	 09pEJkSwfnm7p4qzVA/dqtSKUC+JV2L4mbq4qMIQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EDtYrh1752703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 08:55:34 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 08:55:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 08:55:34 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EDtX4E4004753;
	Thu, 14 Aug 2025 08:55:34 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 3/3] remoteproc: da8xx: Use devm_rproc_add() helper
Date: Thu, 14 Aug 2025 08:55:32 -0500
Message-ID: <20250814135532.638040-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814135532.638040-1-afd@ti.com>
References: <20250814135532.638040-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use the device lifecycle managed add function. This helps prevent mistakes
like deleting out of order in cleanup functions and forgetting to delete
on error paths.

As this now makes the IRQ free ordered correctly, we can drop that from
the remove() callback, which is now empty and can also be removed.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 58b4f05283d92..e418a2bf5d2ee 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -302,8 +302,6 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, rproc);
-
 	/* everything the ISR needs is now setup, so hook it up */
 	ret = devm_request_threaded_irq(dev, irq, da8xx_rproc_callback,
 					handle_event, 0, "da8xx-remoteproc",
@@ -328,7 +326,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	drproc->irq_data = irq_data;
 	drproc->irq = irq;
 
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed: %d\n", ret);
 		return ret;
@@ -337,21 +335,6 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void da8xx_rproc_remove(struct platform_device *pdev)
-{
-	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct da8xx_rproc *drproc = rproc->priv;
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
@@ -360,7 +343,6 @@ MODULE_DEVICE_TABLE(of, davinci_rproc_of_match);
 
 static struct platform_driver da8xx_rproc_driver = {
 	.probe = da8xx_rproc_probe,
-	.remove = da8xx_rproc_remove,
 	.driver = {
 		.name = "davinci-rproc",
 		.of_match_table = of_match_ptr(davinci_rproc_of_match),
-- 
2.39.2

