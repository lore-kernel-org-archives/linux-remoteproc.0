Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA849258CC3;
	Thu, 17 Apr 2025 18:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914046; cv=none; b=Uu5k66oV3bzEUnLumCpPTxR9iLEh6JpzCnc/eQmvDFbRaJ4qHwYkA25rpQwqkgX8NoNXY2OquO3iZavNz27wjVU6ruW7dzQRW8KYh8MNua3alvisXEFDB6uFezbw5dL5FNLp9hQh1tDNX8A8KebVyT9+1CXnGJq5tVq6aomTJKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914046; c=relaxed/simple;
	bh=98SZpoaERwj9vViG4APzLEqwFeyGXYp6soyLU3Qs7RQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IXlCnTU+1Modcjwfv3SzUm+/ssclrX2Syoc/+f3kyv80pKTmBpyWEuDyFEF4D+rLqkrJ7QbB0Elhe/UgMYzL/nilbsAWnMfozhse3BWX3vLDIkd8+UOVd3r3qbBydPujLSjIslkCfd13Xe72TsUtx8FNhu3OPZK6oRu1xRO4CO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Rv3AOsXh; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Rv3AOsXh"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKW2l080368
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914032;
	bh=q7RJ9MHcDGG9elUeLTMTOypoJGvFQM3t792jb4YIS4E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Rv3AOsXhx/VNwcXiUQasgVh+nM/UTkaqeqg7EcQsFFJFOPGm1KCDb/ApRUHah2IyT
	 qBwZeMP3Rk3fgkwyIcFHyDjWbnfDZS2bCyYUL1+6QhnafLZpim8lwQVXLwTJBliWhq
	 K5ljo8NGDsWIlARHltX1inGCTyBMuiZe3+s93V8o=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKWUk027682
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:20:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:20:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:20:32 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1Hp071102;
	Thu, 17 Apr 2025 13:20:28 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 07/33] remoteproc: k3-r5: Use k3_r5_rproc_mem_data structure for memory info
Date: Thu, 17 Apr 2025 23:49:35 +0530
Message-ID: <20250417182001.3903905-8-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417182001.3903905-1-b-padhi@ti.com>
References: <20250417182001.3903905-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The ti_k3_r5_remoteproc.c driver previously hardcoded device memory
region addresses and names. Change this to use the k3_r5_rproc_mem_data
structure to store memory information. This aligns with K3 DSP and M4
drivers, and can be refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v10: Changelog:
1. Collected R/B from v9 version of this patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-4-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 65 ++++++++++++++++++++----
 1 file changed, 56 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 5a460cfdfb4c4..e2dd5c38a0668 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -84,18 +84,44 @@ enum cluster_mode {
 	CLUSTER_MODE_SINGLECORE
 };
 
+/**
+ * struct k3_r5_mem_data - memory definitions for a R5
+ * @name: name for this memory entry
+ * @dev_addr: device address for the memory entry
+ */
+struct k3_r5_mem_data {
+	const char *name;
+	const u32 dev_addr;
+};
+
+/**
+ * struct k3_r5_dev_data - device data structure for a R5
+ * @mems: pointer to memory definitions for a R5
+ * @num_mems: number of memory regions in @mems
+ * @boot_align_addr: boot vector address alignment granularity
+ * @uses_lreset: flag to denote the need for local reset management
+ */
+struct k3_r5_dev_data {
+	const struct k3_r5_mem_data *mems;
+	u32 num_mems;
+	u32 boot_align_addr;
+	bool uses_lreset;
+};
+
 /**
  * struct k3_r5_soc_data - match data to handle SoC variations
  * @tcm_is_double: flag to denote the larger unified TCMs in certain modes
  * @tcm_ecc_autoinit: flag to denote the auto-initialization of TCMs for ECC
  * @single_cpu_mode: flag to denote if SoC/IP supports Single-CPU mode
  * @is_single_core: flag to denote if SoC/IP has only single core R5
+ * @core_data: pointer to R5-core-specific device data
  */
 struct k3_r5_soc_data {
 	bool tcm_is_double;
 	bool tcm_ecc_autoinit;
 	bool single_cpu_mode;
 	bool is_single_core;
+	const struct k3_r5_dev_data *core_data;
 };
 
 /**
@@ -151,6 +177,7 @@ struct k3_r5_core {
  * @rmem: reserved memory regions data
  * @num_rmems: number of reserved memory regions
  * @reset: reset control handle
+ * @data: pointer to R5-core-specific device data
  * @tsp: TI-SCI processor control handle
  * @ti_sci: TI-SCI handle
  * @ti_sci_id: TI-SCI device identifier
@@ -166,6 +193,7 @@ struct k3_r5_rproc {
 	struct k3_r5_mem *rmem;
 	int num_rmems;
 	struct reset_control *reset;
+	const struct k3_r5_dev_data *data;
 	struct ti_sci_proc *tsp;
 	const struct ti_sci_handle *ti_sci;
 	u32 ti_sci_id;
@@ -1235,31 +1263,32 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 					       struct k3_r5_rproc *kproc)
 {
-	static const char * const mem_names[] = {"atcm", "btcm"};
+	const struct k3_r5_dev_data *data = kproc->data;
 	struct device *dev = &pdev->dev;
 	struct k3_r5_core *core = kproc->priv;
 	struct resource *res;
 	int num_mems;
 	int i;
 
-	num_mems = ARRAY_SIZE(mem_names);
-	kproc->mem = devm_kcalloc(dev, num_mems, sizeof(*kproc->mem), GFP_KERNEL);
+	num_mems = kproc->data->num_mems;
+	kproc->mem = devm_kcalloc(kproc->dev, num_mems, sizeof(*kproc->mem),
+				  GFP_KERNEL);
 	if (!kproc->mem)
 		return -ENOMEM;
 
 	for (i = 0; i < num_mems; i++) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   mem_names[i]);
+						   data->mems[i].name);
 		if (!res) {
 			dev_err(dev, "found no memory resource for %s\n",
-				mem_names[i]);
+				data->mems[i].name);
 			return -EINVAL;
 		}
 		if (!devm_request_mem_region(dev, res->start,
 					     resource_size(res),
 					     dev_name(dev))) {
 			dev_err(dev, "could not request %s region for resource\n",
-				mem_names[i]);
+				data->mems[i].name);
 			return -EBUSY;
 		}
 
@@ -1273,7 +1302,8 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
 							 resource_size(res));
 		if (!kproc->mem[i].cpu_addr) {
-			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
+			dev_err(dev, "failed to map %s memory\n",
+				data->mems[i].name);
 			return -ENOMEM;
 		}
 		kproc->mem[i].bus_addr = res->start;
@@ -1286,7 +1316,7 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
 		 * SoCs) based on loczrama setting
 		 */
-		if (!strcmp(mem_names[i], "atcm")) {
+		if (!strcmp(data->mems[i].name, "atcm")) {
 			kproc->mem[i].dev_addr = core->loczrama ?
 							0 : K3_R5_TCM_DEV_ADDR;
 		} else {
@@ -1296,7 +1326,7 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 		kproc->mem[i].size = resource_size(res);
 
 		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			mem_names[i], &kproc->mem[i].bus_addr,
+			data->mems[i].name, &kproc->mem[i].bus_addr,
 			kproc->mem[i].size, kproc->mem[i].cpu_addr,
 			kproc->mem[i].dev_addr);
 	}
@@ -1408,6 +1438,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		kproc->priv = core;
 		kproc->dev = cdev;
 		kproc->rproc = rproc;
+		kproc->data = cluster->soc_data->core_data;
 		core->kproc = kproc;
 
 		kproc->ti_sci = devm_ti_sci_get_by_phandle(cdev, "ti,sci");
@@ -1772,11 +1803,24 @@ static int k3_r5_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct k3_r5_mem_data r5_mems[] = {
+	{ .name = "atcm", .dev_addr = 0x0 },
+	{ .name = "btcm", .dev_addr = K3_R5_TCM_DEV_ADDR },
+};
+
+static const struct k3_r5_dev_data r5_data = {
+	.mems = r5_mems,
+	.num_mems = ARRAY_SIZE(r5_mems),
+	.boot_align_addr = 0,
+	.uses_lreset = true,
+};
+
 static const struct k3_r5_soc_data am65_j721e_soc_data = {
 	.tcm_is_double = false,
 	.tcm_ecc_autoinit = false,
 	.single_cpu_mode = false,
 	.is_single_core = false,
+	.core_data = &r5_data,
 };
 
 static const struct k3_r5_soc_data j7200_j721s2_soc_data = {
@@ -1784,6 +1828,7 @@ static const struct k3_r5_soc_data j7200_j721s2_soc_data = {
 	.tcm_ecc_autoinit = true,
 	.single_cpu_mode = false,
 	.is_single_core = false,
+	.core_data = &r5_data,
 };
 
 static const struct k3_r5_soc_data am64_soc_data = {
@@ -1791,6 +1836,7 @@ static const struct k3_r5_soc_data am64_soc_data = {
 	.tcm_ecc_autoinit = true,
 	.single_cpu_mode = true,
 	.is_single_core = false,
+	.core_data = &r5_data,
 };
 
 static const struct k3_r5_soc_data am62_soc_data = {
@@ -1798,6 +1844,7 @@ static const struct k3_r5_soc_data am62_soc_data = {
 	.tcm_ecc_autoinit = true,
 	.single_cpu_mode = false,
 	.is_single_core = true,
+	.core_data = &r5_data,
 };
 
 static const struct of_device_id k3_r5_of_match[] = {
-- 
2.34.1

