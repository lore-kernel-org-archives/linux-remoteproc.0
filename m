Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B73EAC98;
	Wed, 20 May 2026 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276408; cv=none; b=DEJrEyEOUv2YLv+4YZq8ICI6LJgpwGvUsx7kSlqOSqDvecVYalmvMx8mxPHEPKahDBLdMWyWufmFXe+vHUs1FJNZGAlXciZe3mzDjRyVFgQvw2vnJPyf3HGQ+aux9XlnOivI2rKktYOZ+1xwY8oCee5KxG+nsA9Y3lUdmTG/FT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276408; c=relaxed/simple;
	bh=P8fXXB7ke2d49pyHCD53ay9lIR/yzm7qpiBQAzPLW2E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HKzB1v3Jxprhq7eV8ZphlBs5K86WVuWBodHq60XpglnECf2t4CSicpqEvXjkmsM97MLCZE6MoT1RJgLC3Sz8iCuKfhtlx25jCY4G7b0mFpvfhs8axy0AcggW6Myioe4tPHOz9iiBIJ6kcgccrqZ/xzQOxj3x4hkbU5itUOaY9l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=EOJLNiP4; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EOJLNiP4"
X-UUID: c21edb90543e11f1a3561939bc42ff46-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=neaiS3v6Ee0wnOpS6Uq6OxdGxu6XYh+uZ3ykA7gR8Z4=;
	b=EOJLNiP41QCWkOta+YNBWlQSohWA1ZQa1Rsd9VD8V+/nB3H6s8z1swEp1csAxZtwoLYeR/tAcHq1xZDKPtgIJLka2GOCZ4ZTaOesoa2rNNTEaK+r84+it8kjub+XfTQyFWUjUc6+AI/Vf4m67odIQkkugIne8d2PxbFsdnq809g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:41637fca-ac03-4f20-a115-e7369faed630,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:d64c081f-023f-4f87-9e9c-6c116c694fb3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c21edb90543e11f1a3561939bc42ff46-20260520
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 19811079; Wed, 20 May 2026 19:26:34 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 19:26:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 19:26:33 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Arnab Layek
	<arnab.layek@mediatek.com>
Subject: [PATCH v4 0/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Wed, 20 May 2026 19:26:28 +0800
Message-ID: <20260520112629.3420612-1-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This patch updates the mtk,scp dt-binding schema to support MT8188's
requirement for 1-2 memory regions while maintaining strict backward
compatibility for other MediaTek SoCs.

The MT8188 SCP requires a main SRAM region and optionally supports an
L1TCM (Level 1 Tightly Coupled Memory) region for performance
optimization. L1TCM is optional because basic SCP functionality works
with only SRAM, but L1TCM provides faster memory access when the board
hardware configuration includes it.

The base schema uses minItems: 1, maxItems: 2 (permissive range),
following the pattern established in other MediaTek dt-bindings like
mediatek,vcodec-encoder.yaml where the base accommodates all variants.
Conditionals then narrow the constraints per device.

Changes in v4:
- Improved commit message clarity per kernel submission guidelines:
  * Added bullet-point explanation of the two memory regions
  * Explained WHY L1TCM is optional (performance optimization, not
    required for basic functionality)
  * Explicitly listed which SoCs remain single-region
  * Clarified the two-conditional approach
  * Explained how minItems: 1 allows board-specific configuration
- Cover letter updated to explain L1TCM optional reasoning

Changes in v3:
- Removed "Tested on..." line (bindings cannot be tested)
- Added minItems: 1 to MT8188 conditional to make L1TCM truly optional
- Referenced mediatek,vcodec-encoder.yaml iommus pattern explicitly
- Base schema: minItems: 1, maxItems: 2 (permissive range)
- Non-MT8188: explicitly restricted to maxItems: 1
- MT8188: documented with item descriptions for both regions

Changes in v2:
- Added conditional schema for MT8188 to allow 1-2 memory regions
- Added descriptions for each memory region
- Did not work: base maxItems: 1 conflicted with conditional

Arnab Layek (1):
  dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for
    MT8188

 .../bindings/remoteproc/mtk,scp.yaml          | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

-- 
2.45.2
