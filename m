Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CD4C47080
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74516613CC
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhEVAFF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 May 2021 20:05:05 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58098 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhEVAE7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 May 2021 20:04:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14M03Rda027044;
        Fri, 21 May 2021 19:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621641807;
        bh=Qssj1nV4S10Ul8Kxy2VUEa4I3AvbvOPfLAxyjDwNqMs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HYlqV4FOaqtpcg/8+9HTgDIU6cT2hZpaLrzTxZ0l8fLXA8QebLV3OFCehm6ghSSYJ
         5BasNMIT/9BP9PedV3xMkL+5W7526joqRgtD0Bogg5idXRZE0qoLwIDYQbte6Tz5AQ
         BC5K/d5iQmGPgWRs8mjhtPNWp149TMUDHOwbM1Ls=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14M03R6R048575
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 19:03:27 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 19:03:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 19:03:26 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14M03QtB001106;
        Fri, 21 May 2021 19:03:26 -0500
Received: from localhost ([10.250.35.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14M03Q9Y091542;
        Fri, 21 May 2021 19:03:26 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 4/6] remoteproc: k3-r5: Add support for IPC-only mode for all R5Fs
Date:   Fri, 21 May 2021 19:03:07 -0500
Message-ID: <20210522000309.26134-5-s-anna@ti.com>
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

Add support to the K3 R5F remoteproc driver to configure all the R5F
cores to be either in IPC-only mode or the traditional remoteproc mode.
The IPC-only mode expects that the remote processors are already booted
by the bootloader, and only performs the minimum steps required to
initialize and deinitialize the virtio IPC transports. The remoteproc
mode allows the kernel remoteproc driver to do the regular load and
boot and other device management operations for a R5F core.

The IPC-only mode for a R5F core is detected and configured at driver
probe time by querying the System Firmware for the R5F power and reset
state and/or status and making sure that the R5F core is indeed started
by the bootloaders, otherwise the device is configured for remoteproc
mode.

Support for IPC-only mode is achieved through .attach(), .detach() and
.get_loaded_rsc_table() callback ops and various other flags in both
remoteproc core and the K3 R5F remoteproc driver. The resource table
follows a design-by-contract approach and is expected to be at the base
of the DDR firmware region reserved for each remoteproc, it is mostly
expected to contain only the virtio device and trace resource entries.

NOTE:
The driver cannot configure a R5F core for remoteproc mode by any
means without rebooting the kernel if that R5F core has been started
by a bootloader.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 215 +++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index e7e1ca71763e..66f0654f0860 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -151,6 +151,7 @@ struct k3_r5_core {
  * @core: cached pointer to r5 core structure being used
  * @rmem: reserved memory regions data
  * @num_rmems: number of reserved memory regions
+ * @ipc_only: flag to indicate IPC-only mode
  */
 struct k3_r5_rproc {
 	struct device *dev;
@@ -161,6 +162,7 @@ struct k3_r5_rproc {
 	struct k3_r5_core *core;
 	struct k3_r5_mem *rmem;
 	int num_rmems;
+	bool ipc_only;
 };
 
 /**
@@ -440,6 +442,10 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 	bool mem_init_dis;
 	int ret;
 
+	/* IPC-only mode does not require the cores to be released from reset */
+	if (kproc->ipc_only)
+		return 0;
+
 	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
 	if (ret < 0)
 		return ret;
@@ -503,6 +509,10 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
+	/* do not put back the cores into reset in IPC-only mode */
+	if (kproc->ipc_only)
+		return 0;
+
 	/* Re-use LockStep-mode reset logic for Single-CPU mode */
 	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
 	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
@@ -538,6 +548,12 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	u32 boot_addr;
 	int ret;
 
+	if (kproc->ipc_only) {
+		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
+			__func__);
+		return -EINVAL;
+	}
+
 	ret = k3_r5_rproc_request_mbox(rproc);
 	if (ret)
 		return ret;
@@ -604,9 +620,16 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
+	struct device *dev = kproc->dev;
 	struct k3_r5_core *core = kproc->core;
 	int ret;
 
+	if (kproc->ipc_only) {
+		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
+			__func__);
+		return -EINVAL;
+	}
+
 	/* halt all applicable cores */
 	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
 		list_for_each_entry(core, &cluster->cores, elem) {
@@ -635,6 +658,85 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	return ret;
 }
 
+/*
+ * Attach to a running R5F remote processor (IPC-only mode)
+ *
+ * The R5F attach callback only needs to request the mailbox, the remote
+ * processor is already booted, so there is no need to issue any TI-SCI
+ * commands to boot the R5F cores in IPC-only mode.
+ */
+static int k3_r5_rproc_attach(struct rproc *rproc)
+{
+	struct k3_r5_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	if (!kproc->ipc_only || rproc->state != RPROC_DETACHED) {
+		dev_err(dev, "R5F is expected to be in IPC-only mode and RPROC_DETACHED state\n");
+		return -EINVAL;
+	}
+
+	ret = k3_r5_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
+
+	dev_err(dev, "R5F core initialized in IPC-only mode\n");
+	return 0;
+}
+
+/*
+ * Detach from a running R5F remote processor (IPC-only mode)
+ *
+ * The R5F detach callback performs the opposite operation to attach callback
+ * and only needs to release the mailbox, the R5F cores are not stopped and
+ * will be left in booted state in IPC-only mode.
+ */
+static int k3_r5_rproc_detach(struct rproc *rproc)
+{
+	struct k3_r5_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+
+	if (!kproc->ipc_only || rproc->state != RPROC_ATTACHED) {
+		dev_err(dev, "R5F is expected to be in IPC-only mode and RPROC_ATTACHED state\n");
+		return -EINVAL;
+	}
+
+	mbox_free_channel(kproc->mbox);
+	dev_err(dev, "R5F core deinitialized in IPC-only mode\n");
+	return 0;
+}
+
+/*
+ * This function implements the .get_loaded_rsc_table() callback and is used
+ * to provide the resource table for the booted R5F in IPC-only mode. The K3 R5F
+ * firmwares follow a design-by-contract approach and are expected to have the
+ * resource table at the base of the DDR region reserved for firmware usage.
+ * This provides flexibility for the remote processor to be booted by different
+ * bootloaders that may or may not have the ability to publish the resource table
+ * address and size through a DT property.
+ */
+static struct resource_table *k3_r5_get_loaded_rsc_table(struct rproc *rproc,
+							 size_t *rsc_table_sz)
+{
+	struct k3_r5_rproc *kproc = rproc->priv;
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
  * Internal Memory translation helper
  *
@@ -709,8 +811,11 @@ static const struct rproc_ops k3_r5_rproc_ops = {
 	.unprepare	= k3_r5_rproc_unprepare,
 	.start		= k3_r5_rproc_start,
 	.stop		= k3_r5_rproc_stop,
+	.attach		= k3_r5_rproc_attach,
+	.detach		= k3_r5_rproc_detach,
 	.kick		= k3_r5_rproc_kick,
 	.da_to_va	= k3_r5_rproc_da_to_va,
+	.get_loaded_rsc_table = k3_r5_get_loaded_rsc_table,
 };
 
 /*
@@ -1014,6 +1119,109 @@ static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
 	}
 }
 
+/*
+ * This function checks and configures a R5F core for IPC-only or remoteproc
+ * mode. The driver is configured to be in IPC-only mode for a R5F core when
+ * the core has been loaded and started by a bootloader. The IPC-only mode is
+ * detected by querying the System Firmware for reset, power on and halt status
+ * and ensuring that the core is running. Any incomplete steps at bootloader
+ * are validated and errored out.
+ *
+ * In IPC-only mode, the driver state flags for ATCM, BTCM and LOCZRAMA settings
+ * and cluster mode parsed originally from kernel DT are updated to reflect the
+ * actual values configured by bootloader. The driver internal device memory
+ * addresses for TCMs are also updated.
+ */
+static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
+{
+	struct k3_r5_cluster *cluster = kproc->cluster;
+	struct k3_r5_core *core = kproc->core;
+	struct device *cdev = core->dev;
+	bool r_state = false, c_state = false;
+	u32 ctrl = 0, cfg = 0, stat = 0, halted = 0;
+	u64 boot_vec = 0;
+	u32 atcm_enable, btcm_enable, loczrama;
+	struct k3_r5_core *core0;
+	enum cluster_mode mode;
+	int ret;
+
+	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
+
+	ret = core->ti_sci->ops.dev_ops.is_on(core->ti_sci, core->ti_sci_id,
+					      &r_state, &c_state);
+	if (ret) {
+		dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
+			ret);
+		return ret;
+	}
+	if (r_state != c_state) {
+		dev_warn(cdev, "R5F core may have been powered on by a different host, programmed state (%d) != actual state (%d)\n",
+			 r_state, c_state);
+	}
+
+	ret = reset_control_status(core->reset);
+	if (ret < 0) {
+		dev_err(cdev, "failed to get initial local reset status, ret = %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl,
+				     &stat);
+	if (ret < 0) {
+		dev_err(cdev, "failed to get initial processor status, ret = %d\n",
+			ret);
+		return ret;
+	}
+	atcm_enable = cfg & PROC_BOOT_CFG_FLAG_R5_ATCM_EN ?  1 : 0;
+	btcm_enable = cfg & PROC_BOOT_CFG_FLAG_R5_BTCM_EN ?  1 : 0;
+	loczrama = cfg & PROC_BOOT_CFG_FLAG_R5_TCM_RSTBASE ?  1 : 0;
+	if (cluster->soc_data->single_cpu_mode) {
+		mode = cfg & PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE ?
+				CLUSTER_MODE_SINGLECPU : CLUSTER_MODE_SPLIT;
+	} else {
+		mode = cfg & PROC_BOOT_CFG_FLAG_R5_LOCKSTEP ?
+				CLUSTER_MODE_LOCKSTEP : CLUSTER_MODE_SPLIT;
+	}
+	halted = ctrl & PROC_BOOT_CTRL_FLAG_R5_CORE_HALT;
+
+	/*
+	 * IPC-only mode detection requires both local and module resets to
+	 * be deasserted and R5F core to be unhalted. Local reset status is
+	 * irrelevant if module reset is asserted (POR value has local reset
+	 * deasserted), and is deemed as remoteproc mode
+	 */
+	if (c_state && !ret && !halted) {
+		dev_err(cdev, "configured R5F for IPC-only mode\n");
+		kproc->rproc->state = RPROC_DETACHED;
+		kproc->rproc->detach_on_shutdown = true;
+		kproc->ipc_only = true;
+		ret = 1;
+	} else if (!c_state) {
+		dev_err(cdev, "configured R5F for remoteproc mode\n");
+		ret = 0;
+	} else {
+		dev_err(cdev, "mismatched mode: local_reset = %s, module_reset = %s, core_state = %s\n",
+			!ret ? "deasserted" : "asserted",
+			c_state ? "deasserted" : "asserted",
+			halted ? "halted" : "unhalted");
+		ret = -EINVAL;
+	}
+
+	/* fixup TCMs, cluster & core flags to actual values in IPC-only mode */
+	if (ret > 0) {
+		if (core == core0)
+			cluster->mode = mode;
+		core->atcm_enable = atcm_enable;
+		core->btcm_enable = btcm_enable;
+		core->loczrama = loczrama;
+		core->mem[0].dev_addr = loczrama ? 0 : K3_R5_TCM_DEV_ADDR;
+		core->mem[1].dev_addr = loczrama ? K3_R5_TCM_DEV_ADDR : 0;
+	}
+
+	return ret;
+}
+
 static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
@@ -1054,6 +1262,12 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		kproc->rproc = rproc;
 		core->rproc = rproc;
 
+		ret = k3_r5_rproc_configure_mode(kproc);
+		if (ret < 0)
+			goto err_config;
+		if (ret)
+			goto init_rmem;
+
 		ret = k3_r5_rproc_configure(kproc);
 		if (ret) {
 			dev_err(dev, "initial configure failed, ret = %d\n",
@@ -1061,6 +1275,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto err_config;
 		}
 
+init_rmem:
 		k3_r5_adjust_tcm_sizes(kproc);
 
 		ret = k3_r5_reserved_mem_init(kproc);
-- 
2.30.1

