Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9E7229B02;
	Thu, 14 Aug 2025 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755185988; cv=none; b=lwyWlDEAzTZrJNdDqaFHrGwrZPDMYiUA71clnrft6z1iuIr0U9q3z4yviFEH8U2ddrctmjC0Y9unqdUbcMAeJvlTCrwLAlHsAClUlEYDBj7YyUL9v8XArwXVD3GfREpcpeI8rGM4VrJIl0mY7RDS6GBGl9HpMYtXe6GUrlyTsaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755185988; c=relaxed/simple;
	bh=Aozbz3bWXqF7F76Tu8d0hlgtsQZWnJPCD0v39IXAarI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J5SZACwNewmJDp+PSnSzhklbuAXadTq2NA0bk89XwhlTU0EXT4CDGYZQoMM+oY4JQSyeQwATKbkqEqg8FoYcaFyHJZJem+yP3/wZ7bn8ZgKYtgi1GteDXzrUcRqmro2E2jtbm8XJAXgHx/Mqj4DCvqaSVezY5Hp7eA8wn5sRvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hlg8auDW; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hlg8auDW"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EFdg2B1963869;
	Thu, 14 Aug 2025 10:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755185982;
	bh=TLtXusRMjrN3yzTWi90NwUk4sR7yTSZj/gKurUQqQ70=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hlg8auDWduZLICB+/gFAxKelOK9D+K4h7kF/l8+V3bQX/AcX19+6k2Kl+sEdBZTaR
	 z7N/Fn9U+h1mx7WdCysT5zaTN2CnwKINOqsg8sPQM7fcY2LdnwhfEQ7rWOPku1u5V9
	 gaobIejMP0nFrS6Jzm7SLeMVBbnKCIZnoptm0pZo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EFdgAP938245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 10:39:42 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 10:39:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 10:39:42 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EFdfKf3826763;
	Thu, 14 Aug 2025 10:39:42 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 2/4] remoteproc: wkup_m3: Use devm action to call PM runtime put sync
Date: Thu, 14 Aug 2025 10:39:38 -0500
Message-ID: <20250814153940.670564-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814153940.670564-1-afd@ti.com>
References: <20250814153940.670564-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This helps prevent mistakes like putting out of order in cleanup functions
and forgetting to put sync on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/wkup_m3_rproc.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 35c2145b12db7..2569f041d9cab 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -125,6 +125,13 @@ static const struct of_device_id wkup_m3_rproc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, wkup_m3_rproc_of_match);
 
+static void wkup_m3_rproc_pm_runtime_put(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put_sync(dev);
+}
+
 static int wkup_m3_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -152,17 +159,16 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
-		goto err;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "pm_runtime_get_sync() failed\n");
+	ret = devm_add_action_or_reset(dev, wkup_m3_rproc_pm_runtime_put, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add disable pm devm action\n");
 
 	rproc = rproc_alloc(dev, "wkup_m3", &wkup_m3_rproc_ops,
 			    fw_name, sizeof(*wkupm3));
-	if (!rproc) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!rproc)
+		return -ENOMEM;
 
 	rproc->auto_boot = false;
 	rproc->sysfs_read_only = true;
@@ -219,8 +225,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 
 err_put_rproc:
 	rproc_free(rproc);
-err:
-	pm_runtime_put_noidle(dev);
 	return ret;
 }
 
@@ -230,7 +234,6 @@ static void wkup_m3_rproc_remove(struct platform_device *pdev)
 
 	rproc_del(rproc);
 	rproc_free(rproc);
-	pm_runtime_put_sync(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
-- 
2.39.2

