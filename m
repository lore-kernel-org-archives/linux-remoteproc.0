Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE6D3054F7;
	Mon, 10 Nov 2025 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769640; cv=none; b=eqobCfnt4jEcc4dhqj31+Kb5vX8D0KfBEVQOEwyFu2hpl2t8PUbsWYWybvbcyR4xdrNcS4x1kcRtbLD2q807+WxQvM45q3xsLyaq8Pkpq5D96RA5MwXfoX1nr1hu32A8ULNxjAxtkaqzD5fU3yUOGfv1SHkmQ2thQUgUwtwwZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769640; c=relaxed/simple;
	bh=nbCu1VgAuvVKEnuINY15HczxWzsWlUhA5cUBZqSqZb0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MTRIoWDb+w35c2odvKyvYhsiP4oYyv3x5MkZH6jo0eC0TmAhD2vSan4DQFZJZn7G7NdgW+VHrUtYb6n7dX2UgVCDE1rhzz0RE7wLaEuR2NPcoSs+RuxvtcPRZAl2bvyIvMIFXHhcBwXiRCv0XRICNu3QrYK1Yav3vEE3cjQeymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hJGyQCPS; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hJGyQCPS"
X-UUID: f388a10abe1d11f0b33aeb1e7f16c2b6-20251110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OfMPxUnD8vjuFK9r4Pv/nUsJVT3L7xdp5W2yLIlL/3M=;
	b=hJGyQCPSY9bLCly7i96AcurFoOu8w/r4r2rEuNkX8w5N8Ij8fPMEnciIUVRn3UVST7hyv3er5PX3RVgCL5gHwkrDN8Z/dEcmWxCReu9LQhqEiwmTm6EEOGBbeVZbOR9kTOETAL21o2/YaPco4fINU5FwYzoz2Tk7miyNPygEj2Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3635df35-d557-4a1e-9bc9-78994764fc86,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:37357b82-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f388a10abe1d11f0b33aeb1e7f16c2b6-20251110
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1094888467; Mon, 10 Nov 2025 18:13:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 10 Nov 2025 18:13:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 10 Nov 2025 18:13:47 +0800
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
Subject: [PATCH v3 2/3] remoteproc: mediatek: Add MT8189 SCP platform data
Date: Mon, 10 Nov 2025 18:13:30 +0800
Message-ID: <20251110101342.24261-3-huayu.zong@mediatek.com>
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

Add platform data for MT8189 to support SCP remote processor.
This enables SCP functionality on MT8189 SoC.

Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  5 +++++
 drivers/remoteproc/mtk_scp.c    | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index d45480ad332e..abf0dbd9978c 100644
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
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index c3c37cae933a..f311e23b6d65 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1529,6 +1529,23 @@ static const struct mtk_scp_of_data mt8188_of_data_c1 = {
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
@@ -1587,6 +1604,7 @@ static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
 	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
 	{ .compatible = "mediatek,mt8188-scp-dual", .data = &mt8188_of_data_cores },
+	{ .compatible = "mediatek,mt8189-scp", .data = &mt8189_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
 	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
-- 
2.45.2

