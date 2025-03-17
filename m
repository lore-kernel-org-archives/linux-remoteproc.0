Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE668246333;
	Mon, 17 Mar 2025 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213295; cv=none; b=HItGPG1j56jYUAhEwSmvUW1/t+Ia+GViGOF0UwEzn6UXlIwlRNhhw+IEqjhJHJq8gShmTXhomxIjwDktZH62zY7rFGPPfePDzwcCUssQ/GbfdGay8YFlsetFJ/WTbEX7Q2LcKS+Th5hpMHywiR+xzMBRZth2f06gBbJajOn63Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213295; c=relaxed/simple;
	bh=JewcrYwDBFSk+fQ1z+NLef+gtNFyQxq4oxtg31ZjkCk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3S+I4FLDKUiRmK11MXOgh6zrGBou+aHt10T49wzzA/gtydU8so+xqbxY91pRs/88VxZM0MezGxfLxuOq3R0gYLX0uWa5qLGg+DQU2S5ZMJ26pevRj6G0sVZAIGLX6LD0nFrrM0XALpMWJ80D70wbkrpO22YQCSXiRjg+CdYBGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lZKxkHpd; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lZKxkHpd"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC86ZO2802977
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213286;
	bh=eIHUahv9R0Bi7huOuYXql7JJgbjFhwQnw9A3eSvQqmw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lZKxkHpdYkovCNb9Pn3Krs/5Pf/DgyMfxFudMiw1hxKUXMRsfnl8rsVdap7Q3AM7z
	 cYfLVciBZERM5rs/9IkAg7tjV6s94yzkBYE4XrlpmBfVMhwR2tCP3+AHq8ospIunRv
	 j5AgnvsKYJ5ecoHguXBcDmVokXoV9Bj1kij4Ua7w=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC86pF108865
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:08:06 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:08:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:08:06 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKM060901;
	Mon, 17 Mar 2025 07:08:02 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 25/26] remoteproc: k3: Refactor reserved_mem_init() functions into common driver
Date: Mon, 17 Mar 2025 17:36:21 +0530
Message-ID: <20250317120622.1746415-26-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317120622.1746415-1-b-padhi@ti.com>
References: <20250317120622.1746415-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The k3_{r5/dsp/m4}_reserved_mem_init() functions initialize the reserved
memory regions associated with the remote processor. Refactor these
functions into ti_k3_common.c driver as k3_reserved_mem_init() and align
R5, DSP and M4 drivers to use this common function throughout.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 70 +++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 72 +-------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 71 +-------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 82 +----------------------
 5 files changed, 74 insertions(+), 222 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index a51c0196530e..b72c4c179c97 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -470,5 +470,75 @@ void k3_mem_release(void *data)
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
index 70656215c4d7..148717942dfb 100644
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
index 67b92cbf7c2b..a1a31c4f8c3e 100644
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
index fed1d189144a..ecac013b6482 100644
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
@@ -1156,7 +1076,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 init_rmem:
 		k3_r5_adjust_tcm_sizes(kproc);
 
-		ret = k3_r5_reserved_mem_init(kproc);
+		ret = k3_reserved_mem_init(kproc);
 		if (ret) {
 			dev_err(cdev, "reserved memory init failed, ret = %d\n",
 				ret);
-- 
2.34.1

