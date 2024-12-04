Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B8F1F6680;
	Wed,  4 Dec 2024 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310715; cv=none; b=XlCrND9qPRAW39NrSyVkErNGaPyL6DFuVax6TknlwTmKEA3pjaxItqvxLycf3Z/J3ATnX+GN1uHktnoug3JuqFVYsQaeZzMGzGZ/zNgmpRHxUGkHQGx1DWmmW4KX6aIrQtjej6FM48trYL9BjmshLjyd0y2FzVjrO8/WUhR9QLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310715; c=relaxed/simple;
	bh=FsUQzpLlESBToq4cj3LdWkpnyMvxTeQO7TkZ2B6Kzt8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S86uU2MOD7eJ1/ehghe1hE4Jd+qBdt33sSEyX5pR4t9Mi0Uo5ON3FjK8zWG/eKCL6HCsyiT67VpmwWTNGeLBuIE1smo+HJG6bs6+agR2QPo+n8LNxtyHrkVQTcswBFZL7jdWd5X71MkkeBqcPqyciwTDkjEme4vDctv3YlB6cng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bj2C1lz/; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bj2C1lz/"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4BBlMh1593540
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Dec 2024 05:11:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733310707;
	bh=yxTK74BG9onPeTZN2lVJE4j1Ooe6Fla/IoZvSgHbKgM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bj2C1lz/Et9x6RyMvXre/4LF7FZA7zGEzMDN7E+kBgcqu7ArzkduuGHkL5TpH+HcW
	 YUrxodhkojQIztAGG2Bc7v5hoz4FS3gkJHeWpCr4R2OaX5EFFSLO/jgq5EOwg2zNuH
	 TwKyG0ze7qivQfoG0i+v7vgjJXqxgq53nuQJVoCI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4BBl1Y018456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2024 05:11:47 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 05:11:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 05:11:46 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBVUO083186;
	Wed, 4 Dec 2024 05:11:44 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] remoteproc: k3-r5: Use devm_ioremap_wc() helper
Date: Wed, 4 Dec 2024 16:41:29 +0530
Message-ID: <20241204111130.2218497-5-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204111130.2218497-1-b-padhi@ti.com>
References: <20241204111130.2218497-1-b-padhi@ti.com>
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
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 40 +++++-------------------
 1 file changed, 8 insertions(+), 32 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 2966cb210403..1a7681502f62 100644
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
@@ -1285,10 +1267,8 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		}
 
 		ret = rproc_add(rproc);
-		if (ret) {
-			dev_err(dev, "rproc_add failed, ret = %d\n", ret);
-			goto err_add;
-		}
+		if (ret)
+			dev_err_probe(dev, ret, "rproc_add failed\n");
 
 		/* create only one rproc in lockstep, single-cpu or
 		 * single core mode
@@ -1333,8 +1313,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 
 err_powerup:
 	rproc_del(rproc);
-err_add:
-	k3_r5_reserved_mem_exit(kproc);
 out:
 	/* undo core0 upon any failures on core1 in split-mode */
 	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1) {
@@ -1379,8 +1357,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 		mbox_free_channel(kproc->mbox);
 
 		rproc_del(rproc);
-
-		k3_r5_reserved_mem_exit(kproc);
 	}
 }
 
-- 
2.34.1

