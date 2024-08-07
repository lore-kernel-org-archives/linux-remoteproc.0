Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414A1B32C2;
	Wed,  7 Aug 2024 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723011789; cv=none; b=qAzJdplnqZaOfyRmiosygP26nvMyCvplDwzJWqv7gXPy6m+GrJ7lMcB0Zra91zdV2rOy0idaZH4NvS68KVCvK8nNiQbiivkayQhojsT2Bh8MsLl9Rgu5MgCXTnwEkb5SE+d9IPUU1NXNyGJCAdZkmKLVOMeGv9luN4skGCt0BMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723011789; c=relaxed/simple;
	bh=XX5lk/EGD1JDuHuaaqCecl9EwNGgc0Sm/gXayLwffhc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HcHQ5n+01ciGZBQ7muWL6ats/NOhLcCcmXpP03zPuVzILFOh6NnQvBpVd2OgjsilqQRwh13KyQ/qDdVPq2ZEa+lekzwNVx+n+QhLLc43aqw5JBsZd1k9WrYN0Kz7m9HFPTLKDNHqsJK/gZrbw0Y22ZBwZNcgrUN9V7E6LcYtJP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MWBiSzYN; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MWBiSzYN"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4776N3gJ012217;
	Wed, 7 Aug 2024 01:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723011783;
	bh=2wnaAUvdmWFnYbpnk3YmZfgyoVHWrC7hRzfJNvl3PvE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MWBiSzYNqNqwrdLvND6mT1fzp5KpgAKvQWCDbjbOWIdtmbbJM8QPLnUaED9Qg08ej
	 nT7FSDIoYmNrekmsW8mZFpFSG6HMyA7i/PdwaZfOx0xe5g6Kwyszh2hu9+Ic3VGPTA
	 MJnJN/8cCZ5vwb8pqEYoh7PMODXfYSRD7+IkYsQI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4776N3c9024986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2024 01:23:03 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 01:23:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 01:23:02 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4776MvbQ109450;
	Wed, 7 Aug 2024 01:23:00 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] remoteproc: k3-r5: Use devm_rproc_alloc() helper
Date: Wed, 7 Aug 2024 11:52:54 +0530
Message-ID: <20240807062256.1721682-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807062256.1721682-1-b-padhi@ti.com>
References: <20240807062256.1721682-1-b-padhi@ti.com>
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
index 39a47540c590..dbcd8840ae8d 100644
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
@@ -1352,7 +1352,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 err_add:
 	k3_r5_reserved_mem_exit(kproc);
 err_config:
-	rproc_free(rproc);
 	core->rproc = NULL;
 out:
 	/* undo core0 upon any failures on core1 in split-mode */
@@ -1399,7 +1398,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 
 		k3_r5_reserved_mem_exit(kproc);
 
-		rproc_free(rproc);
 		core->rproc = NULL;
 	}
 }
-- 
2.34.1

