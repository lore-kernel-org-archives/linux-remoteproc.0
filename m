Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99678202976;
	Tue, 29 Jul 2025 02:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753756307; cv=none; b=gDjiJdmRyBSBuu2+Mx5kkd/m/DqTPe6K1zgC5RftbQWOQuMk+wz2tEPQ6Tpzuofy0a/EpYO2nXp7GU/JSHBE2yxzGQ79iR0Tdje2bVZpwGTUccxcvSt0qbabOuM3zk+fnbOdCfXkS1QXpfw+DLc7TiyZIPfQnTcHdraUE+i1rv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753756307; c=relaxed/simple;
	bh=VpfO5jq7Rgl2P01yNdb0ZVD+vXm7aa9G8GSDFv0LnzM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZBxiuqYHWhjD/sxIn8DFWVdoZVAehSHGiwSl9PHqcL8/84R/omQkoTUSwHvcmEaOvrF30iabtzZ74L5pngH1RmTMGCKOmDAnRm7sTzoNgx3D08a/USXtSNoNcPnhwLBdthatTIhssZa7m/YtwHBz25uK3Gk/XhLx9+2aNDn1wkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LD/lu15g; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LD/lu15g"
X-UUID: 235ecafe6c2411f0b33aeb1e7f16c2b6-20250729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=41rw4LISPl+iO7NfLc3Ar1MC/dnrRsPRo+py+vvxe0E=;
	b=LD/lu15gcYba++9X9lodLeKiqr1jW3FCU+NThFwCj3IqedqH48AQbiuTRbDwfD5l1y2H6h8RIbu1CojLOaAaCRl9J9ppNVAWpwWJ5Uzg8dauYQI7fl7hbd/JHTrS3RF3vSuB1JxYnNDh//9n2gIGJdyMJrc7AJgKEx300tXGMj0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:c2b87ee7-51db-411c-abc1-436b28e4f5d4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:0b095950-93b9-417a-b51d-915a29f1620f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 235ecafe6c2411f0b33aeb1e7f16c2b6-20250729
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1901018978; Tue, 29 Jul 2025 10:31:31 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 10:31:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 10:31:29 +0800
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
	<--cc=Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH 0/3] Add support for MT8189 SCP and device tree bindings
Date: Tue, 29 Jul 2025 10:31:10 +0800
Message-ID: <20250729023125.9036-1-huayu.zong@mediatek.com>
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
bindings, dts node, and driver support.

---
This series patches dependent on:
[1]
https://patchwork.kernel.org/project/linux-mediatek/cover/20250718075630.644870-1-sirius.wang@mediatek.com/

Huayu Zong (3):
  dt-bindings: remoteproc: mediatek: Add binding for mt8189 scp
  arm64: dts: mt8189: Add scp node
  remoteproc: mediatek: Support MT8189 SCP

 .../bindings/remoteproc/mtk,scp.yaml          |  2 +
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts   | 17 +++++++++
 arch/arm64/boot/dts/mediatek/mt8189.dtsi      | 11 ++++++
 drivers/remoteproc/mtk_common.h               | 11 ++++++
 drivers/remoteproc/mtk_scp.c                  | 37 +++++++++++++++++--
 5 files changed, 75 insertions(+), 3 deletions(-)

-- 
2.45.2

