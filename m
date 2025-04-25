Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9C0252914;
	Fri, 25 Apr 2025 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577792; cv=none; b=DAojuhPhw4KjPdu+8WOMZ4aYJUGAi6hWMPLujhdkBZJWEw+GXeYFdBGlftU7jzR4//lvMEG0nkxQT78cMawrpgUZa0cMji+zSff0PtPQARExgoZqrqc2mzipuA+3BAycDhO4rVK9PsjktZ3Ehr+rkDWSJMzdSd42+o8LNmVIUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577792; c=relaxed/simple;
	bh=lUcYW3rUY2ErUUm/ATEdr702Pe/13luWFwzj90wolkM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X75yZ/VVqND+bdbRrKO3INykeBvRrVPYi9xCagzsVQaAmIKyz5uvb6gPHC5D9GgmwYOZlQFqw/dac3DJ3TF3VAXi1SzsPFCA2ae+CVCUlWnr0gggMOtIcd+8TucS1jI6CUqiqbeIUJj/Qb4aKe/r2zgXPrYW1OFNZAQFbhg9Kt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vV7Rt4co; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vV7Rt4co"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAh4Sa2123142
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577784;
	bh=GH2MymkmCjILKruX5AE6IIJg5EphuL8HD5SZZIzE0TI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vV7Rt4coob39kNDIuHoRUCAkAEeGrhaSi3X6Gra7fA8A+ScCSG6Khfw+/vIF06z6S
	 Pyyn/cqkJdzhpfq2lCQLFEoE/7hSn79f2JKoRPCKjj3zJg2OFsegP1H2zQgFiX+OSm
	 TjamiBqm6tCTDlRsIsHJe3mc8+HI/JHjS6ImjTmk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAh3IJ028306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:43:04 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:43:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:43:03 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZh038329;
	Fri, 25 Apr 2025 05:43:00 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 22/35] remoteproc: k3-dsp: Don't override rproc ops in IPC-only mode
Date: Fri, 25 Apr 2025 16:11:22 +0530
Message-ID: <20250425104135.830255-23-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Currently, the driver overrides the rproc ops when booting in IPC-only
mode. Remove these overrides and register the ops unconditionally. This
requires to have IPC-only mode checks in the .prepare and .unprepare ops
and returning early. The other rproc ops are invoked when booting either
in IPC-only mode or in remoteproc mode but not both.

This is done to align the rproc ops implementations of DSP driver with
M4 driver and can be factored out at a later stage.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-21-b-padhi@ti.com/

v10: Changelog:
1. New patch. Gets rid of overriding function pointers. Makes further
commits more atomic.

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 27 +++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index d1d35f819c232..9037e3948f4f5 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -40,6 +40,10 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
+	/* If the core is running already no need to deassert the module reset */
+	if (rproc->state == RPROC_DETACHED)
+		return 0;
+
 	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret)
@@ -64,6 +68,10 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
+	/* If the core is running already no need to deassert the module reset */
+	if (rproc->state == RPROC_DETACHED)
+		return 0;
+
 	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret)
@@ -232,10 +240,13 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 }
 
 static const struct rproc_ops k3_dsp_rproc_ops = {
-	.start		= k3_dsp_rproc_start,
-	.stop		= k3_dsp_rproc_stop,
-	.kick		= k3_rproc_kick,
-	.da_to_va	= k3_dsp_rproc_da_to_va,
+	.start			= k3_dsp_rproc_start,
+	.stop			= k3_dsp_rproc_stop,
+	.attach			= k3_dsp_rproc_attach,
+	.detach			= k3_dsp_rproc_detach,
+	.kick			= k3_rproc_kick,
+	.da_to_va		= k3_dsp_rproc_da_to_va,
+	.get_loaded_rsc_table	= k3_dsp_get_loaded_rsc_table,
 };
 
 static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
@@ -458,14 +469,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	if (p_state) {
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
-		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->prepare = NULL;
-		rproc->ops->unprepare = NULL;
-		rproc->ops->start = NULL;
-		rproc->ops->stop = NULL;
-		rproc->ops->attach = k3_dsp_rproc_attach;
-		rproc->ops->detach = k3_dsp_rproc_detach;
-		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
 	} else {
 		dev_info(dev, "configured DSP for remoteproc mode\n");
 		/*
-- 
2.34.1

