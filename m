Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235751DEFF7;
	Mon,  2 Dec 2024 21:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733174986; cv=none; b=rXl4/tul24pHeAmuMQKxBnYJzDq1NsV35JBd0NDR40t3yZo2N900Slp1G4xVuFDvINiFIadp6zAPebbqwWhqHY5O+bjdI2cUBiRThixvKYPNt5cEQ7LMxIXWpTvtMWaF0iVhYwrtc+mWVcuFtvefioj5HY5fBDel5WN48qfQ3OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733174986; c=relaxed/simple;
	bh=NDvTx9XnqrD/F0oeK+S6HRNS206jDyTNfj/b1gsRNaU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mE+xnP4yoMoUaay682NV/WS2EjS4GUo7uJIQLqEVFqgwPAgzLkgM7HTg5NhPOHQYdb9ZaODiBGQR+i1WP0cKOORFn4slsfpdzD7bFz1gNKX2hMWUngpXFJOJK4deZy1TJlDvatTE8z1m9asNKDXUcQbkHnrPuYG4Nryd3DR7K3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gtg/vxKg; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gtg/vxKg"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2LTe8v1523649
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 2 Dec 2024 15:29:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733174980;
	bh=QZOf5eEW5hqotQys4N4msPYx4BmSQ3v7wLH71yiXCi0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gtg/vxKgnXpDo8LavDCIbVGtUAgfRwGkM8P/B8RCNRcl3QUj+XFyvR9JyQ36DBzem
	 Uq8PRkgnNTlOZ2xlv8gpEjhv2keY72BxLCX+RST56r8ys+7aH7BhBaCBuDj+hjNCHk
	 ivEstML3Q8nOHCNpb7VB9qJblewTCe6QRAri5Uyw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LTeoq128174;
	Mon, 2 Dec 2024 15:29:40 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 15:29:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 15:29:39 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LTcFL014672;
	Mon, 2 Dec 2024 15:29:39 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 3/3] remoteproc: da8xx: Use devm_rproc_add() helper
Date: Mon, 2 Dec 2024 15:29:38 -0600
Message-ID: <20241202212938.219964-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202212938.219964-1-afd@ti.com>
References: <20241202212938.219964-1-afd@ti.com>
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

