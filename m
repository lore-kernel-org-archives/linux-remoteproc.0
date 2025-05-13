Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BED1EE7BD;
	Tue, 13 May 2025 05:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115166; cv=none; b=TAnCgzi9uzYvsRrxvifaUZDnBhJQDjCz5Rtbb0YUdohkvP1TQ4Fmo2E3U8DnjjR+86TZrPMD0qzPvC5+Qf0aH6FnpN+tepGifeoaXjqh4Dc9k0A6mg+L3a4O1Ny04E3rS49ZlBr6gHve6MNNHMmlX6ICxl70bFIPCf0k0g/TiDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115166; c=relaxed/simple;
	bh=iDpS7TwY+6rTwfXKEAdrlmRiq01OrY9PlJd8GUULm2I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HFCkaYUZ/jj2WH4YUq6l3MTtxLiotFPrtWeBbDoBblUXUCt6nrQmKur8OVtMvZPN9UrNPcEhEQqdeBCjtsEChRQgRdDSj1UXVTMjJCknY5+k30AI7AF1kb5zNPNI07g6yPWH3unqzmwOstM/Ivu92X+i4dEP8pEbLp2o48gpyfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G2CeA6j0; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G2CeA6j0"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jve52210791;
	Tue, 13 May 2025 00:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115157;
	bh=5abvST1uqeTTBWKRrEbNjkcmRuKmZQZsIAyCx0+vq4U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=G2CeA6j0tFUAWlYdNCQSJOGMaizMz7h+qXoIu2oCF69gd8mpGjsVcV9XpSOUuqr6d
	 Mj7w8GzZLpw97nTrfQyhb/raiuqLzubW+RgpMtO6NSAJl6PfukFzXsiixoO4rOOgmd
	 T5LJOThKMJ5GZ9vLEPekixRZmPTtRKpUNyZL8qEc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54D5jvvC651776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 00:45:57 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:45:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:45:56 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqJ131001;
	Tue, 13 May 2025 00:45:53 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 10/36] remoteproc: k3-m4: Add pointer to rproc struct within k3_m4_rproc
Date: Tue, 13 May 2025 11:14:44 +0530
Message-ID: <20250513054510.3439842-11-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add a pointer to the rproc struct within k3_m4_rproc internal struct.
This is done to align the M4 internal rproc data structure with R5
driver which can be factored out at a later stage.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-10-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-10-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 04/26] into [v10 08/33] and [v10 09/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-5-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index b161770dcb26f..99746618e1b96 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -50,6 +50,7 @@ struct k3_m4_rproc_mem_data {
 /**
  * struct k3_m4_rproc - k3 remote processor driver structure
  * @dev: cached device pointer
+ * @rproc: remoteproc device handle
  * @mem: internal memory regions data
  * @num_mems: number of internal memory regions
  * @rmem: reserved memory regions data
@@ -64,6 +65,7 @@ struct k3_m4_rproc_mem_data {
  */
 struct k3_m4_rproc {
 	struct device *dev;
+	struct rproc *rproc;
 	struct k3_m4_rproc_mem *mem;
 	int num_mems;
 	struct k3_m4_rproc_mem *rmem;
@@ -580,6 +582,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	rproc->recovery_disabled = true;
 	kproc = rproc->priv;
 	kproc->dev = dev;
+	kproc->rproc = rproc;
 	platform_set_drvdata(pdev, rproc);
 
 	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
-- 
2.34.1

