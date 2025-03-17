Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A27233728;
	Mon, 17 Mar 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213207; cv=none; b=grS9LpWGXeKIlJN7aIbHJ2/H7oJdGLEhPf+hOb/Jz3iArSVJ4P3PNqF1oTtiEP7jyohpYQ0BBC2/nbt5NiHd5NBIbG3Ntbmzw3z6A866WWfI9dqXxprIuls9qhFNTcE+XUgz6L0e3cHrDbYSh9qtxI5Yh+rrSonLRBeeAMjha1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213207; c=relaxed/simple;
	bh=s+yJxp49VF/mwK0XtZkFZkXqt/DFzILJbKyBePbaHK0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l25WFNurlP2zOWCB6y9aQIxKJf30GDiNgJ430n52jPh7775Z4jo0fuaBmxnnCcpexETMkqSAOLB71UnjixpWKtP7IWcmRCZxW3AM2WzCnZdEwJdf6a3B9fWGyR3y0G4yq6UbPmMUUMifxr6Wy8a8BgyWqjrlGdIDzheL7DOGdzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hVgIajtK; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hVgIajtK"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC6ZeO2331215
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213196;
	bh=RTq9KbVztCwplzBxgIFcygBTDAf+k8lLRX80fGBWqS8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hVgIajtK1EgzFkP7jQ9wvRSHr6XY+QuMyB6oWjBfEY0QeIoMQ+ea27B/L0sfXGLSw
	 roZmBqK+S59iEUtIBrR76TcMjXxMYGSODlFpUkbUverOiDCIbS+tS+muCR112AMZln
	 cxPXFCNRVqxoc/cVQe213OXRmZ+7JVXjR+xG5i2k=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC6Zad032695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:06:35 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:06:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:06:35 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MJw060901;
	Mon, 17 Mar 2025 07:06:32 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 01/26] remoteproc: k3-r5: Re-order internal memory initialization function
Date: Mon, 17 Mar 2025 17:35:57 +0530
Message-ID: <20250317120622.1746415-2-b-padhi@ti.com>
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

The core's internal memory data structure will be refactored to be part
of the k3_r5_rproc structure in a future commit. As a result, internal
memory initialization will need to be performed inside
k3_r5_cluster_rproc_init() after rproc_alloc().

Therefore, move the internal memory initialization function,
k3_r5_core_of_get_internal_memories() above k3_r5_rproc_init() so that
it can be invoked from there.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 158 +++++++++++------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index dbc513c5569c..b2738b9a1b2d 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1199,6 +1199,85 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 	return ret;
 }
 
+static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
+					       struct k3_r5_core *core)
+{
+	static const char * const mem_names[] = {"atcm", "btcm"};
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int num_mems;
+	int i;
+
+	num_mems = ARRAY_SIZE(mem_names);
+	core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), GFP_KERNEL);
+	if (!core->mem)
+		return -ENOMEM;
+
+	for (i = 0; i < num_mems; i++) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   mem_names[i]);
+		if (!res) {
+			dev_err(dev, "found no memory resource for %s\n",
+				mem_names[i]);
+			return -EINVAL;
+		}
+		if (!devm_request_mem_region(dev, res->start,
+					     resource_size(res),
+					     dev_name(dev))) {
+			dev_err(dev, "could not request %s region for resource\n",
+				mem_names[i]);
+			return -EBUSY;
+		}
+
+		/*
+		 * TCMs are designed in general to support RAM-like backing
+		 * memories. So, map these as Normal Non-Cached memories. This
+		 * also avoids/fixes any potential alignment faults due to
+		 * unaligned data accesses when using memcpy() or memset()
+		 * functions (normally seen with device type memory).
+		 */
+		core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
+							resource_size(res));
+		if (!core->mem[i].cpu_addr) {
+			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
+			return -ENOMEM;
+		}
+		core->mem[i].bus_addr = res->start;
+
+		/*
+		 * TODO:
+		 * The R5F cores can place ATCM & BTCM anywhere in its address
+		 * based on the corresponding Region Registers in the System
+		 * Control coprocessor. For now, place ATCM and BTCM at
+		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
+		 * SoCs) based on loczrama setting
+		 */
+		if (!strcmp(mem_names[i], "atcm")) {
+			core->mem[i].dev_addr = core->loczrama ?
+							0 : K3_R5_TCM_DEV_ADDR;
+		} else {
+			core->mem[i].dev_addr = core->loczrama ?
+							K3_R5_TCM_DEV_ADDR : 0;
+		}
+		core->mem[i].size = resource_size(res);
+
+		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
+			mem_names[i], &core->mem[i].bus_addr,
+			core->mem[i].size, core->mem[i].cpu_addr,
+			core->mem[i].dev_addr);
+	}
+	core->num_mems = num_mems;
+
+	return 0;
+}
+
+static void k3_r5_release_tsp(void *data)
+{
+	struct ti_sci_proc *tsp = data;
+
+	ti_sci_proc_release(tsp);
+}
+
 static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
@@ -1358,78 +1437,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 	}
 }
 
-static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
-					       struct k3_r5_core *core)
-{
-	static const char * const mem_names[] = {"atcm", "btcm"};
-	struct device *dev = &pdev->dev;
-	struct resource *res;
-	int num_mems;
-	int i;
-
-	num_mems = ARRAY_SIZE(mem_names);
-	core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), GFP_KERNEL);
-	if (!core->mem)
-		return -ENOMEM;
-
-	for (i = 0; i < num_mems; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   mem_names[i]);
-		if (!res) {
-			dev_err(dev, "found no memory resource for %s\n",
-				mem_names[i]);
-			return -EINVAL;
-		}
-		if (!devm_request_mem_region(dev, res->start,
-					     resource_size(res),
-					     dev_name(dev))) {
-			dev_err(dev, "could not request %s region for resource\n",
-				mem_names[i]);
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
-		core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
-							resource_size(res));
-		if (!core->mem[i].cpu_addr) {
-			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
-			return -ENOMEM;
-		}
-		core->mem[i].bus_addr = res->start;
-
-		/*
-		 * TODO:
-		 * The R5F cores can place ATCM & BTCM anywhere in its address
-		 * based on the corresponding Region Registers in the System
-		 * Control coprocessor. For now, place ATCM and BTCM at
-		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
-		 * SoCs) based on loczrama setting
-		 */
-		if (!strcmp(mem_names[i], "atcm")) {
-			core->mem[i].dev_addr = core->loczrama ?
-							0 : K3_R5_TCM_DEV_ADDR;
-		} else {
-			core->mem[i].dev_addr = core->loczrama ?
-							K3_R5_TCM_DEV_ADDR : 0;
-		}
-		core->mem[i].size = resource_size(res);
-
-		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
-			mem_names[i], &core->mem[i].bus_addr,
-			core->mem[i].size, core->mem[i].cpu_addr,
-			core->mem[i].dev_addr);
-	}
-	core->num_mems = num_mems;
-
-	return 0;
-}
-
 static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
 					   struct k3_r5_core *core)
 {
@@ -1487,13 +1494,6 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static void k3_r5_release_tsp(void *data)
-{
-	struct ti_sci_proc *tsp = data;
-
-	ti_sci_proc_release(tsp);
-}
-
 static int k3_r5_core_of_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.34.1

