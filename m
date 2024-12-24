Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558A37160;
	Tue, 24 Dec 2024 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735031727; cv=none; b=cbIRF0xVXugQ4vPGk4e0rwXf7/0mlh1ETJREMoxk2NYgGJqPL+w3FAQgBZoEJv36HC1tTLMFz30SuYn25u/95zzXwDq0p4CJS7lAwuR0PMvFXVJzNlyaDPT5doWisESiKdxINIGJiW25avDOdAzJwnfwP/xNxBdSDyZXsXSMMRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735031727; c=relaxed/simple;
	bh=8ZXBK1+5KLS/LM1KAgC3vJADjfQZrNyS9FvHEsFThB0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oi0n9o0hDR5MOEtM/UhwPkppVyAicbFJrqvGaMjXnPjFp9HANV6tQNErzYOpV1WnpmfQgh3O5d+KSOBJ4To0K6JGWTkKOCeRCGTO8oZ8wdSyAbpZj8BOQnk1RHGIYStesR2TqIoDzz/QBECG5mAsMCfgqFYktQmUqwm+mJfhbbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JZspnzfw; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JZspnzfw"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BO9FAUK697349
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 24 Dec 2024 03:15:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735031710;
	bh=RF5eDGPoNO+tDfEdi/lRyTC1UHzMrOEs2/BqBdNG15g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JZspnzfwk72bE4x/ZdjCmc7A7LI7JbRXLH9OiUIvRPG4vOVD/VL602CMsAb5siFC3
	 nHRVePyMwMiwTA0CABtQV4ArRZzxgmonXyf7W4MBX4qPr23ty+q16lyrf64eBm82Zq
	 wI5O1mSpe9VLYvhK+KsrKkooV+NSqwABxH2rv28E=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BO9FAj6041198;
	Tue, 24 Dec 2024 03:15:10 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 24
 Dec 2024 03:15:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 24 Dec 2024 03:15:10 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BO9EwEQ123859;
	Tue, 24 Dec 2024 03:15:06 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] remoteproc: k3-dsp: Fix checks in k3_dsp_rproc_{mbox_callback/kick}
Date: Tue, 24 Dec 2024 14:44:56 +0530
Message-ID: <20241224091457.1050233-3-b-padhi@ti.com>
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

Commit ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during
probe routine") introduced a check in the "k3_dsp_rproc_mbox_callback()"
and "k3_dsp_rproc_kick()" callbacks to exit if the remote core's state
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
Fixes: ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during probe routine")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Link to RFC version:
https://lore.kernel.org/all/20240916083131.2801755-1-s-vadapalli@ti.com/

Improvements in v1:
1. Ensured these mbox callbacks are functional when the core is in the proccess
of getting attached in IPC-Only mode.
2. Ensured these mbox callbacks are _not_ functional when the core state is
actually detached.

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 53 +++++++++++++++++------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a695890254ff..f20fc2db077b 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -76,6 +76,7 @@ struct k3_dsp_dev_data {
  * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
+ * @is_attach_ongoing: flag to indicate if IPC-only "attach()" is in progress
  */
 struct k3_dsp_rproc {
 	struct device *dev;
@@ -91,6 +92,7 @@ struct k3_dsp_rproc {
 	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
+	bool is_attach_ongoing;
 };
 
 /**
@@ -115,8 +117,11 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
 
-	/* Do not forward messages from a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
+	/*
+	 * Do not forward messages from a detached core, except when the core
+	 * is in the process of being attached in IPC-only mode.
+	 */
+	if (!kproc->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
 		return;
 
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
@@ -159,8 +164,11 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
 
-	/* Do not forward messages to a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
+	/*
+	 * Do not forward messages to a detached core, except when the core is
+	 * in the process of being attached in IPC-only mode.
+	 */
+	if (!kproc->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
 		return;
 
 	/* send the index of the triggered virtqueue in the mailbox payload */
@@ -357,22 +365,39 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 /*
  * Attach to a running DSP remote processor (IPC-only mode)
  *
- * This rproc attach callback is a NOP. The remote processor is already booted,
- * and all required resources have been acquired during probe routine, so there
- * is no need to issue any TI-SCI commands to boot the DSP core. This callback
- * is invoked only in IPC-only mode and exists because rproc_validate() checks
- * for its existence.
+ * This rproc attach callback only needs to set the "is_attach_ongoing" flag to
+ * notify k3_dsp_rproc_{kick/mbox_callback} functions that the core is in the
+ * process of getting attached in IPC-only mode. The remote processor is already
+ * booted, and all required resources have been acquired during probe routine,
+ * so there is no need to issue any TI-SCI commands to boot the DSP core. This
+ * callback is invoked only in IPC-only mode.
  */
-static int k3_dsp_rproc_attach(struct rproc *rproc) { return 0; }
+static int k3_dsp_rproc_attach(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+
+	kproc->is_attach_ongoing = true;
+
+	return 0;
+}
 
 /*
  * Detach from a running DSP remote processor (IPC-only mode)
  *
- * This rproc detach callback is a NOP. The DSP core is not stopped and will be
- * left to continue to run its booted firmware. This callback is invoked only in
- * IPC-only mode and exists for sanity sake.
+ * This rproc detach callback performs the opposite operation to attach callback
+ * and only needs to clear the "is_attach_ongoing" flag to ensure no mailbox
+ * messages are sent to or received from a detached core. The DSP core is not
+ * stopped and will be left to continue to run its booted firmware. This callback
+ * is invoked only in IPC-only mode.
  */
-static int k3_dsp_rproc_detach(struct rproc *rproc) { return 0; }
+static int k3_dsp_rproc_detach(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+
+	kproc->is_attach_ongoing = false;
+
+	return 0;
+}
 
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
-- 
2.34.1

