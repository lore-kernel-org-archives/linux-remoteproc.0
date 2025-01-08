Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E8E1A83F8;
	Wed,  8 Jan 2025 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736318277; cv=none; b=GE12fLipaoecLeO6r2wsJPEDrUu6K+/KNC0zzroD2t6fgsUAb8723JnyMJQVVdgTtyedIQSvMiv4EJjay1iB8S4rck++0EGtUJtFVPv0imy5MKpnaofSqUyikYnzf72dppC7VqqgIYYlNHOV8QBQGe+oX1fiECHV8oy3BR5Nyp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736318277; c=relaxed/simple;
	bh=/kJLj+zEHFc+Er7tcSHChdrepI8ZQEsQJv95T3c6mmQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DyLb0I4hNDyBzMmgNqVep0/DwjgEIW4GNHgep3HYL60BYJ0EquhGjXvmK0jlUT3w9zws2KKXMbeSwUlUXbpz9jrmZmL/PXT4pqFmbWhaV8XOuKKs1e3F1BJ7lCOOD3EXOxrbPgXX0CsG7jL3Iu/sM8c0jGTlYK8kZO1ZBPKYCa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nahnqmoH; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nahnqmoH"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5086beG72686708
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 00:37:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736318260;
	bh=8IaSlyvOaTrReoYpUIP6cJTPR7qVa76kKOyumvMH8Ac=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nahnqmoHIlRc13fV3oR9ifVbL/+zxq37rWVr2m3KOCSgzQkl/UcYnzl7ibg84if4A
	 k32VqIPSts5PoKQf5VgnlgEM9C5Yrmoaq8cRNx5mj8Q29G+g+39pov8KFJHwKt/aqU
	 UKXwNzfzst9nndp5PeznmUXWvBkCRyHtL3mCi2fE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5086beRf027060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 00:37:40 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 00:37:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 00:37:39 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5086bSPf127347;
	Wed, 8 Jan 2025 00:37:36 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] remoteproc: k3-dsp: Fix checks in k3_dsp_rproc_{mbox_callback/kick}
Date: Wed, 8 Jan 2025 12:07:26 +0530
Message-ID: <20250108063727.1416324-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108063727.1416324-1-b-padhi@ti.com>
References: <20250108063727.1416324-1-b-padhi@ti.com>
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
To resolve this, a new variable, "is_attached", is introduced to
distinguish between core states: when a core is actually detached and
when it is in the process of being attached. The callbacks are updated
to return early only if the core is actually detached and not during an
ongoing attach operation in IPC-only mode.

Reported-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Closes: https://lore.kernel.org/all/20240916083131.2801755-1-s-vadapalli@ti.com/
Fixes: ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during probe routine")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
Link to v1:
https://lore.kernel.org/all/20241224091457.1050233-3-b-padhi@ti.com/

v2: Changelog:
1. Changed variable name "is_attached_ongoing" to "is_attached". [Udit]
2. Improved comments.
3. Carried R/B tag from V1.

Link to RFC version:
https://lore.kernel.org/all/20240916083131.2801755-1-s-vadapalli@ti.com/

Improvements in v1:
1. Ensured these mbox callbacks are functional when the core is in the proccess
of getting attached in IPC-Only mode.
2. Ensured these mbox callbacks are _not_ functional when the core state is
actually detached.

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 63 ++++++++++++++++++-----
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a695890254ff..718d07f0180e 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -76,6 +76,7 @@ struct k3_dsp_dev_data {
  * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
+ * @is_attached: Indicates whether core is attached from the k3-dsp driver's POV
  */
 struct k3_dsp_rproc {
 	struct device *dev;
@@ -91,6 +92,7 @@ struct k3_dsp_rproc {
 	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
+	bool is_attached;
 };
 
 /**
@@ -115,8 +117,16 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
 
-	/* Do not forward messages from a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
+	/*
+	 * Do not forward messages from a detached core, except when the core
+	 * is transitioning to the attached state in IPC-only mode.
+	 *
+	 * In IPC-only mode, the default rproc state is "RPROC_DETACHED." To
+	 * distinguish between an actually detached core and one in transition,
+	 * use the "is_attached" flag, which is set once the driver's internal
+	 * attach() operations start.
+	 */
+	if (!kproc->is_attached && kproc->rproc->state == RPROC_DETACHED)
 		return;
 
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
@@ -159,8 +169,16 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
 
-	/* Do not forward messages to a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
+	/*
+	 * Do not forward messages to a detached core, except when the core
+	 * is transitioning to the attached state in IPC-only mode.
+	 *
+	 * In IPC-only mode, the default rproc state is "RPROC_DETACHED." To
+	 * distinguish between an actually detached core and one in transition,
+	 * use the "is_attached" flag, which is set once the driver's internal
+	 * attach() operations start.
+	 */
+	if (!kproc->is_attached && kproc->rproc->state == RPROC_DETACHED)
 		return;
 
 	/* send the index of the triggered virtqueue in the mailbox payload */
@@ -357,22 +375,39 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 /*
  * Attach to a running DSP remote processor (IPC-only mode)
  *
- * This rproc attach callback is a NOP. The remote processor is already booted,
- * and all required resources have been acquired during probe routine, so there
- * is no need to issue any TI-SCI commands to boot the DSP core. This callback
- * is invoked only in IPC-only mode and exists because rproc_validate() checks
- * for its existence.
+ * This rproc attach callback only needs to set the "is_attached" flag to
+ * notify k3_dsp_rproc_{kick/mbox_callback} functions that the core is attached
+ * from the k3-dsp driver's POV. The remote processor is already booted, and all
+ * required resources have been acquired during probe routine, so there is no
+ * need to issue any TI-SCI commands to boot the DSP core. This callback is
+ * invoked only in IPC-only mode.
  */
-static int k3_dsp_rproc_attach(struct rproc *rproc) { return 0; }
+static int k3_dsp_rproc_attach(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+
+	kproc->is_attached = true;
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
+ * and only needs to clear the "is_attached" flag to ensure no mailbox
+ * messages are sent to or received from a detached core. The DSP core is not
+ * stopped and will be left to continue to run its booted firmware. This callback
+ * is invoked only in IPC-only mode.
  */
-static int k3_dsp_rproc_detach(struct rproc *rproc) { return 0; }
+static int k3_dsp_rproc_detach(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+
+	kproc->is_attached = false;
+
+	return 0;
+}
 
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
-- 
2.34.1

