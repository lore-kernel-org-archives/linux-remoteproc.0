Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFABC1F941F;
	Fri,  3 Jan 2025 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899189; cv=none; b=LCp9iLhjD8rxtdsegFdEANAzIOLDh14l8uFF3aNGB+WeppZ3E1+nGKHJE9lbWZlFGmvzQ0MQXc/RpJKpLG7EnH7ycxu8H4fS3saw9sMKWXhsigzUIrAJE1zIpWWa2xGYjVykmUHp59i488wSPCDWSBWTi9UDCGdvLeXzAAQAbKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899189; c=relaxed/simple;
	bh=Fm5OkSK3KIib1TPPxadSQXRiQkaYbKKsLNDV1NvqS2o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hcPsnsVtzdbNUyjz/TR+/HG523hci/2wVxLJ/jJZt19zp10MB+NsXGvmrJPonFCmpx2mf78zgtReoiMWnqKisSM//MFUrcszG38jJvLFZeP68nY0oIcyB7CcR9ZgGTUbyg2QLo5/SmfWV7TAy5CPN8oM9Kj2bpPmyeaddkJoXnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aJBherqi; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aJBherqi"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ACs7Y2076372
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 04:12:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899174;
	bh=fq5TNC9QrfaSZDncZPI6A87HfJTjjUWbjcK9fTzKL9U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aJBherqippPaVVYGjiSr6zc1zeg688GQunhIfZzQy6bsEd+ZwuJvlJKW+dvsnyutq
	 +LIh9Jq8LeGU9WdEoPfaZzO18uWbgBy2A3TqHsPdAc83S8KQpATsX4pQfpDwtd+mpR
	 hsBTQAKcR8pSx+uDvRY+rlcK95t/V4E9z9GcKzMI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACsJY041864;
	Fri, 3 Jan 2025 04:12:54 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:12:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:12:54 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSN126047;
	Fri, 3 Jan 2025 04:12:51 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 05/20] remoteproc: k3-m4: Use k3_rproc_mem_data structure for memory info
Date: Fri, 3 Jan 2025 15:42:16 +0530
Message-ID: <20250103101231.1508151-6-b-padhi@ti.com>
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

The ti_k3_m4_remoteproc.c driver previously hardcoded device memory
region addresses and names. Change this to use the k3_rproc_mem_data
structure to store memory information. This aligns with
ti_k3_dsp_remoteproc.c driver, and can be refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_m4_remoteproc.c | 40 ++++++++++++++++--------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 953c3999019f..fc688b124a54 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,9 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-#define K3_M4_IRAM_DEV_ADDR 0x00000
-#define K3_M4_DRAM_DEV_ADDR 0x30000
-
 static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -210,14 +207,13 @@ static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
 				       struct k3_rproc *kproc)
 {
-	static const char * const mem_names[] = { "iram", "dram" };
-	static const u32 mem_addrs[] = { K3_M4_IRAM_DEV_ADDR, K3_M4_DRAM_DEV_ADDR };
+	const struct k3_rproc_dev_data *data = kproc->data;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	int num_mems;
 	int i;
 
-	num_mems = ARRAY_SIZE(mem_names);
+	num_mems = kproc->data->num_mems;
 	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
 				  sizeof(*kproc->mem), GFP_KERNEL);
 	if (!kproc->mem)
@@ -225,17 +221,17 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
 
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
 
@@ -243,15 +239,15 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
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
@@ -446,6 +442,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 static int k3_m4_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct k3_rproc_dev_data *data;
 	struct k3_rproc *kproc;
 	struct rproc *rproc;
 	const char *fw_name;
@@ -453,6 +450,10 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	bool p_state = false;
 	int ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
@@ -467,6 +468,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	kproc = rproc->priv;
 	kproc->rproc = rproc;
 	kproc->dev = dev;
+	kproc->data = data;
 	platform_set_drvdata(pdev, rproc);
 
 	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
@@ -534,8 +536,20 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct k3_rproc_mem_data am64_m4_mems[] = {
+	{ .name = "iram", .dev_addr = 0x0 },
+	{ .name = "dram", .dev_addr = 0x30000 },
+};
+
+static const struct k3_rproc_dev_data am64_m4_data = {
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

