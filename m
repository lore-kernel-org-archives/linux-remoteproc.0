Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497401DF73D;
	Mon,  2 Dec 2024 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733176302; cv=none; b=JwetuvqilZXW/Cd1KJosfRO/WepqktnMpqf9oIQq8IxlsfR6Y+FhARtC5PI/98cobUb61AJ+I7kMte4ay1cJUW1vtgHpuI7js1WZLO0+42V0S3d6E3cu9br9tYbhX1w4U5UaVgx9UpXbzfgJw9r6PVvteJvIq2ODszShllW3a2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733176302; c=relaxed/simple;
	bh=d4jOEgFPUGRrrJgpszrUZkKA/vNoTKCWuEmyS3DfEtM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BI2yWhIkAu5w+JtlIPE01uP3R1qVG6TkebRyvueubfWBgV6ho43wka3tk61+WXWqa881cqYriMENuZKq4d6+bEaNnv0a5lXboItyp7O5Babi/7vPe5OU6yyPHEVgFf7ymxmo9idhRGYKDokOqsS2Bgc6EYPQzt04FU8cYMlGCtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TZ1G8DOH; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TZ1G8DOH"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Lpb221525724
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 15:51:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733176297;
	bh=9A2Y6WyidL2RoMmQz8BVZNKxU5PS8D4Q8vAbrrMQaNw=;
	h=From:To:CC:Subject:Date;
	b=TZ1G8DOH/461iYJawdDhtb88CtWf0lVS6IIoO/0BQCFpGoVVUso2q98Xro/MyavPj
	 R1RSs4A0eFNTIZORf6X8gJ+WEmKKHZ8SdB/IcJferRlPebzvauVp5k+HlrLEKWEV7B
	 bJ6UstfDPjP/1ERSnEgcH9ggC/yIO4U1j+XJFD3c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Lpb2m035747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 15:51:37 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 15:51:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 15:51:36 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LparJ039277;
	Mon, 2 Dec 2024 15:51:36 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 1/5] remoteproc: keystone: Use devm action to release reserved memory
Date: Mon, 2 Dec 2024 15:51:31 -0600
Message-ID: <20241202215135.294829-1-afd@ti.com>
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

Changes for v2:
 - Keep `goto disable_clk` for this patch to prevent git-bisect issues

 drivers/remoteproc/keystone_remoteproc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 6e54093d17323..3f2f72bd1cac8 100644
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
+			goto disable_clk;
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

