Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790CD265622;
	Thu, 17 Apr 2025 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914120; cv=none; b=R6bild/3K9HBxOwqWTqI0uq4uf8xUgORgQzWvH2hfuI2hPaLPSo5AkCY8AANMJtsH89PexZjXMsh8PTOLgTt/wpCu6OQdms1A46PYeu6u4fGntui5pasjCwaZZXKyaD89X3vRg0DycLJpxY6TLr5UO7vszLlNXa8in0iEYjrJsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914120; c=relaxed/simple;
	bh=pYDW8We44mz/EdC5ZsjzV/TMp3nGNNp+NWT6uPqB/K4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6l+zhsFkufPgVaOuzr6ClAlexO/zx+BIBnt0+VCqkJiiLHKH0MqOKmbrBFiqEMyA0gfEdnDf99aQc0A6yNXmAbO6GLWVNQL/BnTEqXLCl+sN9NnEeHC256pFJANAjGxVjOfhUPgztkl8i/94pcMh+7PqYaeyuZd409Zyp7CgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ISx/8+Qx; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ISx/8+Qx"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILpnu720191
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914111;
	bh=Rq36zyQX3PjdXeX/2hoyDTr4vrLv/LYbZMZ+vMyY+Kc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ISx/8+QxFLb4l92MlGYoFeSLIOlL5XkdNRpku0chtkoybEFiDyRiZ99zTBnDl+gJt
	 5KxYlL+ftBhlND3kqYqIROwdT67e+jUPcb17bBPgJ0mMiSstZlRdgwm9flMfhqAJcP
	 wHtdMmgiMSLK4elmVqT/Fqv8bBSNxN+vb4JtZPMU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILo3B059868
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:51 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:50 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1IC071102;
	Thu, 17 Apr 2025 13:21:47 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 28/33] remoteproc: k3: Refactor .get_loaded_rsc_table ops into common driver
Date: Thu, 17 Apr 2025 23:49:56 +0530
Message-ID: <20250417182001.3903905-29-b-padhi@ti.com>
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

The .get_loaded_rsc_table rproc ops implementations in TI K3 R5, DSP and
M4 remoteproc drivers return a pointer to the resource table that was
pre-loaded at the base address of the DDR region reserved for firmware
usage.

Refactor the implementations into ti_k3_common.c driver as
k3_get_loaded_rsc_table() and register this common function as
.get_loaded_rsc_table ops in R5, DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
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
index 98f638fe3fe6b..d4524d2c88e3c 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -320,5 +320,38 @@ EXPORT_SYMBOL_GPL(k3_rproc_attach);
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
index 97345349b818a..266e5c66762f1 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -99,4 +99,6 @@ int k3_rproc_start(struct rproc *rproc);
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
index 0884087cc9f9d..f56551f9f23cf 100644
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
index 49b576872103e..e6f136d320c13 100644
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

