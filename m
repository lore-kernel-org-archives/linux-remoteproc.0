Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674F123EA80;
	Thu, 15 Jan 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768475813; cv=none; b=ft0Siqbex35KPsET//TdZSgXRPz9oT/F5WdIyxcLlL37rqFVNgdfdq/QEohrDaDjBh6Ksb18z2AZRGPbeRHqXen7GDtpVI/yhRf2QCArpDFtHJCA+BTZaeFOkUcMgVbfrY06cpeVieKq1WQOy7ePw7WY+czBRn+go7VD8t5Yo+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768475813; c=relaxed/simple;
	bh=gDZnxx6q0qOAWO0hBNhp6yUK/DLiEBqTd5LIFfrJ1sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X/7L0r67DwjV7gQKmWbpNEXay6nL2jDHIdQBPOAS2vk18uk3LdHJ+5qy96Lkjs2qwHy2LoRKu3xGFSbql7XPtYNoh7cvqwDeKBD5EvJIXoiBE6+2ket+d5GSJQSQ12w8Ub7ERabgHXvohv+2znoj5w9dESMWak6gAFje6MUVa/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gTE6zypq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gTE6zypq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768475810;
	bh=gDZnxx6q0qOAWO0hBNhp6yUK/DLiEBqTd5LIFfrJ1sQ=;
	h=From:To:Cc:Subject:Date:From;
	b=gTE6zypqItfbmjm4GsreCssgWqf+84qPC4TokgTWJNKpwq5RYs5tHiEH3uJn/m99u
	 AH8FwNMvh1YyfIWI/e2MusG9Djm3r6VBt/kXeR6jfYjiSWu+F0gYX2M20ZicFEK680
	 0u0w4kedPWkziui13uMLqPQWmBJOIDj3whkJRnySwQvPozQ5pQh4O8G+2ABsWhZE3y
	 cxukh4oKq8JUJxKdQPzTM6LvMKqT5JEdYZUj4MmNjiW3YRsH1RYzZc/sLCMWXnXibJ
	 ymJ35HYNQasnzrxYo96OvH82COZ8Hs4YMvhpFGZFOhrmDPriEA6S/FHmj1DplKK1n8
	 Ef25U81+5sVXA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E019717E10C8;
	Thu, 15 Jan 2026 12:16:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tinghan.shen@mediatek.com,
	olivia.wen@mediatek.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2] dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO from MT8188 dual
Date: Thu, 15 Jan 2026 12:16:45 +0100
Message-ID: <20260115111645.63295-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though the MT8188 SoC's Dual-Core SCP IP is practically the
same as the one found on MT8195, it doesn't have a dedicated L1
TCM and relies only on SRAM.

Set reg/reg-names minItems to 1 globally and override it in all of
the conditionals for the SoCs that require more, and then split
the mt8195/8188 conditionals to allow specifying only the cfg MMIO
on MT8188.

Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v2:
 - Fix dtc warnings and validate again

  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/remoteproc/mtk,scp.example.dts
  DTC [C] Documentation/devicetree/bindings/remoteproc/mtk,scp.example.dtb
Done.

 .../bindings/remoteproc/mtk,scp.yaml          | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 179c98b33b4d..f0cae3e4bc78 100644
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
@@ -185,7 +185,7 @@ allOf:
     then:
       properties:
         reg:
-          maxItems: 3
+          minItems: 3
         reg-names:
           items:
             - const: sram
@@ -196,11 +196,22 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: cfg
+  - if:
+      properties:
+        compatible:
+          enum:
             - mediatek,mt8195-scp-dual
     then:
       properties:
         reg:
-          maxItems: 2
+          minItems: 2
         reg-names:
           items:
             - const: cfg
-- 
2.52.0

