Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C8F1F130C;
	Mon, 21 Apr 2025 20:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745268577; cv=none; b=cTGGCv4vVcqMWm0JGpblzP8LNmRUE81kmguRp8aH/5unUqmmnURh4X53W0RbBQ36VJUdL84uie5ZlE99g7u7tHpeUt4uj4sOew2tJ12lfqHxe+MugAN44lXNTd5H/uZ6xgBNf1Rf5qizrGr1g9DkY77WNYKQtA4eluh9WOi4CaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745268577; c=relaxed/simple;
	bh=1wIDWPEibG09Jj0SDTOitc8WPtvsWbMRGzVMJKc/3OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zy7OE5SFZE0+ylCU/LZPJ+tdiwPh7O9h/k0kZOiRUOqlMa1aFuARk74NHJNRgSeH3C9tg4FG4ME/MqKppYB4VxPca3aCXGPK47/9iafLX6vwCXXiTUli9udlV9pxNemovoAglLLlYY4eq3jGZ/zYRPmSjjHXpSNNjIYqY3MTp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M6y2QRed; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M6y2QRed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745268573;
	bh=1wIDWPEibG09Jj0SDTOitc8WPtvsWbMRGzVMJKc/3OQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M6y2QRed+ZGlksJm+Purl5Bs7WbVSSBr91Kkv6uVY6KTuX0UhtyQEZdXQ5uh2cjbR
	 6h1t3d0C3jz18vXmy3mgcVRY9NfIkt3fUzzXqPSNxFx6J9l2mXnInj751O39YzyK3E
	 JAUM3s4sDSMxMvasDo2AajPNUC09CXuQrAFk6Zqgk+A9mYXxBY6ZuyC6nYvJQxYBV2
	 l05vPUZUS/FYQpy3ysUpPKYlxyRpKA9EpauP116VbjKLXc6ABKZOGh6KcuPdZ9cL3w
	 8XILwUuABJXYrS/6FtRbbsEKwkdZtS2rOUBUlyObGophE4ewyR9dTyCSdEGmGXNp1b
	 npJz8Sc/9F4Gw==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5A1D17E09B5;
	Mon, 21 Apr 2025 22:49:30 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 21 Apr 2025 16:49:05 -0400
Subject: [PATCH v2 2/5] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-scp-dual-core-mt8390-v2-2-c84117a959a9@collabora.com>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

