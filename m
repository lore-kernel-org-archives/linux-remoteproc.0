Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336B23B894B;
	Mon, 27 Apr 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288518; cv=none; b=FWdPLW44cJEP1Ak8Hy4bK2yVf1+LsRYZAqp0kYBFq2p3mYJYmOYwigerVmneJRRMK8DDuPX6OC823OF51XNeMrdHaJ6WURbuWsggqAdUYnywIgzjfKnz9jBoNBYVMcSscnokggW7/9k7wXKK0CNsrTji9MiSlSsa3cXCPltEzTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288518; c=relaxed/simple;
	bh=KIuBF8VcxDJ32+OrASEWukv5W35acgxE/Pr4k00xbYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJsgHaj/fxvARL32b2y/W59JIUrIX4ienItIoVFCsXm3SRmEeZ1vz9I9rF3j4okDs1qnlbCwmgqP4jGxvRqDpiS0/cyQkZ+Sg+MbmoDq9n37y0whQ4/JNrJTHCgJt8PRkZPawqXNaDVY35jO+zB19mHVvFoTQ/w2hHtmoOSosUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OVQjYj+Z; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OVQjYj+Z"
X-UUID: 5c1efb0c422a11f19a16598d5ca7f8ec-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=86q4Zuo6aBd/L3i4NYi1P6U8VCnSNpXDSdHTFbafsWg=;
	b=OVQjYj+ZiDTkPz7CvtX5vf23V0npAozbQ0hR4J0zVbzWt0nZQKK4CH3nzAjyJ0daZBD8l5G/tByEmJsspmOEbkTKzlIG4VTVgQZugDg/uu8cb61DNuu0ri86W/Zzm9AbOv9ug4y8EPRP671g92/sSbXry5exTJNXficWbYhilMo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ac9179bb-1918-467f-83d7-3b8f4a9898ff,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:337d82be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5c1efb0c422a11f19a16598d5ca7f8ec-20260427
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1632408405; Mon, 27 Apr 2026 19:15:12 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:15:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:15:10 +0800
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
	<Hailong.Fan@mediatek.com>, Huayu Zong <Huayu.Zong@mediatek.com>, Jarried Lin
	<Jarried.Lin@mediatek.com>, Justin Yeh <Justin.Yeh@mediatek.com>, Vince-WL
 Liu <Vince-WL.Liu@mediatek.com>, Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v4 7/7] MAINTAINERS: Add entry for MediaTek VCP remoteproc driver
Date: Mon, 27 Apr 2026 19:04:46 +0800
Message-ID: <20260427111446.22955-8-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
References: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add maintainer entry for the MediaTek Video Companion Processor
(VCP) remoteproc driver, including the device tree bindings,
firmware IPC interface, remoteproc driver, and public headers.

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 62b89d0013d2..4e27fcca28f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3065,6 +3065,20 @@ N:	mtk
 N:	mt[2678]
 K:	mediatek
 
+ARM/MEDIATEK VCP REMOTEPROC DRIVER
+M:	Xiangzhi Tang <xiangzhi.tang@mediatek.com>
+M:	Matthias Brugger <matthias.bgg@gmail.com>
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+L:	linux-remoteproc@vger.kernel.org
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
+F:	drivers/firmware/mtk-vcp-ipc.c
+F:	drivers/remoteproc/mtk_vcp*
+F:	include/linux/firmware/mediatek/mtk-vcp-ipc.h
+F:	include/linux/remoteproc/mtk_vcp_public.h
+
 ARM/Mediatek USB3 PHY DRIVER
 M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.46.0

