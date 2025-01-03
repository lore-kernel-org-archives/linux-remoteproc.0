Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047E01FA8EC;
	Fri,  3 Jan 2025 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899225; cv=none; b=qJJgGbh6Ht9sAOI4Wj27HVhvA0ybpUM2mXbc8ykm1meahtsoB52ZMCoCBQXB/1hO3B8UXUoVExda9VY7FZI8NmZ0wZjmDnYFoBV8iM+AGOimOAtWQoY1X13f5c9ADPDR5j/NoY7bzxBvU6IWuA+kyqHyza5Yjczh77z1u5jIG8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899225; c=relaxed/simple;
	bh=SBIBdglxUVPUrPvPV9VvYBGeZTu7MyxJT7z6oBcyD2o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N5/VxhacPw2Btf6kiEWemKSGayNFpt00PfzuSY5VRnob699EAn7HpHyk8MJATeWIArGRz1UleyV8Pzc5IyAGgThSBMEVD3vpmbj8F31Mjxlj9RlxXAymaic+ra80/guJKrKbeexrasyXsEtGmeZZ1WkVhIIafA8Uc2rxkKXH1tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nGxA9zON; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nGxA9zON"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ADWfN2019430
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 04:13:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899212;
	bh=CXWL05Dk4Kif1ALU2qQrpVKTkO7f5ZOUdelxySb2xI8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nGxA9zONhW0DLRMCZcLulzlje3ePtnHghyB0xOIh6qJXNJkp2l4+p+SS9RtGHo2t7
	 2ROLVnw87F+Q99GJMZGxxaVHxak0lTlGsTyyelGEO3UXvC0wpXbFMukUoROSNrDAZR
	 e6tSK+/G6xKwJdDCld+co+3gfpnXcmqilbI6j3HM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ADW8L042128;
	Fri, 3 Jan 2025 04:13:32 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:32 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSX126047;
	Fri, 3 Jan 2025 04:13:28 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 15/20] remoteproc: k3: Refactor .get_loaded_rsc_table ops into common driver
Date: Fri, 3 Jan 2025 15:42:26 +0530
Message-ID: <20250103101231.1508151-16-b-padhi@ti.com>
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

The .get_loaded_rsc_table rproc ops implementations in
ti_k3_dsp_remoteproc.c and ti_k3_m4_remoteproc.c drivers return a
pointer to the resource table that was pre-loaded at the base address of
the DDR region reserved for firmware usage. Refactor the implementations
into ti_k3_common.c driver as k3_get_loaded_rsc_table() and align DSP
and M4 drivers to register this common function as .get_loaded_rsc_table
ops.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 33 +++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  2 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 49 ++++-------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 34 +---------------
 4 files changed, 44 insertions(+), 74 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index b5ef2ac0d399..f56d2553a669 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -349,5 +349,38 @@ int k3_rproc_detach(struct rproc *rproc)
 }
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
index c7be85b0e5ac..663911dc7032 100644
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
index 6b532bda8d1d..e1caa5ee9a0d 100644
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
-- 
2.34.1

