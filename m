Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3508B3054C3;
	Mon, 10 Nov 2025 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769637; cv=none; b=CUiV/NJlHyHIe06s3+SlWrVvoKg7DILKWT+EvuPn8meeVJkFt243fgdkR43tSERtR4Kr/DWfKoQlnEo8jMJ3V3dI3VBWb2m+mbJ2i1f+SC/UuXsCfGIb3cD9BtabQklxwiaGw2BquygCvPWIFG/MS4PQDNuVE8H0/hA4F6Iu7gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769637; c=relaxed/simple;
	bh=QNbA2jGx3nt6lFRUjy+4vBDY9WWz712/pU3xbGzkwaI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+RFJBTJTIek07Ua8P8sdeCcGF12eOPCpxNJeWNNTJRNEmgKLA0+iBnc8uXLGS2+mr8OuKqdBihx3oJRuobhzXI4TtozOYjImkDeDjC3TVen3ws6SHnKIVPiNz7wYN+9c5YaCXatB809LCq2Hy+tNDyDMPT3yn/oB4cXHz7zFh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BY3FFz72; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BY3FFz72"
X-UUID: f2feb756be1d11f08ac0a938fc7cd336-20251110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=F+LAoo9QUHiN7emChFIulad0jwV90T0Vbi/l6sOzzf8=;
	b=BY3FFz72saYqQu1xl7dVp6ZFNQ3iN861wTp1GeR82EHuEcxlbxWrpOBJHp60q1dp4ZrOv+pIahSxpKZpxDgqPPPws7j+q/2gOeVlJIYONrfbGutOPNrRHk50nPCyVv6RKAu5wvBBWKMukPposDLoawjQW+UGALRjqbWNt9rOly8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f7a30afc-2423-4b5f-bce7-33b3894bc0d1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:6c1fef63-6377-47fe-8022-3226f0b92c45,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2feb756be1d11f08ac0a938fc7cd336-20251110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1559714305; Mon, 10 Nov 2025 18:13:48 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 10 Nov 2025 18:13:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 10 Nov 2025 18:13:46 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH v3 1/3] remoteproc: mediatek: Support platform reg offsets in mtk_scp_of_data
Date: Mon, 10 Nov 2025 18:13:29 +0800
Message-ID: <20251110101342.24261-2-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251110101342.24261-1-huayu.zong@mediatek.com>
References: <20251110101342.24261-1-huayu.zong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Some platforms only differ in HW register offsets, but can share
the same API. Refine struct mtk_scp_of_data to allow setting HW
register offsets via platform data, enabling better code reuse
and easier support for new platforms.

Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  5 +++++
 drivers/remoteproc/mtk_scp.c    | 18 ++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index fd5c539ab2ac..d45480ad332e 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -112,6 +112,11 @@ struct mtk_scp_of_data {
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
+	u32 scp_to_host_ipc_clr_reg;
+	u32 scp_to_spm_ipc_clr_reg;
+
+	u32 scp_secure_domain_reg;
+	u32 scp_domain_value;
 
 	size_t ipi_buf_offset;
 	const struct mtk_scp_sizes_data *scp_sizes;
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 10e3f9eb8cd2..c3c37cae933a 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -236,7 +236,7 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 		 * MT8192_SCP2APMCU_IPC.
 		 */
 		writel(MT8192_SCP_IPC_INT_BIT,
-		       scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+		       scp->cluster->reg_base + scp->data->scp_to_host_ipc_clr_reg);
 	} else {
 		scp_wdt_handler(scp, scp_to_host);
 		writel(1, scp->cluster->reg_base + MT8192_CORE0_WDT_IRQ);
@@ -561,7 +561,7 @@ static int mt8188_scp_c1_before_load(struct mtk_scp *scp)
 static int mt8192_scp_before_load(struct mtk_scp *scp)
 {
 	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
-	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
+	writel(0xff, scp->cluster->reg_base + scp->data->scp_to_spm_ipc_clr_reg);
 
 	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
 
@@ -575,6 +575,18 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
 
+	/* Set the domain of master in SCP.
+	 *
+	 * In the SCP, cores, DMA, and SPI are masters. When these masters
+	 * access memory or devices, they need to carry a domain ID. This
+	 * domain ID is used to determine whether they have permission to
+	 * access the target device or memory.
+	 */
+
+	if (scp->data->scp_secure_domain_reg)
+		writel(scp->data->scp_domain_value,
+		       scp->cluster->reg_base + scp->data->scp_secure_domain_reg);
+
 	return 0;
 }
 
@@ -1527,6 +1539,8 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
+	.scp_to_host_ipc_clr_reg = MT8192_SCP2APMCU_IPC_CLR,
+	.scp_to_spm_ipc_clr_reg = MT8192_SCP2SPM_IPC_CLR,
 	.scp_sizes = &default_scp_sizes,
 };
 
-- 
2.45.2

