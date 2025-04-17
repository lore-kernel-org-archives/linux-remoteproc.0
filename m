Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E5266588;
	Thu, 17 Apr 2025 18:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914130; cv=none; b=pNfw83nlJEe5MU41xlsWq4sUx9HRWYm1F8JNBuXBCmRfHscPMng1rGdv4+Uqc/wzR15oDbdlBllWWq7/XfM6hUnWaca3saSMSfnuX6JcLThIaQtP1ewyPT7igSYMzXJ069hljTaT9lRYR9azXTPgeKIdPuQVrvQl5WL8TITDQaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914130; c=relaxed/simple;
	bh=uEhewtQ9pS4aKP7YDciBXIIYZdonsUWLFAGlPtujaWg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAaOXDU7j4osgJAQPXdRC7QMm/BSLIG/Q2UWLt8PVHhIBWR0xN9F9asju/ep9w8nOxBoeCmw8xIA9sPa3Atw4B5jS0r/fpFAyuBCIScbm9IGNCqmPD2MonhjxDnHxfBrJHhPniex54VRjqGFLlEceBUnhBhEag/uggEAKgZVi4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZRz41LTl; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZRz41LTl"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILwGr720203
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914118;
	bh=1NnwGrMNq1EccBXK0NXBt1c0zHG/sgfNGVonPcZTlGA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZRz41LTlDlJ2GlCumNFFVRleDVntpaZLSnhY6YeVgtIUfii99y9Vd/KinkmqCTRg2
	 IPiaCUTMBOKNjbpBCf6wPztsMm2j1Qc0ib30XrGcpjHLKEt9hQCYzM9X/VxFcXUO53
	 Dn4/fdz9V6IkmRmnFBHHgABU/aGT0E9YqPHG2Egs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILwpu023454
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:58 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:58 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1IE071102;
	Thu, 17 Apr 2025 13:21:54 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 30/33] remoteproc: k3: Refactor of_get_memories() functions into common driver
Date: Thu, 17 Apr 2025 23:49:58 +0530
Message-ID: <20250417182001.3903905-31-b-padhi@ti.com>
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

The of_get_memories() implementations in the TI K3 R5, DSP and M4
remoteproc drivers initialize and assign memory regions used by the
remote processor in the same way. Refactor these implementations into
ti_k3_common.c driver as k3_rproc_of_get_memories() use this common
function for mem initialization in R5, DSP and M4 drivers.

Note: The TCM addresses for R5 core are configurable based on the
'loczrama' setting. Therefore, override the bus_addr assignment done by
the common function for TCMs of R5 remote processors by reading the
'loczrama' DT property in k3_r5_core_of_get_internal_memories().

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Updated commit message to call out the changes better.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-24-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 53 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  2 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 54 +---------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 54 +---------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 55 ++++-------------------
 5 files changed, 66 insertions(+), 152 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index e469e9ea426fc..4358502850214 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -410,5 +410,58 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_da_to_va);
 
+int k3_rproc_of_get_memories(struct platform_device *pdev,
+			     struct k3_rproc *kproc)
+{
+	const struct k3_rproc_dev_data *data = kproc->data;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int num_mems = 0;
+	int i;
+
+	num_mems = kproc->data->num_mems;
+	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
+				  sizeof(*kproc->mem), GFP_KERNEL);
+	if (!kproc->mem)
+		return -ENOMEM;
+
+	for (i = 0; i < num_mems; i++) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   data->mems[i].name);
+		if (!res) {
+			dev_err(dev, "found no memory resource for %s\n",
+				data->mems[i].name);
+			return -EINVAL;
+		}
+		if (!devm_request_mem_region(dev, res->start,
+					     resource_size(res),
+					     dev_name(dev))) {
+			dev_err(dev, "could not request %s region for resource\n",
+				data->mems[i].name);
+			return -EBUSY;
+		}
+
+		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
+							 resource_size(res));
+		if (!kproc->mem[i].cpu_addr) {
+			dev_err(dev, "failed to map %s memory\n",
+				data->mems[i].name);
+			return -ENOMEM;
+		}
+		kproc->mem[i].bus_addr = res->start;
+		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
+		kproc->mem[i].size = resource_size(res);
+
+		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+			data->mems[i].name, &kproc->mem[i].bus_addr,
+			kproc->mem[i].size, kproc->mem[i].cpu_addr,
+			kproc->mem[i].dev_addr);
+	}
+	kproc->num_mems = num_mems;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_of_get_memories);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index d600d18b9c7eb..a811c4951e6b0 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -105,4 +105,6 @@ struct resource_table *k3_get_loaded_rsc_table(struct rproc *rproc,
 					       size_t *rsc_table_sz);
 void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 			bool *is_iomem);
+int k3_rproc_of_get_memories(struct platform_device *pdev,
+			     struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index fa1943c39df90..5ba82944a537f 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -66,58 +66,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.get_loaded_rsc_table	= k3_get_loaded_rsc_table,
 };
 
-static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
-					struct k3_rproc *kproc)
-{
-	const struct k3_rproc_dev_data *data = kproc->data;
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	int num_mems = 0;
-	int i;
-
-	num_mems = kproc->data->num_mems;
-	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
-				  sizeof(*kproc->mem), GFP_KERNEL);
-	if (!kproc->mem)
-		return -ENOMEM;
-
-	for (i = 0; i < num_mems; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   data->mems[i].name);
-		if (!res) {
-			dev_err(dev, "found no memory resource for %s\n",
-				data->mems[i].name);
-			return -EINVAL;
-		}
-		if (!devm_request_mem_region(dev, res->start,
-					     resource_size(res),
-					     dev_name(dev))) {
-			dev_err(dev, "could not request %s region for resource\n",
-				data->mems[i].name);
-			return -EBUSY;
-		}
-
-		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
-							 resource_size(res));
-		if (!kproc->mem[i].cpu_addr) {
-			dev_err(dev, "failed to map %s memory\n",
-				data->mems[i].name);
-			return -ENOMEM;
-		}
-		kproc->mem[i].bus_addr = res->start;
-		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
-		kproc->mem[i].size = resource_size(res);
-
-		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			data->mems[i].name, &kproc->mem[i].bus_addr,
-			kproc->mem[i].size, kproc->mem[i].cpu_addr,
-			kproc->mem[i].dev_addr);
-	}
-	kproc->num_mems = num_mems;
-
-	return 0;
-}
-
 static void k3_dsp_mem_release(void *data)
 {
 	struct device *dev = data;
@@ -269,7 +217,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = k3_dsp_rproc_of_get_memories(pdev, kproc);
+	ret = k3_rproc_of_get_memories(pdev, kproc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index db7c908e04392..81862a7809b5b 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,58 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
-				       struct k3_rproc *kproc)
-{
-	const struct k3_rproc_dev_data *data = kproc->data;
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	int num_mems;
-	int i;
-
-	num_mems = kproc->data->num_mems;
-	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
-				  sizeof(*kproc->mem), GFP_KERNEL);
-	if (!kproc->mem)
-		return -ENOMEM;
-
-	for (i = 0; i < num_mems; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   data->mems[i].name);
-		if (!res) {
-			dev_err(dev, "found no memory resource for %s\n",
-				data->mems[i].name);
-			return -EINVAL;
-		}
-		if (!devm_request_mem_region(dev, res->start,
-					     resource_size(res),
-					     dev_name(dev))) {
-			dev_err(dev, "could not request %s region for resource\n",
-				data->mems[i].name);
-			return -EBUSY;
-		}
-
-		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
-							 resource_size(res));
-		if (!kproc->mem[i].cpu_addr) {
-			dev_err(dev, "failed to map %s memory\n",
-				data->mems[i].name);
-			return -ENOMEM;
-		}
-		kproc->mem[i].bus_addr = res->start;
-		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
-		kproc->mem[i].size = resource_size(res);
-
-		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			data->mems[i].name, &kproc->mem[i].bus_addr,
-			kproc->mem[i].size, kproc->mem[i].cpu_addr,
-			kproc->mem[i].dev_addr);
-	}
-	kproc->num_mems = num_mems;
-
-	return 0;
-}
-
 static void k3_m4_rproc_dev_mem_release(void *data)
 {
 	struct device *dev = data;
@@ -225,7 +173,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = k3_m4_rproc_of_get_memories(pdev, kproc);
+	ret = k3_rproc_of_get_memories(pdev, kproc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 93adb2d142e18..94e9506a8e6e2 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1009,55 +1009,22 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 	const struct k3_rproc_dev_data *data = kproc->data;
 	struct device *dev = &pdev->dev;
 	struct k3_r5_core *core = kproc->priv;
-	struct resource *res;
-	int num_mems;
-	int i;
+	int num_mems = data->num_mems;
+	int i, ret;
 
-	num_mems = kproc->data->num_mems;
-	kproc->mem = devm_kcalloc(kproc->dev, num_mems, sizeof(*kproc->mem),
-				  GFP_KERNEL);
-	if (!kproc->mem)
-		return -ENOMEM;
+	ret = k3_rproc_of_get_memories(pdev, kproc);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < num_mems; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   data->mems[i].name);
-		if (!res) {
-			dev_err(dev, "found no memory resource for %s\n",
-				data->mems[i].name);
-			return -EINVAL;
-		}
-		if (!devm_request_mem_region(dev, res->start,
-					     resource_size(res),
-					     dev_name(dev))) {
-			dev_err(dev, "could not request %s region for resource\n",
-				data->mems[i].name);
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
-		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
-							 resource_size(res));
-		if (!kproc->mem[i].cpu_addr) {
-			dev_err(dev, "failed to map %s memory\n",
-				data->mems[i].name);
-			return -ENOMEM;
-		}
-		kproc->mem[i].bus_addr = res->start;
-
 		/*
 		 * TODO:
 		 * The R5F cores can place ATCM & BTCM anywhere in its address
 		 * based on the corresponding Region Registers in the System
 		 * Control coprocessor. For now, place ATCM and BTCM at
 		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
-		 * SoCs) based on loczrama setting
+		 * SoCs) based on loczrama setting overriding default assignment
+		 * done by k3_rproc_of_get_memories().
 		 */
 		if (!strcmp(data->mems[i].name, "atcm")) {
 			kproc->mem[i].dev_addr = core->loczrama ?
@@ -1066,14 +1033,10 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 			kproc->mem[i].dev_addr = core->loczrama ?
 							K3_R5_TCM_DEV_ADDR : 0;
 		}
-		kproc->mem[i].size = resource_size(res);
 
-		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			data->mems[i].name, &kproc->mem[i].bus_addr,
-			kproc->mem[i].size, kproc->mem[i].cpu_addr,
-			kproc->mem[i].dev_addr);
+		dev_dbg(dev, "Updating bus addr %pa of memory %5s\n",
+			&kproc->mem[i].bus_addr, data->mems[i].name);
 	}
-	kproc->num_mems = num_mems;
 
 	return 0;
 }
-- 
2.34.1

