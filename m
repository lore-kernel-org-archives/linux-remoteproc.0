Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81740187FE7;
	Thu,  8 Aug 2024 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723102899; cv=none; b=LyrpVm7y4CKTmDj38hr5z8RP1AgVAIMBhiDEhG0ZtzXvNIcNLU5ng6S65D7KkDhOApoCig18hJXALYwAy/SDjEjGMAQzMjNtVtCaGd6U9FWlw8gaqmuQsi74HRjn/dmRJHTOCuGNXOD1iR519+Wl2EVd2FCFvUnRtR2+lkhV0O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723102899; c=relaxed/simple;
	bh=cNoubhjPRgMTIBYnIMv6xdWQlzX3Fpdq/o53GhtBOHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pfvXz3CUYmC8Fk8gTVAOkUa+NMDuull0HbtwkupENcP5dQYGTxBZeh2jUwNveQJGIatf9isu3PtoiALSCG5b30ZOCJrWzbM8fRMSUePg4k1+7qmPDauOQpDHu3rgJmaarIG8dUBsaDWcLpmMBLKq3kRZ/lQIY03CQ8E5wYnBnjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kVOgifwS; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kVOgifwS"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4787fXt3049389;
	Thu, 8 Aug 2024 02:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723102893;
	bh=XHLtzWz1tIg0xr/lKTb9xpsk1bQHGKUTNtJjAcQoSdQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kVOgifwSSWpogAb4vRB2yzHhlnzohUNcQ26IHp/Cexg5nBlsXaxX6Inq8FJKplBXp
	 Qb5QSyiU0jSAKQMxHSeXPxW9iLXTMUL2vMECTPtcqiyvfK2m56b8HFK0DVVSYPF/L/
	 6mLjB1aY2rvbx5p4BwvY817ZIxiDkf/IgbGJgrHY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4787fXJ1071138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 02:41:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 02:41:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 02:41:33 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4787fRZO020900;
	Thu, 8 Aug 2024 02:41:31 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/3] remoteproc: k3-r5: Use devm_rproc_alloc() helper
Date: Thu, 8 Aug 2024 13:11:25 +0530
Message-ID: <20240808074127.2688131-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808074127.2688131-1-b-padhi@ti.com>
References: <20240808074127.2688131-1-b-padhi@ti.com>
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
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 39a47540c590..57067308b3c0 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1259,8 +1259,8 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		rproc = rproc_alloc(cdev, dev_name(cdev), &k3_r5_rproc_ops,
-				    fw_name, sizeof(*kproc));
+		rproc = devm_rproc_alloc(cdev, dev_name(cdev), &k3_r5_rproc_ops,
+					 fw_name, sizeof(*kproc));
 		if (!rproc) {
 			ret = -ENOMEM;
 			goto out;
@@ -1280,7 +1280,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 
 		ret = k3_r5_rproc_configure_mode(kproc);
 		if (ret < 0)
-			goto err_config;
+			goto out;
 		if (ret)
 			goto init_rmem;
 
@@ -1288,7 +1288,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		if (ret) {
 			dev_err(dev, "initial configure failed, ret = %d\n",
 				ret);
-			goto err_config;
+			goto out;
 		}
 
 init_rmem:
@@ -1298,7 +1298,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		if (ret) {
 			dev_err(dev, "reserved memory init failed, ret = %d\n",
 				ret);
-			goto err_config;
+			goto out;
 		}
 
 		ret = rproc_add(rproc);
@@ -1351,9 +1351,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 	rproc_del(rproc);
 err_add:
 	k3_r5_reserved_mem_exit(kproc);
-err_config:
-	rproc_free(rproc);
-	core->rproc = NULL;
 out:
 	/* undo core0 upon any failures on core1 in split-mode */
 	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1) {
@@ -1398,9 +1395,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 		rproc_del(rproc);
 
 		k3_r5_reserved_mem_exit(kproc);
-
-		rproc_free(rproc);
-		core->rproc = NULL;
 	}
 }
 
-- 
2.34.1

