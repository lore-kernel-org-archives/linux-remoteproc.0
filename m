Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6023F7DA7F;
	Tue, 13 May 2025 05:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115146; cv=none; b=ZfzB4D8XyZavXaL2nFDiq75wb0foDu9bBpeAEPpK1WKBFJeMcpwXAgExIaGqt6K6KuuD00I1DMbavCsf2BiG5nhBjRL2AjUJg4h3wGrEm6uIvKqTuf+1AWSRl3SBAlhlDLcqfmkUOm4khGeJ4HH6wIHMPbBZ0ggYQOX2vquJKNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115146; c=relaxed/simple;
	bh=GO9FfsL09bUmQcVrlG2H2lZfuUcloiASH3s0QosKeCA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pc1kRzeQKk8iDXmokRck908bzpkg0aBcyWez++SHUv/tiF/XVSJgBUr9tca3T/Og2NKf7XPFgP3U7SIxndFptk2Y7a2znyHd7tZCgcIj4EFtYp0Zscur3gkRP0dgg2a63WzGMtns/c/yOaCFYOaSqxi5M5PDzEVIyXLBV4jVwFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lbbVOWFK; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lbbVOWFK"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5jaZX2226317
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115136;
	bh=zhAcpJlYU4/0MR5n21lEvZAva+QCUEB0sleYKRGULAo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lbbVOWFKR++8Kuw8L0P4ZeXM4uwd/047617kOeiTMWU8yvQqiMjd/iIh4usDZITlD
	 C29IR+2/L9ysqCGawWLtg2PhuANKk5gBVceNvLLwWQcXS7kGx1gV5s2LNqM+iQZRT8
	 9CvIZmu1meHp9JJI7VHsR/HELpG3qsKZoaIpmEe0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5ja5D062993
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:45:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:45:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:45:36 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqE131001;
	Tue, 13 May 2025 00:45:32 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 05/36] remoteproc: k3-r5: Re-order internal memory initialization functions
Date: Tue, 13 May 2025 11:14:39 +0530
Message-ID: <20250513054510.3439842-6-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The internal memory struct pointer, 'mem', will be refactored from
k3_r5_core struct into k3_r5_rproc struct in a future commit.

Therefore, move the internal memory initialization function,
k3_r5_core_of_get_internal_memories() above k3_r5_cluster_rproc_init()
so that the former can be invoked by the later.

While at it, also re-order the k3_r5_core_of_get_sram_memories() to keep
all the internal memory initialization functions at one place.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-5-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-5-b-padhi@ti.com/

v10: Changelog:
1. Re-ordered both core_of_get_{internal/sram}_memories() together.
2. Moved release_tsp() re-ordering into a separate future commit.
3. Updated commit message to call out changes in a better way.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-2-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 258 +++++++++++------------
 1 file changed, 129 insertions(+), 129 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index ba082ca13e750..062a654cac0f0 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1227,6 +1227,135 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 	return ret;
 }
 
+static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
+					       struct k3_r5_core *core)
+{
+	static const char * const mem_names[] = {"atcm", "btcm"};
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int num_mems;
+	int i;
+
+	num_mems = ARRAY_SIZE(mem_names);
+	core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), GFP_KERNEL);
+	if (!core->mem)
+		return -ENOMEM;
+
+	for (i = 0; i < num_mems; i++) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   mem_names[i]);
+		if (!res) {
+			dev_err(dev, "found no memory resource for %s\n",
+				mem_names[i]);
+			return -EINVAL;
+		}
+		if (!devm_request_mem_region(dev, res->start,
+					     resource_size(res),
+					     dev_name(dev))) {
+			dev_err(dev, "could not request %s region for resource\n",
+				mem_names[i]);
+			return -EBUSY;
+		}
+
+		/*
+		 * TCMs are designed in general to support RAM-like backing
+		 * memories. So, map these as Normal Non-Cached memories. This
+		 * also avoids/fixes any potential alignment faults due to
+		 * unaligned data accesses when using memcpy() or memset()
+		 * functions (normally seen with device type memory).
+		 */
+		core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
+							resource_size(res));
+		if (!core->mem[i].cpu_addr) {
+			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
+			return -ENOMEM;
+		}
+		core->mem[i].bus_addr = res->start;
+
+		/*
+		 * TODO:
+		 * The R5F cores can place ATCM & BTCM anywhere in its address
+		 * based on the corresponding Region Registers in the System
+		 * Control coprocessor. For now, place ATCM and BTCM at
+		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
+		 * SoCs) based on loczrama setting
+		 */
+		if (!strcmp(mem_names[i], "atcm")) {
+			core->mem[i].dev_addr = core->loczrama ?
+							0 : K3_R5_TCM_DEV_ADDR;
+		} else {
+			core->mem[i].dev_addr = core->loczrama ?
+							K3_R5_TCM_DEV_ADDR : 0;
+		}
+		core->mem[i].size = resource_size(res);
+
+		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+			mem_names[i], &core->mem[i].bus_addr,
+			core->mem[i].size, core->mem[i].cpu_addr,
+			core->mem[i].dev_addr);
+	}
+	core->num_mems = num_mems;
+
+	return 0;
+}
+
+static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
+					   struct k3_r5_core *core)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *sram_np;
+	struct resource res;
+	int num_sram;
+	int i, ret;
+
+	num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
+	if (num_sram <= 0) {
+		dev_dbg(dev, "device does not use reserved on-chip memories, num_sram = %d\n",
+			num_sram);
+		return 0;
+	}
+
+	core->sram = devm_kcalloc(dev, num_sram, sizeof(*core->sram), GFP_KERNEL);
+	if (!core->sram)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sram; i++) {
+		sram_np = of_parse_phandle(np, "sram", i);
+		if (!sram_np)
+			return -EINVAL;
+
+		if (!of_device_is_available(sram_np)) {
+			of_node_put(sram_np);
+			return -EINVAL;
+		}
+
+		ret = of_address_to_resource(sram_np, 0, &res);
+		of_node_put(sram_np);
+		if (ret)
+			return -EINVAL;
+
+		core->sram[i].bus_addr = res.start;
+		core->sram[i].dev_addr = res.start;
+		core->sram[i].size = resource_size(&res);
+		core->sram[i].cpu_addr = devm_ioremap_wc(dev, res.start,
+							 resource_size(&res));
+		if (!core->sram[i].cpu_addr) {
+			dev_err(dev, "failed to parse and map sram%d memory at %pad\n",
+				i, &res.start);
+			return -ENOMEM;
+		}
+
+		dev_dbg(dev, "memory sram%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+			i, &core->sram[i].bus_addr,
+			core->sram[i].size, core->sram[i].cpu_addr,
+			core->sram[i].dev_addr);
+	}
+	core->num_sram = num_sram;
+
+	return 0;
+}
+
 static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
@@ -1366,135 +1495,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 	}
 }
 
-static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
-					       struct k3_r5_core *core)
-{
-	static const char * const mem_names[] = {"atcm", "btcm"};
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	int num_mems;
-	int i;
-
-	num_mems = ARRAY_SIZE(mem_names);
-	core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), GFP_KERNEL);
-	if (!core->mem)
-		return -ENOMEM;
-
-	for (i = 0; i < num_mems; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   mem_names[i]);
-		if (!res) {
-			dev_err(dev, "found no memory resource for %s\n",
-				mem_names[i]);
-			return -EINVAL;
-		}
-		if (!devm_request_mem_region(dev, res->start,
-					     resource_size(res),
-					     dev_name(dev))) {
-			dev_err(dev, "could not request %s region for resource\n",
-				mem_names[i]);
-			return -EBUSY;
-		}
-
-		/*
-		 * TCMs are designed in general to support RAM-like backing
-		 * memories. So, map these as Normal Non-Cached memories. This
-		 * also avoids/fixes any potential alignment faults due to
-		 * unaligned data accesses when using memcpy() or memset()
-		 * functions (normally seen with device type memory).
-		 */
-		core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
-							resource_size(res));
-		if (!core->mem[i].cpu_addr) {
-			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
-			return -ENOMEM;
-		}
-		core->mem[i].bus_addr = res->start;
-
-		/*
-		 * TODO:
-		 * The R5F cores can place ATCM & BTCM anywhere in its address
-		 * based on the corresponding Region Registers in the System
-		 * Control coprocessor. For now, place ATCM and BTCM at
-		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
-		 * SoCs) based on loczrama setting
-		 */
-		if (!strcmp(mem_names[i], "atcm")) {
-			core->mem[i].dev_addr = core->loczrama ?
-							0 : K3_R5_TCM_DEV_ADDR;
-		} else {
-			core->mem[i].dev_addr = core->loczrama ?
-							K3_R5_TCM_DEV_ADDR : 0;
-		}
-		core->mem[i].size = resource_size(res);
-
-		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			mem_names[i], &core->mem[i].bus_addr,
-			core->mem[i].size, core->mem[i].cpu_addr,
-			core->mem[i].dev_addr);
-	}
-	core->num_mems = num_mems;
-
-	return 0;
-}
-
-static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
-					   struct k3_r5_core *core)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
-	struct device_node *sram_np;
-	struct resource res;
-	int num_sram;
-	int i, ret;
-
-	num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
-	if (num_sram <= 0) {
-		dev_dbg(dev, "device does not use reserved on-chip memories, num_sram = %d\n",
-			num_sram);
-		return 0;
-	}
-
-	core->sram = devm_kcalloc(dev, num_sram, sizeof(*core->sram), GFP_KERNEL);
-	if (!core->sram)
-		return -ENOMEM;
-
-	for (i = 0; i < num_sram; i++) {
-		sram_np = of_parse_phandle(np, "sram", i);
-		if (!sram_np)
-			return -EINVAL;
-
-		if (!of_device_is_available(sram_np)) {
-			of_node_put(sram_np);
-			return -EINVAL;
-		}
-
-		ret = of_address_to_resource(sram_np, 0, &res);
-		of_node_put(sram_np);
-		if (ret)
-			return -EINVAL;
-
-		core->sram[i].bus_addr = res.start;
-		core->sram[i].dev_addr = res.start;
-		core->sram[i].size = resource_size(&res);
-		core->sram[i].cpu_addr = devm_ioremap_wc(dev, res.start,
-							 resource_size(&res));
-		if (!core->sram[i].cpu_addr) {
-			dev_err(dev, "failed to parse and map sram%d memory at %pad\n",
-				i, &res.start);
-			return -ENOMEM;
-		}
-
-		dev_dbg(dev, "memory sram%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			i, &core->sram[i].bus_addr,
-			core->sram[i].size, core->sram[i].cpu_addr,
-			core->sram[i].dev_addr);
-	}
-	core->num_sram = num_sram;
-
-	return 0;
-}
-
 static void k3_r5_release_tsp(void *data)
 {
 	struct ti_sci_proc *tsp = data;
-- 
2.34.1

