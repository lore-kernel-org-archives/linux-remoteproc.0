Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E21A83D0;
	Fri,  2 Aug 2024 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622999; cv=none; b=HIdJg4LZnV67ZrtCHqFa7p8r4WIgn5xVN/VCTcLEj35/qKfiKHDtzIViPk+P5YFe9X0Bbx6Q1ucI4KiZmHVFnqT5m0JfGg4p0AOQywoPcTk3AvcKeYsUpiezABkMKBt5HqRalN1gWkW7oLD/5EFhpT7DurTujB9efHdvvtffEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622999; c=relaxed/simple;
	bh=YTijXSwbtkDt+G+LCvECK+11VvEPBRmo9gUYwYTi6xQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R11+QSC/pPsxP/8owad7Ch+w6kWLtxuPm6uvq8WQm/1o7AoMvITnnctlAaQDFu2vUB2B+y4IcJqK6tmjftfNcmlWfwe1B8qm182p9aNATBiSzAOa1d5XtxWBDMcFbkVPDMqf4VhW1wza1IdRoRYvUHOEn++S+olEHZf/+gZp9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aPeBVC8J; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aPeBVC8J"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472IN3Sh069886;
	Fri, 2 Aug 2024 13:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722622983;
	bh=J0m4m+3HttioTdWTTPB2v877twY5lb3S3IK/+3qAB9I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aPeBVC8J1vQ1zB9oeWgGwSxspR9uWUAMlL1e8fKtNwyrQB9oKnBEiQ3GNPjOJFWKU
	 fHBEkel+tGuBb01wDZSzpw0f0Man8pOlZUKVj9KEPx67P1H2wT1wyNWUxCPTasiGII
	 HzHkFw+TKmzS1x0rRXC/FyvT8qFhA+TfeJgUSCUI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472IN3jv079454
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 13:23:03 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 13:23:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 13:23:02 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472IN0BV039524;
	Fri, 2 Aug 2024 13:23:02 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 6/7] remoteproc: keystone: Use devm_gpiod_get() helper
Date: Fri, 2 Aug 2024 13:22:59 -0500
Message-ID: <20240802182300.244055-6-afd@ti.com>
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

Use device life-cycle managed GPIO get function to simplify probe
and exit paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index e65f99b1bf379..da5d5969829fb 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -440,7 +440,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (ksproc->irq_fault < 0)
 		return ksproc->irq_fault;
 
-	ksproc->kick_gpio = gpiod_get(dev, "kick", GPIOD_ASIS);
+	ksproc->kick_gpio = devm_gpiod_get(dev, "kick", GPIOD_ASIS);
 	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
@@ -457,27 +457,19 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
 	if (ret < 0) {
-		dev_err(dev, "failed to get reset status, status = %d\n", ret);
-		goto release_mem;
+		return dev_err_probe(dev, ret, "failed to get reset status\n");
 	} else if (ret == 0) {
 		WARN(1, "device is not in reset\n");
 		keystone_rproc_dsp_reset(ksproc);
 	}
 
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err(dev, "failed to add register device with remoteproc core, status = %d\n",
-			ret);
-		goto release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register device with remoteproc core\n");
 
 	platform_set_drvdata(pdev, ksproc);
 
 	return 0;
-
-release_mem:
-	gpiod_put(ksproc->kick_gpio);
-	return ret;
 }
 
 static void keystone_rproc_remove(struct platform_device *pdev)
@@ -485,7 +477,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 	struct keystone_rproc *ksproc = platform_get_drvdata(pdev);
 
 	rproc_del(ksproc->rproc);
-	gpiod_put(ksproc->kick_gpio);
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
-- 
2.39.2

