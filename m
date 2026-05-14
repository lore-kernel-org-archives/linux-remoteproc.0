Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF36394497;
	Thu, 14 May 2026 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759147; cv=none; b=TRU2BM+YtoBXNJcwA8eYNWWx8WyJ4bCdNdSZFmxdL9ZIEbNn4NLU7uWXdYokTE9ITambglCEImr2JJr711tk4aht0XjxCGqrQfxtiAkivxYlv2M+gLxoeYzS7OHzjFKYJmm1k+O7japIgHyAZEd3r5rV/kRbl0qVGjN9xQgIia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759147; c=relaxed/simple;
	bh=nJYVklzZgfyD2RnpmOAVf1w41BxMFSISQ1XYfztf0wM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlgVNmbn56Oxj2G85ZAwFH2iY/BXZZ5QbUOTgktqZFM6n67dEIQc7gDrCc9kiwYsPRL2O7h7mzXdpttJqJEN1TUmiGjuFbW2g3UstUiS4uZoxpKyldZe2oX76QTqLQac477icKGaqTGDtXe9TZzwfL1zXXfRcmXu0Xq5lTCRVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LiS42PMW; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LiS42PMW"
X-UUID: 6de5fdf04f8a11f1a3561939bc42ff46-20260514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kJQqS4PQIMT43o0/jBTZZXHcdzByOY4XAL5JDZHdgEc=;
	b=LiS42PMWA29jcC+1YTjT4BR4uVMtg9kbQbm3WXFysvHGQ071UdTkpu0EB08Ro3hLXzhRsH//IUrsJnuYOXEW0o7Ia73EwQDNaDx5+kelrqnXzyURX3vePdqPjTYUW+88h9rVfwrcY41XCrj8IxaCW5j5CwdVBOXY8WfDqcJYc3Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:18b35e0d-62fc-4a25-9458-b6509b22cc23,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:79bd41c8-ea23-4b4b-9221-06b52a563801,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6de5fdf04f8a11f1a3561939bc42ff46-20260514
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2062673648; Thu, 14 May 2026 19:45:39 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 14 May 2026 19:45:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 14 May 2026 19:45:37 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <arnab.layek@mediatek.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Thu, 14 May 2026 19:45:33 +0800
Message-ID: <20260514114533.174008-2-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260514114533.174008-1-arnab.layek@mediatek.com>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
 <20260514114533.174008-1-arnab.layek@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The MT8188 SCP requires support for 1-2 reserved memory regions, while
other MediaTek SoCs use only a single memory region.

The schema uses a permissive base with restrictive conditionals:
1) Base schema allows all devices minItems: 1, maxItems: 2
2) Non-MT8188 devices (mt8183, mt8186, mt8192, mt8195, mt8195-dual) are
   restricted to maxItems: 1, overriding the base
3) MT8188 devices (mt8188, mt8188-dual) set minItems: 1 with item
   descriptions, inheriting maxItems: 2 from base, making the second
   L1TCM region optional

This follows the same pattern as other MediaTek dt-bindings such as
mediatek,jpeg-encoder.yaml which uses conditional schemas to support
different numbers of iommus per device variant.

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
