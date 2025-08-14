Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A163A22B8C5;
	Thu, 14 Aug 2025 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755185988; cv=none; b=dnoWzbjbwmUrxb5Lm10gWF4WzWyMmE2S+qwCaO6xKdFaSOoqt+Ze0iO3VuKtkxl4gCzC1PhpJORwSDeingQci4d9/+SblnoXnh8nL+CDSnh2IwnfHPe5+0jZ4YGqqk3+BVuW3jG9+LOLgGOxy+W96R3UnUgA1Yjahj+hGWMVefw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755185988; c=relaxed/simple;
	bh=YdzNUb5yrjlOg/1mW+q0lnPWV9LnGDsoUDURf/Ndo4E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bQFp5tA1EcrTn1alK3Iyw6C3EkJYrBtHQHR5Tf64uq2R6rjuojaWORCI77Sub8mQ2Qmy0a+l4UtONFwvxdgXY30fFYplULHT/z38LWOInTFTjNfois+8bFgYVdDKUtEFE8QpM8tkOF7jXkDGcxKN1fLaa5y6zBMSB6P8USTlcm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=t1yXvnA3; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t1yXvnA3"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EFdgis2415806;
	Thu, 14 Aug 2025 10:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755185982;
	bh=4jVQ5OeIAGOJIdP9xObpEaYGeVtRlBcgDJDETqLejV4=;
	h=From:To:CC:Subject:Date;
	b=t1yXvnA3J3A4RmfNmF5hg8XetxiHF3Rn5yrQzYyQTbjqJ10of31c1t94m5o3j/L8o
	 QhwHa3guswF/1ItA9QFXmmnWcpIWR4ZPfd0dzpJ+uEU0AUrk/x8I9Jp20O1gqgOCGP
	 49Z5JbCK8Qzgp/wzdrMIHvbGD5TVAmpgKqySRtUU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EFdgMJ938242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 10:39:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 10:39:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 10:39:42 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EFdfKe3826763;
	Thu, 14 Aug 2025 10:39:41 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 1/4] remoteproc: wkup_m3: Use devm_pm_runtime_enable() helper
Date: Thu, 14 Aug 2025 10:39:37 -0500
Message-ID: <20250814153940.670564-1-afd@ti.com>
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

Use device life-cycle managed runtime enable function to simplify probe
and exit paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/wkup_m3_rproc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index d8be21e717212..35c2145b12db7 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -148,7 +148,9 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
@@ -219,7 +221,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	rproc_free(rproc);
 err:
 	pm_runtime_put_noidle(dev);
-	pm_runtime_disable(dev);
 	return ret;
 }
 
@@ -230,7 +231,6 @@ static void wkup_m3_rproc_remove(struct platform_device *pdev)
 	rproc_del(rproc);
 	rproc_free(rproc);
 	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
-- 
2.39.2

