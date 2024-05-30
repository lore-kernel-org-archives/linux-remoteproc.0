Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF96F142E6C;
	Thu, 30 May 2024 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060081; cv=none; b=C3MxVYQfMNE0lFoYtAXKermCzmz7bpKOXrZL2rAjrrpw63GJjdyVzWdSPmsz1xEZy7NucRmcANZbO4ShXLcNId7dzLW4/1qfj5+dzk2aB3nDLZSQlVRDfySIaWLgVukwAn0nhkZ5FxQLkfdt402qE1S6K8MPImSxVUcez6O/1lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060081; c=relaxed/simple;
	bh=H+qCObtCZgHNJ48o6q7pLeyIu/O7/+J50S4buns9VCA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAlFbIFXMaexuvUi1GoZx0GPKWwuu00SYd7CTvXGO+kiUUUhNZia1bUCvJ4QSu54fRF/d1k+Jgzw8VJ0zCC2mNJJQsrCOErLXms2RvKAPJmbexqEiuQoI4IYGcUJrDZKFvCmpqJanWeGOiSCFearj37WqmQ9urOH5gZsegZHKKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ahN26wT4; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ahN26wT4"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44U97i4q097026;
	Thu, 30 May 2024 04:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717060064;
	bh=gmp8rs8G5Za6Ekd4eJjX5uWVgL9bWVS6AH0AYLHSkgM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ahN26wT4nFzfFxshD4LP11QP01ZGpMYd4K6IAyyxtvzArTDhMPxrYKoPxGWj/O0mm
	 67qKEGmCJ7ojvFBp8TIKGBvtNSN7AffyS/42rxINDUXy6EJgMqV9mWsvs1DdOt1R/n
	 EOKi0UxOyNzwEAfpadwEQRlNdo4YC/EYlggs+Il0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44U97iwN000826
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 May 2024 04:07:44 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 04:07:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 04:07:43 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44U97cln043154;
	Thu, 30 May 2024 04:07:41 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] remoteproc: k3-r5: Use devm_rproc_alloc() helper
Date: Thu, 30 May 2024 14:37:35 +0530
Message-ID: <20240530090737.655054-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530090737.655054-1-b-padhi@ti.com>
References: <20240530090737.655054-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Use the device lifecycle managed allocation function. This helps prevent
mistakes like freeing out of order in cleanup functions and forgetting
to free on error paths.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 50e486bcfa10..26362a509ae3 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1258,8 +1258,8 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		rproc = rproc_alloc(cdev, dev_name(cdev), &k3_r5_rproc_ops,
-				    fw_name, sizeof(*kproc));
+		rproc = devm_rproc_alloc(cdev, dev_name(cdev), &k3_r5_rproc_ops,
+					 fw_name, sizeof(*kproc));
 		if (!rproc) {
 			ret = -ENOMEM;
 			goto out;
@@ -1351,7 +1351,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 err_add:
 	k3_r5_reserved_mem_exit(kproc);
 err_config:
-	rproc_free(rproc);
 	core->rproc = NULL;
 out:
 	/* undo core0 upon any failures on core1 in split-mode */
@@ -1398,7 +1397,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 
 		k3_r5_reserved_mem_exit(kproc);
 
-		rproc_free(rproc);
 		core->rproc = NULL;
 	}
 }
-- 
2.34.1

