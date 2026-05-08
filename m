Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FDE317167;
	Fri,  8 May 2026 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778242560; cv=none; b=c7T1TXaRbiYAUiip/dp4ed+uWQWh8iD/3OIoqco4Iug0Ha4m5q2Ycl6V1YUeTr8GqAfMujPetiD2APyOe1xmVyA9LsXVqcAiyvGZ1KaAJLjzUy1+rw04S3vHXgbVRadu3UoBkvTlbgVMYxQVYx4SCH5hBhwt1HR2VN5NaTyqLKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778242560; c=relaxed/simple;
	bh=tv7e5xKm8dmPFj6w559nG3N6yw7HaDW7AfF8V5ZgLok=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZfGcmvXDJ8eCX/mbJENG2ft8dXVxTbw6Gy65tFY3t3IyoUTwl8w8/55I8nwye+y0DijqBqOr+lWkUQzblh82YHyNNijAengLQruNT2eVw9fX/jVx80+W3hZqQw+QptX92az1mUmyQf69gSk13Gn1MC/k4JkHgAFe6LQE8+H5jXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cqTLal99; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cqTLal99"
X-UUID: a75d37044ad711f1a4e839cc21f16abe-20260508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wxp2NTpjEGAl1WZuVMHNm69/goC1fsF9Ilh4ewlLsms=;
	b=cqTLal99xo6QYt15dZSbVMy3wx16WuvVIpHZyLUaMMg9HY3N9GwnWLSk3USmz69ognnw2W+qmsKBP42WOR++kQIOfjA0hjJrsBf9cFtKJKZuDLNCATc3KEVwv0ZB6Hd2ggp02voIZd+aKK0pRaBgl/cEEerTj0/JnEjNsGMBs+I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:23f3a25a-4a47-4ba1-928c-2ad21904cbe7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:56bb12bf-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a75d37044ad711f1a4e839cc21f16abe-20260508
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1391867302; Fri, 08 May 2026 20:15:51 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 8 May 2026 20:15:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 8 May 2026 20:15:49 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Arnab Layek
	<arnab.layek@mediatek.com>
Subject: [PATCH v2 0/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Fri, 8 May 2026 20:15:46 +0800
Message-ID: <20260508121547.516634-1-arnab.layek@mediatek.com>
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

This patch updates the MediaTek SCP device tree binding to support
multiple memory regions for MT8188 SoCs, addressing review feedback
from v1.

The MT8188 SCP requires two memory regions (SRAM + L1TCM) while other
MediaTek SoCs use only one. This patch follows the proper pattern of
using conditional schemas with explicit descriptions.

Changes in v2:
- Use conditional schema (if/then in allOf) to restrict multiple
  memory regions only to MT8188 variants, keeping maxItems: 1 as
  default for other SoCs (addresses Krzysztof's review)
- Add explicit item descriptions for each memory region (Main SRAM
  and optional L1TCM) instead of just setting minItems/maxItems
- Apply to both top-level and patternProperties

Based on linux-next, tag: next-20260505

Arnab Layek (1):
  dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for
    MT8188

 .../bindings/remoteproc/mtk,scp.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.45.2

