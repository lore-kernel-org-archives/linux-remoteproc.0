Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674F259C9F;
	Thu, 17 Apr 2025 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914050; cv=none; b=k7jQlKA0DpjYO5H8Fy3pCMf1PnlfsOHOs2iuON1XCie8XdoD/oELpIcSjbRUajdUISKRT4jObsSFJmExOlcQYNfCdPrl0/tIDi/rq4fDtKu4FNoUTY/NDxovv+XSBa90HJQFBLI8/XZ/VBkIGxFS03O3XP4/ptybxhc0mtiDklk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914050; c=relaxed/simple;
	bh=eiw8Y5KNHlLMMepMCNIiXZAtTJb/XRmRIIzckyUO/3Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8sISomeDRNLr5U+yg8jlWwqkOzGRzzoIF7TzBUanEeyS0F2iexswxl5TtdK/DxkBiclJ9QAEVv4RsduObv1DFaLOzyDRISp9TEFNAq6w92y9tgTkewvO6BP2ufPqOWlad7Xh6gjr8oFCUeaYFKJ5sCkMbpGqEaX/jYeHhTSZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Jnl/9FBh; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Jnl/9FBh"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKe8S089175
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914040;
	bh=jYu7yybZsxQHOxDp+pJjGwOeX1CwFDRC72fAgK5S4rI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jnl/9FBhgpa8p3ZaflGPxwN6SVe4Ii3wm1Uu59ThsDjtNq/RACDWLt5/wlZ1fFPLu
	 +vnWsZ5g+w4MvZFnTlmgX+ZjbuWj6MmBcdiTLQlqO+u2l3TxmOkbjiAB2jFQ4iMRCb
	 hHbANMO6pGclHOFWc9ul+/GnT3F8kr8u/+pwAGy0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKd0s027713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:20:39 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:20:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:20:39 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1Hr071102;
	Thu, 17 Apr 2025 13:20:36 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 09/33] remoteproc: k3-m4: Add pointer to rproc struct within k3_m4_rproc
Date: Thu, 17 Apr 2025 23:49:37 +0530
Message-ID: <20250417182001.3903905-10-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417182001.3903905-1-b-padhi@ti.com>
References: <20250417182001.3903905-1-b-padhi@ti.com>
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
---
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

