Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5837B027;
	Mon, 11 May 2026 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501434; cv=none; b=IJje5A+dHhxgtFplXqYB1KD6LjZcfRQlvV+tg2rRYA8KHjyUz5pZ/efk/KxEIN25OoqV2lIzWSG3s3JKUHrh4C455OLzJM7sOGqU9TdpQ+uoMvrvhcx8IkWU3ntF9c62KVCQJ0UE8aX7Yh4zK+GCI9b7KXp2iu6f6pwwxaK+LZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501434; c=relaxed/simple;
	bh=tv7e5xKm8dmPFj6w559nG3N6yw7HaDW7AfF8V5ZgLok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ie7gzMm3WfIqTICMX8+clpWf5neRJcpIwxy4dAC6QFCrcM5SHsj/k0vCvxtRg1hi0+9CLKOWGNVzlGAHo8Us/gBSlz7ERWSc1odQHP2G/kSq5bXCIavaBFT0lbd59+jAOJSuwNvurZ5a/hwHqSW8Fjzjs9STisN8jWjedH5rJbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Phz4EIAS; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Phz4EIAS"
X-UUID: 5ebf23ec4d3211f1a4e839cc21f16abe-20260511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wxp2NTpjEGAl1WZuVMHNm69/goC1fsF9Ilh4ewlLsms=;
	b=Phz4EIASYeia2G6fqxZ1qVAGtzKmeuilHB2xNvodI1N8hrUnnUuP77LIK70CgrpFifGjisbedQGa4hZamGENHQIJtrmC0eq7nQ08Wc1tgtQZVZqmAzIuf739XSGoqNIfm+7siAZXcY+YqwzCJXZf1OGvs+kbdAe2zE804IHovdg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b29211de-fcfd-4598-b15a-ac2a49cbfcc6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:36d331bf-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5ebf23ec4d3211f1a4e839cc21f16abe-20260511
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 982308658; Mon, 11 May 2026 20:10:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 11 May 2026 20:10:14 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 11 May 2026 20:10:14 +0800
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
Date: Mon, 11 May 2026 20:10:03 +0800
Message-ID: <20260511121004.2984149-1-arnab.layek@mediatek.com>
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

