Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD684D535;
	Wed, 10 Jul 2024 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600961; cv=none; b=diGbVho7gWEOTmJyUWGft2YyJYzB/i21tHHJ4Waa0YIPOiFWYInsVlXBsqNud1+bVXqnAdMh9hq1wO0SoUGfSrXdXsoBxB9XXRlkgv6hdgwAD7oPPNJFQyUAg8zJ5+r6vQhkKY4s0nyfiGSxVXRrN1QWPzgtHFOCRg4khUsxSzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600961; c=relaxed/simple;
	bh=/cSixCFKERN/J7DRtssnHK2SWpy1fqsCyCoIL53VSHw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BWDpAHeruqOgKcKb6RwtHc+N3y6YJIx/CGuc3mzFLIR4mEVpsdJQ2+g5510PqTu4rr43/Oeucn8EHvqMAJRl0v4pN/w6qTLTnGdftnLCeir002F7T2dzLbalHxrXAGrYEQmFI3a/5SBmAemWP6Lb/Iap244d93BYyCZzmFNoJ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=fctuXaPG; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fctuXaPG"
X-UUID: 54ca3f843e9811efb5b96b43b535fdb4-20240710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=00qi1vCjVrBTnoMM1ymQIUcx+b2b5UPxjpcAqXcyXco=;
	b=fctuXaPG4XNC8Fosfr6HyRUpTLneQC6ks+9KSIYTKQFaeHHUw2ZBUvuf1BIwkHcXh8mBdYzrs2yI4FeXbkn41uthyGpoV9+lpGC+Uw7hXCGEeMgMRyh2u8K5EVTGGBt6Lf7C4klTOQhGjHM/OW0I6phTVfl44eIAsm2UA5/xPHY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:1ec12272-4b5e-483a-b3fa-59c4e5725506,IP:0,U
	RL:0,TC:0,Content:35,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:35
X-CID-META: VersionHash:ba885a6,CLOUDID:5683490d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 54ca3f843e9811efb5b96b43b535fdb4-20240710
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1828831548; Wed, 10 Jul 2024 16:42:25 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jul 2024 01:42:24 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jul 2024 16:42:24 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, shun-yi.wang <shun-yi.wang@mediatek.com>
Subject: [PATCH RFC 0/1] Support CMA regions
Date: Wed, 10 Jul 2024 16:41:59 +0800
Message-ID: <20240710084200.6561-1-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

In order to reserve specific Contiguous Memory Allocator (CMA) regions 
for hardware use. When the name of the reserved region contains "cma", 
then a corresponding CMA heap is added.

In the DTS (Device Tree Source), we may have several memory regions 
with different names, e.g.,
&scp {
	...
	memory-region = <&mem_reserved_1>, <&mem_reserved_2>;
};

mem_reserved_1: xxx-xxx-region {
	...
};
mem_reserved_2: xxx-xxx-cma-region {
	...
};

When the name of the region contains "cma", a corresponding heap 
allocator is added by cma_heap_add().
However, we are unsure if using the name "cma" as an identifier
is a good practice.
I sincerely hope that you can provide me some suggestions, thanks.
Especially within the segment of '#ifdef CONFIG_DMA_BUF_HEAPS_CMA'

Note: The cma_heap_add() is introduced from this patch:
dma-buf: heaps: Introduce cma_heap_add() for non-default CMA heap

shun-yi.wang (1):
  remoteproc: mediatek: Support reserved CMA regions

 drivers/remoteproc/mtk_scp.c | 38 ++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

-- 
2.18.0

