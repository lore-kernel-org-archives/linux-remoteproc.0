Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC721B4C49;
	Wed,  7 Aug 2024 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723011793; cv=none; b=AKavRZKEv13pvShra8wK/18h+KHzOYWZv3M59LX5S2RNZGjs/Rorvuz//b/rb2YF/MOM6Ifffvb5bWQpWb+NA1+oIDuAvZgJfOfiSH1ixo6e2NuAZViwH/XWM9rYXL0erkB3hiXB5/+x1WOju8vEom40bnux75qOSdywKt8tEas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723011793; c=relaxed/simple;
	bh=cwyVha76L9dMRTlLZwe/e9rZ5SeYqrXCN4kBDltS0NU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjcrwrxxfSw0DA5e1//lWyHobyYrRrQ/dRFpsqe5H8UNkpkap0xDPknCyuPVyrfxMGcnD9VQYQ+vkJcRIknp+eM6jxu+UBwrw4GeM53npujF2wvNDyQbicOxMwSAj5JR5TL3VZKO/pKnMLWpW527Y4xn/C2VtRkazkXCXPAB2F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O072zYYX; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O072zYYX"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4776N8Ye039251;
	Wed, 7 Aug 2024 01:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723011788;
	bh=5MpBxrH+KUnTljjKnrw2P1OErwakV1TDMWAln66BLPQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O072zYYXQTVAO91Jco6HAHiFw7E7MfGarwaC0jfTQBAQEz+HhnCAA9t9XxFyXim6Y
	 RwyS+6/QlTcg6zUWEqHY93mKLKsLHZUmGKShRdn7t4j1SNVi17K7m9lp1xiHcE/0tr
	 1//bdIbzq31fkodpM7f4+/2ApMwoi6eqt09n2nfk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4776N8v2012953
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2024 01:23:08 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 01:23:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 01:23:07 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4776MvbS109450;
	Wed, 7 Aug 2024 01:23:05 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] remoteproc: k3-dsp: Acquire mailbox handle during probe routine
Date: Wed, 7 Aug 2024 11:52:56 +0530
Message-ID: <20240807062256.1721682-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807062256.1721682-1-b-padhi@ti.com>
References: <20240807062256.1721682-1-b-padhi@ti.com>
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

Fixes: b8431920391d ("remoteproc: k3-dsp: Add support for IPC-only mode for all K3 DSPs")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 80 +++++++++--------------
 1 file changed, 30 insertions(+), 50 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a22d41689a7d..9009367e2891 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -115,6 +115,10 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
 
+	/* Do not forward messages from a detached core */
+	if (kproc->rproc->state == RPROC_DETACHED)
+		return;
+
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
 	switch (msg) {
@@ -155,6 +159,10 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
 
+	/* Do not forward messages to a detached core */
+	if (kproc->rproc->state == RPROC_DETACHED)
+		return;
+
 	/* send the index of the triggered virtqueue in the mailbox payload */
 	ret = mbox_send_message(kproc->mbox, (void *)msg);
 	if (ret < 0)
@@ -230,12 +238,9 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
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
@@ -315,32 +320,23 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
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
 
 	dev_dbg(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
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
@@ -353,8 +349,6 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
 	struct k3_dsp_rproc *kproc = rproc->priv;
 
-	mbox_free_channel(kproc->mbox);
-
 	k3_dsp_rproc_reset(kproc);
 
 	return 0;
@@ -363,42 +357,22 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
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
@@ -697,6 +671,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	kproc->dev = dev;
 	kproc->data = data;
 
+	ret = k3_dsp_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
+
 	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
 	if (IS_ERR(kproc->ti_sci))
 		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
@@ -789,6 +767,8 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
 		if (ret)
 			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
 	}
+
+	mbox_free_channel(kproc->mbox);
 }
 
 static const struct k3_dsp_mem_data c66_mems[] = {
-- 
2.34.1

