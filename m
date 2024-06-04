Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038767C6D5;
	Tue,  4 Jun 2024 05:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478259; cv=none; b=E5jqDhekt1j9rJdQgek1uN3urcln3O+/rjLNZKorxheNJEokOCxzR/seluPJj2uV4XHfPbEFPVoRphTaUQ6jgtEGKnfqUDJefy2Pt6niOSS5q0MW4HnY9wsiCgtKT4HpFo5VUtw5A9hevL7rfcxCXSX6EMX7gFRldxWKFQ9tVW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478259; c=relaxed/simple;
	bh=GwkCMWw3oi8gTTSHVAmKy7neG48Qxgizk9BHVwaSCdA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NV7h4AYU7+Lj13OdxtKt6C0Lu1jO2AWoWw27PS0bqVTnNTZqX8YjDTZX+L9XQF1InrYjel2xmG4EjRpSgU0ZbS0eSYCsUcm1cbB9c0ZaIcxUC6W6fH2MGY2k4Bh2GDwMT/ZILiLhrkdWIcMBTfWLjaj8y502JQ8d9fLtfzTM98o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mGOOiSfX; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mGOOiSfX"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4545HXCn041088;
	Tue, 4 Jun 2024 00:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717478253;
	bh=0c0FIMvUv+8QpYHCEqlth87kUQCKC2xRbuBUQx70Jz8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mGOOiSfXlTZFIEWaJN8dUo9xe5lksBZ9m+dCeI07s0xo8nt3vSmZD7BWlse4lFJnN
	 gGPVwA0fJr2dbVxrg/XFE6azdQb6BGU74NtotRyFFN4l8bs10CCHvcIavZ8WYLLP1S
	 kRZ5Eto2DC30SdBJZdNdm1hrHVaBg+/++8ZZWJUQ=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4545HXAh031550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 00:17:33 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 00:17:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 00:17:33 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4545HNG7067975;
	Tue, 4 Jun 2024 00:17:31 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] remoteproc: k3-dsp: Acquire mailbox handle during probe routine
Date: Tue, 4 Jun 2024 10:47:22 +0530
Message-ID: <20240604051722.3608750-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604051722.3608750-1-b-padhi@ti.com>
References: <20240604051722.3608750-1-b-padhi@ti.com>
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
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 76 ++++++++---------------
 1 file changed, 26 insertions(+), 50 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 3555b535b1683..edaa5e91aebe9 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -115,6 +115,10 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
 
+	/* Do not forward messages to a detached core */
+	if (kproc->rproc->state == RPROC_DETACHED)
+		return;
+
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
 	switch (msg) {
@@ -230,12 +234,9 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 	client->knows_txdone = false;
 
 	kproc->mbox = mbox_request_channel(client, 0);
-	if (IS_ERR(kproc->mbox)) {
-		ret = -EBUSY;
-		dev_err(dev, "mbox_request_channel failed: %ld\n",
-			PTR_ERR(kproc->mbox));
-		return ret;
-	}
+	if (IS_ERR(kproc->mbox))
+		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
+				     "mbox_request_channel failed\n");
 
 	/*
 	 * Ping the remote processor, this is only for sanity-sake for now;
@@ -315,32 +316,23 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
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
-		ret = -EINVAL;
-		goto put_mbox;
+		return -EINVAL;
 	}
 
 	dev_err(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
 	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
 	if (ret)
-		goto put_mbox;
+		return ret;
 
 	ret = k3_dsp_rproc_release(kproc);
 	if (ret)
-		goto put_mbox;
+		return ret;
 
 	return 0;
-
-put_mbox:
-	mbox_free_channel(kproc->mbox);
-	return ret;
 }
 
 /*
@@ -353,8 +345,6 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
 	struct k3_dsp_rproc *kproc = rproc->priv;
 
-	mbox_free_channel(kproc->mbox);
-
 	k3_dsp_rproc_reset(kproc);
 
 	return 0;
@@ -363,42 +353,22 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
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
+ * is invoked only in IPC-only mode and exists because rproc_validate() checks
+ * for its existence.
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
@@ -697,6 +667,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	kproc->dev = dev;
 	kproc->data = data;
 
+	ret = k3_dsp_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
+
 	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
 	if (IS_ERR(kproc->ti_sci))
 		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
@@ -789,6 +763,8 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
 		if (ret)
 			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
 	}
+
+	mbox_free_channel(kproc->mbox);
 }
 
 static const struct k3_dsp_mem_data c66_mems[] = {
-- 
2.34.1

