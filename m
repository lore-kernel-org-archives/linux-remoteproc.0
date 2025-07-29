Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8307A20D4F9;
	Tue, 29 Jul 2025 02:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753756309; cv=none; b=QCO8ONb2jgx3qIQywicORyfIGCUeamHLFGL9DwzwTfIg/qpVUXiRMcq5fxQ7NyQlU6bHzJAdKy4Li6ng+hGIjcJy42iG4p2zEplxpXMpvAYN30bEo1xNNJM5s+8LBFKQmqqXjHXdNfxxTugUU2zKP+nR7ZCXzszdSX2w9cq6X8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753756309; c=relaxed/simple;
	bh=Fv+mqhtoohGsxrWk8MdR/p813cWLZElyVD4RRW2uZyk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JcBvqeFb8zhEzQbVMlJnxu+wLCXgyjZov5ZBVyNkedEVoXb8numuQnQ97jIWLJiDkhdIq5IJBap0Dxe8iziyxWHsgFEIIC/34YcFdVtf8/ysvAj/jPgjzJJVI2Dq14pJZ4I3k+Jo8P+h0WAdR3we5hEryEvVPKeX6p3rCJ23lso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HGkbQybO; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HGkbQybO"
X-UUID: 252415386c2411f0b33aeb1e7f16c2b6-20250729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bYebe6d6FF9a4Sv4DvMcxFHqACdPJ8d1sUQcdh4dprA=;
	b=HGkbQybOGOYQBWIuNXkYPFYAVg1vnabqsg9i4zZ3150X+6Hxz/5o1xczpGc5oWPI5YTLKDDsSdIzi3RmD4oBIgglrJx7QAUehYPxDk95j1Q6kydcm3QwIdGVIEW2wmsxuz1Ny5h6nxj3JjtQ6s9T7sVOxaRgicpBM2Fnxq1rwgo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:c9a35b41-8a16-4a2d-af32-a6377096b96d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:d8555e9a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 252415386c2411f0b33aeb1e7f16c2b6-20250729
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 697706325; Tue, 29 Jul 2025 10:31:34 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 10:31:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 10:31:32 +0800
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
	<--cc=Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH 3/3] remoteproc: mediatek: Support MT8189 SCP
Date: Tue, 29 Jul 2025 10:31:13 +0800
Message-ID: <20250729023125.9036-4-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250729023125.9036-1-huayu.zong@mediatek.com>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add SCP support for mt8189.

Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
---
 drivers/remoteproc/mtk_common.h | 11 ++++++++++
 drivers/remoteproc/mtk_scp.c    | 37 ++++++++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index fd5c539ab2ac..fb2131e0ed07 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -35,6 +35,11 @@
 #define MT8186_SCP_L1_SRAM_PD_P1	0x40B0
 #define MT8186_SCP_L1_SRAM_PD_p2	0x40B4
 
+#define MT8189_SCP2APMCU_IPC_CLR	0x30010
+#define MT8189_SCP2SPM_IPC_CLR		0x30018
+#define MT8189_SCP_SECURE_DOMAIN	0xA080
+#define MT8189_SCP_DOMAIN_VAL		0x3303003
+
 #define MT8192_L2TCM_SRAM_PD_0		0x10C0
 #define MT8192_L2TCM_SRAM_PD_1		0x10C4
 #define MT8192_L2TCM_SRAM_PD_2		0x10C8
@@ -112,6 +117,12 @@ struct mtk_scp_of_data {
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
+	u32 scp_to_host_ipc_set_reg;
+	u32 scp_to_host_ipc_clr_reg;
+	u32 scp_to_spm_ipc_clr_reg;
+
+	u32 scp_secure_domain_reg;
+	u32 scp_domain_value;
 
 	size_t ipi_buf_offset;
 	const struct mtk_scp_sizes_data *scp_sizes;
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 8206a1766481..956793fc6901 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -225,7 +225,8 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 {
 	u32 scp_to_host;
 
-	scp_to_host = readl(scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_SET);
+	scp_to_host = readl(scp->cluster->reg_base +
+			    scp->data->scp_to_host_ipc_set_reg);
 
 	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
 		scp_ipi_handler(scp);
@@ -235,7 +236,7 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 		 * MT8192_SCP2APMCU_IPC.
 		 */
 		writel(MT8192_SCP_IPC_INT_BIT,
-		       scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+		       scp->cluster->reg_base + scp->data->scp_to_host_ipc_clr_reg);
 	} else {
 		scp_wdt_handler(scp, scp_to_host);
 		writel(1, scp->cluster->reg_base + MT8192_CORE0_WDT_IRQ);
@@ -559,8 +560,10 @@ static int mt8188_scp_c1_before_load(struct mtk_scp *scp)
 
 static int mt8192_scp_before_load(struct mtk_scp *scp)
 {
+	u32 scp2spm_ipc_clr = scp->data->scp_to_spm_ipc_clr_reg;
+
 	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
-	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
+	writel(0xff, scp->cluster->reg_base + scp2spm_ipc_clr);
 
 	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
 
@@ -574,6 +577,11 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
 
+	/* set the domain of master in SCP */
+	if (scp->data->scp_secure_domain_reg)
+		writel(scp->data->scp_domain_value,
+		       scp->cluster->reg_base + scp->data->scp_secure_domain_reg);
+
 	return 0;
 }
 
@@ -1464,6 +1472,24 @@ static const struct mtk_scp_of_data mt8188_of_data_c1 = {
 	.scp_sizes = &mt8188_scp_c1_sizes,
 };
 
+static const struct mtk_scp_of_data mt8189_of_data = {
+	.scp_clk_get = mt8195_scp_clk_get,
+	.scp_before_load = mt8192_scp_before_load,
+	.scp_irq_handler = mt8192_scp_irq_handler,
+	.scp_reset_assert = mt8192_scp_reset_assert,
+	.scp_reset_deassert = mt8192_scp_reset_deassert,
+	.scp_stop = mt8192_scp_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
+	.host_to_scp_reg = MT8192_GIPC_IN_SET,
+	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
+	.scp_to_host_ipc_set_reg = MT8192_SCP2APMCU_IPC_SET,
+	.scp_to_host_ipc_clr_reg = MT8189_SCP2APMCU_IPC_CLR,
+	.scp_to_spm_ipc_clr_reg = MT8189_SCP2SPM_IPC_CLR,
+	.scp_secure_domain_reg = MT8189_SCP_SECURE_DOMAIN,
+	.scp_domain_value = MT8189_SCP_DOMAIN_VAL,
+	.scp_sizes = &default_scp_sizes,
+};
+
 static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_clk_get = mt8192_scp_clk_get,
 	.scp_before_load = mt8192_scp_before_load,
@@ -1475,6 +1501,10 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 	.scp_sizes = &default_scp_sizes,
+	.scp_to_host_ipc_set_reg = MT8192_SCP2APMCU_IPC_SET,
+	.scp_to_host_ipc_clr_reg = MT8192_SCP2APMCU_IPC_CLR,
+	.scp_to_spm_ipc_clr_reg = MT8192_SCP2SPM_IPC_CLR,
+	.scp_sizes = &default_scp_sizes,
 };
 
 static const struct mtk_scp_of_data mt8195_of_data = {
@@ -1520,6 +1550,7 @@ static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
 	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
 	{ .compatible = "mediatek,mt8188-scp-dual", .data = &mt8188_of_data_cores },
+	{ .compatible = "mediatek,mt8189-scp", .data = &mt8189_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
 	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
-- 
2.45.2

