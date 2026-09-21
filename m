Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35FB47D928;
	Mon, 21 Sep 2026 23:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033130; cv=none; b=H9r8AbC9ceJil08I0YkM8I9dohdOPzKNRdTp40pAlPGYrV2e4J3g8N5nxjkOMDVmPQF5aNHxiCwHRqNVVd7iq2ehEFtEkc9NqU9Hp0324PafRrxj4k/WfseKVxCYfDA6QUpjn2HTnmtOObcyi7t6RzDRjIuQCvCnAoN+40eELQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033130; c=relaxed/simple;
	bh=HPCKNkww8LmU0HYS7C9/vUmGRaos+9Fe1ZFZyEU10to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kWyqIahELPsi5gaYUTgzw7fGx/yO6rVbxa6D10KBCJtEvLNPJaPOvSLJNuSHsV3GQ4LmfzswKhrMK+2Ea3tuvPnDuP7WLLw7Gi1GL/NvUohPn6RljzOw20sbpxpoOeaCmpHr09hIfZYxlRI0O+lSTFYymAdOUUC7kXh1Gm8K6Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFShLVFL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFShLVFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE431F000FF;
	Mon, 21 Sep 2026 23:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033123;
	bh=6I1c2DKea4EEAi8SLaXvb55Qi01ll52Fv9Ok3/gsA0U=;
	h=From:To:Cc:Subject:Date;
	b=lFShLVFLoiJWchmE1b7VGA36VTzuP1kn0UQ38IfKlVlQrWmYn/JkUccia0GaV4xFK
	 0LY0w4qE5UYm2WG3x1sUTGgzrGo8lxL1E5X8N5nXVnhK/XvfLZ9f8f9JUQG4fL9o0e
	 8OeDWw/uBx6Uucc46yqlwJP+A7v6KKYUb+JpvCkvknmvKi1GK1jpKjn0ZrXutxAkOB
	 HhPk/Och7EriEHR352q9JaaXThNJkUWMHEUBhqOQgAQv8/QEBbJFOJdj2/ay1KP+w7
	 9zETy60uNDBgrK5wQeFGXbkfeg/YGUX49h4nJMi7rrZUr0ap7uTLMClUYupU/Z10zK
	 mnynxz0k5LLMg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: remoteproc: Fix MT8188 SCP regs
Date: Mon, 21 Sep 2026 18:25:19 -0500
Message-ID: <20260921232520.3127457-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow single-register MT8188 SCP dual nodes with only the cfg
region. Keep two-register and three-register requirements for the
other MediaTek SCP variants that need SRAM and L1TCM regions.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index bdbb12118da4..2f0a28c7a24c 100644
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
@@ -185,6 +186,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 3
           maxItems: 3
         reg-names:
           items:
@@ -195,17 +197,31 @@ allOf:
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
+          minItems: 1
+          maxItems: 1
+        reg-names:
+          items:
+            - const: cfg
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

