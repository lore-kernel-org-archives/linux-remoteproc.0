Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D4D233705;
	Wed,  2 Apr 2025 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585730; cv=none; b=nYxQXzZQr3ufs325UslBFSM+xeEFyc/OTWCpNlBiZT80v9pO6MYC3NMYKGJlsg8Twxl2pbQ+DhJnff46jy9PhPpI7V4cjnYm/Z1QyQjnsbgOqekr9e7/+va2Ii5UT5MQo+tYUfBrkbSIyvBvCvoHMR0/uqh1oguh1mtEjy/plso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585730; c=relaxed/simple;
	bh=+oInFd9o56WoIjnjQMsxHXJoufXRhdWk4A7jmx2W8ac=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JA2561xaog6P8Yta+kF5Ghxvdk2rhCkPkUhmdNT2Ne1h3XE3dRCpAu/npgOObkoU0RsEyWkAHHVB3B9P4lgBYS10pGQRm6UZIBdAvdpHigdatJ9+pAkeJnzbDrb2Zx/yqamHutdd8pxATVdHvEt8SGG6D1fQN9SzT9L6+xLbeWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OJInvAc4; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OJInvAc4"
X-UUID: eedafa640fa311f08eb9c36241bbb6fb-20250402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZfylEnuuGaFHWJYkmAWFhZ3H3gqBPJ+dZpFKqdQdJYo=;
	b=OJInvAc4AtVxo+eR6AvtrSSLnR2f5XtaDsoexbIre2rBW8+LDdb2OJcYQbq2bIB3GIxr6RKfMseEXZ7UgwtSCrPZePD1Nnya4/coYODTEHsOYLtQQjQ/YKMf+qN92EtwB7iibNZXxiEhZYBss/m77/IPzZ7UooZy+2ft6C1L+yg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c302fe46-7efc-4e2d-b686-6654f6b61f92,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:1261e04a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: eedafa640fa311f08eb9c36241bbb6fb-20250402
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 406034062; Wed, 02 Apr 2025 17:22:00 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Apr 2025 17:21:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 2 Apr 2025 17:21:58 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jjian.zhou@mediatek.com>, <hailong.fan@mediatek.com>, Xiangzhi Tang
	<xiangzhi.tang@mediatek.com>
Subject: [PATCH 0/2] Add vcp driver
Date: Wed, 2 Apr 2025 17:19:23 +0800
Message-ID: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
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
The VCP host driver using rproc mechanism to load vcm firmware
from filesystem, and using SMC services to request ATF to setting
vcp boot sequence, and Host communicated with VCP FW depends on VCP
IPC interfaces

This series patches dependent on:
[1]
https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/
[2]
https://patchwork.kernel.org/project/linux-mediatek/patch/20250317110331.2776-4-jjian.zhou@mediatek.com/

note: dependent on arm,smmu-v3 Mediatek patch, onwer https://patchwork.kernel.org/project/linux-mediatek/list/?submitter=216242 

Xiangzhi Tang (2):
  dt-bindings: remoteproc: Add VCP support for mt8196
  remoterpoc: mediatek: vcp: Add vcp remoteproc driver

 .../remoteproc/mediatek,mt8196-vcp.yaml       | 174 ++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   4 +
 drivers/remoteproc/mtk_vcp_common.c           | 982 ++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h           | 251 +++++
 drivers/remoteproc/mtk_vcp_rproc.c            | 724 +++++++++++++
 drivers/remoteproc/mtk_vcp_rproc.h            | 107 ++
 include/linux/remoteproc/mtk_vcp_public.h     | 138 +++
 include/linux/soc/mediatek/mtk_sip_svc.h      |   3 +
 9 files changed, 2395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
 create mode 100644 drivers/remoteproc/mtk_vcp_common.c
 create mode 100644 drivers/remoteproc/mtk_vcp_common.h
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.c
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.h
 create mode 100644 include/linux/remoteproc/mtk_vcp_public.h

-- 
2.45.2

