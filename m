Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422B1DE3B2;
	Mon,  2 Dec 2024 22:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177953; cv=none; b=ms4/xLs68lahiFX5NsHyiWDbHHF8QcjH9z4rMteqOgrPn4GpIUG6tbb4HcORO3cRSwoIRsT6DNjyl/4PIsla0KfAVNlhN9mJ/xWKZt5I3IfWmyH79pgjJgOkN59Dy8LHJHjIs8qqPELWlSlYU4IyPfD+8i4GO4L9K1BPaux0j60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177953; c=relaxed/simple;
	bh=YdzNUb5yrjlOg/1mW+q0lnPWV9LnGDsoUDURf/Ndo4E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ef/D+c91OcvGd+8cipk3cl7CuSU8giOjmvqpZtM1Z1Do1pcziqiA8xnihzcLuOiS9uAD3M00l+1j8i66zxe7dO8wX5LnMTeFfTMAfJ6ItyyCYZG1Q/+5YL9lqgGXDAxqPs39tbHQFP1mfUx3Y1AJ72sTu6tL6JFRhwAxNW7s294=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VObvzbY/; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VObvzbY/"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MJ6eV1528297
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 16:19:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733177946;
	bh=4jVQ5OeIAGOJIdP9xObpEaYGeVtRlBcgDJDETqLejV4=;
	h=From:To:CC:Subject:Date;
	b=VObvzbY//u+ktja/loM5SiDIoYBGR6CCzIAoCOAfzwQ9uRypuI3FLzxjcrVNNGcTU
	 8CgZwtd1QQIZI8a+nV31/5BYHNWmYZw4d0cQdx93WIrSWQhh5j+MIchA/hFxhOgj7v
	 jc8mj1hKksozh9KvI9JRRr8DrNC9VkyO7PVIrRus=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MJ6t0059127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 16:19:06 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 16:19:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 16:19:06 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2MJ5Us068468;
	Mon, 2 Dec 2024 16:19:05 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 1/4] remoteproc: wkup_m3: Use devm_pm_runtime_enable() helper
Date: Mon, 2 Dec 2024 16:19:01 -0600
Message-ID: <20241202221904.319149-1-afd@ti.com>
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

