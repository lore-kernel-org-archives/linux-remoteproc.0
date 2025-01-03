Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B451B0F15;
	Fri,  3 Jan 2025 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899172; cv=none; b=jTZmkVop5te6Ua8yQMnm0s9nshrD2lfvHC3KzZRrMHo/+Vi4Zbgyb0X89zqH/fQOgV3g7DsJE9qBmW0s/RSl2ipsu8dS8TqqpP0dkvMpkGA1urtCGpUQNocv4fwl/SYxi1iDLi9dwIKxr1VJuDrWKLhMqZQ7vAcRB2E9XGEWoDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899172; c=relaxed/simple;
	bh=/29MSFbPgQUCCFm0c37xVaMkx8k9/eU3gI33n/h0gt4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqjmGPT/ZG71OjHZM8CjSZk9CgKOKAdznYpkyEi9y6ppyk20+hHO6+Yb9YJVufpTh9g9CaspXgEel9dGjsFPSFiE7Kb810aBU3UfFfq72lV2po2wwHim7gRzDlTNa/T94rz1htH36F6o74/dNxWo5+zqlxU8J0yaHiBeb3asCbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TNpyyh82; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TNpyyh82"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ACewc2382517
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 04:12:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899160;
	bh=SPoqV2eDb292uZt8eTSHqRtT4vsMfk16uFTNAa5m4co=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TNpyyh82fBMrKT8wBJcHqYqFaSciimkdDZt5ZehgX0HCwUC6q2iPgz48YATSzqs0a
	 wZOZ92VmaBT56Uw5pi1tqvfr1W3IWLfy9BqCOpg2wWwLqlVJJIgguAeyO/s7i/Tx7C
	 c/ONIhbU5kbqLuGpgD/FtQAtf/y5SjA1lCYxAJIg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503ACe0d112225
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:12:40 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:12:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:12:39 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSJ126047;
	Fri, 3 Jan 2025 04:12:36 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 01/20] remoteproc: k3-m4: Prevent Mailbox level IPC with detached core
Date: Fri, 3 Jan 2025 15:42:12 +0530
Message-ID: <20250103101231.1508151-2-b-padhi@ti.com>
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

Inter-Processor Communication is facilitated through mailbox payloads,
which typically contains the index of the triggered virtqueue having the
actual data to be consumed, but the payload can also be used for trivial
communication, like sending an echo message or notifying a crash etc.
When the core is detached, the virtqueues are freed, and thus the Virtio
level IPC is not functional. However, Mailbox IPC is still possible with
trivial payloads.

Therefore, introduce checks in k3_m4_rproc_kick() and
k3_m4_rproc_mbox_callback() functions to return early without parsing
the payload when core is detached, and is not undergoing an attach
operation in IPC-only mode.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_m4_remoteproc.c | 41 ++++++++++++++++++++----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index a16fb165fced..3201c3684a86 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -50,6 +50,7 @@ struct k3_m4_rproc_mem_data {
 /**
  * struct k3_m4_rproc - k3 remote processor driver structure
  * @dev: cached device pointer
+ * @rproc: remoteproc device handle
  * @mem: internal memory regions data
  * @num_mems: number of internal memory regions
  * @rmem: reserved memory regions data
@@ -60,9 +61,11 @@ struct k3_m4_rproc_mem_data {
  * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
+ * @is_attach_ongoing: flag to indicate if IPC-only "attach()" is in progress
  */
 struct k3_m4_rproc {
 	struct device *dev;
+	struct rproc *rproc;
 	struct k3_m4_rproc_mem *mem;
 	int num_mems;
 	struct k3_m4_rproc_mem *rmem;
@@ -73,6 +76,7 @@ struct k3_m4_rproc {
 	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
+	bool is_attach_ongoing;
 };
 
 /**
@@ -93,8 +97,16 @@ static void k3_m4_rproc_mbox_callback(struct mbox_client *client, void *data)
 {
 	struct device *dev = client->dev;
 	struct rproc *rproc = dev_get_drvdata(dev);
+	struct k3_m4_rproc *kproc = rproc->priv;
 	u32 msg = (u32)(uintptr_t)(data);
 
+	/*
+	 * Do not forward messages from a detached core, except when the core
+	 * is in the process of being attached in IPC-only mode.
+	 */
+	if (!kproc->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
+		return;
+
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
 	switch (msg) {
@@ -135,6 +147,12 @@ static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
 	u32 msg = (u32)vqid;
 	int ret;
 
+	/*
+	 * Do not forward messages to a detached core, except when the core
+	 * is in the process of being attached in IPC-only mode.
+	 */
+	if (!kproc->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
+		return;
 	/*
 	 * Send the index of the triggered virtqueue in the mailbox payload.
 	 * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
@@ -515,15 +533,19 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
 /*
  * Attach to a running M4 remote processor (IPC-only mode)
  *
- * The remote processor is already booted, so there is no need to issue any
- * TI-SCI commands to boot the M4 core. This callback is used only in IPC-only
- * mode.
+ * This rproc attach callback only needs to set the "is_attach_ongoing" flag to
+ * notify k3_m4_rproc_{kick/mbox_callback} functions that the core is in the
+ * process of getting attached in IPC-only mode. The remote processor is already
+ * booted, so there is no need to issue any TI-SCI commands to boot the M4 core.
+ * This callback is used only in IPC-only mode.
  */
 static int k3_m4_rproc_attach(struct rproc *rproc)
 {
 	struct k3_m4_rproc *kproc = rproc->priv;
 	int ret;
 
+	kproc->is_attach_ongoing = true;
+
 	ret = k3_m4_rproc_ping_mbox(kproc);
 	if (ret)
 		return ret;
@@ -534,12 +556,18 @@ static int k3_m4_rproc_attach(struct rproc *rproc)
 /*
  * Detach from a running M4 remote processor (IPC-only mode)
  *
- * This rproc detach callback performs the opposite operation to attach
- * callback, the M4 core is not stopped and will be left to continue to
- * run its booted firmware. This callback is invoked only in IPC-only mode.
+ * This rproc detach callback performs the opposite operation to attach callback
+ * and only needs to clear the "is_attach_ongoing" flag to ensure no mailbox
+ * messages are sent to or received from a detached core. The M4 core is not
+ * stopped and will be left to continue to run its booted firmware. This
+ * callback is invoked only in IPC-only mode.
  */
 static int k3_m4_rproc_detach(struct rproc *rproc)
 {
+	struct k3_m4_rproc *kproc = rproc->priv;
+
+	kproc->is_attach_ongoing = false;
+
 	return 0;
 }
 
@@ -577,6 +605,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	rproc->has_iommu = false;
 	rproc->recovery_disabled = true;
 	kproc = rproc->priv;
+	kproc->rproc = rproc;
 	kproc->dev = dev;
 	platform_set_drvdata(pdev, rproc);
 
-- 
2.34.1

