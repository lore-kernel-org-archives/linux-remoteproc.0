Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D010021C180;
	Fri,  2 Aug 2024 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722623004; cv=none; b=Z59bHSz5UHYJtpTjxk0bm+jXL2q4sQIKdOD74/orl+nOTjJJ5VwkQRbhQQwbysOMoxG9XZr+ZtSkX1wjVHa8TJfIXnC5J//IAmARbLfopBzN9uOMoF+JN8CW7peQKLjd8Byc9qlcSHma1jY9BhSA6T2LPlpmk9/XAgzimAgaxao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722623004; c=relaxed/simple;
	bh=AW7+aepCwo2s4GgSk1Ro22T2P245hCm6infgWrT0z2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PsjhFOx5pxoLp5OWUhdyc3DtCKsGiFCbAVefpgD2UJdwZw2feAuAtakIT+RA7VyTct4CB42zX7yazAsLFUICioHqnbAx/okAgxlO/QZkop8itK3++3xZzBXmnr4VIBI4ewDa/T0heNwehBr7HxHfXDq6sXKp9ma3tz887ZO3fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rLMW0MvV; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rLMW0MvV"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472IN7Da020284;
	Fri, 2 Aug 2024 13:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722622987;
	bh=NI27/FycpGqHlaV5VaK7X2zGEqiGXCBpHNDJ+WdCRXM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rLMW0MvVfvZU0CAbkB5wNquQPVFce66I3hnU3sKVDmALYzjjI9bYPtldPAIJMex4U
	 inTfIJ+h3E7eYMFVhEKIWK0RcAqjtlIT7o7L9IsB1nNKyeIk1TG+s4qVBZkBBm2ZFW
	 H5gxWrV8eSb0whaT8/8QL5cZZm0MKiUFbbOtXIhc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472IN7fs071391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 13:23:07 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 13:23:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 13:23:02 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472IN0BT039524;
	Fri, 2 Aug 2024 13:23:01 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 4/7] remoteproc: keystone: Use devm_pm_runtime_enable() helper
Date: Fri, 2 Aug 2024 13:22:57 -0500
Message-ID: <20240802182300.244055-4-afd@ti.com>
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

Use device life-cycle managed runtime enable function to simplify probe
and exit paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 033e573544fef..f457cadc1fae0 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -410,12 +410,13 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 		return PTR_ERR(ksproc->reset);
 
 	/* enable clock for accessing DSP internal memories */
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable clock, status = %d\n", ret);
-		goto disable_rpm;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
 
 	ret = keystone_rproc_of_get_memories(pdev, ksproc);
 	if (ret)
@@ -475,8 +476,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	gpiod_put(ksproc->kick_gpio);
 disable_clk:
 	pm_runtime_put_sync(dev);
-disable_rpm:
-	pm_runtime_disable(dev);
 	return ret;
 }
 
@@ -487,7 +486,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 	rproc_del(ksproc->rproc);
 	gpiod_put(ksproc->kick_gpio);
 	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
-- 
2.39.2

