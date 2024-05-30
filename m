Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0018396E;
	Thu, 30 May 2024 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060075; cv=none; b=CmzPcITBhqKmHGMESRTJ1IB65meInKRbCvGnO1LO7e0FHhrC3lxPn2FxGJ8rmpH3m3NqcwgseMjjhMMa217ymCDtX4JkFD8cscbXMuNjTtJOSGpEndbD63YQ5spAPfz7qOQiaRdDdl6NSdn66ZrM9JxfyMCCIvbVCEpcaY5ucMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060075; c=relaxed/simple;
	bh=5Y03twfQVgQmuNLj0UEmzZLgRbVlG6Rhm/xcpfzLatA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oA7tQZCVfNwh0yvBmtG8t+4zuX6VPT+r37NzlDcMOCLHA795WhRtXzA3RAWmat2IaZc6oBQi8pEfzNfPtzUfYrEJrmeYFLSLJAPSaN3Jogw6g+xQsJA+0JFp2m17lpO7AVXLWOuNIMDHc3R67Ndzwkr7fqBxlV3uKwOGcu1roT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=k5tc6uBQ; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k5tc6uBQ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44U97nMF024374;
	Thu, 30 May 2024 04:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717060069;
	bh=GJzDRdOQb8ekKWtlPjrGD6Uo4aZvHTZhxUEY0veqFBM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k5tc6uBQnu6igfTRs+SHCHrw9qXE3Pp96NUx3pWj5oh9Koa9kgZmwyEsBGDarmLMZ
	 sH4eo5cGXylY7f2i3+Ui2TRvspo1Co8tI3HjwTNHZbBCTPVDekdoVUwdHEFJvDEO2K
	 BQh9pWAYh+fBmSg3FFJEkTP6khEw5dwmAJ+py584=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44U97nf1111857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 May 2024 04:07:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 04:07:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 04:07:48 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44U97clp043154;
	Thu, 30 May 2024 04:07:46 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] remoteproc: k3-dsp: Acquire mailbox handle during probe routine
Date: Thu, 30 May 2024 14:37:37 +0530
Message-ID: <20240530090737.655054-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530090737.655054-1-b-padhi@ti.com>
References: <20240530090737.655054-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Acquire the mailbox handle during device probe and do not release handle
in stop/detach routine or error paths. This removes the redundant
requests for mbox handle later during rproc start/attach. This also
allows to defer remoteproc driver's probe if mailbox is not probed yet.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 67 +++++++----------------
 1 file changed, 21 insertions(+), 46 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 3555b535b168..88cda609a5eb 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -222,6 +222,7 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	int ret;
+	long err;
 
 	client->dev = dev;
 	client->tx_done = NULL;
@@ -231,10 +232,9 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 
 	kproc->mbox = mbox_request_channel(client, 0);
 	if (IS_ERR(kproc->mbox)) {
-		ret = -EBUSY;
-		dev_err(dev, "mbox_request_channel failed: %ld\n",
-			PTR_ERR(kproc->mbox));
-		return ret;
+		err = PTR_ERR(kproc->mbox);
+		dev_err(dev, "mbox_request_channel failed: %ld\n", err);
+		return (err == -EPROBE_DEFER) ? -EPROBE_DEFER : -EBUSY;
 	}
 
 	/*
@@ -315,31 +315,25 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	u32 boot_addr;
 	int ret;
 
-	ret = k3_dsp_rproc_request_mbox(rproc);
-	if (ret)
-		return ret;
-
 	boot_addr = rproc->bootaddr;
 	if (boot_addr & (kproc->data->boot_align_addr - 1)) {
 		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 0x%x boundary\n",
 			boot_addr, kproc->data->boot_align_addr);
 		ret = -EINVAL;
-		goto put_mbox;
+		goto out;
 	}
 
 	dev_err(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
 	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
 	if (ret)
-		goto put_mbox;
+		goto out;
 
 	ret = k3_dsp_rproc_release(kproc);
 	if (ret)
-		goto put_mbox;
+		goto out;
 
 	return 0;
-
-put_mbox:
-	mbox_free_channel(kproc->mbox);
+out:
 	return ret;
 }
 
@@ -353,8 +347,6 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
 	struct k3_dsp_rproc *kproc = rproc->priv;
 
-	mbox_free_channel(kproc->mbox);
-
 	k3_dsp_rproc_reset(kproc);
 
 	return 0;
@@ -363,42 +355,21 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 /*
  * Attach to a running DSP remote processor (IPC-only mode)
  *
- * This rproc attach callback only needs to request the mailbox, the remote
- * processor is already booted, so there is no need to issue any TI-SCI
- * commands to boot the DSP core. This callback is invoked only in IPC-only
- * mode.
+ * This rproc attach callback is a NOP. The remote processor is already booted,
+ * and all required resources have been acquired during probe routine, so there
+ * is no need to issue any TI-SCI commands to boot the DSP core. This callback
+ * is invoked only in IPC-only mode and exists for sanity sake.
  */
-static int k3_dsp_rproc_attach(struct rproc *rproc)
-{
-	struct k3_dsp_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	ret = k3_dsp_rproc_request_mbox(rproc);
-	if (ret)
-		return ret;
-
-	dev_info(dev, "DSP initialized in IPC-only mode\n");
-	return 0;
-}
+static int k3_dsp_rproc_attach(struct rproc *rproc) { return 0; }
 
 /*
  * Detach from a running DSP remote processor (IPC-only mode)
  *
- * This rproc detach callback performs the opposite operation to attach callback
- * and only needs to release the mailbox, the DSP core is not stopped and will
- * be left to continue to run its booted firmware. This callback is invoked only
- * in IPC-only mode.
+ * This rproc detach callback is a NOP. The DSP core is not stopped and will be
+ * left to continue to run its booted firmware. This callback is invoked only in
+ * IPC-only mode and exists for sanity sake.
  */
-static int k3_dsp_rproc_detach(struct rproc *rproc)
-{
-	struct k3_dsp_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-
-	mbox_free_channel(kproc->mbox);
-	dev_info(dev, "DSP deinitialized in IPC-only mode\n");
-	return 0;
-}
+static int k3_dsp_rproc_detach(struct rproc *rproc) { return 0; }
 
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
@@ -697,6 +668,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	kproc->dev = dev;
 	kproc->data = data;
 
+	ret = k3_dsp_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
+
 	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
 	if (IS_ERR(kproc->ti_sci))
 		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
-- 
2.34.1

