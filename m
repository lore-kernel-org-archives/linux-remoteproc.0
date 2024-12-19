Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848C1223E8A;
	Thu, 19 Dec 2024 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606376; cv=none; b=PdxqsPrd0Y1vPdZQusrxfQ16Z4ZPELFGzBg4Rxb8NAJxr11N+Y6YEcZVHpov4my5ZYD+7ncCPq6iSTzmihKg9KzpxjTKtlzzcnHjc/1FS2VcVr6uRKp6Lva0tKYve0QfmKq53wPluF+Mbt8EtBGGKkEmjP1Zui+qwCv2orr/9NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606376; c=relaxed/simple;
	bh=H95tboGiQL11F+OfimQkLbVh1I1vfD8vSX/gwNWRBm8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nZ/NVfKE9JEEbUqKloUgGnakGjKiiGoHpDqYSTQ+7MWVDVcuI0Qhohdkl36XcNY/VorSbkJDlzqhEXKlPLQDGbi7c4aD9ETA6dkHsSF19d0ME1MV4tY7aWmpwzjah/XqFkVZ+ZzAuQ4wNABQJDO+zvdHX0qCyZE09qi2FdBdFu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LYn8ZU5f; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LYn8ZU5f"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BJB63eH083445;
	Thu, 19 Dec 2024 05:06:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734606363;
	bh=zII1hSzLLomGKsUI62WG7bz88DmqqPsln6EKNpGgUdc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LYn8ZU5fkmTSTpCWt3fVGR1wiES4xRgE7wds1TjUDKtERH2twrkefHUVmTpRWoaYj
	 MzZFoVyggVABfSEULKZx4ejVJUVqolb02c0SL6w7Nr4HhayyLAYChnJgHq/XxQHFuO
	 Tf519eKQCp6lYyYnKp872eXAxJg5Qz3LMLeoBW2A=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB63eb013172
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 05:06:03 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 05:06:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 05:06:03 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJB5jYC088123;
	Thu, 19 Dec 2024 05:06:00 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/5] remoteproc: k3-r5: Use devm_rproc_add() helper
Date: Thu, 19 Dec 2024 16:35:44 +0530
Message-ID: <20241219110545.1898883-5-b-padhi@ti.com>
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

Use device lifecycle managed devm_rproc_add() helper function. This
helps prevent mistakes like deleting out of order in cleanup functions
and forgetting to delete on all error paths.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Re-ordered [PATCH 5/5] from v1 to [PATCH v2 4/5] in v2. [Andrew]
2. Removed redundant rproc_del() call in k3_r5_cluster_rproc_init() as
devm_rproc_add is used.

Link to v1:
https://lore.kernel.org/all/20241204111130.2218497-6-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 3493bae95fdf..30b72bcb4d68 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1266,7 +1266,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		ret = rproc_add(rproc);
+		ret = devm_rproc_add(dev, rproc);
 		if (ret) {
 			dev_err_probe(dev, ret, "rproc_add failed\n");
 			goto out;
@@ -1297,7 +1297,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			dev_err(dev,
 				"Timed out waiting for %s core to power up!\n",
 				rproc->name);
-			goto err_powerup;
+			goto out;
 		}
 	}
 
@@ -1313,8 +1313,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		}
 	}
 
-err_powerup:
-	rproc_del(rproc);
 out:
 	/* undo core0 upon any failures on core1 in split-mode */
 	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1) {
@@ -1357,8 +1355,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 		}
 
 		mbox_free_channel(kproc->mbox);
-
-		rproc_del(rproc);
 	}
 }
 
-- 
2.34.1

