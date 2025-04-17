Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8485025D52D;
	Thu, 17 Apr 2025 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914053; cv=none; b=UOV1wQhlAjhDP8G99kIpPmRIgE80x19/seP+a3jr/R/sYddm4a0MZmeK3YbF8LJTAgKWgQuRiClvSCOD2h+odJTg7J5QQG+A85vvWtKzfdulynWye8Vvhg7UBNxevPl3+4zPBXqW3KrbkNhTlrc8s90GD6F8QWOdwCxi5okqisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914053; c=relaxed/simple;
	bh=APylSYoC1GvZvn8Cpbm44DqExwTh78VrXVfE8FQDZtU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DeF9NQnng4O1Gah8071F5pTzGQkzjBCrq4+GNFUxtsW7lIGE8V5uVMpCLj3rayfR1vQlWSJU6IXTRyPzC/ATMI9dSUmCpRo5H+StQUDm0GoPbS3ZkNHq+khsZPWwIqIcqUyYqyUA3aQKg94Wh/Bhns9pt4sc7qIbRDthwW18VLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hlYBDMcC; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hlYBDMcC"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKhCu720102
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914043;
	bh=5uVJCYh9x0MA7+BztqHj2STknlAawQJP6Scb7Du1JVA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hlYBDMcCx4xPJ1c3Ag/Xn5iab/C98LURVQhynf6KZG0siJ1smllXYdrWygwuKo5JR
	 0NinwBZFXJtDMKrpOZ74wddEvfraDI726q3AvKNLKTS9ClmtsweGjtNRv7+vIT5Dvl
	 seOVEAhp3Rlnw1q8DP9vWHDPAxcmCUeA7fB7zIOM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKhoC022641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:20:43 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:20:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:20:43 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1Hs071102;
	Thu, 17 Apr 2025 13:20:40 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 10/33] remoteproc: k3-m4: Use k3_rproc_mem_data structure for memory info
Date: Thu, 17 Apr 2025 23:49:38 +0530
Message-ID: <20250417182001.3903905-11-b-padhi@ti.com>
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

The ti_k3_m4_remoteproc.c driver previously hardcoded device memory
region addresses and names. Change this to use the k3_rproc_mem_data
structure to store memory information. This aligns with DSP and R5
drivers, and can be refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
None

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-6-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 60 ++++++++++++++++++------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index d0ee7a8d460d4..e83bef7cfddfd 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -20,9 +20,6 @@
 #include "remoteproc_internal.h"
 #include "ti_sci_proc.h"
 
-#define K3_M4_IRAM_DEV_ADDR 0x00000
-#define K3_M4_DRAM_DEV_ADDR 0x30000
-
 /**
  * struct k3_m4_rproc_mem - internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -38,15 +35,29 @@ struct k3_m4_rproc_mem {
 };
 
 /**
- * struct k3_m4_rproc_mem_data - memory definitions for a remote processor
+ * struct k3_m4_mem_data - memory definitions for a remote processor
  * @name: name for this memory entry
  * @dev_addr: device address for the memory entry
  */
-struct k3_m4_rproc_mem_data {
+struct k3_m4_mem_data {
 	const char *name;
 	const u32 dev_addr;
 };
 
+/**
+ * struct k3_m4_dev_data - device data structure for a M4 core
+ * @mems: pointer to memory definitions for a M4 core
+ * @num_mems: number of memory regions in @mems
+ * @boot_align_addr: boot vector address alignment granularity
+ * @uses_lreset: flag to denote the need for local reset management
+ */
+struct k3_m4_dev_data {
+	const struct k3_m4_mem_data *mems;
+	u32 num_mems;
+	u32 boot_align_addr;
+	bool uses_lreset;
+};
+
 /**
  * struct k3_m4_rproc - k3 remote processor driver structure
  * @dev: cached device pointer
@@ -56,6 +67,7 @@ struct k3_m4_rproc_mem_data {
  * @rmem: reserved memory regions data
  * @num_rmems: number of reserved memory regions
  * @reset: reset control handle
+ * @data: pointer to M4-specific device data
  * @tsp: TI-SCI processor control handle
  * @ti_sci: TI-SCI handle
  * @ti_sci_id: TI-SCI device identifier
@@ -71,6 +83,7 @@ struct k3_m4_rproc {
 	struct k3_m4_rproc_mem *rmem;
 	int num_rmems;
 	struct reset_control *reset;
+	const struct k3_m4_dev_data *data;
 	struct ti_sci_proc *tsp;
 	const struct ti_sci_handle *ti_sci;
 	u32 ti_sci_id;
@@ -336,14 +349,13 @@ static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
 				       struct k3_m4_rproc *kproc)
 {
-	static const char * const mem_names[] = { "iram", "dram" };
-	static const u32 mem_addrs[] = { K3_M4_IRAM_DEV_ADDR, K3_M4_DRAM_DEV_ADDR };
+	const struct k3_m4_dev_data *data = kproc->data;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	int num_mems;
 	int i;
 
-	num_mems = ARRAY_SIZE(mem_names);
+	num_mems = kproc->data->num_mems;
 	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
 				  sizeof(*kproc->mem), GFP_KERNEL);
 	if (!kproc->mem)
@@ -351,17 +363,17 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
 
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
 
@@ -369,15 +381,15 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
 							 resource_size(res));
 		if (!kproc->mem[i].cpu_addr) {
 			dev_err(dev, "failed to map %s memory\n",
-				mem_names[i]);
+				data->mems[i].name);
 			return -ENOMEM;
 		}
 		kproc->mem[i].bus_addr = res->start;
-		kproc->mem[i].dev_addr = mem_addrs[i];
+		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
 		kproc->mem[i].size = resource_size(res);
 
 		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			mem_names[i], &kproc->mem[i].bus_addr,
+			data->mems[i].name, &kproc->mem[i].bus_addr,
 			kproc->mem[i].size, kproc->mem[i].cpu_addr,
 			kproc->mem[i].dev_addr);
 	}
@@ -563,12 +575,17 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct k3_m4_rproc *kproc;
+	const struct k3_m4_dev_data *data;
 	struct rproc *rproc;
 	const char *fw_name;
 	bool r_state = false;
 	bool p_state = false;
 	int ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
@@ -583,6 +600,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	kproc = rproc->priv;
 	kproc->dev = dev;
 	kproc->rproc = rproc;
+	kproc->data = data;
 	platform_set_drvdata(pdev, rproc);
 
 	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
@@ -650,8 +668,20 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct k3_m4_mem_data am64_m4_mems[] = {
+	{ .name = "iram", .dev_addr = 0x0 },
+	{ .name = "dram", .dev_addr = 0x30000 },
+};
+
+static const struct k3_m4_dev_data am64_m4_data = {
+	.mems = am64_m4_mems,
+	.num_mems = ARRAY_SIZE(am64_m4_mems),
+	.boot_align_addr = SZ_1K,
+	.uses_lreset = true,
+};
+
 static const struct of_device_id k3_m4_of_match[] = {
-	{ .compatible = "ti,am64-m4fss", },
+	{ .compatible = "ti,am64-m4fss", .data = &am64_m4_data, },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, k3_m4_of_match);
-- 
2.34.1

