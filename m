Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00CA1AA1C4;
	Fri,  3 Jan 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899179; cv=none; b=EMaND/TyZSDAl3vX1lEeRosmVJUMueTDG6AEnY8EvKo8Cn3XsmrVl477PP0BgBri9kmAys2ioB7gAaZ9IqjloZnU7pmZg1GTwF4RoeatW/v0r1gHTYyTPHlT5HR5eO5qxRBrD9kqd/W8sf8r8TEkRsiRN8gULnKSzeMbNKLKdj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899179; c=relaxed/simple;
	bh=1xrsul6mWUfeY7v3QeDuawa4NM8rB5KbDK5aNG+L0Kc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhxLedcwHRxCltcMQFVCBCrWN/Vfm7Ioe1jI8iApt7XfE5kcDsZPE4BNjd3vyso1IhCLm7f3ByA95tD5yFH0J2y0K/Z8xOnk8ahUg3bT26OOS5BdwAl1roWsdZXYepWQpjmS5gR4NEoik1XZzLd/dmCRUtsjjHePIYULcNPdvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f9VPxqD8; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f9VPxqD8"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ACh7E2019393
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 04:12:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899163;
	bh=SBV1OsWQ7+r/n2HtEto3x74O2ImMh4Yh7VsMQ0rS9ak=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f9VPxqD8TZAgnfuWyD/ECZb3Oowx1wiS5+ybNz7W3FGXzyd2HMstkbLZgvuBND2ra
	 LEfETea51jdid0oy8oExckLgvfAuc9dzxnWteFohEAtOCHxJicnzzOPXeuheggl7GF
	 1f3j6zM9LN+lM5t3//QDtESmALWrOynCPiyvXz4o=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503AChCF041836;
	Fri, 3 Jan 2025 04:12:43 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:12:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:12:43 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSK126047;
	Fri, 3 Jan 2025 04:12:40 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 02/20] remoteproc: k3: Refactor shared data structures
Date: Fri, 3 Jan 2025 15:42:13 +0530
Message-ID: <20250103101231.1508151-3-b-padhi@ti.com>
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

The ti_k3_dsp_remoteproc.c and ti_k3_m4_remoteproc.c drivers share the
same data structure definitions. Refactor the shared data structures
into a new common header file, 'ti_k3_common.h', and update both drivers
to use the unified data structures.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.h         |  91 ++++++++++++++++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 124 +++++-----------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  85 +++------------
 3 files changed, 132 insertions(+), 168 deletions(-)
 create mode 100644 drivers/remoteproc/ti_k3_common.h

diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
new file mode 100644
index 000000000000..9d7ce70bcbf5
--- /dev/null
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * TI K3 Remote Processor(s) driver common code
+ *
+ * Refactored out of ti_k3_dsp_remoteproc.c and ti_k3_m4_remoteproc.c.
+ *
+ * ti_k3_dsp_remoteproc.c:
+ * Copyright (C) 2018-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *	Suman Anna <s-anna@ti.com>
+ *
+ * ti_k3_m4_remoteproc.c:
+ * Copyright (C) 2021-2024 Texas Instruments Incorporated - https://www.ti.com/
+ *	Hari Nagalla <hnagalla@ti.com>
+ */
+
+#ifndef REMOTEPROC_TI_K3_COMMON_H
+#define REMOTEPROC_TI_K3_COMMON_H
+
+/**
+ * struct k3_rproc_mem - internal memory structure
+ * @cpu_addr: MPU virtual address of the memory region
+ * @bus_addr: Bus address used to access the memory region
+ * @dev_addr: Device address of the memory region from remote processor view
+ * @size: Size of the memory region
+ */
+struct k3_rproc_mem {
+	void __iomem *cpu_addr;
+	phys_addr_t bus_addr;
+	u32 dev_addr;
+	size_t size;
+};
+
+/**
+ * struct k3_rproc_mem_data - memory definitions for a remote processor
+ * @name: name for this memory entry
+ * @dev_addr: device address for the memory entry
+ */
+struct k3_rproc_mem_data {
+	const char *name;
+	const u32 dev_addr;
+};
+
+/**
+ * struct k3_rproc_dev_data - device data structure for a remote processor
+ * @mems: pointer to memory definitions for a remote processor
+ * @num_mems: number of memory regions in @mems
+ * @boot_align_addr: boot vector address alignment granularity
+ * @uses_lreset: flag to denote the need for local reset management
+ */
+struct k3_rproc_dev_data {
+	const struct k3_rproc_mem_data *mems;
+	u32 num_mems;
+	u32 boot_align_addr;
+	bool uses_lreset;
+};
+
+/**
+ * struct k3_rproc - k3 remote processor driver structure
+ * @dev: cached device pointer
+ * @rproc: remoteproc device handle
+ * @mem: internal memory regions data
+ * @num_mems: number of internal memory regions
+ * @rmem: reserved memory regions data
+ * @num_rmems: number of reserved memory regions
+ * @reset: reset control handle
+ * @data: pointer to DSP-specific device data
+ * @tsp: TI-SCI processor control handle
+ * @ti_sci: TI-SCI handle
+ * @ti_sci_id: TI-SCI device identifier
+ * @mbox: mailbox channel handle
+ * @client: mailbox client to request the mailbox channel
+ * @is_attach_ongoing: flag to indicate if IPC-only "attach()" is in progress
+ */
+struct k3_rproc {
+	struct device *dev;
+	struct rproc *rproc;
+	struct k3_rproc_mem *mem;
+	int num_mems;
+	struct k3_rproc_mem *rmem;
+	int num_rmems;
+	struct reset_control *reset;
+	const struct k3_rproc_dev_data *data;
+	struct ti_sci_proc *tsp;
+	const struct ti_sci_handle *ti_sci;
+	u32 ti_sci_id;
+	struct mbox_chan *mbox;
+	struct mbox_client client;
+	bool is_attach_ongoing;
+};
+
+#endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index f20fc2db077b..41b32af15260 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -20,81 +20,10 @@
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
 #include "ti_sci_proc.h"
+#include "ti_k3_common.h"
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-/**
- * struct k3_dsp_mem - internal memory structure
- * @cpu_addr: MPU virtual address of the memory region
- * @bus_addr: Bus address used to access the memory region
- * @dev_addr: Device address of the memory region from DSP view
- * @size: Size of the memory region
- */
-struct k3_dsp_mem {
-	void __iomem *cpu_addr;
-	phys_addr_t bus_addr;
-	u32 dev_addr;
-	size_t size;
-};
-
-/**
- * struct k3_dsp_mem_data - memory definitions for a DSP
- * @name: name for this memory entry
- * @dev_addr: device address for the memory entry
- */
-struct k3_dsp_mem_data {
-	const char *name;
-	const u32 dev_addr;
-};
-
-/**
- * struct k3_dsp_dev_data - device data structure for a DSP
- * @mems: pointer to memory definitions for a DSP
- * @num_mems: number of memory regions in @mems
- * @boot_align_addr: boot vector address alignment granularity
- * @uses_lreset: flag to denote the need for local reset management
- */
-struct k3_dsp_dev_data {
-	const struct k3_dsp_mem_data *mems;
-	u32 num_mems;
-	u32 boot_align_addr;
-	bool uses_lreset;
-};
-
-/**
- * struct k3_dsp_rproc - k3 DSP remote processor driver structure
- * @dev: cached device pointer
- * @rproc: remoteproc device handle
- * @mem: internal memory regions data
- * @num_mems: number of internal memory regions
- * @rmem: reserved memory regions data
- * @num_rmems: number of reserved memory regions
- * @reset: reset control handle
- * @data: pointer to DSP-specific device data
- * @tsp: TI-SCI processor control handle
- * @ti_sci: TI-SCI handle
- * @ti_sci_id: TI-SCI device identifier
- * @mbox: mailbox channel handle
- * @client: mailbox client to request the mailbox channel
- * @is_attach_ongoing: flag to indicate if IPC-only "attach()" is in progress
- */
-struct k3_dsp_rproc {
-	struct device *dev;
-	struct rproc *rproc;
-	struct k3_dsp_mem *mem;
-	int num_mems;
-	struct k3_dsp_mem *rmem;
-	int num_rmems;
-	struct reset_control *reset;
-	const struct k3_dsp_dev_data *data;
-	struct ti_sci_proc *tsp;
-	const struct ti_sci_handle *ti_sci;
-	u32 ti_sci_id;
-	struct mbox_chan *mbox;
-	struct mbox_client client;
-	bool is_attach_ongoing;
-};
-
 /**
  * k3_dsp_rproc_mbox_callback() - inbound mailbox message handler
  * @client: mailbox client pointer used for requesting the mailbox channel
@@ -111,8 +40,7 @@ struct k3_dsp_rproc {
  */
 static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
 {
-	struct k3_dsp_rproc *kproc = container_of(client, struct k3_dsp_rproc,
-						  client);
+	struct k3_rproc *kproc = container_of(client, struct k3_rproc, client);
 	struct device *dev = kproc->rproc->dev.parent;
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
@@ -159,7 +87,7 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
  */
 static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = rproc->dev.parent;
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
@@ -179,7 +107,7 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
 }
 
 /* Put the DSP processor into reset */
-static int k3_dsp_rproc_reset(struct k3_dsp_rproc *kproc)
+static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	int ret;
@@ -205,7 +133,7 @@ static int k3_dsp_rproc_reset(struct k3_dsp_rproc *kproc)
 }
 
 /* Release the DSP processor from reset */
-static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
+static int k3_dsp_rproc_release(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	int ret;
@@ -234,7 +162,7 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
 
 static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	int ret;
@@ -278,7 +206,7 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
  */
 static int k3_dsp_rproc_prepare(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -302,7 +230,7 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
  */
 static int k3_dsp_rproc_unprepare(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -323,7 +251,7 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
  */
 static int k3_dsp_rproc_start(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	u32 boot_addr;
 	int ret;
@@ -355,7 +283,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
  */
 static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 
 	k3_dsp_rproc_reset(kproc);
 
@@ -374,7 +302,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
  */
 static int k3_dsp_rproc_attach(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 
 	kproc->is_attach_ongoing = true;
 
@@ -392,7 +320,7 @@ static int k3_dsp_rproc_attach(struct rproc *rproc)
  */
 static int k3_dsp_rproc_detach(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 
 	kproc->is_attach_ongoing = false;
 
@@ -412,7 +340,7 @@ static int k3_dsp_rproc_detach(struct rproc *rproc)
 static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
 							  size_t *rsc_table_sz)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 
 	if (!kproc->rmem[0].cpu_addr) {
@@ -441,7 +369,7 @@ static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
  */
 static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	void __iomem *va = NULL;
 	phys_addr_t bus_addr;
 	u32 dev_addr, offset;
@@ -498,9 +426,9 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 };
 
 static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
-					struct k3_dsp_rproc *kproc)
+					struct k3_rproc *kproc)
 {
-	const struct k3_dsp_dev_data *data = kproc->data;
+	const struct k3_rproc_dev_data *data = kproc->data;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	int num_mems = 0;
@@ -556,7 +484,7 @@ static void k3_dsp_mem_release(void *data)
 	of_reserved_mem_device_release(dev);
 }
 
-static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
+static int k3_dsp_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev->of_node;
@@ -637,8 +565,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	const struct k3_dsp_dev_data *data;
-	struct k3_dsp_rproc *kproc;
+	const struct k3_rproc_dev_data *data;
+	struct k3_rproc *kproc;
 	struct rproc *rproc;
 	const char *fw_name;
 	bool p_state = false;
@@ -754,7 +682,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 
 static void k3_dsp_rproc_remove(struct platform_device *pdev)
 {
-	struct k3_dsp_rproc *kproc = platform_get_drvdata(pdev);
+	struct k3_rproc *kproc = platform_get_drvdata(pdev);
 	struct rproc *rproc = kproc->rproc;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -768,37 +696,37 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
 	mbox_free_channel(kproc->mbox);
 }
 
-static const struct k3_dsp_mem_data c66_mems[] = {
+static const struct k3_rproc_mem_data c66_mems[] = {
 	{ .name = "l2sram", .dev_addr = 0x800000 },
 	{ .name = "l1pram", .dev_addr = 0xe00000 },
 	{ .name = "l1dram", .dev_addr = 0xf00000 },
 };
 
 /* C71x cores only have a L1P Cache, there are no L1P SRAMs */
-static const struct k3_dsp_mem_data c71_mems[] = {
+static const struct k3_rproc_mem_data c71_mems[] = {
 	{ .name = "l2sram", .dev_addr = 0x800000 },
 	{ .name = "l1dram", .dev_addr = 0xe00000 },
 };
 
-static const struct k3_dsp_mem_data c7xv_mems[] = {
+static const struct k3_rproc_mem_data c7xv_mems[] = {
 	{ .name = "l2sram", .dev_addr = 0x800000 },
 };
 
-static const struct k3_dsp_dev_data c66_data = {
+static const struct k3_rproc_dev_data c66_data = {
 	.mems = c66_mems,
 	.num_mems = ARRAY_SIZE(c66_mems),
 	.boot_align_addr = SZ_1K,
 	.uses_lreset = true,
 };
 
-static const struct k3_dsp_dev_data c71_data = {
+static const struct k3_rproc_dev_data c71_data = {
 	.mems = c71_mems,
 	.num_mems = ARRAY_SIZE(c71_mems),
 	.boot_align_addr = SZ_2M,
 	.uses_lreset = false,
 };
 
-static const struct k3_dsp_dev_data c7xv_data = {
+static const struct k3_rproc_dev_data c7xv_data = {
 	.mems = c7xv_mems,
 	.num_mems = ARRAY_SIZE(c7xv_mems),
 	.boot_align_addr = SZ_2M,
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 3201c3684a86..feca53978c62 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -19,66 +19,11 @@
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
 #include "ti_sci_proc.h"
+#include "ti_k3_common.h"
 
 #define K3_M4_IRAM_DEV_ADDR 0x00000
 #define K3_M4_DRAM_DEV_ADDR 0x30000
 
-/**
- * struct k3_m4_rproc_mem - internal memory structure
- * @cpu_addr: MPU virtual address of the memory region
- * @bus_addr: Bus address used to access the memory region
- * @dev_addr: Device address of the memory region from remote processor view
- * @size: Size of the memory region
- */
-struct k3_m4_rproc_mem {
-	void __iomem *cpu_addr;
-	phys_addr_t bus_addr;
-	u32 dev_addr;
-	size_t size;
-};
-
-/**
- * struct k3_m4_rproc_mem_data - memory definitions for a remote processor
- * @name: name for this memory entry
- * @dev_addr: device address for the memory entry
- */
-struct k3_m4_rproc_mem_data {
-	const char *name;
-	const u32 dev_addr;
-};
-
-/**
- * struct k3_m4_rproc - k3 remote processor driver structure
- * @dev: cached device pointer
- * @rproc: remoteproc device handle
- * @mem: internal memory regions data
- * @num_mems: number of internal memory regions
- * @rmem: reserved memory regions data
- * @num_rmems: number of reserved memory regions
- * @reset: reset control handle
- * @tsp: TI-SCI processor control handle
- * @ti_sci: TI-SCI handle
- * @ti_sci_id: TI-SCI device identifier
- * @mbox: mailbox channel handle
- * @client: mailbox client to request the mailbox channel
- * @is_attach_ongoing: flag to indicate if IPC-only "attach()" is in progress
- */
-struct k3_m4_rproc {
-	struct device *dev;
-	struct rproc *rproc;
-	struct k3_m4_rproc_mem *mem;
-	int num_mems;
-	struct k3_m4_rproc_mem *rmem;
-	int num_rmems;
-	struct reset_control *reset;
-	struct ti_sci_proc *tsp;
-	const struct ti_sci_handle *ti_sci;
-	u32 ti_sci_id;
-	struct mbox_chan *mbox;
-	struct mbox_client client;
-	bool is_attach_ongoing;
-};
-
 /**
  * k3_m4_rproc_mbox_callback() - inbound mailbox message handler
  * @client: mailbox client pointer used for requesting the mailbox channel
@@ -97,7 +42,7 @@ static void k3_m4_rproc_mbox_callback(struct mbox_client *client, void *data)
 {
 	struct device *dev = client->dev;
 	struct rproc *rproc = dev_get_drvdata(dev);
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	u32 msg = (u32)(uintptr_t)(data);
 
 	/*
@@ -142,7 +87,7 @@ static void k3_m4_rproc_mbox_callback(struct mbox_client *client, void *data)
  */
 static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	u32 msg = (u32)vqid;
 	int ret;
@@ -164,7 +109,7 @@ static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
 			ret);
 }
 
-static int k3_m4_rproc_ping_mbox(struct k3_m4_rproc *kproc)
+static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	int ret;
@@ -196,7 +141,7 @@ static int k3_m4_rproc_ping_mbox(struct k3_m4_rproc *kproc)
  */
 static int k3_m4_rproc_prepare(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -241,7 +186,7 @@ static int k3_m4_rproc_prepare(struct rproc *rproc)
  */
 static int k3_m4_rproc_unprepare(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -272,7 +217,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
 static struct resource_table *k3_m4_get_loaded_rsc_table(struct rproc *rproc,
 							 size_t *rsc_table_sz)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 
 	if (!kproc->rmem[0].cpu_addr) {
@@ -302,7 +247,7 @@ static struct resource_table *k3_m4_get_loaded_rsc_table(struct rproc *rproc,
  */
 static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	void __iomem *va = NULL;
 	phys_addr_t bus_addr;
 	u32 dev_addr, offset;
@@ -348,7 +293,7 @@ static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 }
 
 static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
-				       struct k3_m4_rproc *kproc)
+				       struct k3_rproc *kproc)
 {
 	static const char * const mem_names[] = { "iram", "dram" };
 	static const u32 mem_addrs[] = { K3_M4_IRAM_DEV_ADDR, K3_M4_DRAM_DEV_ADDR };
@@ -407,7 +352,7 @@ static void k3_m4_rproc_dev_mem_release(void *data)
 	of_reserved_mem_device_release(dev);
 }
 
-static int k3_m4_reserved_mem_init(struct k3_m4_rproc *kproc)
+static int k3_m4_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev->of_node;
@@ -492,7 +437,7 @@ static void k3_m4_release_tsp(void *data)
  */
 static int k3_m4_rproc_start(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -517,7 +462,7 @@ static int k3_m4_rproc_start(struct rproc *rproc)
  */
 static int k3_m4_rproc_stop(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -541,7 +486,7 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
  */
 static int k3_m4_rproc_attach(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	int ret;
 
 	kproc->is_attach_ongoing = true;
@@ -564,7 +509,7 @@ static int k3_m4_rproc_attach(struct rproc *rproc)
  */
 static int k3_m4_rproc_detach(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 
 	kproc->is_attach_ongoing = false;
 
@@ -586,7 +531,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 static int k3_m4_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct k3_m4_rproc *kproc;
+	struct k3_rproc *kproc;
 	struct rproc *rproc;
 	const char *fw_name;
 	bool r_state = false;
-- 
2.34.1

