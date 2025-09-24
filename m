Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C63A28B3E7;
	Wed, 24 Sep 2025 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758703472; cv=none; b=PfaN6Tw7gbz1Z80mGeVvPXmEWj18dz75iRTVhnbENxwoJPSKzXHzFYwi6TCA+dhRw5A1ivEZJFsOV2DrLy7+r1R4XrXgqzMZupj1Hpfa7TP/IWz/53kyBuH2X/EJuBTWftAWHKyp0mNEHhwq7r0jghX5ZcgRRi0BwGXsznDEzZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758703472; c=relaxed/simple;
	bh=/FC2XFlapuWI95y2e7FrTZ+yg3mTJn8rYH76JlgtMSc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mPLfe39BGUMBtwRbFneJGbgIMabXVjcAFay7/UIbuj3uH0KWlOnXHwkBnNy9Skf233pF3/qrYFnSynYt2uRxA7qgnaEuJMF8JQEu1OONiE9BgQpvRIMNGJiv/qVQERcKBFsVZVJd/DQUlmdF3Lzlx4ncPXM2Kx1J6C5XBFyomyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AUeMTNuU; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AUeMTNuU"
X-UUID: ad2a774e992211f08d9e1119e76e3a28-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PFuPLTdWH67tX0oh7ejew8sf/DWLeKIxmgCUYj8rnI8=;
	b=AUeMTNuU8mESewvD/6TspUB7ttXJd/6/FklSDo91dOizitck7Rg6g9ByCFpWi0gslQzc+fZXFeiwFbMZr/T+xn8jqx/e2YKPonTvHDliZ1vP2o2vL48ppA5GVHHk+DN4G/8aXMR+O/H0+xI+nOD642ZwKx2rTEQC8blygfuCHI8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:d0c0b270-7880-4498-8156-67ac9abbc5d9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:cb99e46c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ad2a774e992211f08d9e1119e76e3a28-20250924
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1217855027; Wed, 24 Sep 2025 16:44:26 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 24 Sep 2025 16:44:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 24 Sep 2025 16:44:23 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH v2 0/2] Add support for MT8189 SCP and device tree bindings
Date: Wed, 24 Sep 2025 16:44:16 +0800
Message-ID: <20250924084422.4604-1-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

  This patch series adds support for the System Companion
Processor (SCP) on MediaTek MT8189, including device tree
bindings and driver support.

Huayu Zong (2):
  dt-bindings: remoteproc: mediatek: Add binding for mt8189 scp
  remoteproc: mediatek: Support MT8189 SCP

 .../bindings/remoteproc/mtk,scp.yaml          |  2 ++
 drivers/remoteproc/mtk_common.h               | 10 +++++++
 drivers/remoteproc/mtk_scp.c                  | 29 +++++++++++++++++--
 3 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.45.2

