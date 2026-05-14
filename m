Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E44311C2C;
	Thu, 14 May 2026 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760051; cv=none; b=bkmvKdt03nY98ExUear+yjvkjVqx6wXCavZlWxKEcgG0VRra4unsO8oJr2JfvJZiITavbKA/ePWnTub3T8UQaiZNd/iNLUfTSv6YK4wuSZCX5nq8ik7kWMcvzDpo6ad266lj6f1ws7qAGI2B9cy/n647OJeX0/H110kfRDp45nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760051; c=relaxed/simple;
	bh=OqYtpY19HUAOPOGT7U/3n9WrYpKgtCcRI//llJAH2M0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mfWkCRrM1izAGY98VjbCvwqzeM7XfXmiq7x3yK0DcBuzJ6GZXMB4joPwRqQqeMZYGhhLWHFQTE9CO90eBbrHfVNg6GEJTXEhL+DLf5+mFHKpqzyRwZszl+YEawvsWvFBQAO8JS9GOqhea2VoV1+U7t4X3k5s1WUstRKZROc7Cso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YwuNilMc; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YwuNilMc"
X-UUID: 6cbd2e764f8a11f1b5a00d44d12bea5a-20260514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MuqNLnHQ7AjY34gb9tcmUNHMK6k8UlScLgrQcuj0G9I=;
	b=YwuNilMcvqbwn3NM8KYsuArtMfCGidrF44Vz1rotVL+drQrTJ57Ppkx/+ke64IUkqshilkIN6G0IRsag5X/4/W0Jl5u+xnwEPeyLzkXRqYohB+4Tr9n2xOYaSgdQDY2r/2LvsM5Gluc5eaSle+Omf7tkRGNN31nfjnMNyPKRX1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:ab3428cb-2db9-4ac0-a59c-9b6a97b30ec6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:9fbee840-4f1a-4cd1-8315-22e1f88ac479,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6cbd2e764f8a11f1b5a00d44d12bea5a-20260514
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 844076344; Thu, 14 May 2026 19:45:37 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 14 May 2026 19:45:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 14 May 2026 19:45:36 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <arnab.layek@mediatek.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Thu, 14 May 2026 19:45:32 +0800
Message-ID: <20260514114533.174008-1-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260506133157.3283204-1-arnab.layek@mediatek.com>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This series updates the mtk,scp dt-binding schema to support MT8188's
requirement for two memory regions while maintaining backward
compatibility for other MediaTek SoCs.

The schema uses a permissive base with restrictive conditionals:
1) Base schema allows all devices minItems: 1, maxItems: 2
2) Non-MT8188 devices (mt8183, mt8186, mt8192, mt8195, mt8195-dual) are
   restricted to maxItems: 1, overriding the base
3) MT8188 devices (mt8188, mt8188-dual) set minItems: 1 with item
   descriptions, inheriting maxItems: 2 from base, making the second
   L1TCM region optional

Changes in v3:
- Removed "Tested on..." line per Krzysztof's feedback (bindings cannot be tested)
- Added minItems: 1 to MT8188 conditional to make L1TCM region truly optional
- Clarified commit message to specifically reference mediatek,jpeg-encoder.yaml pattern
- Restructured schema per Conor's feedback: base allows maxItems: 2, conditionals restrict
- Added explicit restrictions for non-MT8188 devices (maxItems: 1)
- Added technical explanation of the permissive base + restrictive conditionals pattern

Changes in v2:
- Added conditional schema for MT8188 to allow 1-2 memory regions
- Added descriptions for each memory region
- Did not work: base maxItems: 1 conflicted with conditional trying to allow 2

Arnab Layek (1):
  dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for
    MT8188

 .../bindings/remoteproc/mtk,scp.yaml          | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

-- 
2.45.2


