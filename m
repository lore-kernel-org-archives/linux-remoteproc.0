Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4F134AC;
	Thu, 14 Aug 2025 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180525; cv=none; b=hj+4sdziwiTqLD4V4X0TanSqq6U91WPDXymCFgPZjpeB5bhloamWMnjcRAVZYA41VvK6IWHbNIH7UD5K0d038axWoVmxXrLxh1SNwJveurievSnTXsBenZ94UV9Vy573UsJ8vD5lTe5+5b9YfvU5qV03wITJgmRrgWlC4oqJ7Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180525; c=relaxed/simple;
	bh=H7PmFIF/OZ9TafMWQAj6MmwOPllMqNBoFW9fMrXbjV0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qZghrVTPaZYVFMT+KmX98g4CcCuy1nzLCPJ7z1xhaoyzB2/k0lp3DzLxT4JP1wK3jSo6jiPGc6H9Yn+Miqn4a8nFeOFxS1/HbG1OOakqqONT8j3fLHVoJPW/Htuy9ZR4rnz2hyOSugq7pLKfRiwdgpBqSSwVDVw/LEo584j9zwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dtvoXp33; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dtvoXp33"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EE8b0g1894275;
	Thu, 14 Aug 2025 09:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755180517;
	bh=1pVrV+CC/rGdTxsj/f2r4ynKa0kg+pRxASnQOxUr4jI=;
	h=From:To:CC:Subject:Date;
	b=dtvoXp33UeT9VnnQtIFXA7eaDSmy8FC4dz3dLclrKAwGcbl69M6xWNKqBkxnBahxv
	 UGVbsz8AUaNFN5JgJillo2X4/mwA3hk25J/C0bV+km8pLBCaaTtcol5oo1GGl57aQY
	 2yk0vjGQgrFhVlPcY6NHNJuJgujwSW5SG9yDvj4E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EE8bqW1198876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 09:08:37 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 09:08:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 09:08:36 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EE8ane3715732;
	Thu, 14 Aug 2025 09:08:36 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 1/5] remoteproc: keystone: Use devm action to release reserved memory
Date: Thu, 14 Aug 2025 09:08:31 -0500
Message-ID: <20250814140835.651652-1-afd@ti.com>
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

This helps prevent mistakes like freeing out of order in cleanup functions
and forgetting to free on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 7b41b4547fa80..6fc27e0d7b3de 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -349,6 +349,13 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
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
@@ -425,8 +432,14 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
-	if (of_reserved_mem_device_init(dev))
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
 		dev_warn(dev, "device does not have specific CMA pool\n");
+	} else {
+		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
+		if (ret)
+			goto disable_clk;
+	}
 
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
@@ -450,7 +463,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	return 0;
 
 release_mem:
-	of_reserved_mem_device_release(dev);
 	gpiod_put(ksproc->kick_gpio);
 disable_clk:
 	pm_runtime_put_sync(dev);
@@ -467,7 +479,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 	gpiod_put(ksproc->kick_gpio);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
-- 
2.39.2

