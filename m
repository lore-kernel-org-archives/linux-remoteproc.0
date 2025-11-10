Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165932F360C;
	Mon, 10 Nov 2025 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769640; cv=none; b=HZy0DPeG8eZiUdKKShKG/pQsDWC34waBykS1DM5ZfHUJlZ9WNXdPl0fy0co5FQT1+NosScAJcZrwce6XkkQ4dYt26mpyJbY/1XbwVCoQKvZhJx5YNkV6h/ayGmzrXZDutwP+Qnb5T+BNb7XWgdmwwPR6GFo7y2okZIzQR7mU4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769640; c=relaxed/simple;
	bh=iKOlI+mRSHTLTCemZu0LAJzfXTY7+2dV1qnBNuHlQrg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQFTiGBpk70OCuQy+tswf1tZoK4FfHTSq7LgIDSdBqj3fzMj8iocwFU3/rlsJmTXM/+mkyhoMLLsacSLPZWNrcqYnCiaXzpZdKy9hNs2yKc+PyClEzJVq9h1zv/69kAR4OQNbSSb/bGa8yc4sXqr0zib2nGdcfK91IKBt0nlcYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iWCXagEd; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iWCXagEd"
X-UUID: f3fee7b6be1d11f0b33aeb1e7f16c2b6-20251110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ru+KiglAiw/O5uCz0AVIdoM4zOCp0MNtiP3BB2SfZEo=;
	b=iWCXagEdXFGNw+CmoiMY+/U5/zUzl67gQKOS9WdkQgJjoMKMPOhaLOAO5gHTD415dxGxIWL8qpIwVQDE+Q3Zt/BkKB8r5ekONLYEt/IzF24xQjYOXv+J+GSTprikG9xxgdbxmf51llOkg9YhVPlZ5zg/fZl12r18ah1aVNUiTys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:8e8e043c-0ffc-4d06-a568-824ed8354e70,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:841fef63-6377-47fe-8022-3226f0b92c45,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f3fee7b6be1d11f0b33aeb1e7f16c2b6-20251110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1172380245; Mon, 10 Nov 2025 18:13:50 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 10 Nov 2025 18:13:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 10 Nov 2025 18:13:48 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH v3 3/3] dt-bindings: remoteproc: mediatek: Add MT8189 SCP binding
Date: Mon, 10 Nov 2025 18:13:31 +0800
Message-ID: <20251110101342.24261-4-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251110101342.24261-1-huayu.zong@mediatek.com>
References: <20251110101342.24261-1-huayu.zong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add a new compatible string for MT8189 SCP.
While MT8189 SCP is partially compatible with MT8192, the register layout
has some differences, so a separate binding is required.

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

