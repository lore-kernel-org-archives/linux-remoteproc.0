Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A01A2475E3;
	Fri, 25 Apr 2025 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577753; cv=none; b=Ze/XkhizadBg2EKLWg8xUCgI6rUEMv1aDit8fCfzgatt3g806+WLSqI8hfRGXPAq0MY1559dJwYxm7kKvKQRkh/W1agXUxDeH3PnjmG0eKJuMBr/McLKGjKAhBWPjSAUyjfwWbHuRcoijv057RSNzKvs9s7DBdmMYA8d9h9EkX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577753; c=relaxed/simple;
	bh=F55A6Z4UoulWQvlSKKdoS6WfsA1D8ACV6jC78xJewSs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tPu2Y288y9gk5jJghYwG0Q2hxMq7T2ILd9W0yuVKmvCJJQBOaC2wiKcFSjqJA+0TpUZ6ogPluKSC+hXdsgBm7PxkfgIWDMzAojrs9QTpHiS0rkDc9DDppKSF+CPqKl6XQWkjZnIirOL2j+QuIe13k5MaJbRvHAM5RoiKGr3dmfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xr94XYdv; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xr94XYdv"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgMCU2767904
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577742;
	bh=7b3Ag9tShX/dl8Q8QERRLs2e2xXd9TTFKHu36Sgda/o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xr94XYdvDdP03nukffru+22xg16N18DB5LDiVeWtU4A8g1mzZeGgk7yicAwF8ppeL
	 N+JPqb+/zQvSwdjGhfHXCiQS+f+Dlf8rNCsiaFGv224ptKTV5L3UY5NWiPhWVIsr4x
	 8Z3MzFNk9rDmGi4C1ojTLbB0fCJINnjpaT1TdDKw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgMBA129383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:22 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:22 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZW038329;
	Fri, 25 Apr 2025 05:42:18 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 11/35] remoteproc: k3: Refactor shared data structures
Date: Fri, 25 Apr 2025 16:11:11 +0530
Message-ID: <20250425104135.830255-12-b-padhi@ti.com>
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

The TI K3 R5, DSP and M4 remoteproc drivers share the same data
structure definitions. Refactor the shared data structures into a new
common header file, 'ti_k3_common.h', and update the drivers to use the
unified data structures.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-12-b-padhi@ti.com/

v10: Changelog:
None

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-10-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.h         |  91 +++++++++++++++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 120 ++++----------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 105 +++--------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 132 +++++-----------------
 4 files changed, 161 insertions(+), 287 deletions(-)
 create mode 100644 drivers/remoteproc/ti_k3_common.h

diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
new file mode 100644
index 0000000000000..43aedab9f0aa3
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
+ * @priv: void pointer to carry any private data
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
+	void *priv;
+};
+
+#endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 2191547529c55..e92fab831670c 100644
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
- * @priv: Remote processor private data
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
-	void *priv;
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
@@ -152,7 +80,7 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
  */
 static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = rproc->dev.parent;
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
@@ -165,7 +93,7 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
 }
 
 /* Put the DSP processor into reset */
-static int k3_dsp_rproc_reset(struct k3_dsp_rproc *kproc)
+static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	int ret;
@@ -191,7 +119,7 @@ static int k3_dsp_rproc_reset(struct k3_dsp_rproc *kproc)
 }
 
 /* Release the DSP processor from reset */
-static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
+static int k3_dsp_rproc_release(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	int ret;
@@ -220,7 +148,7 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
 
 static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	int ret;
@@ -264,7 +192,7 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
  */
 static int k3_dsp_rproc_prepare(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -288,7 +216,7 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
  */
 static int k3_dsp_rproc_unprepare(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -309,7 +237,7 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
  */
 static int k3_dsp_rproc_start(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	u32 boot_addr;
 	int ret;
@@ -341,7 +269,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
  */
 static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 
 	k3_dsp_rproc_reset(kproc);
 
@@ -381,7 +309,7 @@ static int k3_dsp_rproc_detach(struct rproc *rproc) { return 0; }
 static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
 							  size_t *rsc_table_sz)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 
 	if (!kproc->rmem[0].cpu_addr) {
@@ -410,7 +338,7 @@ static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
  */
 static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
-	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	void __iomem *va = NULL;
 	phys_addr_t bus_addr;
 	u32 dev_addr, offset;
@@ -467,9 +395,9 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
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
@@ -525,7 +453,7 @@ static void k3_dsp_mem_release(void *data)
 	of_reserved_mem_device_release(dev);
 }
 
-static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
+static int k3_dsp_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev->of_node;
@@ -606,8 +534,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
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
@@ -723,7 +651,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 
 static void k3_dsp_rproc_remove(struct platform_device *pdev)
 {
-	struct k3_dsp_rproc *kproc = platform_get_drvdata(pdev);
+	struct k3_rproc *kproc = platform_get_drvdata(pdev);
 	struct rproc *rproc = kproc->rproc;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -737,37 +665,37 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
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
index e83bef7cfddfd..04095407a483d 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -19,78 +19,7 @@
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
 #include "ti_sci_proc.h"
-
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
- * struct k3_m4_mem_data - memory definitions for a remote processor
- * @name: name for this memory entry
- * @dev_addr: device address for the memory entry
- */
-struct k3_m4_mem_data {
-	const char *name;
-	const u32 dev_addr;
-};
-
-/**
- * struct k3_m4_dev_data - device data structure for a M4 core
- * @mems: pointer to memory definitions for a M4 core
- * @num_mems: number of memory regions in @mems
- * @boot_align_addr: boot vector address alignment granularity
- * @uses_lreset: flag to denote the need for local reset management
- */
-struct k3_m4_dev_data {
-	const struct k3_m4_mem_data *mems;
-	u32 num_mems;
-	u32 boot_align_addr;
-	bool uses_lreset;
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
- * @data: pointer to M4-specific device data
- * @tsp: TI-SCI processor control handle
- * @ti_sci: TI-SCI handle
- * @ti_sci_id: TI-SCI device identifier
- * @mbox: mailbox channel handle
- * @client: mailbox client to request the mailbox channel
- * @priv: Remote processor private data
- */
-struct k3_m4_rproc {
-	struct device *dev;
-	struct rproc *rproc;
-	struct k3_m4_rproc_mem *mem;
-	int num_mems;
-	struct k3_m4_rproc_mem *rmem;
-	int num_rmems;
-	struct reset_control *reset;
-	const struct k3_m4_dev_data *data;
-	struct ti_sci_proc *tsp;
-	const struct ti_sci_handle *ti_sci;
-	u32 ti_sci_id;
-	struct mbox_chan *mbox;
-	struct mbox_client client;
-	void *priv;
-};
+#include "ti_k3_common.h"
 
 /**
  * k3_m4_rproc_mbox_callback() - inbound mailbox message handler
@@ -147,7 +76,7 @@ static void k3_m4_rproc_mbox_callback(struct mbox_client *client, void *data)
  */
 static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	u32 msg = (u32)vqid;
 	int ret;
@@ -163,7 +92,7 @@ static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
 			ret);
 }
 
-static int k3_m4_rproc_ping_mbox(struct k3_m4_rproc *kproc)
+static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	int ret;
@@ -195,7 +124,7 @@ static int k3_m4_rproc_ping_mbox(struct k3_m4_rproc *kproc)
  */
 static int k3_m4_rproc_prepare(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -240,7 +169,7 @@ static int k3_m4_rproc_prepare(struct rproc *rproc)
  */
 static int k3_m4_rproc_unprepare(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -271,7 +200,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
 static struct resource_table *k3_m4_get_loaded_rsc_table(struct rproc *rproc,
 							 size_t *rsc_table_sz)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 
 	if (!kproc->rmem[0].cpu_addr) {
@@ -301,7 +230,7 @@ static struct resource_table *k3_m4_get_loaded_rsc_table(struct rproc *rproc,
  */
 static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	void __iomem *va = NULL;
 	phys_addr_t bus_addr;
 	u32 dev_addr, offset;
@@ -347,9 +276,9 @@ static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 }
 
 static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
-				       struct k3_m4_rproc *kproc)
+				       struct k3_rproc *kproc)
 {
-	const struct k3_m4_dev_data *data = kproc->data;
+	const struct k3_rproc_dev_data *data = kproc->data;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	int num_mems;
@@ -405,7 +334,7 @@ static void k3_m4_rproc_dev_mem_release(void *data)
 	of_reserved_mem_device_release(dev);
 }
 
-static int k3_m4_reserved_mem_init(struct k3_m4_rproc *kproc)
+static int k3_m4_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev->of_node;
@@ -490,7 +419,7 @@ static void k3_m4_release_tsp(void *data)
  */
 static int k3_m4_rproc_start(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -515,7 +444,7 @@ static int k3_m4_rproc_start(struct rproc *rproc)
  */
 static int k3_m4_rproc_stop(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 	int ret;
 
@@ -537,7 +466,7 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
  */
 static int k3_m4_rproc_attach(struct rproc *rproc)
 {
-	struct k3_m4_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	int ret;
 
 	ret = k3_m4_rproc_ping_mbox(kproc);
@@ -574,8 +503,8 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 static int k3_m4_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct k3_m4_rproc *kproc;
-	const struct k3_m4_dev_data *data;
+	const struct k3_rproc_dev_data *data;
+	struct k3_rproc *kproc;
 	struct rproc *rproc;
 	const char *fw_name;
 	bool r_state = false;
@@ -668,12 +597,12 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct k3_m4_mem_data am64_m4_mems[] = {
+static const struct k3_rproc_mem_data am64_m4_mems[] = {
 	{ .name = "iram", .dev_addr = 0x0 },
 	{ .name = "dram", .dev_addr = 0x30000 },
 };
 
-static const struct k3_m4_dev_data am64_m4_data = {
+static const struct k3_rproc_dev_data am64_m4_data = {
 	.mems = am64_m4_mems,
 	.num_mems = ARRAY_SIZE(am64_m4_mems),
 	.boot_align_addr = SZ_1K,
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index e2dd5c38a0668..a6799ce121327 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -26,6 +26,7 @@
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
 #include "ti_sci_proc.h"
+#include "ti_k3_common.h"
 
 /* This address can either be for ATCM or BTCM with the other at address 0x0 */
 #define K3_R5_TCM_DEV_ADDR	0x41010000
@@ -55,20 +56,6 @@
 /* Applicable to only AM64x SoCs */
 #define PROC_BOOT_STATUS_FLAG_R5_SINGLECORE_ONLY	0x00000200
 
-/**
- * struct k3_r5_mem - internal memory structure
- * @cpu_addr: MPU virtual address of the memory region
- * @bus_addr: Bus address used to access the memory region
- * @dev_addr: Device address from remoteproc view
- * @size: Size of the memory region
- */
-struct k3_r5_mem {
-	void __iomem *cpu_addr;
-	phys_addr_t bus_addr;
-	u32 dev_addr;
-	size_t size;
-};
-
 /*
  * All cluster mode values are not applicable on all SoCs. The following
  * are the modes supported on various SoCs:
@@ -84,30 +71,6 @@ enum cluster_mode {
 	CLUSTER_MODE_SINGLECORE
 };
 
-/**
- * struct k3_r5_mem_data - memory definitions for a R5
- * @name: name for this memory entry
- * @dev_addr: device address for the memory entry
- */
-struct k3_r5_mem_data {
-	const char *name;
-	const u32 dev_addr;
-};
-
-/**
- * struct k3_r5_dev_data - device data structure for a R5
- * @mems: pointer to memory definitions for a R5
- * @num_mems: number of memory regions in @mems
- * @boot_align_addr: boot vector address alignment granularity
- * @uses_lreset: flag to denote the need for local reset management
- */
-struct k3_r5_dev_data {
-	const struct k3_r5_mem_data *mems;
-	u32 num_mems;
-	u32 boot_align_addr;
-	bool uses_lreset;
-};
-
 /**
  * struct k3_r5_soc_data - match data to handle SoC variations
  * @tcm_is_double: flag to denote the larger unified TCMs in certain modes
@@ -121,7 +84,7 @@ struct k3_r5_soc_data {
 	bool tcm_ecc_autoinit;
 	bool single_cpu_mode;
 	bool is_single_core;
-	const struct k3_r5_dev_data *core_data;
+	const struct k3_rproc_dev_data *core_data;
 };
 
 /**
@@ -140,8 +103,6 @@ struct k3_r5_cluster {
 	const struct k3_r5_soc_data *soc_data;
 };
 
-struct k3_r5_rproc;
-
 /**
  * struct k3_r5_core - K3 R5 core structure
  * @elem: linked list item
@@ -158,9 +119,9 @@ struct k3_r5_rproc;
 struct k3_r5_core {
 	struct list_head elem;
 	struct device *dev;
-	struct k3_r5_rproc *kproc;
+	struct k3_rproc *kproc;
 	struct k3_r5_cluster *cluster;
-	struct k3_r5_mem *sram;
+	struct k3_rproc_mem *sram;
 	int num_sram;
 	u32 atcm_enable;
 	u32 btcm_enable;
@@ -168,40 +129,6 @@ struct k3_r5_core {
 	bool released_from_reset;
 };
 
-/**
- * struct k3_r5_rproc - K3 remote processor state
- * @dev: cached device pointer
- * @rproc: rproc handle
- * @mem: internal memory regions data
- * @num_mems: number of internal memory regions
- * @rmem: reserved memory regions data
- * @num_rmems: number of reserved memory regions
- * @reset: reset control handle
- * @data: pointer to R5-core-specific device data
- * @tsp: TI-SCI processor control handle
- * @ti_sci: TI-SCI handle
- * @ti_sci_id: TI-SCI device identifier
- * @mbox: mailbox channel handle
- * @client: mailbox client to request the mailbox channel
- * @priv: Remote processor private data
- */
-struct k3_r5_rproc {
-	struct device *dev;
-	struct rproc *rproc;
-	struct k3_r5_mem *mem;
-	int num_mems;
-	struct k3_r5_mem *rmem;
-	int num_rmems;
-	struct reset_control *reset;
-	const struct k3_r5_dev_data *data;
-	struct ti_sci_proc *tsp;
-	const struct ti_sci_handle *ti_sci;
-	u32 ti_sci_id;
-	struct mbox_chan *mbox;
-	struct mbox_client client;
-	void *priv;
-};
-
 /**
  * k3_r5_rproc_mbox_callback() - inbound mailbox message handler
  * @client: mailbox client pointer used for requesting the mailbox channel
@@ -218,8 +145,7 @@ struct k3_r5_rproc {
  */
 static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
 {
-	struct k3_r5_rproc *kproc = container_of(client, struct k3_r5_rproc,
-						client);
+	struct k3_rproc *kproc = container_of(client, struct k3_rproc, client);
 	struct device *dev = kproc->rproc->dev.parent;
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
@@ -254,7 +180,7 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
 /* kick a virtqueue */
 static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
 {
-	struct k3_r5_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = rproc->dev.parent;
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
@@ -266,7 +192,7 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
 			ret);
 }
 
-static int k3_r5_split_reset(struct k3_r5_rproc *kproc)
+static int k3_r5_split_reset(struct k3_rproc *kproc)
 {
 	int ret;
 
@@ -289,7 +215,7 @@ static int k3_r5_split_reset(struct k3_r5_rproc *kproc)
 	return ret;
 }
 
-static int k3_r5_split_release(struct k3_r5_rproc *kproc)
+static int k3_r5_split_release(struct k3_rproc *kproc)
 {
 	int ret;
 
@@ -316,7 +242,7 @@ static int k3_r5_split_release(struct k3_r5_rproc *kproc)
 static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 {
 	struct k3_r5_core *core;
-	struct k3_r5_rproc *kproc;
+	struct k3_rproc *kproc;
 	int ret;
 
 	/* assert local reset on all applicable cores */
@@ -364,7 +290,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 {
 	struct k3_r5_core *core;
-	struct k3_r5_rproc *kproc;
+	struct k3_rproc *kproc;
 	int ret;
 
 	/* enable PSC modules on all applicable cores */
@@ -409,13 +335,13 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 	return ret;
 }
 
-static inline int k3_r5_core_halt(struct k3_r5_rproc *kproc)
+static inline int k3_r5_core_halt(struct k3_rproc *kproc)
 {
 	return ti_sci_proc_set_control(kproc->tsp,
 				       PROC_BOOT_CTRL_FLAG_R5_CORE_HALT, 0);
 }
 
-static inline int k3_r5_core_run(struct k3_r5_rproc *kproc)
+static inline int k3_r5_core_run(struct k3_rproc *kproc)
 {
 	return ti_sci_proc_set_control(kproc->tsp,
 				       0, PROC_BOOT_CTRL_FLAG_R5_CORE_HALT);
@@ -423,7 +349,7 @@ static inline int k3_r5_core_run(struct k3_r5_rproc *kproc)
 
 static int k3_r5_rproc_request_mbox(struct rproc *rproc)
 {
-	struct k3_r5_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	int ret;
@@ -474,7 +400,7 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
  */
 static int k3_r5_rproc_prepare(struct rproc *rproc)
 {
-	struct k3_r5_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct k3_r5_core *core = kproc->priv, *core0, *core1;
 	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
@@ -572,7 +498,7 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
  */
 static int k3_r5_rproc_unprepare(struct rproc *rproc)
 {
-	struct k3_r5_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct k3_r5_core *core = kproc->priv, *core0, *core1;
 	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
@@ -635,7 +561,7 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
  */
 static int k3_r5_rproc_start(struct rproc *rproc)
 {
-	struct k3_r5_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct k3_r5_core *core = kproc->priv;
 	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
@@ -700,7 +626,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
  */
 static int k3_r5_rproc_stop(struct rproc *rproc)
 {
-	struct k3_r5_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct k3_r5_core *core = kproc->priv;
 	struct k3_r5_cluster *cluster = core->cluster;
 	int ret;
@@ -764,7 +690,7 @@ static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
 static struct resource_table *k3_r5_get_loaded_rsc_table(struct rproc *rproc,
 							 size_t *rsc_table_sz)
 {
-	struct k3_r5_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct device *dev = kproc->dev;
 
 	if (!kproc->rmem[0].cpu_addr) {
@@ -793,7 +719,7 @@ static struct resource_table *k3_r5_get_loaded_rsc_table(struct rproc *rproc,
  */
 static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
-	struct k3_r5_rproc *kproc = rproc->priv;
+	struct k3_rproc *kproc = rproc->priv;
 	struct k3_r5_core *core = kproc->priv;
 	void __iomem *va = NULL;
 	phys_addr_t bus_addr;
@@ -896,7 +822,7 @@ static const struct rproc_ops k3_r5_rproc_ops = {
  * both the cores with the same settings, before reconfiguing again for
  * LockStep mode.
  */
-static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
+static int k3_r5_rproc_configure(struct k3_rproc *kproc)
 {
 	struct k3_r5_core *temp, *core0, *core = kproc->priv;
 	struct k3_r5_cluster *cluster = core->cluster;
@@ -1025,7 +951,7 @@ static void k3_r5_mem_release(void *data)
 	of_reserved_mem_device_release(dev);
 }
 
-static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
+static int k3_r5_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev_of_node(dev);
@@ -1118,7 +1044,7 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
  * supported SoCs. The Core0 TCM sizes therefore have to be adjusted to only
  * half the original size in Split mode.
  */
-static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
+static void k3_r5_adjust_tcm_sizes(struct k3_rproc *kproc)
 {
 	struct k3_r5_core *core0, *core = kproc->priv;
 	struct k3_r5_cluster *cluster = core->cluster;
@@ -1156,7 +1082,7 @@ static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
  * actual values configured by bootloader. The driver internal device memory
  * addresses for TCMs are also updated.
  */
-static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
+static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 {
 	struct k3_r5_core *core0, *core = kproc->priv;
 	struct k3_r5_cluster *cluster = core->cluster;
@@ -1261,9 +1187,9 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 }
 
 static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
-					       struct k3_r5_rproc *kproc)
+					       struct k3_rproc *kproc)
 {
-	const struct k3_r5_dev_data *data = kproc->data;
+	const struct k3_rproc_dev_data *data = kproc->data;
 	struct device *dev = &pdev->dev;
 	struct k3_r5_core *core = kproc->priv;
 	struct resource *res;
@@ -1403,7 +1329,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
-	struct k3_r5_rproc *kproc;
+	struct k3_rproc *kproc;
 	struct k3_r5_core *core, *core1;
 	struct device_node *np;
 	struct device *cdev;
@@ -1562,7 +1488,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 static void k3_r5_cluster_rproc_exit(void *data)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(data);
-	struct k3_r5_rproc *kproc;
+	struct k3_rproc *kproc;
 	struct k3_r5_core *core;
 	struct rproc *rproc;
 	int ret;
@@ -1803,12 +1729,12 @@ static int k3_r5_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct k3_r5_mem_data r5_mems[] = {
+static const struct k3_rproc_mem_data r5_mems[] = {
 	{ .name = "atcm", .dev_addr = 0x0 },
 	{ .name = "btcm", .dev_addr = K3_R5_TCM_DEV_ADDR },
 };
 
-static const struct k3_r5_dev_data r5_data = {
+static const struct k3_rproc_dev_data r5_data = {
 	.mems = r5_mems,
 	.num_mems = ARRAY_SIZE(r5_mems),
 	.boot_align_addr = 0,
-- 
2.34.1

