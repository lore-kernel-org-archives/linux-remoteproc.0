Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCFD2459F8;
	Mon, 17 Mar 2025 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213287; cv=none; b=WNW2Il0Lh07RMPzTVlDNfoul4J6g5trOboDpt9mDlzI5OEYtaCvj3Wc6taTtbzJKp1678YRkyhJxcmhA2LIBphpqbCPhFHoPhg1r32uJkuMuQRZTosTosD7QjrqYMXNjJuBSWkj2WIDTgFK4b7ZD2uyCLyWWrPut21IWnCkAie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213287; c=relaxed/simple;
	bh=sNQbgVOO0tEqnTmxQslAMVTkMoQW5i3rNMxPpzhAodU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jMNEMM5uYsI3H6eU0nnLz46pt6+7pfyzZgcPbJV8cy5+7dVAtSmEmXAXnwTlgfjXeIJ1V99ijwpKnhdlLsqVB+SA3hesyX0P8uhtYKf/nt3zkgL3V8oJwubYuy/Ntkr23QKuZgG2yqE7DXZF4/HDHdJJbldREnXhX4GB8tc9qQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o3WaTfc2; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o3WaTfc2"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7sBm2267010
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213275;
	bh=B7q/2a/BjF5X3WM4pIQbeKEPWHPe6L4eu9IuiA0IsXg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o3WaTfc2G3Ah9Ep67odlL/AqCVgz+wKv17MY1+JVfsYxgk6MbZVhIwxkw2AUHZNTl
	 NOVCs4GeDrLWCnIbeqkvnhGxIKWfscUr5OA37KJZH/7qDPT+egK8BsjyJWsA0WuUMh
	 baq9roh2RXQS4EgW3tdk/PoAseXVuGCXRHSV6YVk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7svs124389
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:07:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:54 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKJ060901;
	Mon, 17 Mar 2025 07:07:51 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 22/26] remoteproc: k3: Refactor .da_to_va rproc ops into common driver
Date: Mon, 17 Mar 2025 17:36:18 +0530
Message-ID: <20250317120622.1746415-23-b-padhi@ti.com>
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

The .da_to_va rproc ops implementations in TI K3 R5, DSP and M4
remoteproc drivers return the Kernel virtual address for a
corresponding rproc device address. Refactor the implementations into
ti_k3_common.c driver as k3_rproc_da_to_va and align R5, DSP and M4
drivers to use this common function for address translation.
Additionally, handle R5 SRAM memory translations specifically in the R5
remoteproc driver.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 57 ++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  4 ++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 63 +----------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 58 +--------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 37 +------------
 5 files changed, 65 insertions(+), 154 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 92681d24a20a..818d66d0ca10 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -352,5 +352,62 @@ struct resource_table *k3_get_loaded_rsc_table(struct rproc *rproc,
 }
 EXPORT_SYMBOL_GPL(k3_get_loaded_rsc_table);
 
+/*
+ * Custom function to translate a remote processor device address (internal
+ * RAMs only) to a kernel virtual address.  The remote processors can access
+ * their RAMs at either an internal address visible only from a remote
+ * processor, or at the SoC-level bus address. Both these addresses need to be
+ * looked through for translation. The translated addresses can be used either
+ * by the remoteproc core for loading (when using kernel remoteproc loader), or
+ * by any rpmsg bus drivers.
+ */
+void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
+{
+	struct k3_rproc *kproc = rproc->priv;
+	void __iomem *va = NULL;
+	phys_addr_t bus_addr;
+	u32 dev_addr, offset;
+	size_t size;
+	int i;
+
+	if (len == 0)
+		return NULL;
+
+	for (i = 0; i < kproc->num_mems; i++) {
+		bus_addr = kproc->mem[i].bus_addr;
+		dev_addr = kproc->mem[i].dev_addr;
+		size = kproc->mem[i].size;
+
+		/* handle rproc-view addresses */
+		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
+			offset = da - dev_addr;
+			va = kproc->mem[i].cpu_addr + offset;
+			return (__force void *)va;
+		}
+
+		/* handle SoC-view addresses */
+		if (da >= bus_addr && (da + len) <= (bus_addr + size)) {
+			offset = da - bus_addr;
+			va = kproc->mem[i].cpu_addr + offset;
+			return (__force void *)va;
+		}
+	}
+
+	/* handle static DDR reserved memory regions */
+	for (i = 0; i < kproc->num_rmems; i++) {
+		dev_addr = kproc->rmem[i].dev_addr;
+		size = kproc->rmem[i].size;
+
+		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
+			offset = da - dev_addr;
+			va = kproc->rmem[i].cpu_addr + offset;
+			return (__force void *)va;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_da_to_va);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 266e5c66762f..d600d18b9c7e 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -16,6 +16,8 @@
 #ifndef REMOTEPROC_TI_K3_COMMON_H
 #define REMOTEPROC_TI_K3_COMMON_H
 
+#define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
+
 /**
  * struct k3_rproc_mem - internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -101,4 +103,6 @@ int k3_rproc_attach(struct rproc *rproc);
 int k3_rproc_detach(struct rproc *rproc);
 struct resource_table *k3_get_loaded_rsc_table(struct rproc *rproc,
 					       size_t *rsc_table_sz);
+void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
+			bool *is_iomem);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 0bfa3b730d1f..3d888ab9de6b 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -22,8 +22,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-#define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
-
 /*
  * Power up the DSP remote processor.
  *
@@ -58,72 +56,13 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * Custom function to translate a DSP device address (internal RAMs only) to a
- * kernel virtual address.  The DSPs can access their RAMs at either an internal
- * address visible only from a DSP, or at the SoC-level bus address. Both these
- * addresses need to be looked through for translation. The translated addresses
- * can be used either by the remoteproc core for loading (when using kernel
- * remoteproc loader), or by any rpmsg bus drivers.
- */
-static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	void __iomem *va = NULL;
-	phys_addr_t bus_addr;
-	u32 dev_addr, offset;
-	size_t size;
-	int i;
-
-	if (len == 0)
-		return NULL;
-
-	for (i = 0; i < kproc->num_mems; i++) {
-		bus_addr = kproc->mem[i].bus_addr;
-		dev_addr = kproc->mem[i].dev_addr;
-		size = kproc->mem[i].size;
-
-		if (da < KEYSTONE_RPROC_LOCAL_ADDRESS_MASK) {
-			/* handle DSP-view addresses */
-			if (da >= dev_addr &&
-			    ((da + len) <= (dev_addr + size))) {
-				offset = da - dev_addr;
-				va = kproc->mem[i].cpu_addr + offset;
-				return (__force void *)va;
-			}
-		} else {
-			/* handle SoC-view addresses */
-			if (da >= bus_addr &&
-			    (da + len) <= (bus_addr + size)) {
-				offset = da - bus_addr;
-				va = kproc->mem[i].cpu_addr + offset;
-				return (__force void *)va;
-			}
-		}
-	}
-
-	/* handle static DDR reserved memory regions */
-	for (i = 0; i < kproc->num_rmems; i++) {
-		dev_addr = kproc->rmem[i].dev_addr;
-		size = kproc->rmem[i].size;
-
-		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
-			offset = da - dev_addr;
-			va = kproc->rmem[i].cpu_addr + offset;
-			return (__force void *)va;
-		}
-	}
-
-	return NULL;
-}
-
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start			=	k3_dsp_rproc_start,
 	.stop			=	k3_rproc_stop,
 	.attach			=	k3_rproc_attach,
 	.detach			=	k3_rproc_detach,
 	.kick			=	k3_rproc_kick,
-	.da_to_va		=	k3_dsp_rproc_da_to_va,
+	.da_to_va		=	k3_rproc_da_to_va,
 	.get_loaded_rsc_table	=	k3_get_loaded_rsc_table,
 };
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 59c696a493c5..063025738e6a 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,62 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-/*
- * Custom function to translate a remote processor device address (internal
- * RAMs only) to a kernel virtual address.  The remote processors can access
- * their RAMs at either an internal address visible only from a remote
- * processor, or at the SoC-level bus address. Both these addresses need to be
- * looked through for translation. The translated addresses can be used either
- * by the remoteproc core for loading (when using kernel remoteproc loader), or
- * by any rpmsg bus drivers.
- */
-static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	void __iomem *va = NULL;
-	phys_addr_t bus_addr;
-	u32 dev_addr, offset;
-	size_t size;
-	int i;
-
-	if (len == 0)
-		return NULL;
-
-	for (i = 0; i < kproc->num_mems; i++) {
-		bus_addr = kproc->mem[i].bus_addr;
-		dev_addr = kproc->mem[i].dev_addr;
-		size = kproc->mem[i].size;
-
-		/* handle M4-view addresses */
-		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
-			offset = da - dev_addr;
-			va = kproc->mem[i].cpu_addr + offset;
-			return (__force void *)va;
-		}
-
-		/* handle SoC-view addresses */
-		if (da >= bus_addr && ((da + len) <= (bus_addr + size))) {
-			offset = da - bus_addr;
-			va = kproc->mem[i].cpu_addr + offset;
-			return (__force void *)va;
-		}
-	}
-
-	/* handle static DDR reserved memory regions */
-	for (i = 0; i < kproc->num_rmems; i++) {
-		dev_addr = kproc->rmem[i].dev_addr;
-		size = kproc->rmem[i].size;
-
-		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
-			offset = da - dev_addr;
-			va = kproc->rmem[i].cpu_addr + offset;
-			return (__force void *)va;
-		}
-	}
-
-	return NULL;
-}
-
 static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
 				       struct k3_rproc *kproc)
 {
@@ -220,7 +164,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 	.attach = k3_rproc_attach,
 	.detach = k3_rproc_detach,
 	.kick = k3_rproc_kick,
-	.da_to_va = k3_m4_rproc_da_to_va,
+	.da_to_va = k3_rproc_da_to_va,
 	.get_loaded_rsc_table = k3_get_loaded_rsc_table,
 };
 
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 34ee5669238b..dd70a11a9140 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -572,7 +572,6 @@ static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 	struct k3_rproc *kproc = rproc->priv;
 	struct k3_r5_core *core = kproc->priv;
 	void __iomem *va = NULL;
-	phys_addr_t bus_addr;
 	u32 dev_addr, offset;
 	size_t size;
 	int i;
@@ -580,27 +579,6 @@ static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 	if (len == 0)
 		return NULL;
 
-	/* handle both R5 and SoC views of ATCM and BTCM */
-	for (i = 0; i < kproc->num_mems; i++) {
-		bus_addr = kproc->mem[i].bus_addr;
-		dev_addr = kproc->mem[i].dev_addr;
-		size = kproc->mem[i].size;
-
-		/* handle R5-view addresses of TCMs */
-		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
-			offset = da - dev_addr;
-			va = kproc->mem[i].cpu_addr + offset;
-			return (__force void *)va;
-		}
-
-		/* handle SoC-view addresses of TCMs */
-		if (da >= bus_addr && ((da + len) <= (bus_addr + size))) {
-			offset = da - bus_addr;
-			va = kproc->mem[i].cpu_addr + offset;
-			return (__force void *)va;
-		}
-	}
-
 	/* handle any SRAM regions using SoC-view addresses */
 	for (i = 0; i < core->num_sram; i++) {
 		dev_addr = core->sram[i].dev_addr;
@@ -613,19 +591,8 @@ static void *k3_r5_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 		}
 	}
 
-	/* handle static DDR reserved memory regions */
-	for (i = 0; i < kproc->num_rmems; i++) {
-		dev_addr = kproc->rmem[i].dev_addr;
-		size = kproc->rmem[i].size;
-
-		if (da >= dev_addr && ((da + len) <= (dev_addr + size))) {
-			offset = da - dev_addr;
-			va = kproc->rmem[i].cpu_addr + offset;
-			return (__force void *)va;
-		}
-	}
-
-	return NULL;
+	/* handle both TCM and DDR memory regions */
+	return k3_rproc_da_to_va(rproc, da, len, is_iomem);
 }
 
 static const struct rproc_ops k3_r5_rproc_ops = {
-- 
2.34.1

