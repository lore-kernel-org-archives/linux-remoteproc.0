Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9273C4338F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Jul 2021 22:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B63D60F23
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Jul 2021 22:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhGWVX2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 23 Jul 2021 17:23:28 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40904 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232752AbhGWVXY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 23 Jul 2021 17:23:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16NM3pHa007875;
        Fri, 23 Jul 2021 17:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627077831;
        bh=lucGUhsDE/7dni7QpmMzRuzrPPk7alQxXO8NsPcIWd8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sLlno0lF25jGJAa6JIS1I1ysXMBgbtcTrf9TyAj3MDyw+wR+GzEc6K5rLBIB9QcbF
         dnRrwt38kNCdv8xtKtuJ9rDEP4eS3hirBDeo0qyefF6M/e5eiPx8ndUA8WXZq0AhM3
         aBXvmN5xmPTOwa8nHMf/VbXu+KmHLcIEkT8aBUJA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16NM3pY2066339
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Jul 2021 17:03:51 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 23
 Jul 2021 17:02:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 23 Jul 2021 17:02:50 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16NM2orR102335;
        Fri, 23 Jul 2021 17:02:50 -0500
Received: from localhost ([10.250.38.176])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 16NM2o6R126741;
        Fri, 23 Jul 2021 17:02:50 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 5/5] remoteproc: k3-dsp: Add support for IPC-only mode for all K3 DSPs
Date:   Fri, 23 Jul 2021 17:02:48 -0500
Message-ID: <20210723220248.6554-6-s-anna@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723220248.6554-1-s-anna@ti.com>
References: <20210723220248.6554-1-s-anna@ti.com>
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
.get_loaded_rsc_table() callback ops and zeroing out the regular rproc
ops .prepare(), .unprepare(), .start() and .stop(). The resource table
follows a design-by-contract approach and is expected to be at the base
of the DDR firmware region reserved for each remoteproc, it is mostly
expected to contain only the virtio device and trace resource entries.

NOTE:
The driver cannot configure a DSP core for remoteproc mode by any
means without rebooting the kernel if that DSP core has been started
by a bootloader.  This is the current desired behavior and can be
enhanced in the future if the feature is needed.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2: Addressed various review comments from v1
 - Reworked the logic to not use remoteproc detach_on_shutdown and
   local ipc-only state flags
 - Plugged in the required IPC-only ops dynamically with the regular
   remoteproc-mode ops zeroed out
 - Dropped all the unneeded error checks in start, stop, prepare, 
   unprepare, attach and detach callbacks
 - Callback function descriptions updated to reflect the mode they
   apply to
 - Dropped unused r_state variable in probe
 - Switched to dev_info for the mode information traces from dev_err
 - Revised the last 2 paras of the patch description
v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210522000309.26134-7-s-anna@ti.com/

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 132 +++++++++++++++++++---
 1 file changed, 115 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index faf60a274e8d..6eaecf02aee5 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -260,7 +260,8 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
  * used to release the global reset on C66x DSPs to allow loading into the DSP
  * internal RAMs. The .prepare() ops is invoked by remoteproc core before any
  * firmware loading, and is followed by the .start() ops after loading to
- * actually let the C66x DSP cores run.
+ * actually let the C66x DSP cores run. This callback is invoked only in
+ * remoteproc mode.
  */
 static int k3_dsp_rproc_prepare(struct rproc *rproc)
 {
@@ -284,7 +285,7 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
  * powering down the C66x DSP cores. The cores themselves are only halted in the
  * .stop() callback through the local reset, and the .unprepare() ops is invoked
  * by the remoteproc core after the remoteproc is stopped to balance the global
- * reset.
+ * reset. This callback is invoked only in remoteproc mode.
  */
 static int k3_dsp_rproc_unprepare(struct rproc *rproc)
 {
@@ -305,7 +306,7 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
  *
  * This function will be invoked only after the firmware for this rproc
  * was loaded, parsed successfully, and all of its resource requirements
- * were met.
+ * were met. This callback is invoked only in remoteproc mode.
  */
 static int k3_dsp_rproc_start(struct rproc *rproc)
 {
@@ -346,7 +347,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
  * Stop the DSP remote processor.
  *
  * This function puts the DSP processor into reset, and finishes processing
- * of any pending messages.
+ * of any pending messages. This callback is invoked only in remoteproc mode.
  */
 static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
@@ -359,6 +360,78 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 	return 0;
 }
 
+/*
+ * Attach to a running DSP remote processor (IPC-only mode)
+ *
+ * This rproc attach callback only needs to request the mailbox, the remote
+ * processor is already booted, so there is no need to issue any TI-SCI
+ * commands to boot the DSP core. This callback is invoked only in IPC-only
+ * mode.
+ */
+static int k3_dsp_rproc_attach(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	ret = k3_dsp_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "DSP initialized in IPC-only mode\n");
+	return 0;
+}
+
+/*
+ * Detach from a running DSP remote processor (IPC-only mode)
+ *
+ * This rproc detach callback performs the opposite operation to attach callback
+ * and only needs to release the mailbox, the DSP core is not stopped and will
+ * be left to continue to run its booted firmware. This callback is invoked only
+ * in IPC-only mode.
+ */
+static int k3_dsp_rproc_detach(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+
+	mbox_free_channel(kproc->mbox);
+	dev_info(dev, "DSP deinitialized in IPC-only mode\n");
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
+ * address and size through a DT property. This callback is invoked only in
+ * IPC-only mode.
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
@@ -605,6 +678,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	struct k3_dsp_rproc *kproc;
 	struct rproc *rproc;
 	const char *fw_name;
+	bool p_state = false;
 	int ret = 0;
 	int ret1;
 
@@ -683,19 +757,43 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
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
+					       NULL, &p_state);
+	if (ret) {
+		dev_err(dev, "failed to get initial state, mode cannot be determined, ret = %d\n",
+			ret);
+		goto release_mem;
+	}
+
+	/* configure J721E devices for either remoteproc or IPC-only mode */
+	if (p_state) {
+		dev_info(dev, "configured DSP for IPC-only mode\n");
+		rproc->state = RPROC_DETACHED;
+		/* override rproc ops with only required IPC-only mode ops */
+		rproc->ops->prepare = NULL;
+		rproc->ops->unprepare = NULL;
+		rproc->ops->start = NULL;
+		rproc->ops->stop = NULL;
+		rproc->ops->attach = k3_dsp_rproc_attach;
+		rproc->ops->detach = k3_dsp_rproc_detach;
+		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
+	} else {
+		dev_info(dev, "configured DSP for remoteproc mode\n");
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
2.32.0

