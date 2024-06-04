Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DB37C6D5;
	Tue,  4 Jun 2024 05:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478254; cv=none; b=KyqhQGlrnMLrEbIvGAKzSARGTxDhgszwWCBObPO+CLn5c82mHukN0JWQEBp3aiRu0/Z7Ifv0zOkwK6CIGfUFJbmmQtpgCsiPMHCSHy0KIyFxa/am3QV5L4YWBZTwDEa7l95Bb++vOiiUSYS2H9uwDeSc9Sczx442eHT9hoemxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478254; c=relaxed/simple;
	bh=tMZU77ZpEJIXR41I2pln5JIOX/gnB5gXPAarg47/1LU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dCPq4lQtibgvTmJsPw5gL/oXZlAlH/YdI5WV3zo+37nMNYzyUcHSIxj0bJnQBOOoe+a8no8L0M+vhHq2AXJgHohc/5r24IPhWkx79aGEbdsIf0NsF0TctwllvHX+Kj+iXrjFnbqyOF9Q83zWCHL3K0uazexTQZCgyl5Y7WN5DSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aRw5Lweo; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aRw5Lweo"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4545HSKQ004324;
	Tue, 4 Jun 2024 00:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717478248;
	bh=vgrQhwQ+LZZ7+U766LpZ5SROVnCeOnpXR/Ie63+uDow=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aRw5LweoH+I5Y3w3kQXVsEPgt5wvwhaPPxXnBYpK/39LQ+2aqNrX9HdzrVwgaV8Po
	 Gg+1hss64jJGFBXM2kM3V3oeMieFdlHGIm0E6wNn+QEUpWmOrk/5HiFLmWGRdO4CPK
	 BkFTOJiHXoeyo2wyYXPFD8xAeKWYKWUT7a/4liwY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4545HSl1031490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 00:17:28 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 00:17:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 00:17:28 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4545HNG5067975;
	Tue, 4 Jun 2024 00:17:26 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] remoteproc: k3-r5: Use devm_rproc_alloc() helper
Date: Tue, 4 Jun 2024 10:47:20 +0530
Message-ID: <20240604051722.3608750-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604051722.3608750-1-b-padhi@ti.com>
References: <20240604051722.3608750-1-b-padhi@ti.com>
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
index 50e486bcfa103..26362a509ae3c 100644
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

