Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1E620F071;
	Tue, 18 Mar 2025 22:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742336684; cv=none; b=aUGhqUv/VoWK8GyM5Aa3R3GhXPyxNzqx2whDKiHN2ar/eDAi5pRgFZzEU/KC7yxQhqMgCHUKrQDEhyAyvJlpIFUoAfeQDokI4GBpbmWfJyaa6qvBwvLOR+xaDcN8NeavPbAz/ttAW87xukEFmkMEY/xm+5AIRake9iUxrarA28k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742336684; c=relaxed/simple;
	bh=ebGgU8hC64Kx1MeaVNKAzJY5DqxxZk54iPOshavrJOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tw7/bm5jkjMeUO6djpUyjwJzJdREZPf5+Exz0DjdxiU2IqHluORHHegjO+K8fxH7i6Pnzid/z+mtP4RpiogvUPCaHpB8aWYJdvWyOJwMiZ3gcjm1YWKUVncFa8StkxGUWRsT1BCRTNB2lpOPqRbhIQTrrNN2bFHxPZX4uGIu2Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H85OROV8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H85OROV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336681;
	bh=ebGgU8hC64Kx1MeaVNKAzJY5DqxxZk54iPOshavrJOQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H85OROV8YeghJXytIplf5CcPOR7ZCEqVXqfu6vLBY8AfJxPraTyWE5X1VnOcGRLf7
	 j45/TRpM1MxGTYrfZUOQwPUp+yzdrugLE/fRdcgHesoAleL8B91N9iY+BmhvpZgvis
	 g/VkOlq7XpOCelkbpo/oFreA2TM/GkniSaA7Ei6WyosFrMBW5rB2owyQ9nBmOMdIdq
	 kiwDi0N/AkmCCKgmM40xmcb+69WQFeHxMzWuJltOq/HRXF0mWy4QTx/nAJeZMiMFHs
	 P6nAxzD+3RDQvH4qzoqzaSN+Z1vWaY1TmDVUrfNsuhEAWzNbOb+L21/0BHjeYWw1Ho
	 mEIMworYuAP+w==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E27C317E0FD1;
	Tue, 18 Mar 2025 23:24:37 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 18 Mar 2025 18:22:16 -0400
Subject: [PATCH 2/4] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

The SCP present on MT8188 does not have an L1TCM memory region, but the
binding incorrectly requires one for the dual-core description of the
MT8188 SCP. Remove that requirement. Also update the minimum number of
reg and reg-names to 1, since as this is a multi-core SCP with no
L1TCM memory, only the CFG memory region is present in the parent node.

Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../devicetree/bindings/remoteproc/mtk,scp.yaml       | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index ee33c233e44f3d51f0851b35697a24208c87f68a..04348cfcb0424dc78ff1ddd77665285a052925e9 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -28,11 +28,11 @@ properties:
     description:
       Should contain the address ranges for memory regions SRAM, CFG, and,
       on some platforms, L1TCM.
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   clocks:
@@ -171,6 +171,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 2
         reg-names:
           items:
@@ -196,16 +197,28 @@ allOf:
       properties:
         compatible:
           enum:
-            - mediatek,mt8188-scp-dual
             - mediatek,mt8195-scp-dual
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 2
         reg-names:
           items:
             - const: cfg
             - const: l1tcm
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: cfg
 
 additionalProperties: false
 

-- 
2.49.0

