Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D51A2459EA;
	Fri, 25 Apr 2025 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577838; cv=none; b=EOgHFa+BWsWpq837Fz3HTX6y7OyKaPN6NysDYe13B6rjwLZtpEcU+NtDaWIjBObVrKj1EYJguTvRhzHkBSyKB/n//I2CDjiPQQhe1X/489o5HkX3PXgcaL5tt7fI1e1L9pqKRnoYZg9uIpMDczsPBHSeyLrQvPUPvvvkyen/BfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577838; c=relaxed/simple;
	bh=t4E4gIFsqcj3xRi5CPwE4xyEfnGnfu2jqEQ6kHTM0r8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Au9UePrOtLri11aZTAfDleEuAvQPe3TTgrERTCWJblosuYrLp1sGdvqyzJY3OLNWx6KcuBm3Ppe0NgZKwMabkc1jEFNbLYO6DansQk9CnB6LbkdlfoFtXikeJh9ReV5/8r+01dQ8niP5Z7fjqm63G8MTqn03oWsFcLUn7WvoImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TQ2NJTif; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TQ2NJTif"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhnSn2123203
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577829;
	bh=boTJLf+gbkLwBpqUNpSj0k+h2YOYNsa109r0mDe7txc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TQ2NJTifZb2wXOfMO4/zpq78+BiclegIYFe7M3/+37/4r9Qyb8qzYnZLNKguPnhZX
	 dKOEPQ5VG1mLVoA6zRtXzh1UVriWcNGxjIHmGEuSqTJUg1YXzUNcet5JA0+6iRN1mR
	 RNBljhOATcmTFvBV1Ayd8dlWFPdCZAzdJXFw5wiA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhnNw129921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:43:49 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:43:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:43:49 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZt038329;
	Fri, 25 Apr 2025 05:43:45 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 34/35] remoteproc: k3: Refactor reserved_mem_init() functions into common driver
Date: Fri, 25 Apr 2025 16:11:34 +0530
Message-ID: <20250425104135.830255-35-b-padhi@ti.com>
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

The reserved_mem_init() implementations in the R5, DSP and M4 remoteproc
drivers initialize the reserved memory regions associated with the
remote processor.

Refactor these functions into the ti_k3_common.c driver as
k3_reserved_mem_init() and use this common function throughout in R5,
DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-33-b-padhi@ti.com/

v10: Changelog:
1. Update commit message to call out changes in a better way.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-26-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 70 +++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 72 +-------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 71 +-------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 82 +----------------------
 5 files changed, 74 insertions(+), 222 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index c58e68e1764ea..72e274d0ef668 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -465,5 +465,75 @@ void k3_mem_release(void *data)
 }
 EXPORT_SYMBOL_GPL(k3_mem_release);
 
+int k3_reserved_mem_init(struct k3_rproc *kproc)
+{
+	struct device *dev = kproc->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *rmem_np;
+	struct reserved_mem *rmem;
+	int num_rmems;
+	int ret, i;
+
+	num_rmems = of_property_count_elems_of_size(np, "memory-region",
+						    sizeof(phandle));
+	if (num_rmems < 0) {
+		dev_err(dev, "device does not reserved memory regions (%d)\n",
+			num_rmems);
+		return -EINVAL;
+	}
+	if (num_rmems < 2) {
+		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
+			num_rmems);
+		return -EINVAL;
+	}
+
+	/* use reserved memory region 0 for vring DMA allocations */
+	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
+	if (ret) {
+		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
+		return ret;
+	}
+	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
+	if (ret)
+		return ret;
+
+	num_rmems--;
+	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
+	if (!kproc->rmem)
+		return -ENOMEM;
+
+	/* use remaining reserved memory regions for static carveouts */
+	for (i = 0; i < num_rmems; i++) {
+		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
+		if (!rmem_np)
+			return -EINVAL;
+
+		rmem = of_reserved_mem_lookup(rmem_np);
+		of_node_put(rmem_np);
+		if (!rmem)
+			return -EINVAL;
+
+		kproc->rmem[i].bus_addr = rmem->base;
+		/* 64-bit address regions currently not supported */
+		kproc->rmem[i].dev_addr = (u32)rmem->base;
+		kproc->rmem[i].size = rmem->size;
+		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
+		if (!kproc->rmem[i].cpu_addr) {
+			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
+				i + 1, &rmem->base, &rmem->size);
+			return -ENOMEM;
+		}
+
+		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+			i + 1, &kproc->rmem[i].bus_addr,
+			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
+			kproc->rmem[i].dev_addr);
+	}
+	kproc->num_rmems = num_rmems;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 70656215c4d72..148717942dfb3 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -108,4 +108,5 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
 void k3_mem_release(void *data);
+int k3_reserved_mem_init(struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 6c79b347a610a..45000b68260c1 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -66,76 +66,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.get_loaded_rsc_table	= k3_get_loaded_rsc_table,
 };
 
-static int k3_dsp_reserved_mem_init(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *rmem_np;
-	struct reserved_mem *rmem;
-	int num_rmems;
-	int ret, i;
-
-	num_rmems = of_property_count_elems_of_size(np, "memory-region",
-						    sizeof(phandle));
-	if (num_rmems < 0) {
-		dev_err(dev, "device does not reserved memory regions (%pe)\n",
-			ERR_PTR(num_rmems));
-		return -EINVAL;
-	}
-	if (num_rmems < 2) {
-		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
-			num_rmems);
-		return -EINVAL;
-	}
-
-	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
-	if (ret) {
-		dev_err(dev, "device cannot initialize DMA pool (%pe)\n",
-			ERR_PTR(ret));
-		return ret;
-	}
-	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
-	if (ret)
-		return ret;
-
-	num_rmems--;
-	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
-	if (!kproc->rmem)
-		return -ENOMEM;
-
-	/* use remaining reserved memory regions for static carveouts */
-	for (i = 0; i < num_rmems; i++) {
-		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np)
-			return -EINVAL;
-
-		rmem = of_reserved_mem_lookup(rmem_np);
-		of_node_put(rmem_np);
-		if (!rmem)
-			return -EINVAL;
-
-		kproc->rmem[i].bus_addr = rmem->base;
-		/* 64-bit address regions currently not supported */
-		kproc->rmem[i].dev_addr = (u32)rmem->base;
-		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
-		if (!kproc->rmem[i].cpu_addr) {
-			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
-				i + 1, &rmem->base, &rmem->size);
-			return -ENOMEM;
-		}
-
-		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			i + 1, &kproc->rmem[i].bus_addr,
-			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
-			kproc->rmem[i].dev_addr);
-	}
-	kproc->num_rmems = num_rmems;
-
-	return 0;
-}
-
 static void k3_dsp_release_tsp(void *data)
 {
 	struct ti_sci_proc *tsp = data;
@@ -214,7 +144,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = k3_dsp_reserved_mem_init(kproc);
+	ret = k3_reserved_mem_init(kproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "reserved memory init failed\n");
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 67b92cbf7c2bd..a1a31c4f8c3e7 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,75 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-static int k3_m4_reserved_mem_init(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *rmem_np;
-	struct reserved_mem *rmem;
-	int num_rmems;
-	int ret, i;
-
-	num_rmems = of_property_count_elems_of_size(np, "memory-region",
-						    sizeof(phandle));
-	if (num_rmems < 0) {
-		dev_err(dev, "device does not reserved memory regions (%d)\n",
-			num_rmems);
-		return -EINVAL;
-	}
-	if (num_rmems < 2) {
-		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
-			num_rmems);
-		return -EINVAL;
-	}
-
-	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
-	if (ret) {
-		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
-		return ret;
-	}
-	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
-	if (ret)
-		return ret;
-
-	num_rmems--;
-	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
-	if (!kproc->rmem)
-		return -ENOMEM;
-
-	/* use remaining reserved memory regions for static carveouts */
-	for (i = 0; i < num_rmems; i++) {
-		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np)
-			return -EINVAL;
-
-		rmem = of_reserved_mem_lookup(rmem_np);
-		of_node_put(rmem_np);
-		if (!rmem)
-			return -EINVAL;
-
-		kproc->rmem[i].bus_addr = rmem->base;
-		/* 64-bit address regions currently not supported */
-		kproc->rmem[i].dev_addr = (u32)rmem->base;
-		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
-		if (!kproc->rmem[i].cpu_addr) {
-			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
-				i + 1, &rmem->base, &rmem->size);
-			return -ENOMEM;
-		}
-
-		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			i + 1, &kproc->rmem[i].bus_addr,
-			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
-			kproc->rmem[i].dev_addr);
-	}
-	kproc->num_rmems = num_rmems;
-
-	return 0;
-}
-
 static void k3_m4_release_tsp(void *data)
 {
 	struct ti_sci_proc *tsp = data;
@@ -170,7 +101,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = k3_m4_reserved_mem_init(kproc);
+	ret = k3_reserved_mem_init(kproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "reserved memory init failed\n");
 
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 59bd610f2a8c7..77183606b9d4d 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -761,86 +761,6 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
 	return ret;
 }
 
-static int k3_r5_reserved_mem_init(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	struct device_node *np = dev_of_node(dev);
-	struct device_node *rmem_np;
-	struct reserved_mem *rmem;
-	int num_rmems;
-	int ret, i;
-
-	num_rmems = of_property_count_elems_of_size(np, "memory-region",
-						    sizeof(phandle));
-	if (num_rmems <= 0) {
-		dev_err(dev, "device does not have reserved memory regions, ret = %d\n",
-			num_rmems);
-		return -EINVAL;
-	}
-	if (num_rmems < 2) {
-		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
-			num_rmems);
-		return -EINVAL;
-	}
-
-	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
-	if (ret) {
-		dev_err(dev, "device cannot initialize DMA pool, ret = %d\n",
-			ret);
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
-	if (ret)
-		return ret;
-
-	num_rmems--;
-	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
-	if (!kproc->rmem)
-		return -ENOMEM;
-
-	/* use remaining reserved memory regions for static carveouts */
-	for (i = 0; i < num_rmems; i++) {
-		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np)
-			return -EINVAL;
-
-		rmem = of_reserved_mem_lookup(rmem_np);
-		of_node_put(rmem_np);
-		if (!rmem)
-			return -EINVAL;
-
-		kproc->rmem[i].bus_addr = rmem->base;
-		/*
-		 * R5Fs do not have an MMU, but have a Region Address Translator
-		 * (RAT) module that provides a fixed entry translation between
-		 * the 32-bit processor addresses to 64-bit bus addresses. The
-		 * RAT is programmable only by the R5F cores. Support for RAT
-		 * is currently not supported, so 64-bit address regions are not
-		 * supported. The absence of MMUs implies that the R5F device
-		 * addresses/supported memory regions are restricted to 32-bit
-		 * bus addresses, and are identical
-		 */
-		kproc->rmem[i].dev_addr = (u32)rmem->base;
-		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
-		if (!kproc->rmem[i].cpu_addr) {
-			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
-				i + 1, &rmem->base, &rmem->size);
-			return -ENOMEM;
-		}
-
-		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			i + 1, &kproc->rmem[i].bus_addr,
-			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
-			kproc->rmem[i].dev_addr);
-	}
-	kproc->num_rmems = num_rmems;
-
-	return 0;
-}
-
 /*
  * Each R5F core within a typical R5FSS instance has a total of 64 KB of TCMs,
  * split equally into two 32 KB banks between ATCM and BTCM. The TCMs from both
@@ -1213,7 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 init_rmem:
 		k3_r5_adjust_tcm_sizes(kproc);
 
-		ret = k3_r5_reserved_mem_init(kproc);
+		ret = k3_reserved_mem_init(kproc);
 		if (ret) {
 			dev_err(cdev, "reserved memory init failed, ret = %d\n",
 				ret);
-- 
2.34.1

