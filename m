Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E952459D7;
	Fri, 25 Apr 2025 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577743; cv=none; b=LUrsnYpRoX66PXoM30iWpKWCWV5t4zqyAOIEEI6wGZ1rfJT2B9T7OguVGcs5WG4n7nH0J73Cn3ZgCBsZYFeueSYO9NFKEzp48NXLvzqsGRCtV6bKaILyiFmjBcfhsuyWPXYSMkM4tlEVaSWZ7NfZOArdx2gngmxnQFWDNWAwDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577743; c=relaxed/simple;
	bh=/eWdFo7cdA129S9Auj5YU1U5n+C6m1swp8K67yJpoug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Be4VJvf1MhEHdU0bkrC90PZEqAiWomy6zY7RA856mTeOPZ1ACUz27nM0Me1HDQTVQMwtLpDWfQ2b8hM4WarrVFHJm4iNLzXZ3ZCVYG6hIwOkxR9WE96uEz86OxdFQsEQu0rvnfU4BBuP0IDn9ERbVN8ErTe4geawRDITmGNnPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XkZQuf93; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XkZQuf93"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgELU2123075
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577734;
	bh=ZiVl8TYIK39g5zRMl6qNuLeQ8+AlLlFWdSDbM+hAv6I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XkZQuf93wOtdOfVQK0IU259QmWCNOWiSJVK+Z3WPo1HLsqk30BIceDdzQOdHrxlOT
	 WEvop5CPg0ivZ83astcoO43Cew5Dhu/Ha19x4MMkKVUEW7169QNK/Uf69Wm7xYrdEZ
	 ZBhHZwMgHovrpab9WViC5pYTwXYHyTVShd6D4Iao=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgEDY087341
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:14 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:14 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZU038329;
	Fri, 25 Apr 2025 05:42:10 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 09/35] remoteproc: k3-m4: Add pointer to rproc struct within k3_m4_rproc
Date: Fri, 25 Apr 2025 16:11:09 +0530
Message-ID: <20250425104135.830255-10-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
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
---
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
index 24c90db58ee3d..d0ee7a8d460d4 100644
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

