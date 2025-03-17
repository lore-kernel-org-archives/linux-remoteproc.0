Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27539238D25;
	Mon, 17 Mar 2025 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213279; cv=none; b=T5KNXKjxNnv1eFJ7d3XURJQSJrBqLcQLWMTE4Spqo5MX//67iCOlaXaFlyqheLVyBRmf9qweTYSqy9fT+zIkUvNbu6XupQufKTvn+vkvTx5wb1ueV04x178RFRjV+F+LpaiPvtHvEoVmbsVzVTIGMabUdEQCKp8J94PcobOjhbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213279; c=relaxed/simple;
	bh=KoXnTTvKKbTVITUBoCqWNz2j5omol39ytBAPwuFUicw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V8w7+oDFbsJ7bjD+6HzO4CWYQ5rn4QHjvnq0NPr1KUjDaa6XEOFjT0Y9j9MdBO61tiNHTHK6BnkOBBRCqOWFOCGFpwwahK6Fb5GrWdksqdFfngU0KoJGVLNYpmVAdlsZQKrLedOcgcaCoY3rfDcSJYvOi9ck5PwrzvzdVCYgnsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o/HqErLW; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o/HqErLW"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7lpF2755821
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213267;
	bh=NqMCLBjr01kU/bl5NRhutDtfMj9xfCr/kPkKJKIFGGY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o/HqErLWUjrbuTKkOYsaHeA3amfIYsmN9BQBiC19B2wZ8HeKD+0Fm2qezDF++9k39
	 B/0++aV8ozCb5ubZHEv/7anBbzH3mNbaGK8XE8A3Art25vUdk0R7Voe68AwxcHBSYi
	 hK84piQAM9o+mJvOMWm9vgxT4lHn+eVg4PrQnX/o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7ldW124360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:07:47 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:46 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKH060901;
	Mon, 17 Mar 2025 07:07:43 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 20/26] remoteproc: k3: Refactor .detach rproc ops into common driver
Date: Mon, 17 Mar 2025 17:36:16 +0530
Message-ID: <20250317120622.1746415-21-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317120622.1746415-1-b-padhi@ti.com>
References: <20250317120622.1746415-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The .detach rproc ops implementations in TI K3 R5, DSP and M4
remoteproc drivers are NOPs. Refactor the implementations into
ti_k3_common.c driver as k3_rproc_detach() and align R5, DSP and M4
drivers to register this common function as .detach ops.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 10 ++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 11 +----------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 14 +-------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 11 +----------
 5 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 9e80d4da0d43..84e263f159a0 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -309,5 +309,15 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
 int k3_rproc_attach(struct rproc *rproc) { return 0; }
 EXPORT_SYMBOL_GPL(k3_rproc_attach);
 
+/*
+ * Detach from a running remote processor (IPC-only mode)
+ *
+ * The rproc detach callback is a NOP. The remote processor is not stopped and
+ * will be left in booted state in IPC-only mode. This callback is invoked only
+ * in IPC-only mode and exists for sanity sake
+ */
+int k3_rproc_detach(struct rproc *rproc) { return 0; }
+EXPORT_SYMBOL_GPL(k3_rproc_detach);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 93f41ee41505..97345349b818 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -98,4 +98,5 @@ int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
 int k3_rproc_stop(struct rproc *rproc);
 int k3_rproc_attach(struct rproc *rproc);
+int k3_rproc_detach(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index d7ae4b202f92..dd81bcc8e1e4 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -58,15 +58,6 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * Detach from a running DSP remote processor (IPC-only mode)
- *
- * This rproc detach callback is a NOP. The DSP core is not stopped and will be
- * left to continue to run its booted firmware. This callback is invoked only in
- * IPC-only mode and exists for sanity sake.
- */
-static int k3_dsp_rproc_detach(struct rproc *rproc) { return 0; }
-
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
  * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
@@ -162,6 +153,7 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start		= k3_dsp_rproc_start,
 	.stop		= k3_rproc_stop,
 	.attach		= k3_rproc_attach,
+	.detach		= k3_rproc_detach,
 	.kick		= k3_rproc_kick,
 	.da_to_va	= k3_dsp_rproc_da_to_va,
 };
@@ -387,7 +379,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
 		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->detach = k3_dsp_rproc_detach;
 		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
 	} else {
 		dev_info(dev, "configured DSP for remoteproc mode\n");
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index b52a1014c934..accf8b9aea6e 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,25 +244,13 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Detach from a running M4 remote processor (IPC-only mode)
- *
- * This rproc detach callback performs the opposite operation to attach
- * callback, the M4 core is not stopped and will be left to continue to
- * run its booted firmware. This callback is invoked only in IPC-only mode.
- */
-static int k3_m4_rproc_detach(struct rproc *rproc)
-{
-	return 0;
-}
-
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
 	.start = k3_rproc_start,
 	.stop = k3_rproc_stop,
 	.attach = k3_rproc_attach,
-	.detach = k3_m4_rproc_detach,
+	.detach = k3_rproc_detach,
 	.kick = k3_rproc_kick,
 	.da_to_va = k3_m4_rproc_da_to_va,
 	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index fe1bc3a74b09..a17c4b5418ae 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -559,15 +559,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * Detach from a running R5F remote processor (IPC-only mode)
- *
- * The R5F detach callback is a NOP. The R5F cores are not stopped and will be
- * left in booted state in IPC-only mode. This callback is invoked only in
- * IPC-only mode and exists for sanity sake.
- */
-static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
-
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
  * to provide the resource table for the booted R5F in IPC-only mode. The K3 R5F
@@ -1049,7 +1040,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 		kproc->rproc->ops->start = NULL;
 		kproc->rproc->ops->stop = NULL;
 		kproc->rproc->ops->attach = k3_rproc_attach;
-		kproc->rproc->ops->detach = k3_r5_rproc_detach;
+		kproc->rproc->ops->detach = k3_rproc_detach;
 		kproc->rproc->ops->get_loaded_rsc_table =
 						k3_r5_get_loaded_rsc_table;
 	} else if (!c_state) {
-- 
2.34.1

