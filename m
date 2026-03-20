Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6B13959D;
	Fri, 20 Mar 2026 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773976856; cv=none; b=tqomO2o1txT+Sh+Df4SJNmDrOz7fFlpVOwFNOzKiudOT1crxAoOQwn/UnCoPyeGi1wLiNWlUh4vJdYcK0jPvYNKpUEkVXzC10yVMEKcCYaZbhPW2IiNKwTHwsqB7Rg8acSfeo8I5MCjkYIzptsNAC0hU3GHvx9t5uYIiyOSnVRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773976856; c=relaxed/simple;
	bh=szKYI83weKaXqPwTWfwyi4XDV6R99x8dRNHaibChJZ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sh+gN84AZVpjjOzuNKB/MdIt9fVIbTVB9LoHZ/yN0Dtt32nn+EYN9hmPiPgyLCYK10rHCcYXT3vEzyG3tS2gZOsUnt6JSkK0VeGJgCyRPsBs+FT4t1db+cBDbbyk9kqzC0NIE1Za+T+pKV7X9gc678yGeTJEzkItxudqK+LdT9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=S5xekfv/; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S5xekfv/"
X-UUID: c49c497e240b11f1a39cd589f645bc18-20260320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=mP0wrA9XEI65mNtyVEuwgccgjZcyoSlyRxpMG9DjBwA=;
	b=S5xekfv/eXne+h150pLhqYZy0uXUjbHxidFis+tY+f9jnsv10TQ9ezTf8AeJSePDW8hWF9zaTAm/aCRsOG2YF/QDPajh6jRlG7BzTXHC79uNPcbpTilhUn9Ypncp7qHpIzTJmXzQBnjGRJ/44R+xYIvo99FFmYAVv06nifugvT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d3795bbb-5418-4230-a637-949b35d87036,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:411ab54c-9183-487b-8624-e74f2dd98990,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102|836|888|898,TC:-5,Content:0|1
	5|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c49c497e240b11f1a39cd589f645bc18-20260320
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 824155755; Fri, 20 Mar 2026 11:20:38 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 11:20:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 11:20:36 +0800
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
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<Hailong.Fan@mediatek.com>, Huayu Zong <huayu.Zong@mediatek.com>, Xiangzhi
 Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v3 0/6] ASoC: mediatek: Add VCP driver on Mediatek MT8196 SoC
Date: Fri, 20 Mar 2026 11:18:02 +0800
Message-ID: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
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

> This series is based on linux-next, tag: next-20260319.
>
> Changes in v3:
> - Fix probe path driver to using dev_err_probe error printf
> - Eliminate the use of global variables
> - Using readl_poll_timeout instead of "For" poll and "while" poll
> - Add VCP IPC layer driver   
> - Fix reviewer's comments
> This series patches dependent on:
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250623120154.109429-2-angelogioacchino.delregno@collabora.com/
> [2]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250822021217.1598-3-jjian.zhou@mediatek.com/

Xiangzhi Tang (6):
  dt-bindings: remoteproc: Add VCP support for mt8196
  remoteproc: Mediatek: Add VCP remoteproc driver
  firmware: mediatek: Add VCP IPC protocol interfaces driver
  remoteproc: mediatek: Add VCP ipi-mbox init driver
  remoteproc: mediatek: Add VCP ipi communication sync mechanism
  remoterpoc: mediatek: vcp: Add vcp suspned and resume feature

 .../remoteproc/mediatek,mt8196-vcp.yaml       | 161 ++++
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/mtk-vcp-ipc.c                | 481 ++++++++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   3 +
 drivers/remoteproc/mtk_vcp_common.c           | 854 ++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h           | 279 ++++++
 drivers/remoteproc/mtk_vcp_rproc.c            | 540 +++++++++++
 drivers/remoteproc/mtk_vcp_rproc.h            |  95 ++
 include/linux/firmware/mediatek/mtk-vcp-ipc.h | 151 ++++
 include/linux/remoteproc/mtk_vcp_public.h     | 146 +++
 include/linux/soc/mediatek/mtk_sip_svc.h      |   2 +
 13 files changed, 2734 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
 create mode 100644 drivers/firmware/mtk-vcp-ipc.c
 create mode 100644 drivers/remoteproc/mtk_vcp_common.c
 create mode 100644 drivers/remoteproc/mtk_vcp_common.h
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.c
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.h
 create mode 100644 include/linux/firmware/mediatek/mtk-vcp-ipc.h
 create mode 100644 include/linux/remoteproc/mtk_vcp_public.h

-- 
2.46.0

