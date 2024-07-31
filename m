Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7D018E03E;
	Wed, 31 Jul 2024 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722428285; cv=none; b=kchJVwZGjaxAdfYRQZpzvotsKbe2yIGZtCM8BS/pxUv8F7X5olXcdc55upFDLCDKTuEsUwk8eH0HzYuZRSv1vulzuZfu62/eFabWPZmTb6eDUQ7VXxtv8nnobmex0tRgMuY4GBfZV1wSP5mOCMpV6Z+A3/O+icDcKVqddSz/jw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722428285; c=relaxed/simple;
	bh=uHTK8leKm5GM9bj4CyWgy/C5obCrIASr+JAInKw/p7I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsOja/FaWIzyLXzXybFdn81VXLoQME572NkG81hO58ynQC/AtwKi7HdcYUCLa0Yb2Dll9r7bTukC2erW7vQqP1KpzxMtkx4JUv6tXKEgSzXsBEzohe3txr1mIynWJNXMxuMqbfXQ/qIW3bTgCWLgbRsy4Fl2GiY71ja/xzGNwNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=DZIlnf5e; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DZIlnf5e"
X-UUID: e71e46ec4f3611ef87684b57767b52b1-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=doFfXAdFce+mHfwQqD0retC6vnN+u/7Ff0DYCz/QITI=;
	b=DZIlnf5e9llC+JfX+bs7/gmyoRLXoqByuSqO8AXUHiiymtNlvkWOkbkHQAIKT7o9ffFcFRqxkciQFph6vGAsdkO4r8I7NH/CmKL+qT8ZjzBYom5cxYt7ZQEMWAoIvbpNGtrTGbiYPGb1xOjUJrogNm5NibhseBr6DPyCt3ndL4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:dc853362-b0d1-4871-aa89-5d0d80a0edfc,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:cd2ffcd5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
	,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: e71e46ec4f3611ef87684b57767b52b1-20240731
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 889398865; Wed, 31 Jul 2024 20:17:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 20:17:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 20:17:50 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Conor Dooley
	<conor+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, shun-yi.wang <shun-yi.wang@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: Support multiple reserved memory regions
Date: Wed, 31 Jul 2024 20:17:29 +0800
Message-ID: <20240731121730.1196-2-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
References: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.303100-8.000000
X-TMASE-MatchedRID: x6uIgBUWMExlJTodqNqEzkg5Iem1vm3HMZm0+sEE9msa/zWbQz3vDnIg
	OX9HH0Q4DGo03EdVgDKjp64yUKGpZAe8DFR77Tc9R+GtoiXVeDFYuTsoeO+cJJsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNa6KQIvxVddMz2TjDxPo/IhKuQ3j/AQWx0ba8Mi83eAhDQwJC8nENETqCy
	Yebl7X7A==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.303100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F99A50D39DB22728D64E0B3D9C7D062858A63D0629F3B6FE71372A746F0533C22000:8
X-MTK: N

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

Remove the maximum number of 1 for memory regions.
Instead, add some descriptions to ensure the integrity
of the documentation.

Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index d05d1563ec19..3362c8ffdccc 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -55,7 +55,9 @@ properties:
       initializing SCP.
 
   memory-region:
-    maxItems: 1
+    description:
+      List of phandles to the reserved memory nodes used by
+      remoteproc devices.
 
   cros-ec-rpmsg:
     $ref: /schemas/mfd/google,cros-ec.yaml
@@ -123,7 +125,9 @@ patternProperties:
           initializing sub cores of multi-core SCP.
 
       memory-region:
-        maxItems: 1
+        description:
+          List of phandles to the reserved memory nodes used by
+          remoteproc devices.
 
       cros-ec-rpmsg:
         $ref: /schemas/mfd/google,cros-ec.yaml
-- 
2.18.0

