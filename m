Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFACC4707E
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD3FC613F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhEVAFG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 May 2021 20:05:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40154 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhEVAFE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 May 2021 20:05:04 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14M03bkM087981;
        Fri, 21 May 2021 19:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621641817;
        bh=utxACe9JOi+mmI1qJxt47DD+ZcLFKmpOoukqpsvO2jo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Z/ddQadANuUvpsWrN2SzG3eFfRO8OSpcpiilPH9khSeEKxtx6cLGUsndo4cMg7e+T
         7tLBh8hpKl2d9Htd+yK4lLv3D7Z3ZstVZoLbWix4dBWgppia04VSogXvws2fqt+/tb
         uLj+1Hnd5K5XmlB/K5uukLCbIjWBpkJw4qh6uE6A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14M03bII123963
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 19:03:37 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 19:03:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 19:03:36 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14M03aHp065132;
        Fri, 21 May 2021 19:03:36 -0500
Received: from localhost ([10.250.35.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14M03aAd091586;
        Fri, 21 May 2021 19:03:36 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 6/6] remoteproc: k3-dsp: Add support for IPC-only mode for all K3 DSPs
Date:   Fri, 21 May 2021 19:03:09 -0500
Message-ID: <20210522000309.26134-7-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210522000309.26134-1-s-anna@ti.com>
References: <20210522000309.26134-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add support to the K3 DSP remoteproc driver to configure all the C66x
and C71x cores on J721E SoCs to be either in IPC-only mode or the
traditional remoteproc mode. The IPC-only mode expects that the remote
processors are already booted by the bootloader, and only perform the
minimum steps required to initialize and deinitialize the virtio IPC
transports. The remoteproc mode allows the kernel remoteproc driver to
do the regular load and boot and other device management operations for
a DSP.

The IPC-only mode for a DSP is detected and configured at driver probe
time by querying the System Firmware for the DSP power and reset state
and/or status and making sure that the DSP is indeed started by the
bootloaders, otherwise the device is configured for remoteproc mode.

Support for IPC-only mode is achieved through .attach(), .detach() and
.get_loaded_rsc_table() callback ops and various other flags in both
remoteproc core and the K3 DSP remoteproc driver. The resource table
follows a design-by-contract approach and is expected to be at the base
of the DDR firmware region reserved for each remoteproc, it is mostly
expected to contain only the virtio device and trace resource entries.

NOTE:
The driver cannot configure a DSP core for remoteproc mode by any
means without rebooting the kernel if that R5F core has been started
by a bootloader.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 151 ++++++++++++++++++++--
 1 file changed, 138 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index faf60a274e8d..b154a52f1fa6 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -76,6 +76,7 @@ struct k3_dsp_dev_data {
  * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
+ * @ipc_only: flag to indicate IPC-only mode
  */
 struct k3_dsp_rproc {
 	struct device *dev;
@@ -91,6 +92,7 @@ struct k3_dsp_rproc {
 	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
+	bool ipc_only;
 };
 
 /**
@@ -268,6 +270,10 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
+	/* IPC-only mode does not require the core to be released from reset */
+	if (kproc->ipc_only)
+		return 0;
+
 	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret)
@@ -292,6 +298,10 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
+	/* do not put back the cores into reset in IPC-only mode */
+	if (kproc->ipc_only)
+		return 0;
+
 	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret)
@@ -314,6 +324,12 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	u32 boot_addr;
 	int ret;
 
+	if (kproc->ipc_only) {
+		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
+			__func__);
+		return -EINVAL;
+	}
+
 	ret = k3_dsp_rproc_request_mbox(rproc);
 	if (ret)
 		return ret;
@@ -351,6 +367,13 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
 	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+
+	if (kproc->ipc_only) {
+		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
+			__func__);
+		return -EINVAL;
+	}
 
 	mbox_free_channel(kproc->mbox);
 
@@ -359,6 +382,85 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 	return 0;
 }
 
+/*
+ * Attach to a running DSP remote processor (IPC-only mode)
+ *
+ * This rproc attach callback only needs to request the mailbox, the remote
+ * processor is already booted, so there is no need to issue any TI-SCI
+ * commands to boot the DSP core.
+ */
+static int k3_dsp_rproc_attach(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	if (!kproc->ipc_only || rproc->state != RPROC_DETACHED) {
+		dev_err(dev, "DSP is expected to be in IPC-only mode and RPROC_DETACHED state\n");
+		return -EINVAL;
+	}
+
+	ret = k3_dsp_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
+
+	dev_err(dev, "DSP initialized in IPC-only mode\n");
+	return 0;
+}
+
+/*
+ * Detach from a running DSP remote processor (IPC-only mode)
+ *
+ * This rproc detach callback performs the opposite operation to attach callback
+ * and only needs to release the mailbox, the DSP core is not stopped and will
+ * be left to continue to run its booted firmware.
+ */
+static int k3_dsp_rproc_detach(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+
+	if (!kproc->ipc_only || rproc->state != RPROC_ATTACHED) {
+		dev_err(dev, "DSP is expected to be in IPC-only mode and RPROC_ATTACHED state\n");
+		return -EINVAL;
+	}
+
+	mbox_free_channel(kproc->mbox);
+	dev_err(dev, "DSP deinitialized in IPC-only mode\n");
+	return 0;
+}
+
+/*
+ * This function implements the .get_loaded_rsc_table() callback and is used
+ * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
+ * firmwares follow a design-by-contract approach and are expected to have the
+ * resource table at the base of the DDR region reserved for firmware usage.
+ * This provides flexibility for the remote processor to be booted by different
+ * bootloaders that may or may not have the ability to publish the resource table
+ * address and size through a DT property.
+ */
+static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
+							  size_t *rsc_table_sz)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+
+	if (!kproc->rmem[0].cpu_addr) {
+		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/*
+	 * NOTE: The resource table size is currently hard-coded to a maximum
+	 * of 256 bytes. The most common resource table usage for K3 firmwares
+	 * is to only have the vdev resource entry and an optional trace entry.
+	 * The exact size could be computed based on resource table address, but
+	 * the hard-coded value suffices to support the IPC-only mode.
+	 */
+	*rsc_table_sz = 256;
+	return (struct resource_table *)kproc->rmem[0].cpu_addr;
+}
+
 /*
  * Custom function to translate a DSP device address (internal RAMs only) to a
  * kernel virtual address.  The DSPs can access their RAMs at either an internal
@@ -421,8 +523,11 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start		= k3_dsp_rproc_start,
 	.stop		= k3_dsp_rproc_stop,
+	.attach		= k3_dsp_rproc_attach,
+	.detach		= k3_dsp_rproc_detach,
 	.kick		= k3_dsp_rproc_kick,
 	.da_to_va	= k3_dsp_rproc_da_to_va,
+	.get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table,
 };
 
 static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
@@ -605,6 +710,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	struct k3_dsp_rproc *kproc;
 	struct rproc *rproc;
 	const char *fw_name;
+	bool r_state = false;
+	bool p_state = false;
 	int ret = 0;
 	int ret1;
 
@@ -683,19 +790,37 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		goto release_tsp;
 	}
 
-	/*
-	 * ensure the DSP local reset is asserted to ensure the DSP doesn't
-	 * execute bogus code in .prepare() when the module reset is released.
-	 */
-	if (data->uses_lreset) {
-		ret = reset_control_status(kproc->reset);
-		if (ret < 0) {
-			dev_err(dev, "failed to get reset status, status = %d\n",
-				ret);
-			goto release_mem;
-		} else if (ret == 0) {
-			dev_warn(dev, "local reset is deasserted for device\n");
-			k3_dsp_rproc_reset(kproc);
+	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
+					       &r_state, &p_state);
+	if (ret) {
+		dev_err(dev, "failed to get initial state, mode cannot be determined, ret = %d\n",
+			ret);
+		goto release_mem;
+	}
+
+	/* configure J721E devices for either remoteproc or IPC-only mode */
+	if (p_state) {
+		dev_err(dev, "configured DSP for IPC-only mode\n");
+		rproc->state = RPROC_DETACHED;
+		rproc->detach_on_shutdown = true;
+		kproc->ipc_only = true;
+	} else {
+		dev_err(dev, "configured DSP for remoteproc mode\n");
+		/*
+		 * ensure the DSP local reset is asserted to ensure the DSP
+		 * doesn't execute bogus code in .prepare() when the module
+		 * reset is released.
+		 */
+		if (data->uses_lreset) {
+			ret = reset_control_status(kproc->reset);
+			if (ret < 0) {
+				dev_err(dev, "failed to get reset status, status = %d\n",
+					ret);
+				goto release_mem;
+			} else if (ret == 0) {
+				dev_warn(dev, "local reset is deasserted for device\n");
+				k3_dsp_rproc_reset(kproc);
+			}
 		}
 	}
 
-- 
2.30.1

