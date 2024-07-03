Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787DB16EC0F;
	Wed,  3 Jul 2024 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720007603; cv=none; b=G/vjAjTutFq9jC+BiIsZwfCj75pm+Wg0mY/meCkBpWZA3SpS0HTsUEzTerBPVDPuZ3plHG4Fox1ppBX3wEZOkLGagPX07IfUgR8V1oqeAzoYGWmLij7HiV6uM+rpqkZXuf4hJkrAlOwAgXLIjabwvlLCMKMfAlOK299DFwYmXHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720007603; c=relaxed/simple;
	bh=lpZigUaFB4xScHIYUZnAnWaTnYcqGKTbw0w0yBnKrQo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P6O29l4w2pULe4iiwBpRd8xKdyQ3cA/ymAaC4NC2BGOfb4W7XyT3sHFO9gvCadP3+KGVsvkeh7ILxNEsvX++XWJ3HBiXXOQERDh3S34fNB1IssNgKKnNGxpLLnyn2Bst7GFbzb3jkjVX3tvc+9jnZ6B+xKCfUx7W106QagEUQes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=oVv7at7s; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oVv7at7s"
X-UUID: d4737518393211ef99dc3f8fac2c3230-20240703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vS8hQTlNVH9MhN3RvCv54s6g1Fx7Jmupeu84eDVbJPE=;
	b=oVv7at7sgDBeUqLbY9m9mcSMa6836ceMoNDf/V+pTfj8GUVCO/W0jOJXy/X6hk2v0UwoGqGpG4HrOQJYiZqCocg9UX2f0sUTMtH25yA3DUfMzP+od9nRxTtuyQ7ACarNXz0XSTY4odNnhcU9vKkBNYW3+rsBvjZacjZlRRiml9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:26650afc-007f-4d57-995a-6bde2a64062b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:ed79050d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d4737518393211ef99dc3f8fac2c3230-20240703
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1699590047; Wed, 03 Jul 2024 19:53:14 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
Subject: [PATCH 0/1] Support multiple reserved memory regions
Date: Wed, 3 Jul 2024 19:53:07 +0800
Message-ID: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
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

Besides the reserved memory region for SCP, there are additional 
reserved memory regions for specific hardware use.
Currently, only a single memory region is supported.
Modifications are made to support multiple memory regions.

shun-yi.wang (1):
  remoteproc: mediatek: support multiple reserved memory

 drivers/remoteproc/mtk_scp.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

-- 
2.18.0

