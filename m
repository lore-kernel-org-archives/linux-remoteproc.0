Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFAF16F8F5;
	Wed,  3 Jul 2024 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720007606; cv=none; b=oicZClG6WggIbl4P83q92czPnkOD5whkqCnCnDvR4lXz+2vaolMUFpY8dujNeSUqJcOmOMxqpyRLJWWJ/BeiCjJV4pCw2V1qpYY8JtMdIqC+JTLVZ+QgS8ALypZb+wECGmGUcE61XLt9KjQ1HJdsSePQdeA4qbPvkYS6BIFrtyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720007606; c=relaxed/simple;
	bh=/m1aybwXVDqT4wfLqQkBnjr1+YSMqNOJ/CoRq2aM3go=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvWzlvmFrE2D86CpsUVQxt+Tey/FKe8xl0IpPbO4lBBHCxTFa+Xs3mht1JCKclDxKWoKfivBYPC+aBe7nrjnOOh1o7PmQ1x7KLsRn9d5dcfMMsMf0nbdI14bbENzUOMzXXBfSPUZAchiZEBatSc23lwPAWXjODEZQ1xChVFfOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NKaGM0vz; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NKaGM0vz"
X-UUID: d551591e393211ef99dc3f8fac2c3230-20240703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=75FkGdUKgt+Z9hXJnJSQngHwHaha+5GUkIFIvukvpH4=;
	b=NKaGM0vzZOZyrtlEqFXiDOsmDOeKz0DSeoyHprO9wvNf7oiKmYwsWEwgUh4rFiIdjGwBY2nLltQfXuQqFMrAPTm1DcjbgBfT8XpGHI0Xi4IdSSi78jrV2CHCJJvWXBux11Hkb6xJ4g0B3L4bamYW0NaVONsXTbIx9xqpZlSDPwQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:cede9587-a949-4299-b78e-5d9afc42bf30,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:e48ae8d4-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d551591e393211ef99dc3f8fac2c3230-20240703
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1428062565; Wed, 03 Jul 2024 19:53:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Jul 2024 19:53:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Jul 2024 19:53:13 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>, shun-yi.wang
	<shun-yi.wang@mediatek.com>
Subject: [PATCH 1/1] remoteproc: mediatek: Support multiple reserved memory regions
Date: Wed, 3 Jul 2024 19:53:08 +0800
Message-ID: <20240703115308.17436-2-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
References: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.883000-8.000000
X-TMASE-MatchedRID: Ei0WBMmFdJjleW6zTRN7wAPZZctd3P4B6tEkNTIMeQjEosIs7IJbkCpJ
	3T68EJKPg/N7mdNXD1c8RLY2vU8PD4/opKiQWjqUdXu122+iJtp6zDxGcFEbChL6MU7t349bxsr
	6m7RljBHftLFtxOSbQ4Ay6p60ZV62fJ5/bZ6npdjKayT/BQTiGlIc3O7Mj/yCMO7Fp3VK5MEhmu
	FTYDf84D50unEEcwa99dfwm9WweGYZ3afb2GJc48A9F3ly54VehHNYhwwtQTza6j4tja6OgKCjN
	WMcfCKKdATQdtPksR+3/JiWOe6GXXSWgQ2GpXdZhztLVWA1eE9DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.883000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	E45F84B53C2F9FE0E27731A6831DB9EC31E41B727B72E08D8A7DF8CAA7380CC92000:8
X-MTK: N

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

SCP supports multiple reserved memory regions, intended for
specific hardwards.

Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9ecd5ea04b5f3..1902826cea0af 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1006,22 +1006,31 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
 
 static int scp_map_memory_region(struct mtk_scp *scp)
 {
-	int ret;
+	int ret, i, err;
 	const struct mtk_scp_sizes_data *scp_sizes;
+	struct device_node *node = scp->dev->of_node;
+	struct of_phandle_iterator it;
+
+	i = 0;
+	of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
+		ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
+
+		if (ret) {
+			dev_err(scp->dev, "failed to assign memory-region: %s\n",
+				it.node->name);
+			of_node_put(it.node);
+			return -ENOMEM;
+		}
 
-	ret = of_reserved_mem_device_init(scp->dev);
+		i++;
+	}
 
 	/* reserved memory is optional. */
-	if (ret == -ENODEV) {
+	if (!i) {
 		dev_info(scp->dev, "skipping reserved memory initialization.");
 		return 0;
 	}
 
-	if (ret) {
-		dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
-		return -ENOMEM;
-	}
-
 	/* Reserved SCP code size */
 	scp_sizes = scp->data->scp_sizes;
 	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp_sizes->max_dram_size,
-- 
2.18.0

