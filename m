Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA911FA84A;
	Fri,  3 Jan 2025 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899215; cv=none; b=EVkEa7Xa0YcuRWf+lsSWLGPLCC3T8XaJNY9OqqpbsLlceHATRUtPOkjQhwt7XJIYJzXL8Q9en9B4yfLAUCxmSVsv7PHH9dAnivKKld4JjSTvNXoRMGF3jkNlvsGNDMWkjMMJ3RaReiuk3LZ2Hnfls4foch0towjEoh8rzJqyDq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899215; c=relaxed/simple;
	bh=HGWhO5DY563RVZtr1WtD3aDkGj33a3vpzvohs5DBaZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PdZk52PgctnpSi2fjt/C0OPL/7GGJTpFH8JcXdlKcQEX1qTG+XDyNFl0Iya47kT975cjf9swt/6h76KzcNCrfbXssDTX/FDAE5XDDad2iUAmItgzl5V2cNX2rYRRa8JxizF3rBhy+KVTxGmqFMCRrGhzxatWRxChHUiBDa9b28k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ogwKeIDv; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ogwKeIDv"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ADO5O2382614
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 04:13:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899204;
	bh=uRd82LX/k2X+x0gz85aF0ANVYLU3nlil1bS1yS2k/x8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ogwKeIDvYzPBH/AeTT+j8G4AqBSi22ZfbQSrVak4kB3w7ooZKIFld4+uukuhUAneg
	 yAeYraM2IP29Mczfd9WJXq66gwIBKB1k2UYuLPnVwYa9GLbzWeM45VjK/uSPtqPyH0
	 pPaRIetmKaWKJiUUvAW5F/48CUkentnTaNG0W75w=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503ADOlB126173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:13:24 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:24 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSV126047;
	Fri, 3 Jan 2025 04:13:20 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 13/20] remoteproc: k3: Refactor .attach rproc ops into common driver
Date: Fri, 3 Jan 2025 15:42:24 +0530
Message-ID: <20250103101231.1508151-14-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103101231.1508151-1-b-padhi@ti.com>
References: <20250103101231.1508151-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The .attach rproc ops implementations in ti_k3_dsp_remoteproc.c and
ti_k3_m4_remoteproc.c drivers set the "is_attach_ongoing" flag to
signify that the core is undergoing transition from detached to
attached state. Refactor the implementations into ti_k3_common.c driver
as k3_rproc_attach() and align DSP and M4 drivers to register this
common function as .attach ops.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 20 ++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 21 +--------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 20 +-------------------
 4 files changed, 23 insertions(+), 39 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 799152d1a736..296a47de9d72 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -310,5 +310,25 @@ int k3_rproc_stop(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_stop);
 
+/*
+ * Attach to a running remote processor (IPC-only mode)
+ *
+ * This rproc attach callback only needs to set the "is_attach_ongoing" flag to
+ * notify k3_rproc_{kick/mbox_callback} functions that the core is in the
+ * process of getting attached in IPC-only mode. The remote processor is already
+ * booted, and all required resources have been acquired during probe routine,
+ * so there is no need to issue any TI-SCI commands to boot the remote core.
+ * This callback is invoked only in IPC-only mode.
+ */
+int k3_rproc_attach(struct rproc *rproc)
+{
+	struct k3_rproc *kproc = rproc->priv;
+
+	kproc->is_attach_ongoing = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_attach);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index bfcb5d086cff..89175cb5a006 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -97,4 +97,5 @@ int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
 int k3_rproc_stop(struct rproc *rproc);
+int k3_rproc_attach(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a9896ba51399..43c1eda47be2 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -58,25 +58,6 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * Attach to a running DSP remote processor (IPC-only mode)
- *
- * This rproc attach callback only needs to set the "is_attach_ongoing" flag to
- * notify k3_rproc_{kick/mbox_callback} functions that the core is in the
- * process of getting attached in IPC-only mode. The remote processor is already
- * booted, and all required resources have been acquired during probe routine,
- * so there is no need to issue any TI-SCI commands to boot the DSP core. This
- * callback is invoked only in IPC-only mode.
- */
-static int k3_dsp_rproc_attach(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-
-	kproc->is_attach_ongoing = true;
-
-	return 0;
-}
-
 /*
  * Detach from a running DSP remote processor (IPC-only mode)
  *
@@ -189,6 +170,7 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start		= k3_dsp_rproc_start,
 	.stop		= k3_rproc_stop,
+	.attach		= k3_rproc_attach,
 	.kick		= k3_rproc_kick,
 	.da_to_va	= k3_dsp_rproc_da_to_va,
 };
@@ -414,7 +396,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
 		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->attach = k3_dsp_rproc_attach;
 		rproc->ops->detach = k3_dsp_rproc_detach;
 		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
 	} else {
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 27bf8ed49f59..e78e35c1375c 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,24 +244,6 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Attach to a running M4 remote processor (IPC-only mode)
- *
- * This rproc attach callback only needs to set the "is_attach_ongoing" flag to
- * notify k3_rproc_{kick/mbox_callback} functions that the core is in the
- * process of getting attached in IPC-only mode. The remote processor is already
- * booted, so there is no need to issue any TI-SCI commands to boot the M4 core.
- * This callback is used only in IPC-only mode.
- */
-static int k3_m4_rproc_attach(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-
-	kproc->is_attach_ongoing = true;
-
-	return 0;
-}
-
 /*
  * Detach from a running M4 remote processor (IPC-only mode)
  *
@@ -285,7 +267,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 	.unprepare = k3_rproc_unprepare,
 	.start = k3_rproc_start,
 	.stop = k3_rproc_stop,
-	.attach = k3_m4_rproc_attach,
+	.attach = k3_rproc_attach,
 	.detach = k3_m4_rproc_detach,
 	.kick = k3_rproc_kick,
 	.da_to_va = k3_m4_rproc_da_to_va,
-- 
2.34.1

