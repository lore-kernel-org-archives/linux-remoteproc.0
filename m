Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D207113E889;
	Tue,  4 Jun 2024 05:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478258; cv=none; b=n5JvDuR82ePfmtMjInmn9/Q5CVjuiSb2xWb6RlIezPeyZRsMUPbxne24VPNWkdwHLw+ydgCEvyoFx3go8DtNVCCuej0Lycr8VWr2NhyPQ1baZFaOfQWNj2NEK7sJkmld6TaPaKv65S+oxLDIHt3vZJlyQ9Lipl5ctIIrm5Aq3U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478258; c=relaxed/simple;
	bh=W2iEjcFYtXzerO3EH+gdpbcprbbOo+m+rW84e0VkCv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOSOgxqKhy1BJ/b/bNVcb0+OXkye+GDK+cWLOnrOMrtAdXbwSqLEw1EJxaKeUzbFaGc365kSeg6U7Ymx+TxplbA0wA5BrVBEU0eloZTZF5x29X1RgQlgb4yGNPfIrrIE7wN/yd59v4NE5id1oaHO+kmQgfHJULMLI7Bi025qwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PYpJgGPh; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PYpJgGPh"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4545HVhl027642;
	Tue, 4 Jun 2024 00:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717478251;
	bh=oGNFW8urZYGvXmeyzMPgcUlOPOBsELbnI0ttsaEICK4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PYpJgGPhPspyi6fLcrtUnae4p52p6axKjTBsn/slRurXo44IGTzID5sJgLh6pMeWu
	 4DEyI7FLsTbyqJU7SJ2Q8wd8Cmi1vHqSWTaDEUUi3A7IMjXlcq1q/IQY2bEmf3BzGr
	 qYPyNFlozA/ecXZP/cG9mxSyjqeMwTvsyadnTpO4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4545HV2t024835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 00:17:31 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 00:17:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 00:17:30 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4545HNG6067975;
	Tue, 4 Jun 2024 00:17:28 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] remoteproc: k3-r5: Acquire mailbox handle during probe
Date: Tue, 4 Jun 2024 10:47:21 +0530
Message-ID: <20240604051722.3608750-3-b-padhi@ti.com>
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
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 74 +++++++++---------------
 1 file changed, 26 insertions(+), 48 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 26362a509ae3c..7e02e3472ce25 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -194,6 +194,10 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
 
+	/* Do not forward message to a detached core */
+	if (kproc->rproc->state == RPROC_DETACHED)
+		return;
+
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
 	switch (msg) {
@@ -399,12 +403,9 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
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
@@ -552,10 +553,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	u32 boot_addr;
 	int ret;
 
-	ret = k3_r5_rproc_request_mbox(rproc);
-	if (ret)
-		return ret;
-
 	boot_addr = rproc->bootaddr;
 	/* TODO: add boot_addr sanity checking */
 	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
@@ -564,7 +561,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	core = kproc->core;
 	ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
 	if (ret)
-		goto put_mbox;
+		return ret;
 
 	/* unhalt/run all applicable cores */
 	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
@@ -580,13 +577,12 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
 			dev_err(dev, "%s: can not start core 1 before core 0\n",
 				__func__);
-			ret = -EPERM;
-			goto put_mbox;
+			return -EPERM;
 		}
 
 		ret = k3_r5_core_run(core);
 		if (ret)
-			goto put_mbox;
+			return ret;
 	}
 
 	return 0;
@@ -596,8 +592,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 		if (k3_r5_core_halt(core))
 			dev_warn(core->dev, "core halt back failed\n");
 	}
-put_mbox:
-	mbox_free_channel(kproc->mbox);
 	return ret;
 }
 
@@ -658,8 +652,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 			goto out;
 	}
 
-	mbox_free_channel(kproc->mbox);
-
 	return 0;
 
 unroll_core_halt:
@@ -674,42 +666,22 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 /*
  * Attach to a running R5F remote processor (IPC-only mode)
  *
- * The R5F attach callback only needs to request the mailbox, the remote
- * processor is already booted, so there is no need to issue any TI-SCI
- * commands to boot the R5F cores in IPC-only mode. This callback is invoked
- * only in IPC-only mode.
+ * The R5F attach callback is a NOP. The remote processor is already booted, and
+ * all required resources have been acquired during probe routine, so there is
+ * no need to issue any TI-SCI commands to boot the R5F cores in IPC-only mode.
+ * This callback is invoked only in IPC-only mode and exists because
+ * rproc_validate() checks for its existence.
  */
-static int k3_r5_rproc_attach(struct rproc *rproc)
-{
-	struct k3_r5_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	ret = k3_r5_rproc_request_mbox(rproc);
-	if (ret)
-		return ret;
-
-	dev_info(dev, "R5F core initialized in IPC-only mode\n");
-	return 0;
-}
+static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
 
 /*
  * Detach from a running R5F remote processor (IPC-only mode)
  *
- * The R5F detach callback performs the opposite operation to attach callback
- * and only needs to release the mailbox, the R5F cores are not stopped and
- * will be left in booted state in IPC-only mode. This callback is invoked
- * only in IPC-only mode.
+ * The R5F detach callback is a NOP. The R5F cores are not stopped and will be
+ * left in booted state in IPC-only mode. This callback is invoked only in
+ * IPC-only mode and exists for sanity sake.
  */
-static int k3_r5_rproc_detach(struct rproc *rproc)
-{
-	struct k3_r5_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-
-	mbox_free_channel(kproc->mbox);
-	dev_info(dev, "R5F core deinitialized in IPC-only mode\n");
-	return 0;
-}
+static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
 
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
@@ -1277,6 +1249,10 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		kproc->rproc = rproc;
 		core->rproc = rproc;
 
+		ret = k3_r5_rproc_request_mbox(rproc);
+		if (ret)
+			return ret;
+
 		ret = k3_r5_rproc_configure_mode(kproc);
 		if (ret < 0)
 			goto err_config;
@@ -1393,6 +1369,8 @@ static void k3_r5_cluster_rproc_exit(void *data)
 			}
 		}
 
+		mbox_free_channel(kproc->mbox);
+
 		rproc_del(rproc);
 
 		k3_r5_reserved_mem_exit(kproc);
-- 
2.34.1

