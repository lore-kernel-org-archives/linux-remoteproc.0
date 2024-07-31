Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614D18E03E;
	Wed, 31 Jul 2024 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722428279; cv=none; b=t+qrqWA0yKku7S40qZQSUGDph9uWoxV5lMMQZzQZovRyEQ2xoATxH1hQUGVI9/S+xUgJ3FyIm9bEg7kdvf4FqeK1PuzB1dSyCqFSn0bPc0ziLO1v90KRjdWnI9CV66kcJrgoqmcGlmoIeEOLVuVUDtIj9fy7u0jlaLxpngBkG7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722428279; c=relaxed/simple;
	bh=87Pw7zymow35gU5STehFdamCCw2WSS7rr0FeXYv0z8I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K1we17HgdDHWZ7zpoe5XY77i32tB4asiWpWlKYpoLnW9xbIyVd0+znvGROpnrxwKc1pKoABNXE851eI5gdxFAzny7CvrwpquW8PWllz6K+HAQTuiWYSW0i3DgIqaAX8udClhKcpqPJnS9gsiPnqLvaXyzZyvMHLneSZMSiCs04A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NnxwHnNp; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NnxwHnNp"
X-UUID: e3f8668c4f3611ef9a4e6796c666300c-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+68I2wt+mK5kj3jVcgGesLqev3xV/ggibaKNqaiJVLQ=;
	b=NnxwHnNpkAti5Cm+B4GZCFRSlB2K9J4F6EoFhqCsvH0IbznjxJbQfTP28CBvxp63f+4Npx09mSx99h4pqvQIBoBVE+K+97bhFj5BBOrA/MAZjFNkN5TfzoSUAVoB2qCJ8HPZUesTO006S+2+FM4PdAgIR2ZYzsFg9OA+6BwLV+0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:15f5e026-68c9-4ee4-880a-ba49c65ff1a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:48fa180e-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: e3f8668c4f3611ef9a4e6796c666300c-20240731
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2033716978; Wed, 31 Jul 2024 20:17:44 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 05:17:44 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 20:17:43 +0800
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
Subject: [PATCH v2 0/2] Support multiple reserved memory regions
Date: Wed, 31 Jul 2024 20:17:28 +0800
Message-ID: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
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

Changes in v2:
 - Modify description of memory region in dt-bindings document
 - Fix comments in v1, initial value and from '!i' 'i == 0'
 - Link to v1: https://lore.kernel.org/all/20240703115308.17436-1-shun-yi.wang@mediatek.com

shun-yi.wang (2):
  dt-bindings: remoteproc: Support multiple reserved memory regions
  remoteproc: mediatek: Support multiple reserved memory regions

 .../bindings/remoteproc/mtk,scp.yaml          |  8 ++++--
 drivers/remoteproc/mtk_scp.c                  | 27 ++++++++++++-------
 2 files changed, 24 insertions(+), 11 deletions(-)

-- 
2.18.0

