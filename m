Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01989263C6A;
	Thu, 17 Apr 2025 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914089; cv=none; b=HzQB1DRZJW4yplkxBob/xzl6a4WA4gLagnKk/hHcvm8yCJ4hdS5P0WwrY9b/cIUMLF/h/t/WadaOJ4YwVE0IWlHHGq2J6x07kIelctE8G6tNe5QLltJT3z0CdOglsC4cX4PtL8Hf7ttNrWiRpLHc3T1ZmK+OUdutMkZzoAaGzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914089; c=relaxed/simple;
	bh=5pPk7iVcIJfXK2kURm4vvzrPy3oAQ9+OGu7YfE/hX5M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b11QJkxG/u89PFIag4TrMajs6CIl17UvKgyykFF3BILwvp8L5FVpKCbunvJAQRAOYcTfOj7cVapWf0XxLfcTlcJSxKKCTDJUgjf7oZchYzuBDwQsMsxDauHV4JAVHGeNGsj96zUVabDVzJZw6EgfRMAfhN8okAM+Mg8njp+ch+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f/BhQcSQ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f/BhQcSQ"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILLBg080608
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914081;
	bh=xGUJFaibN0vFhWeMMrvi0bSP7naazg99PXQdeJjgOjo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f/BhQcSQy81ISTzm91eUo+LQEl2z3Jpg8NrfnN3TlKoZtau/zcBO7mO0Sz/NKBDEm
	 JXw2zXxLGJHA1bEqVYtX9wh8feb8vUAz7ZNeerY2toy033eaMq1D81tgRNMh91F55o
	 mHR/xTTmpNlyeIni+PbjJfrV6avu/W4lY9T/lTmo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILLte067988
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:21 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:20 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1I4071102;
	Thu, 17 Apr 2025 13:21:17 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 20/33] remoteproc: k3-dsp: Don't override rproc ops in IPC-only mode
Date: Thu, 17 Apr 2025 23:49:48 +0530
Message-ID: <20250417182001.3903905-21-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417182001.3903905-1-b-padhi@ti.com>
References: <20250417182001.3903905-1-b-padhi@ti.com>
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
---
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

