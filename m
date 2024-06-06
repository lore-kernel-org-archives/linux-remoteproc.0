Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4668145322;
	Thu,  6 Jun 2024 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664786; cv=none; b=fEGg7B6Z60g/XO1XuJUOGfu2V9oTQPxx0OWACMrkh3eWDPFBq+ehZGRbh67rTNXFauhaUFdwYsiyiJpGyvoDAvryCXrZiXyQGiIfRaW2217q/X1j5JFsVxkutK2iL4EWiAFtvxy1v2SWFD8HtgmIBcEvcWtzpdVw0ZSkKYxit+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664786; c=relaxed/simple;
	bh=j0KhmEiIBVO2I7pYxITi/gig0dN1DEwHjsDGFnXyrzk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g/+v1FMdxe/zjSD7mW1cfQaOH6sNacjeW+usJqUL4p3WYB6pZEjRspdyfRgSRgXPsDzZwpIxocr+1480Wd6YICIDbagn37xWCKwJtCAGO9X/jcvogl68CV2+3Yi22g0SZRA7Oy7DmttWRDxZ8PvJ2GvzngdPhEJ7c6NSvGtr6eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=mediatek.corp-partner.google.com; spf=fail smtp.mailfrom=mediatek.corp-partner.google.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=meRGJnk6; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=mediatek.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mediatek.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="meRGJnk6"
X-UUID: 0635c1be23e411efa54bbfbb386b949c-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TulsrRhbIDs8TKsNZRbXbYoBg2+wZ1zCZBN14dFoG5E=;
	b=meRGJnk6ziUMw8bfG5YwdnTXZ8OftlmFv16yhdTHyNmchu5fd0JqfDbu98jsgYSDLlISiTU91vS0GZoI9UyrVnhGbQT9sNTPi+5Fg9gWw3pCpdUU8wo9L13137J8ucGYCwdR+YaThhS29S2ltUZ7vW8JurHZrMQ5EsZz/UBvwds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:14891e03-ae90-45a9-8280-66784abd9ebb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:8178b093-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0635c1be23e411efa54bbfbb386b949c-20240606
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.corp-partner.google.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 665328105; Thu, 06 Jun 2024 17:06:13 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jun 2024 17:06:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jun 2024 17:06:11 +0800
From: jason-ch chen <jason-ch.chen@mediatek.corp-partner.google.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH] remoteproc: mediatek: Increase MT8188 SCP core0 DRAM size
Date: Thu, 6 Jun 2024 17:06:09 +0800
Message-ID: <20240606090609.3199-1-jason-ch.chen@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.374200-8.000000
X-TMASE-MatchedRID: Xmee87WA04ARm9WAyl7+Dna57ruHAnHxJDAZBInjo2YUtdRZTmEaIUUe
	RhGY4VMdIV4u8YKdeKsBtjkcfRMmqUN64DZ+6OgVngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AGsWV0bdkf4OZnI7w0MyspY5QW3P0Do1rUHGWE57KOVV6Bw96C56Hm+BeJ5GJM55Sw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.374200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	8F2C02F9BB7FE52F84685050D7437B8500119C0C2DF2251449391A35E88052222000:8

From: Jason Chen <Jason-ch.Chen@mediatek.com>

Increase MT8188 SCP core0 DRAM size for HEVC driver.

Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index b885a9a041e4..2119fc62c3f2 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1390,7 +1390,7 @@ static const struct mtk_scp_sizes_data default_scp_sizes = {
 };
 
 static const struct mtk_scp_sizes_data mt8188_scp_sizes = {
-	.max_dram_size = 0x500000,
+	.max_dram_size = 0x800000,
 	.ipi_share_buffer_size = 600,
 };
 
-- 
2.34.1

