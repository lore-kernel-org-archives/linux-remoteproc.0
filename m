Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED4C17B502;
	Tue, 24 Dec 2024 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735031718; cv=none; b=gcB95PjKR8I2ya16K/5TVL+IML9qVxZ2wReJCR6XdLlna2hc79UGn9FESZ/swa7YbTrcebaxVPVNRkcLkkQ1CToXCSitowV8IKMXF89xFevyadut3c/+qo+X1THmvTOLmkVrwYH9UdUwAKSVqUFe4SQraEQ6yndYpycjjP8+/Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735031718; c=relaxed/simple;
	bh=Xf2rpMNPHMrDMsqZVvYf1yNrWrUImkrEGU02UX2BKew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0w6ydzhqWARny2NLwwiKMMBPOMIjvNL0/mlrY0uG7Ejm71cTMSMOvJ4PWezT1mTY8S2ssBvqtiY0oSeFHv/X+fNxYYy9HwYYEYTLrCHGL69JFz/2Ebbg4UZxistIFJtL23SRHd/nErnd3B4hRJ8gSkHc8/6XsjZx2uz256RGHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wBTtIGNR; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wBTtIGNR"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BO9F6Sx090028;
	Tue, 24 Dec 2024 03:15:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735031706;
	bh=N7dEHIlkPhOXSw55ptrJ18hKjU3yz9AbtMvzYi/ad6A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wBTtIGNRdHqETsu0W2ZPbRrHqSzC8DwreyY1yJ9B9XE64ywzQ15WGXIaGYRu6Ta79
	 mEO4L9TnYqVh7trHMdZgaGY++FIokn2LWT3X2KvsL8RwONTAhZHNVoGFhSGW5tEWQ+
	 XPJWbJZMp6P0+mkChoYaGaM5VZ5yz8rkfJwINhmU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BO9F6Rq003275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Dec 2024 03:15:06 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 24
 Dec 2024 03:15:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 24 Dec 2024 03:15:06 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BO9EwEP123859;
	Tue, 24 Dec 2024 03:15:02 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] remoteproc: k3-r5: Fix checks in k3_r5_rproc_{mbox_callback/kick}
Date: Tue, 24 Dec 2024 14:44:55 +0530
Message-ID: <20241224091457.1050233-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224091457.1050233-1-b-padhi@ti.com>
References: <20241224091457.1050233-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()"
and "k3_r5_rproc_kick()" callbacks to exit if the remote core's state
was "RPROC_DETACHED". However, this caused issues in IPC-only mode, as
the default state of the core is set to "RPROC_DETACHED", and the
transition to "RPROC_ATTACHED" happens only after the "__rproc_attach()"
function has invoked "rproc_start_subdevices()".

The "rproc_start_subdevices()" function triggers the probe of Virtio
RPMsg subdevices, which require the mailbox callbacks to be functional.
To resolve this, a new variable, "is_attach_ongoing", is introduced to
distinguish between core states: when a core is actually detached and
when it is in the process of being attached. The callbacks are updated
to return early only if the core is actually detached and not during an
ongoing attach operation in IPC-only mode.

Reported-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Closes: https://lore.kernel.org/all/20240916083131.2801755-1-s-vadapalli@ti.com/
Fixes: f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during probe routine")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Link to RFC version:
https://lore.kernel.org/all/20240916083131.2801755-1-s-vadapalli@ti.com/

Improvements in v1:
1. Ensured these mbox callbacks are functional when the core is in the proccess
of getting attached in IPC-Only mode.
2. Ensured these mbox callbacks are _not_ functional when the core state is
actually detached.

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 53 +++++++++++++++++-------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index dbc513c5569c..e218a803fdb5 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -131,6 +131,7 @@ struct k3_r5_cluster {
  * @btcm_enable: flag to control BTCM enablement
  * @loczrama: flag to dictate which TCM is at device address 0x0
  * @released_from_reset: flag to signal when core is out of reset
+ * @is_attach_ongoing: flag to indicate if IPC-only "attach()" is in progress
  */
 struct k3_r5_core {
 	struct list_head elem;
@@ -148,6 +149,7 @@ struct k3_r5_core {
 	u32 btcm_enable;
 	u32 loczrama;
 	bool released_from_reset;
+	bool is_attach_ongoing;
 };
 
 /**
@@ -194,8 +196,11 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
 
-	/* Do not forward message from a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
+	/*
+	 * Do not forward messages from a detached core, except when the core
+	 * is in the process of being attached in IPC-only mode.
+	 */
+	if (!kproc->core->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
 		return;
 
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
@@ -233,8 +238,11 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
 
-	/* Do not forward message to a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
+	/*
+	 * Do not forward messages to a detached core, except when the core is
+	 * in the process of being attached in IPC-only mode.
+	 */
+	if (!kproc->core->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
 		return;
 
 	/* send the index of the triggered virtqueue in the mailbox payload */
@@ -671,22 +679,39 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 /*
  * Attach to a running R5F remote processor (IPC-only mode)
  *
- * The R5F attach callback is a NOP. The remote processor is already booted, and
- * all required resources have been acquired during probe routine, so there is
- * no need to issue any TI-SCI commands to boot the R5F cores in IPC-only mode.
- * This callback is invoked only in IPC-only mode and exists because
- * rproc_validate() checks for its existence.
+ * The R5F attach callback only needs to set the "is_attach_ongoing" flag to
+ * notify k3_r5_rproc_{kick/mbox_callback} functions that the core is in the
+ * process of getting attached in IPC-only mode. The remote processor is
+ * already booted, and all required resources have been acquired during probe
+ * routine, so there is no need to issue any TI-SCI commands to boot the R5F
+ * cores in IPC-only mode. This callback is invoked only in IPC-only mode.
  */
-static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
+static int k3_r5_rproc_attach(struct rproc *rproc)
+{
+	struct k3_r5_rproc *kproc = rproc->priv;
+
+	kproc->core->is_attach_ongoing = true;
+
+	return 0;
+}
 
 /*
  * Detach from a running R5F remote processor (IPC-only mode)
  *
- * The R5F detach callback is a NOP. The R5F cores are not stopped and will be
- * left in booted state in IPC-only mode. This callback is invoked only in
- * IPC-only mode and exists for sanity sake.
+ * The R5F detach callback performs the opposite operation to attach callback
+ * and only needs to clear the "is_attach_ongoing" flag to ensure no mailbox
+ * messages are sent to or received from a detached core. The R5F cores are
+ * not stopped and will be left in booted state in IPC-only mode. This
+ * callback is invoked only in IPC-only mode.
  */
-static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
+static int k3_r5_rproc_detach(struct rproc *rproc)
+{
+	struct k3_r5_rproc *kproc = rproc->priv;
+
+	kproc->core->is_attach_ongoing = false;
+
+	return 0;
+}
 
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
-- 
2.34.1

