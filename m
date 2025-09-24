Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D527F2BD001;
	Wed, 24 Sep 2025 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758703482; cv=none; b=V2CVKE2WwzCsnAJ7JYAPUJtcMRYP8TroUDm+WujmnJX//n4aSYqzLGw/36K2Lzdsrv0jevq0x4e/fyPWLKyMQHkyaBbxT4ih92lpXPk6/ZZEJya895bgmV5uFhPZFP1HIwf1uVDamIsfANkma0BlpGuY3DP/31C7O3NPZfhkFk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758703482; c=relaxed/simple;
	bh=UvFkCQngJmYfxI0ZR3dt0Uav+D/+miNzII7Ubdj2r0g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X3/xGyllpa1dcGoXVuTbkwoPnEOW4b/N98n1ey73guvbLXr9P7ilFg79fUpcL7HogGhliBESEqY5V7xmKIX9NmicKEYNoGO/O/5y8ajRI+vMWO9DbTb2ZYrm2glkzu3v5PT4x8BNWQZzgx3mZhXDq4WnH5tafWZ4Gv7EGpCuPM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=T3AVlxLg; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="T3AVlxLg"
X-UUID: adc0fa48992211f0b33aeb1e7f16c2b6-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XoSu2fJTIg2tOBaQI/yiLzTwJrsr6QRQNWtcsqnm/A0=;
	b=T3AVlxLgbsru6Rzcl6G3xogDcoX9vdzG9gToFSCa9Y5YZI1YbS88dO6albYlLKpXL/WtZ1GNatFms322t7m1I024oFx0hPyGwsrUSoqNDS0JkiTXcLvCL48E5xsTywiY3USL0omOoz6ZPXt+Si+h7MJFIezn4D1HO0NMrvf81d0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:dbe5c7d8-a9e6-4519-9f0b-204e5c2314c7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:de99e46c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: adc0fa48992211f0b33aeb1e7f16c2b6-20250924
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1989981914; Wed, 24 Sep 2025 16:44:27 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 24 Sep 2025 16:44:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 24 Sep 2025 16:44:24 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: Add binding for mt8189 scp
Date: Wed, 24 Sep 2025 16:44:17 +0800
Message-ID: <20250924084422.4604-2-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250924084422.4604-1-huayu.zong@mediatek.com>
References: <20250924084422.4604-1-huayu.zong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the compatible for mt8189 SCP to the binding.

Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 179c98b33b4d..407be544b404 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -20,6 +20,7 @@ properties:
       - mediatek,mt8186-scp
       - mediatek,mt8188-scp
       - mediatek,mt8188-scp-dual
+      - mediatek,mt8189-scp
       - mediatek,mt8192-scp
       - mediatek,mt8195-scp
       - mediatek,mt8195-scp-dual
@@ -168,6 +169,7 @@ allOf:
             - mediatek,mt8183-scp
             - mediatek,mt8186-scp
             - mediatek,mt8188-scp
+            - mediatek,mt8189-scp
     then:
       properties:
         reg:
-- 
2.45.2

