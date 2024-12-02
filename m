Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A695E70804;
	Mon,  2 Dec 2024 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733174986; cv=none; b=d29yXwHuQSzsm4sFY+VVAKYbSSb/CKNPcnkNL9vHWf5ue8F+xGDLKLqdO4dPzJ3XNpYvHvoeESahkyxoTPVfOt7Jkrhpgt2MIMO8v3JWT9av/VikaR1r/jBv0xt5Kdgvkurr3AxyxVdMPVMSYFA+xWu28Tfickh+x13U37pRFRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733174986; c=relaxed/simple;
	bh=yHtL5h/v7HO1ryRykshiynI+97k5cMZ56vG1mfMBJIg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pw5ORSVEhcQJkMJKfNftWCHzyrb/WNmkPpfI5+hSg8RhATw11zRlQNieP4bM/2aDNc0TResru9qlfnG2sjGRZg39/prpJOa4SZ+1M497epIkTHD1Jw1Y8JNtkykYI2yNqfp0JuBcnLw04ApKY/CH7JPyn1UL3K8bFeJE67384oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bAT9bUkN; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bAT9bUkN"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LTdBf045141;
	Mon, 2 Dec 2024 15:29:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733174979;
	bh=B10MrB57L8ner4oDTjBIM6q1QMLdIh/rIWSD9SwnqXU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bAT9bUkN8Sf5KJnr0HqW/M3tDQR9Pg9M1LrC1pbH4iMjp0yH8t1ZRyvcCOldki86k
	 5MKrEmyVrAhVjRIm0P6mChX9+0nZ59wze2+ace5W6DeFhFNRnceeCDe5uWTPUVqeNY
	 +WZIpMAaT7XTVoCpH5BMRQqSexNU9ruJKi4hDmbU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2LTdrw026797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 15:29:39 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 15:29:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 15:29:39 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LTcFK014672;
	Mon, 2 Dec 2024 15:29:39 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 2/3] remoteproc: da8xx: Use devm action to release reserved memory
Date: Mon, 2 Dec 2024 15:29:37 -0600
Message-ID: <20241202212938.219964-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202212938.219964-1-afd@ti.com>
References: <20241202212938.219964-1-afd@ti.com>
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

Changes for v2:
 - Fix unused var "dev" warning

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

