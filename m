Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B9C321431;
	Thu, 14 Aug 2025 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180523; cv=none; b=Tmw1qikgnLbUiD5N9Lo8CVUGpMDRpHLj7xsGdv/06LK7gEqGsK5WJIYCFmDQyJsvQLv4qGlxJ8BBIqCooy0C29Rybhq9VMH5leGdED9vXOnoruDJaSq78PpP4MnaGcjIz8QqfUzX6DHoMfT2F0FW6zFP4vK6w7u7BylkHEf3xW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180523; c=relaxed/simple;
	bh=svoSG8SaGn8D0Y1hfs1pbnH3CHdpAVIsu8oKIGzbN58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZxULdFxtzmik9aLkWKWbnfnvet7zrHFCefw6+0kpOP5gdJbvcaDgeEaLUNRTYLSdZQSEQVGAubFfsK3h0+w2+bwLy+s5ikeTY6ESxiXpa+bXNkYGt7c+fQ8U2BvuepBFY38q6ljh1KBJf3PLJy/K/OcEjeTQFbQ/IfWwrd3UaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HVgHGXbX; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HVgHGXbX"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EE8cR32395137;
	Thu, 14 Aug 2025 09:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755180518;
	bh=wlXlLOOUihpAaawLiXE3BQ55WcPQUhKk+KSgdYEt2rw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HVgHGXbXxy2Jm3vSV9lqfudIgZbGcIjspXmlPoYikd6jFfX2TNDqbhbqhQe2pywVK
	 Wn0nvIdaYedH8zVRleIIFJZY9fTXhC/hM5Pcq0nSNjQCo1nTBKlYBnI2DeMUrLDiN5
	 LlD491iSUtaiTTKqlkE42Yi0GLCGmpOFbfwaIdYU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EE8cl21883732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 09:08:38 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 09:08:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 09:08:37 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EE8ani3715732;
	Thu, 14 Aug 2025 09:08:37 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 5/5] remoteproc: keystone: Use devm_rproc_add() helper
Date: Thu, 14 Aug 2025 09:08:35 -0500
Message-ID: <20250814140835.651652-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814140835.651652-1-afd@ti.com>
References: <20250814140835.651652-1-afd@ti.com>
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
index f2972123ac453..8ef60ae4379f1 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -454,22 +454,13 @@ static int keystone_rproc_probe(struct platform_device *pdev)
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
@@ -481,7 +472,6 @@ MODULE_DEVICE_TABLE(of, keystone_rproc_of_match);
 
 static struct platform_driver keystone_rproc_driver = {
 	.probe	= keystone_rproc_probe,
-	.remove = keystone_rproc_remove,
 	.driver	= {
 		.name = "keystone-rproc",
 		.of_match_table = keystone_rproc_of_match,
-- 
2.39.2

