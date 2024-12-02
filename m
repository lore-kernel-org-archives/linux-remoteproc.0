Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DA51DED48;
	Mon,  2 Dec 2024 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733176303; cv=none; b=Sibc9Q9Xl1PXRf/uQT/DcBIqz3SgvuY2miEexknjNHoSal/++FdgHCqEr3m6GwONYNsa/dQ4+1DnSph4xkI9+taEFNwfirlGEg0HuKEWO2y5OW9tCP+4P274oP6tZSbn/l3ckainSBrufYBRKf2M1/Y5utQ6KXaHhrx4D1u/HZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733176303; c=relaxed/simple;
	bh=faXIQU9kKd8Wcopf9JuTLgTukPwGRACwAybcFzVx1iQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmvaBvqNF55OCr6ZSq4CKSzZ7r9Hfp08uQT5iValC6jeEyNqf8oS/PU+bGkn3Raaw0X1OpzKopTlrwcYEmWdwYF7rp73JFyJAZS4jaBOdtCA4YI+lmx2XRTvVSYWSz8tkHqxc6eEd+lnRY5nbVYU/Jpe66vTlkvUmDl6v9UTlHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G9vqwnGp; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G9vqwnGp"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LpcbT102321;
	Mon, 2 Dec 2024 15:51:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733176298;
	bh=CsEiEIPq1PpdqtEH07wAinREICrbHNi2uY2Her4kNto=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=G9vqwnGpqcuS7IsZ9TUvOT6wJzZxHfwPNsclGdGberFHtiJLvUSEDlqAZb/GmuY/D
	 Ire3oPziuIoyr7r9m3PxHQ/kACZucgmx8LXk1fFGpph+3LwCI0UZJ5gcIshEGqhMdA
	 gARwS2IkaBAzDE3LFpVmSeJZOUyFtsqKZfBMvo9s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Lpc2S032071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 15:51:38 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 15:51:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 15:51:37 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LparM039277;
	Mon, 2 Dec 2024 15:51:37 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 4/5] remoteproc: keystone: Use devm_gpiod_get() helper
Date: Mon, 2 Dec 2024 15:51:34 -0600
Message-ID: <20241202215135.294829-4-afd@ti.com>
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

Use device life-cycle managed GPIO get function to simplify probe
and exit paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 1032f440426da..ec8413ea78cf7 100644
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

