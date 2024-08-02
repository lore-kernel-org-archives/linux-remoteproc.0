Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1297165F0A;
	Fri,  2 Aug 2024 18:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622998; cv=none; b=liMr1sTKJwWxMV4XiIqSPufaHzQxuwxqvjiBlZFeNrWR2EtGPLJLO+uhmJ2zcM/SWlPpUsp1of+q0iOmlWbp+l4rekeo72I9ehH3YfPxlQpwWpW3dMC4jYVpHuJWXS3mqRC0G3jTdvh4kr/z+6ECKjMnUcgIVY2Xn2G4erb10f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622998; c=relaxed/simple;
	bh=BZQIjqi3RVmv20lIjZed/236F9Ix29Tk7k2nJ/s+hmo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZUnOKMxLleURSjWf9i8CXILv58kqxOij4ab/RuWCrfBJ2I8SeGaXTp5CNLaIUgzY45snJJShgu8uPSH0ng3/b59wo2WKd9thaZQVMxfeiLtBvokuvh02Ck2Hgk/cwcH/mDkLsXV1/CWsukUAWfgLItPzGnJiam0SP3alq2Gcmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xrqqjxoQ; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xrqqjxoQ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472IN7Ol069897;
	Fri, 2 Aug 2024 13:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722622987;
	bh=0mbRMD8jBzGMNnJ6EKpzKJECBjbh92PM3dytT8hEJS8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xrqqjxoQVGk1fzjVHOqf/R0YppZJmEh6FkyfRYaooZnie+PQOWOjpg649DizSvP17
	 5oUP5DDFdlAIOnFj1dTzTuVdzbOfW1Cy0VdxuB8Xc4diXne++XhM/kk+aIqGX6Sb/G
	 L74RmoDzwgH4uL8dncOVJKl6MllfV5zPUMDxbHSI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472IN7fr071391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 13:23:07 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 13:23:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 13:23:03 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472IN0BW039524;
	Fri, 2 Aug 2024 13:23:02 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 7/7] remoteproc: keystone: Use devm_rproc_add() helper
Date: Fri, 2 Aug 2024 13:23:00 -0500
Message-ID: <20240802182300.244055-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802182300.244055-1-afd@ti.com>
References: <20240802182300.244055-1-afd@ti.com>
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
 drivers/remoteproc/keystone_remoteproc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index da5d5969829fb..27ebe6661b0b7 100644
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
-	.remove_new = keystone_rproc_remove,
 	.driver	= {
 		.name = "keystone-rproc",
 		.of_match_table = keystone_rproc_of_match,
-- 
2.39.2

