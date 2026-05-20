Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7027D3DB322;
	Wed, 20 May 2026 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276409; cv=none; b=HfpN9TQ6hWVx6xBdIyPA6C57XjDnzi0sq+cfjjAZJ3EE0nHYw5x2tDmxnU/5gJVTspRb6Dyrtd0WQ9kxzDxi7p26sZmjgOszx+LjXirTPjJNHWmsvCVXqfUhikkZHWPNLzhGGKi5QRUa44D5p/jlAbFRClqbbp/7BUsS2o7qBhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276409; c=relaxed/simple;
	bh=uk3KlzLDz/RNxns7096r7xifjYgyvp1l4LW0K6Y5DKI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IIc8mBm+VrAx0x3X7KascgrPPSrwWWeV3vKmD8DujH4jOnvC7t8NFCj6m7SeNnMn4zu/4G2fYGiaiHPX25leimGoCfJiIEUmnXVVPiUFNahFYtIA3Or7GI1IG+36Q2o4F+3xYS/H8mfVtdwfEquu3DbcyRkPWzz1T8ybtESECwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LN20goIK; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LN20goIK"
X-UUID: c41383ec543e11f1a3561939bc42ff46-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1piNjmrlWSwikIHnqy+RsZoVhgioTg2emaClTHlJItE=;
	b=LN20goIK3JgYnXxlMPdzdH6bYrvYZJEVLJxKPeyzmRgqbGFIEuCI6v4kAVw0pBFz/6ChRXNuL3r8ATRkmEgtmGgoIs0skvGNzpRg+Hu3xDDyDdnk6X/xgbQ1o9FRrhXYgU/QgGViwt+dc/WiPVLofD0nIw8aQklGgP6y8tQDOIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:b2e2d4b1-581b-45bd-8713-0d755f7062f4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:7fbd2322-bef7-463f-902c-5f40f7404c33,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c41383ec543e11f1a3561939bc42ff46-20260520
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1911022330; Wed, 20 May 2026 19:26:37 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 19:26:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 19:26:36 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Arnab Layek
	<arnab.layek@mediatek.com>
Subject: [PATCH v4 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Wed, 20 May 2026 19:26:29 +0800
Message-ID: <20260520112629.3420612-2-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260520112629.3420612-1-arnab.layek@mediatek.com>
References: <20260520112629.3420612-1-arnab.layek@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The MT8188 SCP can use either one or two reserved memory regions:
- Required: Main SCP SRAM memory region (mandatory for SCP operation)
- Optional: SCP L1TCM memory region (Level 1 Tightly Coupled Memory,
  used for performance optimization when available, but not required
  for basic SCP functionality)

Other MediaTek SoCs (MT8183, MT8186, MT8192, MT8195) use only a single
memory region and must remain restricted to one region for backward
compatibility.

Update the base schema to allow 1-2 memory regions (minItems: 1,
maxItems: 2), following the pattern used by other MediaTek dt-bindings
like mediatek,vcodec-encoder.yaml where the base property defines a
permissive range accommodating all device variants.

Add two conditionals:
1. Explicitly restrict non-MT8188 devices to maxItems: 1
2. Document MT8188's two regions with descriptions (minItems: 1 makes
   the L1TCM region optional, allowing boards to specify 1-2 regions
   based on hardware configuration)

This approach maintains backward compatibility while enabling MT8188 to
specify 1-2 memory regions depending on board design and performance
requirements.

Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index bdbb12118da4..fca9b0675eae 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -55,7 +55,8 @@ properties:
       initializing SCP.
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   cros-ec-rpmsg:
     $ref: /schemas/embedded-controller/google,cros-ec.yaml
@@ -123,7 +124,8 @@ patternProperties:
           initializing sub cores of multi-core SCP.
 
       memory-region:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
 
       cros-ec-rpmsg:
         $ref: /schemas/embedded-controller/google,cros-ec.yaml
@@ -205,6 +207,45 @@ allOf:
           items:
             - const: cfg
             - const: l1tcm
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8183-scp
+            - mediatek,mt8186-scp
+            - mediatek,mt8192-scp
+            - mediatek,mt8195-scp
+            - mediatek,mt8195-scp-dual
+    then:
+      properties:
+        memory-region:
+          maxItems: 1
+      patternProperties:
+        "^scp@[a-f0-9]+$":
+          properties:
+            memory-region:
+              maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8188-scp
+            - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        memory-region:
+          minItems: 1
+          items:
+            - description: Main SCP SRAM memory region
+            - description: Optional SCP L1TCM memory region
+      patternProperties:
+        "^scp@[a-f0-9]+$":
+          properties:
+            memory-region:
+              minItems: 1
+              items:
+                - description: Main SCP SRAM memory region
+                - description: Optional SCP L1TCM memory region
 
 additionalProperties: false
 
-- 
2.45.2
