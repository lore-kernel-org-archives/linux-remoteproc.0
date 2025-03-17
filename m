Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C266023C390;
	Mon, 17 Mar 2025 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213280; cv=none; b=o4xnj5rg+aAx/qIgmDlgxhZoBe7R2BK/mPRyJBkq8rgOxFMlriulgh0phOF4kbGXBK6PaVfbQYJjk8Dvr4niZziK9CObx1omsqVd9H2y8CtZ5M+siMlXjOLjfGUyFVB/Q4PYimxluRdt+JruvDMV0knc1rssMDQOb7o4SW8Nq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213280; c=relaxed/simple;
	bh=JO8IvKpkO3tmPlWgY5KTs+gID131t1oPGEgBIeEXRPE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZbdsE48GmZNLD/at00nyTGOIboH78BZ5P9RbuMQByBx2fmhSYCp6U4PB+kL/UQzvTSTu9SQn9L/Ka5MWY9glf+8H6VYHXWLxmBSTQsKs6gnYzcL5tuecxo5T7usxVWBN3xnod6sv7vAMv+gpq3IUoYgWrjt6Pf1cybck8iTJ2Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AMZYTk/U; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AMZYTk/U"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7po62331378
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213271;
	bh=1K9d74Mm9Yp4gg9kqiZA5wE5tSW8+6DGE32O4ndbBk0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AMZYTk/ULbY7s7uMb9TysxFMlih1zKXVV0Rkiy43eiiMO9ckymo1pjNhZNOPBKatH
	 krtbXo7x8jRkEpoCBSJEz95eYOdj4xWyedsnMCh1Uj+90jzRiipbpgBSa0lg+7Cacf
	 lgS47TcNAdjG3ffAuW+yTluTTM0p1i28Do9pz5c8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7pnK124375
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:07:51 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:50 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKI060901;
	Mon, 17 Mar 2025 07:07:47 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 21/26] remoteproc: k3: Refactor .get_loaded_rsc_table ops into common driver
Date: Mon, 17 Mar 2025 17:36:17 +0530
Message-ID: <20250317120622.1746415-22-b-padhi@ti.com>
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

The .get_loaded_rsc_table rproc ops implementations in TI K3 R5, DSP and
M4 remoteproc drivers return a pointer to the resource table that was
pre-loaded at the base address of the DDR region reserved for firmware
usage. Refactor the implementations into ti_k3_common.c driver as
k3_get_loaded_rsc_table() and align R5, DSP and M4 drivers to register
this common function as .get_loaded_rsc_table ops.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 33 +++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  2 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 49 ++++-------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 34 +---------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 34 +---------------
 5 files changed, 45 insertions(+), 107 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 84e263f159a0..92681d24a20a 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -319,5 +319,38 @@ EXPORT_SYMBOL_GPL(k3_rproc_attach);
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
index 97345349b818..266e5c66762f 100644
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
index dd81bcc8e1e4..0bfa3b730d1f 100644
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
@@ -150,12 +118,13 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 }
 
 static const struct rproc_ops k3_dsp_rproc_ops = {
-	.start		= k3_dsp_rproc_start,
-	.stop		= k3_rproc_stop,
-	.attach		= k3_rproc_attach,
-	.detach		= k3_rproc_detach,
-	.kick		= k3_rproc_kick,
-	.da_to_va	= k3_dsp_rproc_da_to_va,
+	.start			=	k3_dsp_rproc_start,
+	.stop			=	k3_rproc_stop,
+	.attach			=	k3_rproc_attach,
+	.detach			=	k3_rproc_detach,
+	.kick			=	k3_rproc_kick,
+	.da_to_va		=	k3_dsp_rproc_da_to_va,
+	.get_loaded_rsc_table	=	k3_get_loaded_rsc_table,
 };
 
 static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
@@ -374,12 +343,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
 
-	/* configure J721E devices for either remoteproc or IPC-only mode */
+	/* configure devices for either remoteproc or IPC-only mode */
 	if (p_state) {
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
-		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
 	} else {
 		dev_info(dev, "configured DSP for remoteproc mode\n");
 	}
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index accf8b9aea6e..59c696a493c5 100644
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
index a17c4b5418ae..34ee5669238b 100644
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

