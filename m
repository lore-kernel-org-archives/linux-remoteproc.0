Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481AD222D6A;
	Thu, 19 Dec 2024 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606371; cv=none; b=luqHKIP/6suqbOQhshPyWmOMz8P+wNqpQHxPkqnRyRbgK7XbV4KsjA3xz456Umf8AqfpKMZZuV7LS9XVmTD1lmmUTaT4hoelN6SgZH8la3RpSeE27dVvucE+2IMHrEuhTHUb9neskXimXb200PNPgGx98uJFkKBPSCf69Zd9A7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606371; c=relaxed/simple;
	bh=g1fxSafk1KXtAFB0OxFaBTDmX4G34Tb+ERDOb4R72Co=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/gINdSRBzixGdKd+LMNQlddpVIDIVIyHz411j59sgS/40NPaAIuoU7f1bmb6ubhgDqmvx6Yiw6pS5EttcylcYNPj55P8k1bcym6vdGq1jxqRvxhtZ/hUKouhEl+v7GameDHf2mdyVSi2EvyPztx4tsgLc43t6uzp2uZKsMAuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lGlVEht4; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lGlVEht4"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB603T3773123
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 05:06:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734606360;
	bh=KNmXkfqgbcf9G5JKQ2qpd5TP/9WGb93MYStYoirNm8g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lGlVEht4p7jcxNOXufk8ovMqO9KiCqVHmQkS58lpqYLRBe1R3JUkcs2j7NxdUGT+X
	 0L4wVdEwTxJPaYGL9jiJA0Ie6F/2fLPrTHwcQekGnQbfUQQDk0+QFKvTdomcd8c6QA
	 o3wvNGkHzk6A11qGJuv4EFZoVjeF0gPGMlB48lMM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB60eT082909
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 05:06:00 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 05:05:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 05:06:00 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJB5jYB088123;
	Thu, 19 Dec 2024 05:05:56 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/5] remoteproc: k3-r5: Use devm_ioremap_wc() helper
Date: Thu, 19 Dec 2024 16:35:43 +0530
Message-ID: <20241219110545.1898883-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219110545.1898883-1-b-padhi@ti.com>
References: <20241219110545.1898883-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use a device lifecycle managed ioremap helper function. This helps
prevent mistakes like unmapping out of order in cleanup functions and
forgetting to unmap on all error paths.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Re-ordered [PATCH 4/5] from v1 to [PATCH v2 3/5] in v2. [Andrew]
2. Returned after dev_err_probe() call by jumping to 'out' label in
k3_r5_cluster_rproc_init(). [Andrew]
 
Link to v1:
https://lore.kernel.org/all/20241204111130.2218497-5-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 38 +++++-------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 0753a5c35c7e..3493bae95fdf 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1004,17 +1004,13 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 	/* use remaining reserved memory regions for static carveouts */
 	for (i = 0; i < num_rmems; i++) {
 		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
-		if (!rmem_np) {
-			ret = -EINVAL;
-			goto unmap_rmem;
-		}
+		if (!rmem_np)
+			return -EINVAL;
 
 		rmem = of_reserved_mem_lookup(rmem_np);
 		of_node_put(rmem_np);
-		if (!rmem) {
-			ret = -EINVAL;
-			goto unmap_rmem;
-		}
+		if (!rmem)
+			return -EINVAL;
 
 		kproc->rmem[i].bus_addr = rmem->base;
 		/*
@@ -1029,12 +1025,11 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 		 */
 		kproc->rmem[i].dev_addr = (u32)rmem->base;
 		kproc->rmem[i].size = rmem->size;
-		kproc->rmem[i].cpu_addr = ioremap_wc(rmem->base, rmem->size);
+		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
 		if (!kproc->rmem[i].cpu_addr) {
 			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
 				i + 1, &rmem->base, &rmem->size);
-			ret = -ENOMEM;
-			goto unmap_rmem;
+			return -ENOMEM;
 		}
 
 		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
@@ -1045,19 +1040,6 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 	kproc->num_rmems = num_rmems;
 
 	return 0;
-
-unmap_rmem:
-	for (i--; i >= 0; i--)
-		iounmap(kproc->rmem[i].cpu_addr);
-	return ret;
-}
-
-static void k3_r5_reserved_mem_exit(struct k3_r5_rproc *kproc)
-{
-	int i;
-
-	for (i = 0; i < kproc->num_rmems; i++)
-		iounmap(kproc->rmem[i].cpu_addr);
 }
 
 /*
@@ -1286,8 +1268,8 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 
 		ret = rproc_add(rproc);
 		if (ret) {
-			dev_err(dev, "rproc_add failed, ret = %d\n", ret);
-			goto err_add;
+			dev_err_probe(dev, ret, "rproc_add failed\n");
+			goto out;
 		}
 
 		/* create only one rproc in lockstep, single-cpu or
@@ -1333,8 +1315,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 
 err_powerup:
 	rproc_del(rproc);
-err_add:
-	k3_r5_reserved_mem_exit(kproc);
 out:
 	/* undo core0 upon any failures on core1 in split-mode */
 	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1) {
@@ -1379,8 +1359,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 		mbox_free_channel(kproc->mbox);
 
 		rproc_del(rproc);
-
-		k3_r5_reserved_mem_exit(kproc);
 	}
 }
 
-- 
2.34.1

