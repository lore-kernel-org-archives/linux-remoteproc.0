Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ED8305064;
	Mon, 10 Nov 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769636; cv=none; b=N+2K5JI6ctvIprlF04UyCBzqkvjCgKOMyWRFWactZe+HmFJhET+XQSVFbN45W4+6yObWo8JIxEXVTcxN+YyGXroYcsZ4ZW/YuCiepVO0pNPRtehPohouHsptzTj6NPvcPB/s9EqaQCSVMR+7VJmHNI7fvql//SD/it9bSePHd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769636; c=relaxed/simple;
	bh=32LJX2VLqXeDA+NwDzryxUK5OVfSIb04Y5pgFBaY5Fo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GA+NNkCeomFPh1+cfXiAYy35vANt6lPhv4u2i/0NyQmXTEs2M+HMQZ1I6QzYJJzjOzXTfDRg1U7S3/ZFKTbPYzd1yOoUvpKeh5clJMWxHK/Tx4hQygkuaWahJAtWfgvI9yCpBSfEtRrroDFr1RyPb40lmReap4pHvOR/gVrTcjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=pk5Rwci9; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pk5Rwci9"
X-UUID: f287af12be1d11f08ac0a938fc7cd336-20251110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EoD/aHhTgmIXFon5njzMGTKFSwgtLbPy4kqkBH4hVb4=;
	b=pk5Rwci9z/+wDZH7jcJxxiN06ix9Q966gnCL4gWDuL56TJBlJUBtjWT/eitMpLgAMHltN98gPyRPv2mJKv3+t9vuyB4wN2Bz5VqIiPrE4PkJCydtziNiGC4j6PgBkqTeRfQQPFIvVCss4Y+bu6AtfwCkYssIhzFX13fX0LvIj7k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:7be6c4e7-cd3d-45d8-9d9a-a32ec0374101,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:40eaa1ba-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f287af12be1d11f08ac0a938fc7cd336-20251110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1033637022; Mon, 10 Nov 2025 18:13:48 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 10 Nov 2025 18:13:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 10 Nov 2025 18:13:45 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH v3 0/3] Add support for MT8189 SCP and device tree bindings
Date: Mon, 10 Nov 2025 18:13:28 +0800
Message-ID: <20251110101342.24261-1-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

  This patch series adds support for the System Companion Processor (SCP)
on MediaTek MT8189, including device tree bindings and driver support.

Huayu Zong (3):
  remoteproc: mediatek: Support platform reg offsets in mtk_scp_of_data
  remoteproc: mediatek: Add MT8189 SCP platform data
  dt-bindings: remoteproc: mediatek: Add MT8189 SCP binding

 .../bindings/remoteproc/mtk,scp.yaml          |  2 ++
 drivers/remoteproc/mtk_common.h               | 10 ++++++
 drivers/remoteproc/mtk_scp.c                  | 36 +++++++++++++++++--
 3 files changed, 46 insertions(+), 2 deletions(-)

-- 
2.45.2

