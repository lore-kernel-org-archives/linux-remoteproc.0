Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80214438B;
	Sun, 14 Sep 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853033; cv=none; b=Y0OJ72I09iB4n+O6vxo4W9JiBSAG7lh3MNmNy+ylWoihFo2Q4UHVdpjdoBYFGooh3/L6US+LMoNiiEkbBLz7WsAtr9KO6YkYNFblovI0vJCHS3065q4odUBh0E/786nmVrTm+qpE1Z+YvHJuyXylPNWqoKqWNvbvfj9J5RVqZ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853033; c=relaxed/simple;
	bh=jYSXKlsgfN4x80fjVe8fDpEouCHKUGV+Gbl5lYfi5IU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ogb5aMW//suaHusEXw7KXYmJ5+MYCafMmyVZdzUtoRVxcBjVZBX1YTPO0RlcPsUsjaDuPAr/YMD7EVZZz4u2SrT3+1C/Kj6Ex4nFkttRcn0HTOe+IH6Ke+8p1o9T1OazFV/yhtJ6SSojjLywTlokUFP9jMy/mB+pTWDiKytNxj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lxZsVIyJ; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lxZsVIyJ"
X-UUID: 924cf46a916611f0bd5779446731db89-20250914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8EG6l//2RPlmpS9c/r6hvNChHCCIsYeYKWB2oaD0rvg=;
	b=lxZsVIyJPGc2u1FsNpdnSBW81wqvPAkhjwCwUK5WAK4FyuKwmgshYVtGYsFPUNkeRhhiKaVh46+OS66RGg5QsqLYnX6J8Om5ysiyS7WedistLECO/hcBKW+edgf5IpX90SLlfF7TmP9at/CG8BZukF18fZwMdLr6kxNDme+tnA4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:1104c8da-20c5-4939-9cf6-bc8f8687d6e2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:c3be46f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102,TC:-5,Content:0|15|50,EDM:-3,
	IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 924cf46a916611f0bd5779446731db89-20250914
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 19579633; Sun, 14 Sep 2025 20:30:17 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 14 Sep 2025 20:30:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 14 Sep 2025 20:30:12 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jjian Zhou <Jjian.Zhou@mediatek.com>,
	Hailong Fan <Hailong.Fan@mediatek.com>, Xiangzhi Tang
	<xiangzhi.tang@mediatek.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: Add support of VCP on Mediatek mt8196 SoC.
Date: Sun, 14 Sep 2025 20:29:23 +0800
Message-ID: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support MediaTek's Video Companion Processor(VCP) host driver to
control the MediaTek VCP Risc-V coprocessor.

> This series is based on linux-next, tag: next-20250912.
> 
> Changes in v2:
> - Refactor: split vcp driver patch to mult diff
> - Fix reviewer's comments
> This series patches dependent on:
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250623120154.109429-2-angelogioacchino.delregno@collabora.com/
> [2]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250822021217.1598-3-jjian.zhou@mediatek.com/

Xiangzhi Tang (4):
  dt-bindings: remoteproc: Add VCP support for mt8196
  remoterpoc: mediatek: vcp: Add vcp remoteproc driver
  remoterpoc: mediatek: vcp: Add ipi-mbox communication
  remoterpoc: mediatek: vcp: Add vcp suspned and resume feature

 .../remoteproc/mediatek,mt8196-vcp.yaml       |  165 +++
 drivers/remoteproc/Kconfig                    |   12 +
 drivers/remoteproc/Makefile                   |    3 +
 drivers/remoteproc/mtk_vcp_common.c           | 1015 +++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h           |  284 +++++
 drivers/remoteproc/mtk_vcp_rproc.c            |  544 +++++++++
 drivers/remoteproc/mtk_vcp_rproc.h            |   93 ++
 include/linux/remoteproc/mtk_vcp_public.h     |  141 +++
 include/linux/soc/mediatek/mtk_sip_svc.h      |    3 +
 9 files changed, 2260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
 create mode 100644 drivers/remoteproc/mtk_vcp_common.c
 create mode 100644 drivers/remoteproc/mtk_vcp_common.h
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.c
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.h
 create mode 100644 include/linux/remoteproc/mtk_vcp_public.h

-- 
2.46.0

