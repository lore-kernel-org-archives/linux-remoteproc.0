Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1AF26FD84;
	Thu, 14 Aug 2025 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179739; cv=none; b=EJ2ny5sG3TmLwvFW7GWvWHvKXyNO/dkdPhtkAC6j4GvA0PEmSn7v+I6yr8kMoXs/ETkqX37CDhNh/dNaDRCAYzgkqFCfairTXfdlleqPgfXVQSL2hMmkqGnluAeR7QCZtag4X5WKHXHjmFC1dV2oVEL4PPpAVsNT+jxjad28kQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179739; c=relaxed/simple;
	bh=gvfPsAP95XRdDlwvjCHvl0bOJolt9UGHRBEIH3CNyEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJ9J9k0h27WK954KQTisyIophfwhKhORsQTmOEVIsAfVcj389wm5OHVTYjkybsvWnKtzIvL5bvi2mEKXi17OcH/mkeI2DHXkxGNia6RRzewf8Top8SR3BkTNMUyg11SIUD/ncDI76iBR58RF2WPQBipb0jBx/yL/RwTKpAkXXL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gGiVkUI2; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gGiVkUI2"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EDtYgg2392927;
	Thu, 14 Aug 2025 08:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755179734;
	bh=trZKj/8YCTozgjgEnXHmllZ9Cs4kk4oHcJm1VvImiTE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gGiVkUI2/7yWfwiXg9IsMVHTWhXPQV1Jcsw6bwVkwqGduxcY8AE3yq8s5+BcqXD3l
	 Cv7Hd3LAR749hNBO4+8FM2FUnpXsgTcGoz0vIj0bDz4ULShNOSVeJFp38ceCsk3muL
	 yUOaVWPp9V6rI+zZpJkK1DL7zAf60pFV4RDgm7+U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EDtYcx879341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 08:55:34 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 08:55:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 08:55:33 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EDtX4D4004753;
	Thu, 14 Aug 2025 08:55:33 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 2/3] remoteproc: da8xx: Use devm action to release reserved memory
Date: Thu, 14 Aug 2025 08:55:31 -0500
Message-ID: <20250814135532.638040-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814135532.638040-1-afd@ti.com>
References: <20250814135532.638040-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This helps prevent mistakes like freeing out of order in cleanup functions
and forgetting to free on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 30 +++++++++++++--------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 47df21bea5254..58b4f05283d92 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -233,6 +233,13 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
 	return 0;
 }
 
+static void da8xx_rproc_mem_release(void *data)
+{
+	struct device *dev = data;
+
+	of_reserved_mem_device_release(dev);
+}
+
 static int da8xx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -274,14 +281,13 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 		ret = of_reserved_mem_device_init(dev);
 		if (ret)
 			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
+		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
 	}
 
 	rproc = devm_rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
 				 sizeof(*drproc));
-	if (!rproc) {
-		ret = -ENOMEM;
-		goto free_mem;
-	}
+	if (!rproc)
+		return -ENOMEM;
 
 	/* error recovery is not supported at present */
 	rproc->recovery_disabled = true;
@@ -294,7 +300,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
 	if (ret)
-		goto free_mem;
+		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
@@ -304,7 +310,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 					rproc);
 	if (ret) {
 		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
-		goto free_mem;
+		return ret;
 	}
 
 	/*
@@ -314,7 +320,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	 */
 	ret = reset_control_assert(dsp_reset);
 	if (ret)
-		goto free_mem;
+		return ret;
 
 	drproc->chipsig = chipsig;
 	drproc->bootreg = bootreg;
@@ -325,22 +331,16 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed: %d\n", ret);
-		goto free_mem;
+		return ret;
 	}
 
 	return 0;
-
-free_mem:
-	if (dev->of_node)
-		of_reserved_mem_device_release(dev);
-	return ret;
 }
 
 static void da8xx_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct da8xx_rproc *drproc = rproc->priv;
-	struct device *dev = &pdev->dev;
 
 	/*
 	 * The devm subsystem might end up releasing things before
@@ -350,8 +350,6 @@ static void da8xx_rproc_remove(struct platform_device *pdev)
 	disable_irq(drproc->irq);
 
 	rproc_del(rproc);
-	if (dev->of_node)
-		of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id davinci_rproc_of_match[] __maybe_unused = {
-- 
2.39.2

