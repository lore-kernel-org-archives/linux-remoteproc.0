Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021611AED45;
	Wed, 31 Jul 2024 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722428288; cv=none; b=IzsVuimsjUDsDpgPY1+6sxYFkf5e3ndsT/szWOWm5WmUljZ1DL4ItG85M4wCzg9tivXdfdlo8Nfx4MQCfb0FMPyi/Xrq/VzFr2Ki446MuiItInNKQNEEXa44kYAmkcy1NSI5q1c5i9vj51S/SIBVjn1ZCu4RSkZcBrOd5wsk/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722428288; c=relaxed/simple;
	bh=c+YQeR/Hh+Vizf4MxOFMLX6OLSbxFhQyKLi84YZQoOA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9hM3SBoh3zevjGOCUxPokNq0BderoMnxW+sOBxQD02uXIMNoKaWaBnq3OZCD9MrAQt+ebdsB1eVopikoXX5FLBPfM8zY2eMRFcfLprqxpuyHgbCcUsTVERiGHi2gGrMkbFbYGHog9UuanpF+4rN3lNrW6+ATcYKfRD2H0ekPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=erMtruKD; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="erMtruKD"
X-UUID: e8d536764f3611ef87684b57767b52b1-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ua2gX7Bz6Q1u0d1UN8se5+xwDhkqKZ4z9Veh2f7/sCs=;
	b=erMtruKDvKf8pz5ZdNRY91Stz/fXBMvca4CqyNqDnws17WlOJ/g3j9QyQd+GyUkUryWB59JRq/jAdIL3icp4TBtViKhZWA/3hiHfC7JW49PiqGRb1HrBjpBs0vYCxr5SmCOiafRXFn/sduwqOaGLS6PJxBEyOjLZ/JyVbc2lKSU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b26300f4-9846-4cbe-b2d3-e35ae10ec286,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:e62ffcd5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e8d536764f3611ef87684b57767b52b1-20240731
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1727608357; Wed, 31 Jul 2024 20:17:52 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 05:17:54 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 20:17:54 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Conor Dooley
	<conor+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, shun-yi.wang <shun-yi.wang@mediatek.com>
Subject: [PATCH v2 2/2] remoteproc: mediatek: Support multiple reserved memory regions
Date: Wed, 31 Jul 2024 20:17:30 +0800
Message-ID: <20240731121730.1196-3-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
References: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

SCP supports multiple reserved memory regions, intended for
specific hardwards.

Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 857a61760b27..0e799d0bf73d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1006,20 +1006,29 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
 
 static int scp_map_memory_region(struct mtk_scp *scp)
 {
-	int ret;
 	const struct mtk_scp_sizes_data *scp_sizes;
+	struct device_node *node = scp->dev->of_node;
+	struct of_phandle_iterator it;
+	int ret, err;
+	int i = 0;
 
-	ret = of_reserved_mem_device_init(scp->dev);
+	of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
+		ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
 
-	/* reserved memory is optional. */
-	if (ret == -ENODEV) {
-		dev_info(scp->dev, "skipping reserved memory initialization.");
-		return 0;
+		if (ret) {
+			dev_err(scp->dev, "failed to assign memory-region: %s\n",
+				it.node->name);
+			of_node_put(it.node);
+			return -ENOMEM;
+		}
+
+		i++;
 	}
 
-	if (ret) {
-		dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
-		return -ENOMEM;
+	/* reserved memory is optional. */
+	if (i == 0) {
+		dev_dbg(scp->dev, "skipping reserved memory initialization.");
+		return 0;
 	}
 
 	/* Reserved SCP code size */
-- 
2.18.0

