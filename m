Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB42459CD;
	Fri, 25 Apr 2025 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577826; cv=none; b=AwWd7E3bf9aWJkRFqofYQnrvFOtiIQNnVKQa1fliYN3MznmRbrea6eczDJA13ccl8f30FsoSs5OzBF4nJkUyyChRJ9B2raaeK217gqDfVMz4C3HucRbkVxvY+K6b7vYiSVvNVl6FS839T8VqrbffBmPX90nZx9v8sECGCXs02j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577826; c=relaxed/simple;
	bh=BXf+gYixd2Y78mVnVCA4QjnkKAbVCm0yj4dSxsDakks=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=skHmuR6YCYm1JHarkgID/r6RtluJiJ0RDLvo4CQYwBonyVcxhLqTX1cLUXtBHIpA2+iAY+AFTNqEZnJagUITsYyGAFYM8/rnuElWz8ygrUmqrRVBTCKDsqzTH/JcUk6311J1zWcmU7uEj+ua9Llef6CQ5U1rBFA7wglgO/dzXRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E/GA6tCH; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E/GA6tCH"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhcM72768358
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577818;
	bh=djjKtCYo7HgWg+z2Ev3SdrKmfbRbPKdQcfnRm+TyNuM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E/GA6tCH50yXOvEWLd8yf94igk2LPzxUdKb9m1y2Kv8M04jDWzLFNZen64uq2HWPt
	 7qS212TC6G6F9cSacVeN4Nr69Pnxqh9EWfKwKXyMDMk0MxSlx59pl02GCtCiTHgJTJ
	 cDbZ0FtGnPhxKCnrukyFSNYyfGjF4uDlIXCo4JDA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhcHo087869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:43:38 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:43:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:43:37 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZq038329;
	Fri, 25 Apr 2025 05:43:34 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 31/35] remoteproc: k3: Refactor .da_to_va rproc ops into common driver
Date: Fri, 25 Apr 2025 16:11:31 +0530
Message-ID: <20250425104135.830255-32-b-padhi@ti.com>
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

The .da_to_va rproc ops implementations in TI K3 R5, DSP and M4
remoteproc drivers return the Kernel virtual address for a
corresponding rproc device address.

Refactor the implementations into the ti_k3_common.c driver as
k3_rproc_da_to_va and use this common function for address translation
of DDR and internal memory regions in R5, DSP and M4 drivers.

Note: The R5 SRAM memory translations are still handled in the .da_to_va
ops of the R5 remoteproc driver.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-30-b-padhi@ti.com/

v10: Changelog:
1. Updated commit message to call out the changes better.
2. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-23-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 57 ++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  4 ++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 63 +----------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 58 +--------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 37 +------------
 5 files changed, 65 insertions(+), 154 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 96313d75c5130..3d98361bca990 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -347,5 +347,62 @@ struct resource_table *k3_get_loaded_rsc_table(struct rproc *rproc,
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
index 266e5c66762f1..d600d18b9c7eb 100644
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
index 8a51b304ed1f2..fa1943c39df90 100644
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
 	.start			= k3_dsp_rproc_start,
 	.stop			= k3_rproc_stop,
 	.attach			= k3_rproc_attach,
 	.detach			= k3_rproc_detach,
 	.kick			= k3_rproc_kick,
-	.da_to_va		= k3_dsp_rproc_da_to_va,
+	.da_to_va		= k3_rproc_da_to_va,
 	.get_loaded_rsc_table	= k3_get_loaded_rsc_table,
 };
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 59c696a493c5f..063025738e6a5 100644
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
index e6f136d320c13..93adb2d142e18 100644
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

