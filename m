Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1D743E9C5;
	Wed,  6 May 2026 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074332; cv=none; b=Z83EpbmIP4nuCzneJY+mtvin+5LbrC9fSAyINsNeXf+/re3jiGB/ulhCln/JRNcYlfCpa1bX3/G+e1efnra3zXg2xP7BY4MtmEH9cLO2gW2tuKalTeXnioZr+7J9qDBv7PzOmBohK0XMGDIqVmV/F3Sk5MJ45hxz3hIt1oJaLHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074332; c=relaxed/simple;
	bh=7SyZS0ivEjgZA4nePQg5BQyqm+SCAEV96EdGsQWfh2I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qwmlrSV+jWlFKbKf5JBI50s60+DoMjpH63mgBNCDe+QQ7GKPs7RKxrU3pvweur+3btMnwRhzCKd/30V5Grij6DaTZNHekHrQzqB6VRwC4NoDEp+L82api7xKxe58uQBo8SnAt1gu8rBzBlvqw7/4pzUzj31N5qqd4NA6SmQEnUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=rP8jWi0S; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rP8jWi0S"
X-UUID: f86054c6494f11f1a4e839cc21f16abe-20260506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kVrS/dHQWKD+3tc6CAAThNJdve9BvuJWPhVI1OXqr40=;
	b=rP8jWi0SXFdbvuONLPyevH3YhsQaMs6fvbAyR3OFPfVKEqXvezjclJ64vkc3ogRHJbSaKg9P1/7ilMIs0qxqNmRNb+JrsPBsndL8GQY13+zoVjyi4JJVcX2djV0a27pYnwuBn4jwe4AyXaZ/QlCXn9aXvohvkEuP7/KuWKN2OLQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:595c8a3f-49c0-40e7-80a7-fccfd493f824,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:961ff5be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f86054c6494f11f1a4e839cc21f16abe-20260506
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1006408303; Wed, 06 May 2026 21:32:04 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 6 May 2026 21:32:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 6 May 2026 21:32:03 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Arnab Layek
	<arnab.layek@mediatek.com>
Subject: [PATCH] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions
Date: Wed, 6 May 2026 21:31:57 +0800
Message-ID: <20260506133157.3283204-1-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Update the memory-region property to support 1-2 reserved memory
regions instead of exactly one. This is needed for newer MediaTek
SoCs like MT8188 which require additional memory regions for SCP
operation.

Tested on MT8188 Geralt platform.

Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>
---
 .../devicetree/bindings/remoteproc/mtk,scp.yaml        | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index bdbb12118da4..9f6dca94ff40 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -55,7 +55,10 @@ properties:
       initializing SCP.
 
   memory-region:
-    maxItems: 1
+    description:
+      Phandle to the reserved memory regions.
+    minItems: 1
+    maxItems: 2
 
   cros-ec-rpmsg:
     $ref: /schemas/embedded-controller/google,cros-ec.yaml
@@ -123,7 +126,10 @@ patternProperties:
           initializing sub cores of multi-core SCP.
 
       memory-region:
-        maxItems: 1
+        description:
+          Phandle to the reserved memory regions.
+        minItems: 1
+        maxItems: 2
 
       cros-ec-rpmsg:
         $ref: /schemas/embedded-controller/google,cros-ec.yaml
-- 
2.45.2


