Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F920241668;
	Fri, 25 Apr 2025 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577736; cv=none; b=l/typICZ8sC555Hw1MOKBuM+2ff+KHRDxD4vJ2l/b7C/ZyPUlkRjNMECnMAqWCNouP2nQkWsZTAjiE+XqnYKqEj22SbxzB5bSP61cTHyATin6TBuR9il0Ue8SXbGw82h/th4o6HeL4G89rEJsmiKJ7n+LjYY5za+ODhcLbxgTOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577736; c=relaxed/simple;
	bh=eDxNXVYRbJUg3/+K9+ul9lvijlbsc38yZbBvdYUxrKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bv1K4eeiFjCXVtGN5S7oHJxtIGT8XbEUVSGK4IkUo7wstw1BaeWZddALguR346hh+UGXe16J4kj1+UENC/ksKMHeS/JuB0LES2gKyg5NjaTPVmNiWqCW5uO8ga3IWGZrYzKDI2Ib6ofSc9zXM4wC+NZbzFYRTuWg3R9b3tR+tvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=p89+3DgK; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p89+3DgK"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAg3oW2123067
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577724;
	bh=tdVmoVfx1BnpWX1Rj2ulPLjVwgEu35FnN4Wxhe67eHI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p89+3DgKLQH8ZXWP1oqWyE/VqRckFAZUV5RxBOhPcvqOeSd8dYuk7wDlKTy36TB82
	 hzwvga9bVoFJbfwTOdhNvVbiYjB5Ag9URNy4bF8RLGWqr/KqvBkpbz1HGY7nag8Eux
	 q1r0qmtdc/UHuLs1gEpWvu6gnO92yV9rDF0jp2PQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAg3tG129215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:03 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:02 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZR038329;
	Fri, 25 Apr 2025 05:41:59 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 06/35] remoteproc: k3-r5: Refactor Data Structures to Align with DSP and M4
Date: Fri, 25 Apr 2025 16:11:06 +0530
Message-ID: <20250425104135.830255-7-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Currently, struct members such as mem, num_mems, reset, tsp, ti_sci and
ti_sci_id are part of the k3_r5_core structure. To align the rproc->priv
data structure of the R5 remote processor with that of the DSP and M4,
move the above members from k3_r5_core to k3_r5_rproc struct.

Additionally, introduce a void *priv pointer in k3_r5_rproc that can be
typecasted to point to the k3_r5_core structure. This abstraction is
done to ensure common functionalities across R5, DSP and M4 drivers can
be refactored at a later stage.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-7-b-padhi@ti.com/

v10: Changelog:
None

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-3-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 375 ++++++++++++-----------
 1 file changed, 195 insertions(+), 180 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 8e2d9fa446662..5a460cfdfb4c4 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -114,19 +114,16 @@ struct k3_r5_cluster {
 	const struct k3_r5_soc_data *soc_data;
 };
 
+struct k3_r5_rproc;
+
 /**
  * struct k3_r5_core - K3 R5 core structure
  * @elem: linked list item
  * @dev: cached device pointer
- * @rproc: rproc handle representing this core
- * @mem: internal memory regions data
+ * @kproc: K3 rproc handle representing this core
+ * @cluster: cached pointer to parent cluster structure
  * @sram: on-chip SRAM memory regions data
- * @num_mems: number of internal memory regions
  * @num_sram: number of on-chip SRAM memory regions
- * @reset: reset control handle
- * @tsp: TI-SCI processor control handle
- * @ti_sci: TI-SCI handle
- * @ti_sci_id: TI-SCI device identifier
  * @atcm_enable: flag to control ATCM enablement
  * @btcm_enable: flag to control BTCM enablement
  * @loczrama: flag to dictate which TCM is at device address 0x0
@@ -135,15 +132,10 @@ struct k3_r5_cluster {
 struct k3_r5_core {
 	struct list_head elem;
 	struct device *dev;
-	struct rproc *rproc;
-	struct k3_r5_mem *mem;
+	struct k3_r5_rproc *kproc;
+	struct k3_r5_cluster *cluster;
 	struct k3_r5_mem *sram;
-	int num_mems;
 	int num_sram;
-	struct reset_control *reset;
-	struct ti_sci_proc *tsp;
-	const struct ti_sci_handle *ti_sci;
-	u32 ti_sci_id;
 	u32 atcm_enable;
 	u32 btcm_enable;
 	u32 loczrama;
@@ -153,23 +145,33 @@ struct k3_r5_core {
 /**
  * struct k3_r5_rproc - K3 remote processor state
  * @dev: cached device pointer
- * @cluster: cached pointer to parent cluster structure
- * @mbox: mailbox channel handle
- * @client: mailbox client to request the mailbox channel
  * @rproc: rproc handle
- * @core: cached pointer to r5 core structure being used
+ * @mem: internal memory regions data
+ * @num_mems: number of internal memory regions
  * @rmem: reserved memory regions data
  * @num_rmems: number of reserved memory regions
+ * @reset: reset control handle
+ * @tsp: TI-SCI processor control handle
+ * @ti_sci: TI-SCI handle
+ * @ti_sci_id: TI-SCI device identifier
+ * @mbox: mailbox channel handle
+ * @client: mailbox client to request the mailbox channel
+ * @priv: Remote processor private data
  */
 struct k3_r5_rproc {
 	struct device *dev;
-	struct k3_r5_cluster *cluster;
-	struct mbox_chan *mbox;
-	struct mbox_client client;
 	struct rproc *rproc;
-	struct k3_r5_core *core;
+	struct k3_r5_mem *mem;
+	int num_mems;
 	struct k3_r5_mem *rmem;
 	int num_rmems;
+	struct reset_control *reset;
+	struct ti_sci_proc *tsp;
+	const struct ti_sci_handle *ti_sci;
+	u32 ti_sci_id;
+	struct mbox_chan *mbox;
+	struct mbox_client client;
+	void *priv;
 };
 
 /**
@@ -236,48 +238,48 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
 			ret);
 }
 
-static int k3_r5_split_reset(struct k3_r5_core *core)
+static int k3_r5_split_reset(struct k3_r5_rproc *kproc)
 {
 	int ret;
 
-	ret = reset_control_assert(core->reset);
+	ret = reset_control_assert(kproc->reset);
 	if (ret) {
-		dev_err(core->dev, "local-reset assert failed, ret = %d\n",
+		dev_err(kproc->dev, "local-reset assert failed, ret = %d\n",
 			ret);
 		return ret;
 	}
 
-	ret = core->ti_sci->ops.dev_ops.put_device(core->ti_sci,
-						   core->ti_sci_id);
+	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
 	if (ret) {
-		dev_err(core->dev, "module-reset assert failed, ret = %d\n",
+		dev_err(kproc->dev, "module-reset assert failed, ret = %d\n",
 			ret);
-		if (reset_control_deassert(core->reset))
-			dev_warn(core->dev, "local-reset deassert back failed\n");
+		if (reset_control_deassert(kproc->reset))
+			dev_warn(kproc->dev, "local-reset deassert back failed\n");
 	}
 
 	return ret;
 }
 
-static int k3_r5_split_release(struct k3_r5_core *core)
+static int k3_r5_split_release(struct k3_r5_rproc *kproc)
 {
 	int ret;
 
-	ret = core->ti_sci->ops.dev_ops.get_device(core->ti_sci,
-						   core->ti_sci_id);
+	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
 	if (ret) {
-		dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
+		dev_err(kproc->dev, "module-reset deassert failed, ret = %d\n",
 			ret);
 		return ret;
 	}
 
-	ret = reset_control_deassert(core->reset);
+	ret = reset_control_deassert(kproc->reset);
 	if (ret) {
-		dev_err(core->dev, "local-reset deassert failed, ret = %d\n",
+		dev_err(kproc->dev, "local-reset deassert failed, ret = %d\n",
 			ret);
-		if (core->ti_sci->ops.dev_ops.put_device(core->ti_sci,
-							 core->ti_sci_id))
-			dev_warn(core->dev, "module-reset assert back failed\n");
+		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+							  kproc->ti_sci_id))
+			dev_warn(kproc->dev, "module-reset assert back failed\n");
 	}
 
 	return ret;
@@ -286,11 +288,12 @@ static int k3_r5_split_release(struct k3_r5_core *core)
 static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 {
 	struct k3_r5_core *core;
+	struct k3_r5_rproc *kproc;
 	int ret;
 
 	/* assert local reset on all applicable cores */
 	list_for_each_entry(core, &cluster->cores, elem) {
-		ret = reset_control_assert(core->reset);
+		ret = reset_control_assert(core->kproc->reset);
 		if (ret) {
 			dev_err(core->dev, "local-reset assert failed, ret = %d\n",
 				ret);
@@ -301,8 +304,9 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 
 	/* disable PSC modules on all applicable cores */
 	list_for_each_entry(core, &cluster->cores, elem) {
-		ret = core->ti_sci->ops.dev_ops.put_device(core->ti_sci,
-							   core->ti_sci_id);
+		kproc = core->kproc;
+		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+							    kproc->ti_sci_id);
 		if (ret) {
 			dev_err(core->dev, "module-reset assert failed, ret = %d\n",
 				ret);
@@ -314,14 +318,15 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 
 unroll_module_reset:
 	list_for_each_entry_continue_reverse(core, &cluster->cores, elem) {
-		if (core->ti_sci->ops.dev_ops.put_device(core->ti_sci,
-							 core->ti_sci_id))
+		kproc = core->kproc;
+		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+							  kproc->ti_sci_id))
 			dev_warn(core->dev, "module-reset assert back failed\n");
 	}
 	core = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
 unroll_local_reset:
 	list_for_each_entry_from_reverse(core, &cluster->cores, elem) {
-		if (reset_control_deassert(core->reset))
+		if (reset_control_deassert(core->kproc->reset))
 			dev_warn(core->dev, "local-reset deassert back failed\n");
 	}
 
@@ -331,12 +336,14 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 {
 	struct k3_r5_core *core;
+	struct k3_r5_rproc *kproc;
 	int ret;
 
 	/* enable PSC modules on all applicable cores */
 	list_for_each_entry_reverse(core, &cluster->cores, elem) {
-		ret = core->ti_sci->ops.dev_ops.get_device(core->ti_sci,
-							   core->ti_sci_id);
+		kproc = core->kproc;
+		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+							    kproc->ti_sci_id);
 		if (ret) {
 			dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
 				ret);
@@ -347,7 +354,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 
 	/* deassert local reset on all applicable cores */
 	list_for_each_entry_reverse(core, &cluster->cores, elem) {
-		ret = reset_control_deassert(core->reset);
+		ret = reset_control_deassert(core->kproc->reset);
 		if (ret) {
 			dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
 				ret);
@@ -359,29 +366,30 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 
 unroll_local_reset:
 	list_for_each_entry_continue(core, &cluster->cores, elem) {
-		if (reset_control_assert(core->reset))
+		if (reset_control_assert(core->kproc->reset))
 			dev_warn(core->dev, "local-reset assert back failed\n");
 	}
 	core = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
 unroll_module_reset:
 	list_for_each_entry_from(core, &cluster->cores, elem) {
-		if (core->ti_sci->ops.dev_ops.put_device(core->ti_sci,
-							 core->ti_sci_id))
+		kproc = core->kproc;
+		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+							  kproc->ti_sci_id))
 			dev_warn(core->dev, "module-reset assert back failed\n");
 	}
 
 	return ret;
 }
 
-static inline int k3_r5_core_halt(struct k3_r5_core *core)
+static inline int k3_r5_core_halt(struct k3_r5_rproc *kproc)
 {
-	return ti_sci_proc_set_control(core->tsp,
+	return ti_sci_proc_set_control(kproc->tsp,
 				       PROC_BOOT_CTRL_FLAG_R5_CORE_HALT, 0);
 }
 
-static inline int k3_r5_core_run(struct k3_r5_core *core)
+static inline int k3_r5_core_run(struct k3_r5_rproc *kproc)
 {
-	return ti_sci_proc_set_control(core->tsp,
+	return ti_sci_proc_set_control(kproc->tsp,
 				       0, PROC_BOOT_CTRL_FLAG_R5_CORE_HALT);
 }
 
@@ -439,8 +447,8 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
 static int k3_r5_rproc_prepare(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
-	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct k3_r5_core *core = kproc->core, *core0, *core1;
+	struct k3_r5_core *core = kproc->priv, *core0, *core1;
+	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
 	u32 ctrl = 0, cfg = 0, stat = 0;
 	u64 boot_vec = 0;
@@ -470,7 +478,7 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 		}
 	}
 
-	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
+	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
 	if (ret < 0)
 		return ret;
 	mem_init_dis = !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
@@ -478,7 +486,7 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 	/* Re-use LockStep-mode reset logic for Single-CPU mode */
 	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
 	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
-		k3_r5_lockstep_release(cluster) : k3_r5_split_release(core);
+		k3_r5_lockstep_release(cluster) : k3_r5_split_release(kproc);
 	if (ret) {
 		dev_err(dev, "unable to enable cores for TCM loading, ret = %d\n",
 			ret);
@@ -510,10 +518,10 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 	 * can be effective on all TCM addresses.
 	 */
 	dev_dbg(dev, "zeroing out ATCM memory\n");
-	memset_io(core->mem[0].cpu_addr, 0x00, core->mem[0].size);
+	memset_io(kproc->mem[0].cpu_addr, 0x00, kproc->mem[0].size);
 
 	dev_dbg(dev, "zeroing out BTCM memory\n");
-	memset_io(core->mem[1].cpu_addr, 0x00, core->mem[1].size);
+	memset_io(kproc->mem[1].cpu_addr, 0x00, kproc->mem[1].size);
 
 	return 0;
 }
@@ -537,8 +545,8 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 static int k3_r5_rproc_unprepare(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
-	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct k3_r5_core *core = kproc->core, *core0, *core1;
+	struct k3_r5_core *core = kproc->priv, *core0, *core1;
+	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -565,7 +573,7 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
 	/* Re-use LockStep-mode reset logic for Single-CPU mode */
 	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
 	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
-		k3_r5_lockstep_reset(cluster) : k3_r5_split_reset(core);
+		k3_r5_lockstep_reset(cluster) : k3_r5_split_reset(kproc);
 	if (ret)
 		dev_err(dev, "unable to disable cores, ret = %d\n", ret);
 
@@ -600,9 +608,9 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
 static int k3_r5_rproc_start(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
-	struct k3_r5_cluster *cluster = kproc->cluster;
+	struct k3_r5_core *core = kproc->priv;
+	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
-	struct k3_r5_core *core;
 	u32 boot_addr;
 	int ret;
 
@@ -611,20 +619,19 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
 
 	/* boot vector need not be programmed for Core1 in LockStep mode */
-	core = kproc->core;
-	ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
+	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
 	if (ret)
 		return ret;
 
 	/* unhalt/run all applicable cores */
 	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
 		list_for_each_entry_reverse(core, &cluster->cores, elem) {
-			ret = k3_r5_core_run(core);
+			ret = k3_r5_core_run(core->kproc);
 			if (ret)
 				goto unroll_core_run;
 		}
 	} else {
-		ret = k3_r5_core_run(core);
+		ret = k3_r5_core_run(core->kproc);
 		if (ret)
 			return ret;
 	}
@@ -633,7 +640,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 
 unroll_core_run:
 	list_for_each_entry_continue(core, &cluster->cores, elem) {
-		if (k3_r5_core_halt(core))
+		if (k3_r5_core_halt(core->kproc))
 			dev_warn(core->dev, "core halt back failed\n");
 	}
 	return ret;
@@ -666,21 +673,21 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 static int k3_r5_rproc_stop(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
-	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct k3_r5_core *core = kproc->core;
+	struct k3_r5_core *core = kproc->priv;
+	struct k3_r5_cluster *cluster = core->cluster;
 	int ret;
 
 	/* halt all applicable cores */
 	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
 		list_for_each_entry(core, &cluster->cores, elem) {
-			ret = k3_r5_core_halt(core);
+			ret = k3_r5_core_halt(core->kproc);
 			if (ret) {
 				core = list_prev_entry(core, elem);
 				goto unroll_core_halt;
 			}
 		}
 	} else {
-		ret = k3_r5_core_halt(core);
+		ret = k3_r5_core_halt(core->kproc);
 		if (ret)
 			goto out;
 	}
@@ -689,7 +696,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 
 unroll_core_halt:
 	list_for_each_entry_from_reverse(core, &cluster->cores, elem) {
-		if (k3_r5_core_run(core))
+		if (k3_r5_core_run(core->kproc))
 			dev_warn(core->dev, "core run back failed\n");
 	}
 out:
@@ -759,7 +766,7 @@ static struct resource_table *k3_r5_get_loaded_rsc_table(struct rproc *rproc,
 static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
-	struct k3_r5_core *core = kproc->core;
+	struct k3_r5_core *core = kproc->priv;
 	void __iomem *va = NULL;
 	phys_addr_t bus_addr;
 	u32 dev_addr, offset;
@@ -770,22 +777,22 @@ static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 		return NULL;
 
 	/* handle both R5 and SoC views of ATCM and BTCM */
-	for (i = 0; i < core->num_mems; i++) {
-		bus_addr = core->mem[i].bus_addr;
-		dev_addr = core->mem[i].dev_addr;
-		size = core->mem[i].size;
+	for (i = 0; i < kproc->num_mems; i++) {
+		bus_addr = kproc->mem[i].bus_addr;
+		dev_addr = kproc->mem[i].dev_addr;
+		size = kproc->mem[i].size;
 
 		/* handle R5-view addresses of TCMs */
 		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
 			offset = da - dev_addr;
-			va = core->mem[i].cpu_addr + offset;
+			va = kproc->mem[i].cpu_addr + offset;
 			return (__force void *)va;
 		}
 
 		/* handle SoC-view addresses of TCMs */
 		if (da >= bus_addr && ((da + len) <= (bus_addr + size))) {
 			offset = da - bus_addr;
-			va = core->mem[i].cpu_addr + offset;
+			va = kproc->mem[i].cpu_addr + offset;
 			return (__force void *)va;
 		}
 	}
@@ -863,9 +870,9 @@ static const struct rproc_ops k3_r5_rproc_ops = {
  */
 static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
 {
-	struct k3_r5_cluster *cluster = kproc->cluster;
+	struct k3_r5_core *temp, *core0, *core = kproc->priv;
+	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
-	struct k3_r5_core *core0, *core, *temp;
 	u32 ctrl = 0, cfg = 0, stat = 0;
 	u32 set_cfg = 0, clr_cfg = 0;
 	u64 boot_vec = 0;
@@ -879,10 +886,10 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
 	    cluster->mode == CLUSTER_MODE_SINGLECORE) {
 		core = core0;
 	} else {
-		core = kproc->core;
+		core = kproc->priv;
 	}
 
-	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl,
+	ret = ti_sci_proc_get_status(core->kproc->tsp, &boot_vec, &cfg, &ctrl,
 				     &stat);
 	if (ret < 0)
 		return ret;
@@ -952,7 +959,7 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
 		 * and TEINIT config is only allowed with Core0.
 		 */
 		list_for_each_entry(temp, &cluster->cores, elem) {
-			ret = k3_r5_core_halt(temp);
+			ret = k3_r5_core_halt(temp->kproc);
 			if (ret)
 				goto out;
 
@@ -960,7 +967,7 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
 				clr_cfg &= ~PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
 				clr_cfg &= ~PROC_BOOT_CFG_FLAG_R5_TEINIT;
 			}
-			ret = ti_sci_proc_set_config(temp->tsp, boot_vec,
+			ret = ti_sci_proc_set_config(temp->kproc->tsp, boot_vec,
 						     set_cfg, clr_cfg);
 			if (ret)
 				goto out;
@@ -968,14 +975,14 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
 
 		set_cfg = PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
 		clr_cfg = 0;
-		ret = ti_sci_proc_set_config(core->tsp, boot_vec,
+		ret = ti_sci_proc_set_config(core->kproc->tsp, boot_vec,
 					     set_cfg, clr_cfg);
 	} else {
-		ret = k3_r5_core_halt(core);
+		ret = k3_r5_core_halt(core->kproc);
 		if (ret)
 			goto out;
 
-		ret = ti_sci_proc_set_config(core->tsp, boot_vec,
+		ret = ti_sci_proc_set_config(core->kproc->tsp, boot_vec,
 					     set_cfg, clr_cfg);
 	}
 
@@ -1085,10 +1092,9 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
  */
 static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
 {
-	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct k3_r5_core *core = kproc->core;
+	struct k3_r5_core *core0, *core = kproc->priv;
+	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *cdev = core->dev;
-	struct k3_r5_core *core0;
 
 	if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
 	    cluster->mode == CLUSTER_MODE_SINGLECPU ||
@@ -1098,14 +1104,14 @@ static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
 
 	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
 	if (core == core0) {
-		WARN_ON(core->mem[0].size != SZ_64K);
-		WARN_ON(core->mem[1].size != SZ_64K);
+		WARN_ON(kproc->mem[0].size != SZ_64K);
+		WARN_ON(kproc->mem[1].size != SZ_64K);
 
-		core->mem[0].size /= 2;
-		core->mem[1].size /= 2;
+		kproc->mem[0].size /= 2;
+		kproc->mem[1].size /= 2;
 
 		dev_dbg(cdev, "adjusted TCM sizes, ATCM = 0x%zx BTCM = 0x%zx\n",
-			core->mem[0].size, core->mem[1].size);
+			kproc->mem[0].size, kproc->mem[1].size);
 	}
 }
 
@@ -1124,22 +1130,21 @@ static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
  */
 static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 {
-	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct k3_r5_core *core = kproc->core;
+	struct k3_r5_core *core0, *core = kproc->priv;
+	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *cdev = core->dev;
 	bool r_state = false, c_state = false, lockstep_en = false, single_cpu = false;
 	u32 ctrl = 0, cfg = 0, stat = 0, halted = 0;
 	u64 boot_vec = 0;
 	u32 atcm_enable, btcm_enable, loczrama;
-	struct k3_r5_core *core0;
 	enum cluster_mode mode = cluster->mode;
 	int reset_ctrl_status;
 	int ret;
 
 	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
 
-	ret = core->ti_sci->ops.dev_ops.is_on(core->ti_sci, core->ti_sci_id,
-					      &r_state, &c_state);
+	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
+					       &r_state, &c_state);
 	if (ret) {
 		dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
 			ret);
@@ -1150,7 +1155,7 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 			 r_state, c_state);
 	}
 
-	reset_ctrl_status = reset_control_status(core->reset);
+	reset_ctrl_status = reset_control_status(kproc->reset);
 	if (reset_ctrl_status < 0) {
 		dev_err(cdev, "failed to get initial local reset status, ret = %d\n",
 			reset_ctrl_status);
@@ -1163,7 +1168,7 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 	 */
 	core->released_from_reset = c_state;
 
-	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl,
+	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl,
 				     &stat);
 	if (ret < 0) {
 		dev_err(cdev, "failed to get initial processor status, ret = %d\n",
@@ -1220,25 +1225,26 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 		core->atcm_enable = atcm_enable;
 		core->btcm_enable = btcm_enable;
 		core->loczrama = loczrama;
-		core->mem[0].dev_addr = loczrama ? 0 : K3_R5_TCM_DEV_ADDR;
-		core->mem[1].dev_addr = loczrama ? K3_R5_TCM_DEV_ADDR : 0;
+		kproc->mem[0].dev_addr = loczrama ? 0 : K3_R5_TCM_DEV_ADDR;
+		kproc->mem[1].dev_addr = loczrama ? K3_R5_TCM_DEV_ADDR : 0;
 	}
 
 	return ret;
 }
 
 static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
-					       struct k3_r5_core *core)
+					       struct k3_r5_rproc *kproc)
 {
 	static const char * const mem_names[] = {"atcm", "btcm"};
 	struct device *dev = &pdev->dev;
+	struct k3_r5_core *core = kproc->priv;
 	struct resource *res;
 	int num_mems;
 	int i;
 
 	num_mems = ARRAY_SIZE(mem_names);
-	core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), GFP_KERNEL);
-	if (!core->mem)
+	kproc->mem = devm_kcalloc(dev, num_mems, sizeof(*kproc->mem), GFP_KERNEL);
+	if (!kproc->mem)
 		return -ENOMEM;
 
 	for (i = 0; i < num_mems; i++) {
@@ -1264,13 +1270,13 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 		 * unaligned data accesses when using memcpy() or memset()
 		 * functions (normally seen with device type memory).
 		 */
-		core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
-							resource_size(res));
-		if (!core->mem[i].cpu_addr) {
+		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
+							 resource_size(res));
+		if (!kproc->mem[i].cpu_addr) {
 			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
 			return -ENOMEM;
 		}
-		core->mem[i].bus_addr = res->start;
+		kproc->mem[i].bus_addr = res->start;
 
 		/*
 		 * TODO:
@@ -1281,20 +1287,20 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 		 * SoCs) based on loczrama setting
 		 */
 		if (!strcmp(mem_names[i], "atcm")) {
-			core->mem[i].dev_addr = core->loczrama ?
+			kproc->mem[i].dev_addr = core->loczrama ?
 							0 : K3_R5_TCM_DEV_ADDR;
 		} else {
-			core->mem[i].dev_addr = core->loczrama ?
+			kproc->mem[i].dev_addr = core->loczrama ?
 							K3_R5_TCM_DEV_ADDR : 0;
 		}
-		core->mem[i].size = resource_size(res);
+		kproc->mem[i].size = resource_size(res);
 
 		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			mem_names[i], &core->mem[i].bus_addr,
-			core->mem[i].size, core->mem[i].cpu_addr,
-			core->mem[i].dev_addr);
+			mem_names[i], &kproc->mem[i].bus_addr,
+			kproc->mem[i].size, kproc->mem[i].cpu_addr,
+			kproc->mem[i].dev_addr);
 	}
-	core->num_mems = num_mems;
+	kproc->num_mems = num_mems;
 
 	return 0;
 }
@@ -1369,6 +1375,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct k3_r5_rproc *kproc;
 	struct k3_r5_core *core, *core1;
+	struct device_node *np;
 	struct device *cdev;
 	const char *fw_name;
 	struct rproc *rproc;
@@ -1377,6 +1384,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
 	list_for_each_entry(core, &cluster->cores, elem) {
 		cdev = core->dev;
+		np = dev_of_node(cdev);
 		ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
 		if (ret) {
 			dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
@@ -1397,11 +1405,63 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		rproc->recovery_disabled = true;
 
 		kproc = rproc->priv;
-		kproc->cluster = cluster;
-		kproc->core = core;
+		kproc->priv = core;
 		kproc->dev = cdev;
 		kproc->rproc = rproc;
-		core->rproc = rproc;
+		core->kproc = kproc;
+
+		kproc->ti_sci = devm_ti_sci_get_by_phandle(cdev, "ti,sci");
+		if (IS_ERR(kproc->ti_sci)) {
+			ret = dev_err_probe(cdev, PTR_ERR(kproc->ti_sci),
+					    "failed to get ti-sci handle\n");
+			kproc->ti_sci = NULL;
+			goto out;
+		}
+
+		ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
+		if (ret) {
+			dev_err(cdev, "missing 'ti,sci-dev-id' property\n");
+			goto out;
+		}
+
+		kproc->reset = devm_reset_control_get_exclusive(cdev, NULL);
+		if (IS_ERR_OR_NULL(kproc->reset)) {
+			ret = PTR_ERR_OR_ZERO(kproc->reset);
+			if (!ret)
+				ret = -ENODEV;
+			dev_err_probe(cdev, ret, "failed to get reset handle\n");
+			goto out;
+		}
+
+		kproc->tsp = ti_sci_proc_of_get_tsp(cdev, kproc->ti_sci);
+		if (IS_ERR(kproc->tsp)) {
+			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsp),
+					    "failed to construct ti-sci proc control\n");
+			goto out;
+		}
+
+		ret = k3_r5_core_of_get_internal_memories(to_platform_device(cdev), kproc);
+		if (ret) {
+			dev_err(cdev, "failed to get internal memories, ret = %d\n",
+				ret);
+			goto out;
+		}
+
+		ret = ti_sci_proc_request(kproc->tsp);
+		if (ret < 0) {
+			dev_err(cdev, "ti_sci_proc_request failed, ret = %d\n", ret);
+			goto out;
+		}
+
+		ret = devm_add_action_or_reset(cdev, k3_r5_release_tsp, kproc->tsp);
+		if (ret)
+			goto out;
+	}
+
+	list_for_each_entry(core, &cluster->cores, elem) {
+		cdev = core->dev;
+		kproc = core->kproc;
+		rproc = kproc->rproc;
 
 		ret = k3_r5_rproc_request_mbox(rproc);
 		if (ret)
@@ -1415,7 +1475,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 
 		ret = k3_r5_rproc_configure(kproc);
 		if (ret) {
-			dev_err(dev, "initial configure failed, ret = %d\n",
+			dev_err(cdev, "initial configure failed, ret = %d\n",
 				ret);
 			goto out;
 		}
@@ -1425,14 +1485,14 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 
 		ret = k3_r5_reserved_mem_init(kproc);
 		if (ret) {
-			dev_err(dev, "reserved memory init failed, ret = %d\n",
+			dev_err(cdev, "reserved memory init failed, ret = %d\n",
 				ret);
 			goto out;
 		}
 
-		ret = devm_rproc_add(dev, rproc);
+		ret = devm_rproc_add(cdev, rproc);
 		if (ret) {
-			dev_err_probe(dev, ret, "rproc_add failed\n");
+			dev_err_probe(cdev, ret, "rproc_add failed\n");
 			goto out;
 		}
 
@@ -1461,8 +1521,8 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 	/* undo core0 upon any failures on core1 in split-mode */
 	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1) {
 		core = list_prev_entry(core, elem);
-		rproc = core->rproc;
-		kproc = rproc->priv;
+		kproc = core->kproc;
+		rproc = kproc->rproc;
 		goto err_split;
 	}
 	return ret;
@@ -1487,8 +1547,8 @@ static void k3_r5_cluster_rproc_exit(void *data)
 		list_last_entry(&cluster->cores, struct k3_r5_core, elem);
 
 	list_for_each_entry_from_reverse(core, &cluster->cores, elem) {
-		rproc = core->rproc;
-		kproc = rproc->priv;
+		kproc = core->kproc;
+		rproc = kproc->rproc;
 
 		if (rproc->state == RPROC_ATTACHED) {
 			ret = rproc_detach(rproc);
@@ -1547,58 +1607,12 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
 		goto err;
 	}
 
-	core->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
-	if (IS_ERR(core->ti_sci)) {
-		ret = dev_err_probe(dev, PTR_ERR(core->ti_sci), "failed to get ti-sci handle\n");
-		core->ti_sci = NULL;
-		goto err;
-	}
-
-	ret = of_property_read_u32(np, "ti,sci-dev-id", &core->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "missing 'ti,sci-dev-id' property\n");
-		goto err;
-	}
-
-	core->reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR_OR_NULL(core->reset)) {
-		ret = PTR_ERR_OR_ZERO(core->reset);
-		if (!ret)
-			ret = -ENODEV;
-		dev_err_probe(dev, ret, "failed to get reset handle\n");
-		goto err;
-	}
-
-	core->tsp = ti_sci_proc_of_get_tsp(dev, core->ti_sci);
-	if (IS_ERR(core->tsp)) {
-		ret = dev_err_probe(dev, PTR_ERR(core->tsp),
-				    "failed to construct ti-sci proc control\n");
-		goto err;
-	}
-
-	ret = k3_r5_core_of_get_internal_memories(pdev, core);
-	if (ret) {
-		dev_err(dev, "failed to get internal memories, ret = %d\n",
-			ret);
-		goto err;
-	}
-
 	ret = k3_r5_core_of_get_sram_memories(pdev, core);
 	if (ret) {
 		dev_err(dev, "failed to get sram memories, ret = %d\n", ret);
 		goto err;
 	}
 
-	ret = ti_sci_proc_request(core->tsp);
-	if (ret < 0) {
-		dev_err(dev, "ti_sci_proc_request failed, ret = %d\n", ret);
-		goto err;
-	}
-
-	ret = devm_add_action_or_reset(dev, k3_r5_release_tsp, core->tsp);
-	if (ret)
-		goto err;
-
 	platform_set_drvdata(pdev, core);
 	devres_close_group(dev, k3_r5_core_of_init);
 
@@ -1660,6 +1674,7 @@ static int k3_r5_cluster_of_init(struct platform_device *pdev)
 		}
 
 		core = platform_get_drvdata(cpdev);
+		core->cluster = cluster;
 		put_device(&cpdev->dev);
 		list_add_tail(&core->elem, &cluster->cores);
 	}
-- 
2.34.1

