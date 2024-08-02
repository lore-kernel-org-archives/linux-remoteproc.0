Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5381A83D9;
	Fri,  2 Aug 2024 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722622999; cv=none; b=R0a0JdEeIFR1r6iwiF2V+6uU8EYhimbP4BZRajFo35qAymUApCh8BKt2ZkN8EiASrGhLqLSgEMZ4UksDlFml+mMA++5UzzKMW0ljEbES6VQLkvM2akxCIbiI3WErq74H7aPV2bEzLEyb/QLp5UxwyyLKWlooRSGaC8yMrA8BihY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722622999; c=relaxed/simple;
	bh=8eHj5W2I1B7lPIs7Ayzn9zXsvBeLW03zfffBi42QYq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sAll9ZdZK+zGvBOmFvlVCM6duWsGlpC4FtdaVFq+v9/BfeoWLCAPMOaIxRJOXd0O62ElXtxm1bq4Ft5kd/DJjZb8PPYOjczymtdtq9YfQMugbsP9CgyAdqU4UYhkvUxsVHXTdrSfBbxMsiybEOm6DoezE2DwRcFMTvDd48HNkDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IO/HqWAH; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IO/HqWAH"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472IN2c0069881;
	Fri, 2 Aug 2024 13:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722622982;
	bh=Umy8kAGBBEHNE3RH/Ztc9B7WnVg4TGbetmOyidvtuP8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IO/HqWAHBrF5KAtOIKKeEwRdfHB6IQayIQsWMPYjfHQI2wVFO7NDs2uxi9KaDeM3l
	 C56Pu/g+VRbEpXWKyTXLAFbFmTK1ncHaGsXYo1WYPo/PHcjfG1FgO5g09BnFH7v66S
	 DuJ6E5WQEJLXSrniw8iKd3lSh70zz4ZXYKcyRhr0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472IN2NF079401
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 13:23:02 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 13:23:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 13:23:01 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472IN0BS039524;
	Fri, 2 Aug 2024 13:23:01 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 3/7] remoteproc: keystone: Use devm action to release reserved memory
Date: Fri, 2 Aug 2024 13:22:56 -0500
Message-ID: <20240802182300.244055-3-afd@ti.com>
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

This helps prevent mistakes like freeing out of order in cleanup functions
and forgetting to free on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 8f0f7a4cfef26..033e573544fef 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -358,6 +358,13 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 	return 0;
 }
 
+static void keystone_rproc_mem_release(void *data)
+{
+	struct device *dev = data;
+
+	of_reserved_mem_device_release(dev);
+}
+
 static int keystone_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -434,8 +441,14 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
-	if (of_reserved_mem_device_init(dev))
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
 		dev_warn(dev, "device does not have specific CMA pool\n");
+	} else {
+		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
+		if (ret)
+			return ret;
+	}
 
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
@@ -459,7 +472,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	return 0;
 
 release_mem:
-	of_reserved_mem_device_release(dev);
 	gpiod_put(ksproc->kick_gpio);
 disable_clk:
 	pm_runtime_put_sync(dev);
@@ -476,7 +488,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 	gpiod_put(ksproc->kick_gpio);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
-- 
2.39.2

