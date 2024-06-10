Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD18D152503;
	Mon, 10 Jun 2024 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032651; cv=none; b=PhSl50J8mHi9Jf6Ubz59F3K/P5tBTDq8y586h3DGhk+8HACMK7aB9ulFtHGEXzugkOU4b/iBONYnBsPCvHWHKLMTnf+bqkq9DsFqpbIC7ibGFX+EhVIE1S/ytxuQSzhFoYtb+H7eaMQ0HAqzgtDAqKPXT5u+1CCqIl5fA2FZh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032651; c=relaxed/simple;
	bh=6yYEdI23czqjygLKy/yvVQfBp63RgkYgqjvNiwla/W4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjlqXSMGNdXv2/HcjrE80U5tYj/7bZMG/ND7ZcKVLbZDGcNX74LotcWOmBpI96obg5zkWIMXDtpND6UsvEUAEdJSm7BehNqYM8j2zO0FRCVMAWKfq9PXUHHqbE0sU1x9jwIfyqAG+0us3sU0yEPXI3QR2Vgk0kyJuop3vgmpB44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ok8BC50R; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ok8BC50R"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHNiZ126245;
	Mon, 10 Jun 2024 10:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718032643;
	bh=N/XIQdrQKpNNnxZOsUxINN1I4bjjpDcOT/P/kILZnuA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ok8BC50R+d9lTpqk3tysCurjS7dvP+VjzPghpiQiJaYgcVJY5o9iO6uKdyDBqPKo3
	 zg3VDS0uusZIYv91MEheyAaz93Ur97U5KzA5Rjt68qpKNqBsnUyaq7mHTHTqJ07fJS
	 4xns4G0uULOzps0VSmvXyjG8rDqbb/yvOQYBxUuE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AFHNn7014838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 10:17:23 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 10:17:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 10:17:23 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHMqc017714;
	Mon, 10 Jun 2024 10:17:23 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 2/6] remoteproc: omap: Use devm action to release reserved memory
Date: Mon, 10 Jun 2024 10:17:17 -0500
Message-ID: <20240610151721.189472-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610151721.189472-1-afd@ti.com>
References: <20240610151721.189472-1-afd@ti.com>
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
 drivers/remoteproc/omap_remoteproc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index e91e016583802..df46be84658f7 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1277,6 +1277,13 @@ static int omap_rproc_of_get_timers(struct platform_device *pdev,
 	return 0;
 }
 
+static void omap_rproc_mem_release(void *data)
+{
+	struct device *dev = data;
+
+	of_reserved_mem_device_release(dev);
+}
+
 static int omap_rproc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1346,19 +1353,17 @@ static int omap_rproc_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "Typically this should be provided,\n");
 		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
 	}
+	ret = devm_add_action_or_reset(&pdev->dev, omap_rproc_mem_release, &pdev->dev);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
 	ret = rproc_add(rproc);
 	if (ret)
-		goto release_mem;
+		return ret;
 
 	return 0;
-
-release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
-
-	return ret;
 }
 
 static void omap_rproc_remove(struct platform_device *pdev)
@@ -1366,7 +1371,6 @@ static void omap_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_del(rproc);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct dev_pm_ops omap_rproc_pm_ops = {
-- 
2.39.2

