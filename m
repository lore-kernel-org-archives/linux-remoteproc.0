Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4883F1DF73E;
	Mon,  2 Dec 2024 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733176303; cv=none; b=uipE4BgKCZFxwez7sc6cLomxhfGYQs6mF69jwIHp2GRgFkl9Hq848m5LntqLBde4KTyCXywDxzHK88X940KgAS1GK8pxc21Jgg6t6IVgB9MIxMTnSXdS7Lo0lqQPASCgRClGslMxG+AuPY/5EW0QXKC9XVpvR/PAvOf5ZaZ2+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733176303; c=relaxed/simple;
	bh=T8gDPgRvXev88smqK596aKWPbh7ok3k9ca4wUYJMpAQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XUloUV7YPxwsqvl3EB/0d46Kh+ZABO7o8scjwf2Hbe1UFRpeDaCMgjBhk36tPCfSFcykOmF5jdk8skbf5hfOBVlTOne706w2+WEFb4DLU34dSX3DlhRGifCNaDl9ges739kzyVhDXQv0cRF99qpdb94EgTCfmj/u0S0f8YxcG5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Dev+6yLn; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Dev+6yLn"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LpcIB049644;
	Mon, 2 Dec 2024 15:51:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733176298;
	bh=chRiwMOx7nnLlPqbr26Pq7aSEJPGC/3CHVPgNrjndM0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Dev+6yLnxFaDxdct5g1YwVsxZ6KlzWs6bJm0qObpYrx+pVdlVZ4k4cBoxEB9C/y2A
	 1VJ3NW/tqIj/e2flZtOE0fI2xASpTDn4ZpmvXGiRVGrt+eqFm6xa6KKn6D3leaBmdP
	 KexcAs1pspIyMcMkWhetSkrbqimQyFCDIn8VusBg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2LpcJp038477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 15:51:38 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 15:51:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 15:51:37 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LparN039277;
	Mon, 2 Dec 2024 15:51:37 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 5/5] remoteproc: keystone: Use devm_rproc_add() helper
Date: Mon, 2 Dec 2024 15:51:35 -0600
Message-ID: <20241202215135.294829-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202215135.294829-1-afd@ti.com>
References: <20241202215135.294829-1-afd@ti.com>
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
 drivers/remoteproc/keystone_remoteproc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index ec8413ea78cf7..27ebe6661b0b7 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -463,22 +463,13 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 		keystone_rproc_dsp_reset(ksproc);
 	}
 
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register device with remoteproc core\n");
 
-	platform_set_drvdata(pdev, ksproc);
-
 	return 0;
 }
 
-static void keystone_rproc_remove(struct platform_device *pdev)
-{
-	struct keystone_rproc *ksproc = platform_get_drvdata(pdev);
-
-	rproc_del(ksproc->rproc);
-}
-
 static const struct of_device_id keystone_rproc_of_match[] = {
 	{ .compatible = "ti,k2hk-dsp", },
 	{ .compatible = "ti,k2l-dsp", },
@@ -490,7 +481,6 @@ MODULE_DEVICE_TABLE(of, keystone_rproc_of_match);
 
 static struct platform_driver keystone_rproc_driver = {
 	.probe	= keystone_rproc_probe,
-	.remove = keystone_rproc_remove,
 	.driver	= {
 		.name = "keystone-rproc",
 		.of_match_table = keystone_rproc_of_match,
-- 
2.39.2

