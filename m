Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279491F9AB6;
	Fri,  3 Jan 2025 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899240; cv=none; b=j39KOCnJLnbjRnvWO/qoSGbsjrZI9GtgRAN/0ndfneE42IcumNfOxXWxDEmXh2u7vo+2tJNttBLgUPpTD1IHcDFnoDE2qRGVFehMWFJunjJuHelZzTWbVJfyp6u4NcgwSY1km3eK+P87lZ97XLKq2QDBWc5I+7ObBWHAlxBKS68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899240; c=relaxed/simple;
	bh=SGooeC8GMOs4dNPjC+OAdnx2U4p58VHosQVqxQ1/v/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzN1QOFe84/vIbzsNpjgJBnX5wkvmKlI5NoSwJ1Bh6oirwJZXD5AsCtTqjOY+fqctW2GdTFzlwWQYWyvfVtmxKAufK3fDY4+Fus/8OWDtLhlUr63osFdRKKr9PzkrOyylSGw/rkmvnboVGJeT/etiOO6WYw97YZb+cb+ttVfLLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=w2ujYRPs; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w2ujYRPs"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ADlZa2019441
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 04:13:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899227;
	bh=x3uIxvzuz9RvkvE4KPqs0onDM5GxLBDnjxj7J4ekkPs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=w2ujYRPskuECbQS5A8Bbf9swqegPZSOVDXtAqO5zFRoCQdWTifBHFJNzQip5hHADQ
	 TFWhe4PRS/OX0HgB8NjkGo4Y1pndmBuQZOCot2XGoHDMdPvAqIMKWP4kS7ZY3yu+dT
	 C4NYD9n7rWmyuM7Wq5QCbWsr8H5bDP40DbM47DVc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ADlmQ042181;
	Fri, 3 Jan 2025 04:13:47 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:46 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSb126047;
	Fri, 3 Jan 2025 04:13:43 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 19/20] remoteproc: k3: Refactor reserved_mem_init() functions into common driver
Date: Fri, 3 Jan 2025 15:42:30 +0530
Message-ID: <20250103101231.1508151-20-b-padhi@ti.com>
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

The k3_{dsp_/m4_}reserved_mem_init() functions initialize the reserved
memory regions associated with the remote processor. Refactor these
functions into ti_k3_common.c driver as k3_reserved_mem_init() and align
DSP and M4 drivers to use this common function throughout.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 70 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 72 +----------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 71 +---------------------
 4 files changed, 73 insertions(+), 141 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index c8766a01dc19..8fa14b7dde25 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -504,5 +504,75 @@ void k3_mem_release(void *data)
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
index 31cd202be348..525d1da65105 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -108,4 +108,5 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
 void k3_mem_release(void *data);
+int k3_reserved_mem_init(struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 1176a6f4c977..40187d03206f 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -66,76 +66,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.get_loaded_rsc_table	=	k3_get_loaded_rsc_table,
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
index 6608b13d125b..ae8335c8f9e9 100644
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
 
-- 
2.34.1

