Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A390117C60;
	Wed,  3 Jul 2024 03:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719978267; cv=none; b=fqaqV0mIhI728+oOLuYZiq3JFhJA81AG3uEBM+sUC8DWDOU27zvw7SSRIpNgZ95WMWyYqKkcHrdGhg3dr4icxMHoF9TFfb69jsJmn9z/mwdQCk8Wsmj8iqFckkeZYVKHA6WlAJ+/FUIPDcFDZ0LWtuLHIXOnyJSOni52JjrauDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719978267; c=relaxed/simple;
	bh=bSWZY5KWhs4pwbuKUAh+EkDN2bROG4myn3eDtiD0mrE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FeJx2LAlPIVfrdNPuVYZNLosPku9f8ByrVtyrt9+UuDcWy9FS0OapXY3cjmm01kJndNgrdcsmeJxzaUtEwOCH4Y197SFqX4slCOZsim4sDbTHaE3JRdXaoim4HAPoKe3UODz0i7K++ls6+wicvmTH5VwOsVGOgVXzT7gJnUFI14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eIzh4JOJ; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eIzh4JOJ"
X-UUID: 872bc36c38ee11ef99dc3f8fac2c3230-20240703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0919Eg9JUothln0+V1EUy9kX5BQowYtQJF09dFwlQ+Q=;
	b=eIzh4JOJmNhqQfZg3FffbYTrdBgiSvYozra/EbJ01xc9WcPN/1QGLK7MyYvK/Cpxs61ehbLh9TuhiNyoXE1Kc1nNBhVbUSIq0xO/+k3Wk6cTdWB1dFusFzoDt8BtrwYaYwNTQA/WeQ9yYEmAGi3vM/hm3LoqL0plDvvHN92dQqM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:f6a74159-9ce3-4de6-ac21-4f873f4c9204,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:ba885a6,CLOUDID:16d2d744-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 872bc36c38ee11ef99dc3f8fac2c3230-20240703
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2116597845; Wed, 03 Jul 2024 11:44:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Jul 2024 11:44:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Jul 2024 11:44:17 +0800
From: Jason Chen <Jason-ch.Chen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH] remoteproc: mediatek: Increase MT8188/MT8195 SCP core0 DRAM size
Date: Wed, 3 Jul 2024 11:44:09 +0800
Message-ID: <20240703034409.698-1-Jason-ch.Chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

The current DRAM size is insufficient for the HEVC feature, which
requires more memory for proper functionality. This change ensures the
feature has the necessary resources.

Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index b17757900cd7..e744c07507ee 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1388,7 +1388,7 @@ static const struct mtk_scp_sizes_data default_scp_sizes = {
 };
 
 static const struct mtk_scp_sizes_data mt8188_scp_sizes = {
-	.max_dram_size = 0x500000,
+	.max_dram_size = 0x800000,
 	.ipi_share_buffer_size = 600,
 };
 
@@ -1397,6 +1397,11 @@ static const struct mtk_scp_sizes_data mt8188_scp_c1_sizes = {
 	.ipi_share_buffer_size = 600,
 };
 
+static const struct mtk_scp_sizes_data mt8195_scp_sizes = {
+	.max_dram_size = 0x800000,
+	.ipi_share_buffer_size = 288,
+};
+
 static const struct mtk_scp_of_data mt8183_of_data = {
 	.scp_clk_get = mt8183_scp_clk_get,
 	.scp_before_load = mt8183_scp_before_load,
@@ -1474,7 +1479,7 @@ static const struct mtk_scp_of_data mt8195_of_data = {
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
-	.scp_sizes = &default_scp_sizes,
+	.scp_sizes = &mt8195_scp_sizes,
 };
 
 static const struct mtk_scp_of_data mt8195_of_data_c1 = {
-- 
2.34.1

