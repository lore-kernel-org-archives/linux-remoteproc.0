Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E171EE7DA;
	Tue, 13 May 2025 05:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115262; cv=none; b=nphDWTQ2I4iAML6AAierIKVRhMiScRSVNhmlYEZhcn8AEOUhmqrvxwUSEXkarRk6XSycRETu1BF8IzxM2rJVRphDoXSDT977f4N66t36b0mOqZkKkLpCTMwZ7CGWNwpRNmecwsm9eoey35oNXqL+PwPt9orT5hz/JfBja7TAukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115262; c=relaxed/simple;
	bh=hgzE+hFPOTDMfvpdeUbKY1K4okeoFgoBfZngoDNJIIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tT8SkwCPRolMuNFd94iEoaFRKdL7F+dMcY+OupXGfjBCOUTEsrhDRikT8GaIAILDNGlwACGHLr/uYTI4wD2e4MmuwhvqZ5MCJaq5a812zz+/V7SvzHgJQDof7p3rM52uP8B30ovSRT8XNqAmDGm8b7LNVINx8js8iLZ3WfVF2fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cgzAvFDf; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cgzAvFDf"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5lWsL2764715
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115252;
	bh=ZnWYaZA5ynhkpD2LP/eCnmnWLqMa0zlIQzY4B6Ne42Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cgzAvFDfwCNQWc5r6XhegDByR5utdPOqKus8o28ocpAdlZb4bFQiiPVD9jezkzdtU
	 80ZCtpAqqb7ikCd9yAxzRRJmsuZTu/pGHWFRIPrLTpWfuInNv7eFYSUfde9/ic/HAj
	 zgQIJDg7/zPX7IWklIF1JfUEExFVwbCXh1OBbr0o=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5lWZU089103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:47:32 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:47:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:47:31 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqg131001;
	Tue, 13 May 2025 00:47:28 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 33/36] remoteproc: k3: Refactor of_get_memories() functions into common driver
Date: Tue, 13 May 2025 11:15:07 +0530
Message-ID: <20250513054510.3439842-34-b-padhi@ti.com>
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
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Assign data->num_mems to num_mems. [Mathieu]
2. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-33-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-31-b-padhi@ti.com/

v10: Changelog:
1. Updated commit message to call out the changes better.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-24-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 53 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  2 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 54 +----------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 54 +----------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 49 ++++----------------
 5 files changed, 66 insertions(+), 146 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 9762a9af6b5ff..2200af4edaf85 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -408,5 +408,58 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
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
+	num_mems = data->num_mems;
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
index cfecbf8fc73c4..d05f53bd9073a 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -110,4 +110,6 @@ struct resource_table *k3_get_loaded_rsc_table(struct rproc *rproc,
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
index 7d1c7d8054738..30453aca3c7b0 100644
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
-	num_mems = data->num_mems;
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
index 58c1bc5781d90..86b4135a5d31d 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1009,9 +1009,8 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 	const struct k3_rproc_dev_data *data = kproc->data;
 	struct device *dev = &pdev->dev;
 	struct k3_r5_core *core = kproc->priv;
-	struct resource *res;
 	int num_mems;
-	int i;
+	int i, ret;
 
 	num_mems = data->num_mems;
 	kproc->mem = devm_kcalloc(kproc->dev, num_mems, sizeof(*kproc->mem),
@@ -1019,45 +1018,19 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 	if (!kproc->mem)
 		return -ENOMEM;
 
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
+	ret = k3_rproc_of_get_memories(pdev, kproc);
+	if (ret)
+		return ret;
 
+	for (i = 0; i < num_mems; i++) {
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
@@ -1066,14 +1039,10 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
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

