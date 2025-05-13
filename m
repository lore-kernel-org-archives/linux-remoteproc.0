Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F68B1F75A6;
	Tue, 13 May 2025 05:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115219; cv=none; b=gA10hBcqTjH2lpIwmeg/Q9to4J8w6FVF9C5Cu4O5/hyPKe4a2pP4V298Rb8bfUnNDI66yP2KezPR2Cus4pVSfANk6KIDLAOmtunn4RhxJiGuP8tBRdHdL05anPVJ+2J8gdfswfVMvk65JPZhRlJD1bpQTPKfKKQW3+iHsCqNor0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115219; c=relaxed/simple;
	bh=B8VHH8Yxr3XjdtMnB82WQN/QOL4irCgplIOYCG/DyyM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iMnTi/Unw+LGEIIUH3uzBim2QObV9eqMAgDyMBrV67EoRfD6bgeDNS4Vi63J807ZyAI/5WMwzxkmbDJm8ombVf70Xdznwa14p7bHnA5sRsvzzMBeCdFsl8+2gBIqXQoL34H/BZJK0E12BaHstmS7h6p8w6P3rhcI57mdiNADn4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=smmjgtwn; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="smmjgtwn"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kpau2764360
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115211;
	bh=kZhNnFxB36ojRnRKdzvI326rAgX8fD+AEzjafybBWJM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=smmjgtwnidEiicmxEHppdxpZwB3DAaTnbbtqmFJLzSz6ltgoUECYAaVSArnSD6pgm
	 67i3eUNM+MjwOInQr8QdO75KIMS/hHh66KsyylDG5qAtgSqbcp9TO4+NoIE3S61faE
	 PCrPWv4T2FLIQMi+xTHiK+b2nfcfWGUWNvlzHuNo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kpX3088932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:46:51 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:46:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:46:50 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqW131001;
	Tue, 13 May 2025 00:46:46 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 23/36] remoteproc: k3-dsp: Don't override rproc ops in IPC-only mode
Date: Tue, 13 May 2025 11:14:57 +0530
Message-ID: <20250513054510.3439842-24-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
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
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-23-b-padhi@ti.com/

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

