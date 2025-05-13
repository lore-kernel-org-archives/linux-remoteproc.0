Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D09A20C482;
	Tue, 13 May 2025 05:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115254; cv=none; b=g7qPVh+vVt6MyNAJgAZgeGnTEF9GI+Lrr/MqNxEC09amxVNkIhRPoPXdbKbW93E35Enn5jR2deLNqJYrzAo7XNO9gmr/TE3JagphCHSI8bnYQKXf9JY2SwOyfXupiSE5EmS80F+slp8LuHQEegWYDDK+PBRCLx4B1o7qDlFByWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115254; c=relaxed/simple;
	bh=t6/LYGq7mIca1mwVBTuUcJpIcCUBdNF7/dqUWosdfXU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xp1d8/2kyARqM/MCuoOs+dmHKe28HPk+4ODo4srBMZv5Kq+gNkThS954j2q1C/rbJPZXzdaV36CSUXbAr2h2W4ymsXOJxogrwP5crQSNP5md1Ex55/DWzfpgDlqJ948tGt7jeCOxaQUuG6YGhUXlAGoNCdlQ4ByBXiGDTOebKZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s7MBzUvl; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s7MBzUvl"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5lOeA2764701
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115244;
	bh=c5GSjhshyjW42YE9UlxCYadhh5AmWj09hiTtk6gpwG4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=s7MBzUvlbGtEc7p9sqpK7Veu5FKQdxkmzkNt6OnCZDB6sp7rZC7f9/gwBzA/nVcBs
	 Njbr3kyHR9a9NNYhy3G03BrZ5/8qh17NiJ3XEY2x980dqIy64TpYZ0KWJ3HYkVFolP
	 uog+2kquyEETj+qsTHUAAn2sHaE1a8HjNZhNbNPA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5lOn5063691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:47:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:47:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:47:23 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqe131001;
	Tue, 13 May 2025 00:47:20 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 31/36] remoteproc: k3: Refactor .get_loaded_rsc_table ops into common driver
Date: Tue, 13 May 2025 11:15:05 +0530
Message-ID: <20250513054510.3439842-32-b-padhi@ti.com>
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

The .get_loaded_rsc_table rproc ops implementations in TI K3 R5, DSP and
M4 remoteproc drivers return a pointer to the resource table that was
pre-loaded at the base address of the DDR region reserved for firmware
usage.

Refactor the implementations into ti_k3_common.c driver as
k3_get_loaded_rsc_table() and register this common function as
.get_loaded_rsc_table ops in R5, DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-31-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-29-b-padhi@ti.com/

v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.
2. Update commit message to call out changes in a better way.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-22-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 33 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  2 ++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 34 +----------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 34 +----------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 34 +----------------------
 5 files changed, 38 insertions(+), 99 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 5c976fb570d0f..1219294b5de69 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -318,5 +318,38 @@ EXPORT_SYMBOL_GPL(k3_rproc_attach);
 int k3_rproc_detach(struct rproc *rproc) { return 0; }
 EXPORT_SYMBOL_GPL(k3_rproc_detach);
 
+/*
+ * This function implements the .get_loaded_rsc_table() callback and is used
+ * to provide the resource table for a booted remote processor in IPC-only
+ * mode. The remote processor firmwares follow a design-by-contract approach
+ * and are expected to have the resource table at the base of the DDR region
+ * reserved for firmware usage. This provides flexibility for the remote
+ * processor to be booted by different bootloaders that may or may not have the
+ * ability to publish the resource table address and size through a DT
+ * property.
+ */
+struct resource_table *k3_get_loaded_rsc_table(struct rproc *rproc,
+					       size_t *rsc_table_sz)
+{
+	struct k3_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+
+	if (!kproc->rmem[0].cpu_addr) {
+		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/*
+	 * NOTE: The resource table size is currently hard-coded to a maximum
+	 * of 256 bytes. The most common resource table usage for K3 firmwares
+	 * is to only have the vdev resource entry and an optional trace entry.
+	 * The exact size could be computed based on resource table address, but
+	 * the hard-coded value suffices to support the IPC-only mode.
+	 */
+	*rsc_table_sz = 256;
+	return (__force struct resource_table *)kproc->rmem[0].cpu_addr;
+}
+EXPORT_SYMBOL_GPL(k3_get_loaded_rsc_table);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 42358bf5aae94..61e617d2065e7 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -104,4 +104,6 @@ int k3_rproc_start(struct rproc *rproc);
 int k3_rproc_stop(struct rproc *rproc);
 int k3_rproc_attach(struct rproc *rproc);
 int k3_rproc_detach(struct rproc *rproc);
+struct resource_table *k3_get_loaded_rsc_table(struct rproc *rproc,
+					       size_t *rsc_table_sz);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a62a69d9f80ed..8a51b304ed1f2 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -58,38 +58,6 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * This function implements the .get_loaded_rsc_table() callback and is used
- * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
- * firmwares follow a design-by-contract approach and are expected to have the
- * resource table at the base of the DDR region reserved for firmware usage.
- * This provides flexibility for the remote processor to be booted by different
- * bootloaders that may or may not have the ability to publish the resource table
- * address and size through a DT property. This callback is invoked only in
- * IPC-only mode.
- */
-static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
-							  size_t *rsc_table_sz)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-
-	if (!kproc->rmem[0].cpu_addr) {
-		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	/*
-	 * NOTE: The resource table size is currently hard-coded to a maximum
-	 * of 256 bytes. The most common resource table usage for K3 firmwares
-	 * is to only have the vdev resource entry and an optional trace entry.
-	 * The exact size could be computed based on resource table address, but
-	 * the hard-coded value suffices to support the IPC-only mode.
-	 */
-	*rsc_table_sz = 256;
-	return (__force struct resource_table *)kproc->rmem[0].cpu_addr;
-}
-
 /*
  * Custom function to translate a DSP device address (internal RAMs only) to a
  * kernel virtual address.  The DSPs can access their RAMs at either an internal
@@ -156,7 +124,7 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.detach			= k3_rproc_detach,
 	.kick			= k3_rproc_kick,
 	.da_to_va		= k3_dsp_rproc_da_to_va,
-	.get_loaded_rsc_table	= k3_dsp_get_loaded_rsc_table,
+	.get_loaded_rsc_table	= k3_get_loaded_rsc_table,
 };
 
 static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index d75362717155d..d6fbbe3385567 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,38 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-/*
- * This function implements the .get_loaded_rsc_table() callback and is used
- * to provide the resource table for a booted remote processor in IPC-only
- * mode. The remote processor firmwares follow a design-by-contract approach
- * and are expected to have the resource table at the base of the DDR region
- * reserved for firmware usage. This provides flexibility for the remote
- * processor to be booted by different bootloaders that may or may not have the
- * ability to publish the resource table address and size through a DT
- * property.
- */
-static struct resource_table *k3_m4_get_loaded_rsc_table(struct rproc *rproc,
-							 size_t *rsc_table_sz)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-
-	if (!kproc->rmem[0].cpu_addr) {
-		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	/*
-	 * NOTE: The resource table size is currently hard-coded to a maximum
-	 * of 256 bytes. The most common resource table usage for K3 firmwares
-	 * is to only have the vdev resource entry and an optional trace entry.
-	 * The exact size could be computed based on resource table address, but
-	 * the hard-coded value suffices to support the IPC-only mode.
-	 */
-	*rsc_table_sz = 256;
-	return (__force struct resource_table *)kproc->rmem[0].cpu_addr;
-}
-
 /*
  * Custom function to translate a remote processor device address (internal
  * RAMs only) to a kernel virtual address.  The remote processors can access
@@ -253,7 +221,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 	.detach = k3_rproc_detach,
 	.kick = k3_rproc_kick,
 	.da_to_va = k3_m4_rproc_da_to_va,
-	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
+	.get_loaded_rsc_table = k3_get_loaded_rsc_table,
 };
 
 static int k3_m4_rproc_probe(struct platform_device *pdev)
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index ecd6e6b15d608..2e9e2312384f1 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -559,38 +559,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * This function implements the .get_loaded_rsc_table() callback and is used
- * to provide the resource table for the booted R5F in IPC-only mode. The K3 R5F
- * firmwares follow a design-by-contract approach and are expected to have the
- * resource table at the base of the DDR region reserved for firmware usage.
- * This provides flexibility for the remote processor to be booted by different
- * bootloaders that may or may not have the ability to publish the resource table
- * address and size through a DT property. This callback is invoked only in
- * IPC-only mode.
- */
-static struct resource_table *k3_r5_get_loaded_rsc_table(struct rproc *rproc,
-							 size_t *rsc_table_sz)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-
-	if (!kproc->rmem[0].cpu_addr) {
-		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	/*
-	 * NOTE: The resource table size is currently hard-coded to a maximum
-	 * of 256 bytes. The most common resource table usage for K3 firmwares
-	 * is to only have the vdev resource entry and an optional trace entry.
-	 * The exact size could be computed based on resource table address, but
-	 * the hard-coded value suffices to support the IPC-only mode.
-	 */
-	*rsc_table_sz = 256;
-	return (__force struct resource_table *)kproc->rmem[0].cpu_addr;
-}
-
 /*
  * Internal Memory translation helper
  *
@@ -1042,7 +1010,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 		kproc->rproc->ops->attach = k3_rproc_attach;
 		kproc->rproc->ops->detach = k3_rproc_detach;
 		kproc->rproc->ops->get_loaded_rsc_table =
-						k3_r5_get_loaded_rsc_table;
+						k3_get_loaded_rsc_table;
 	} else if (!c_state) {
 		dev_info(cdev, "configured R5F for remoteproc mode\n");
 		ret = 0;
-- 
2.34.1

