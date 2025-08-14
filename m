Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BED199252;
	Thu, 14 Aug 2025 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180525; cv=none; b=I5nR9aT2ab8ohk8EfOSFIrqs+V+V5oTi7Vi+6B08pFfTKdN/QqN2SS2r7yOUYVDCJLeuS1aIOUdGkFs6GbcahEyTAenz06MnBvhShtijy+Nbabyj8A8CCY55FDk+HKU49uVYMUzR4RG8CGYhfx7/c2k20WnoDBulETqjrRXMtvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180525; c=relaxed/simple;
	bh=Bb/dDfd4e4FCn3A0Qs3O4w/pg1M9+13FbgLJ+YM6Bh8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ji6DGGOxHjG2ETw1D/p594yUmlAjgDty0d3Swp5/E8BcmxZNM9IAKqBxU+3ciOV8+p3xQ8SBx55WrAc2RuLHPraJdID9aeI8hLbru/UDad8cazOJQpTwGEt7zKdDHhhYyOeNMcY26jh2NWGahNcmnM00qsgZgSPFGUsJtEzz+gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=e75CRS+/; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e75CRS+/"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EE8c7E2319021;
	Thu, 14 Aug 2025 09:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755180518;
	bh=RFRRD/pC5qs371E9jtI1qefsxm/L0G/SqAkoFnL0FPk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=e75CRS+/Hby4PjNe+IypoR4Jar9VlIMtTKsuDj1WhOTwx0mqzBO4MOKONZcVXp341
	 Ao1Ry2+y6Hw8GrCtvx9x7GMxVCxmp/FDxUAz7qOcZ1C2bhUjLT/eVFmv4x7v7JC+3c
	 tZrt8U0r8SkhV1dvUGwJAQYOQ/Wul+9yp0/UnVaM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EE8cw01883725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 09:08:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 09:08:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 09:08:37 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EE8ang3715732;
	Thu, 14 Aug 2025 09:08:37 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 3/5] remoteproc: keystone: Use devm action to call PM runtime put sync
Date: Thu, 14 Aug 2025 09:08:33 -0500
Message-ID: <20250814140835.651652-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814140835.651652-1-afd@ti.com>
References: <20250814140835.651652-1-afd@ti.com>
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
 drivers/remoteproc/keystone_remoteproc.c | 36 ++++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 558678d793b0d..1c7437094c4dc 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -356,6 +356,13 @@ static void keystone_rproc_mem_release(void *data)
 	of_reserved_mem_device_release(dev);
 }
 
+static void keystone_rproc_pm_runtime_put(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put_sync(dev);
+}
+
 static int keystone_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -408,30 +415,26 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to enable clock\n");
+	ret = devm_add_action_or_reset(dev, keystone_rproc_pm_runtime_put, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add disable pm devm action\n");
 
 	ret = keystone_rproc_of_get_memories(pdev, ksproc);
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ksproc->irq_ring = platform_get_irq_byname(pdev, "vring");
-	if (ksproc->irq_ring < 0) {
-		ret = ksproc->irq_ring;
-		goto disable_clk;
-	}
+	if (ksproc->irq_ring < 0)
+		return ksproc->irq_ring;
 
 	ksproc->irq_fault = platform_get_irq_byname(pdev, "exception");
-	if (ksproc->irq_fault < 0) {
-		ret = ksproc->irq_fault;
-		goto disable_clk;
-	}
+	if (ksproc->irq_fault < 0)
+		return ksproc->irq_fault;
 
 	ksproc->kick_gpio = gpiod_get(dev, "kick", GPIOD_ASIS);
 	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
-	if (ret) {
-		dev_err(dev, "failed to get gpio for virtio kicks, status = %d\n",
-			ret);
-		goto disable_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
 
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
@@ -439,7 +442,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	} else {
 		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
 		if (ret)
-			goto disable_clk;
+			return ret;
 	}
 
 	/* ensure the DSP is in reset before loading firmware */
@@ -465,8 +468,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 
 release_mem:
 	gpiod_put(ksproc->kick_gpio);
-disable_clk:
-	pm_runtime_put_sync(dev);
 	return ret;
 }
 
@@ -476,7 +477,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 
 	rproc_del(ksproc->rproc);
 	gpiod_put(ksproc->kick_gpio);
-	pm_runtime_put_sync(&pdev->dev);
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
-- 
2.39.2

