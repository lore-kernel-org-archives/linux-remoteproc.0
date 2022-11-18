Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AED1C4321E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Nov 2022 12:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241362AbiKRMeU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Nov 2022 07:34:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241422AbiKRMeT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Nov 2022 07:34:19 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63D182BCA
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Nov 2022 04:34:16 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id x21so6567007ljg.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Nov 2022 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHIWsuWq1sJqpXghdZbQ2VG/V0PuVQZFCFnnBWylORo=;
        b=yOR668t5PGhUblc2ybt3/XYn036PrCbIftEcYaEJp1sDiOsUF3GyqcLUyTRUCJpw+U
         O04Hn3hlb6pbY/Ek8q4Wlp0hH0b7GdHePCmxTqJBL4obnAOalv/JDK3FG5qgKgqdZyTP
         V7nO6ibqMgvkHGSvna7rUU3sVvv9UDivZ6X+eedxli6fZbYSWg34tuMYbVzI5Fjy6w+V
         zr+BSIRfOBc6QbWgxGrOdYRnNXVLz40CsEn/GvvfszBOaFObO25SunmDTuIbnB3NQbPd
         ua6PWyG4Nawd0MH5uFYUf3mhq0PSSZjuAPn4YTtFm04cDesXo2bH4BrBl3nAYabZORMs
         Aiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHIWsuWq1sJqpXghdZbQ2VG/V0PuVQZFCFnnBWylORo=;
        b=ikLNp1MBX9jcE0L9w8uCo8ZnuiSp3jQ/IHSbLzxSknvlrnlOGlyYmAlkT95t6763hE
         5FPfE89UDYJYcj01tbHfvhRYxjnloxPUl9Q5pJ+PuM88CDr4qn64qXF5tUDEmDrynUYe
         RR7KyO/Q0TGavKHP3x87gmYlhHroBkxfVbDE+/dWYGPZ1arYFCQIBp7vgwWgplqEkidL
         5mIgGNIbSBSEZrYYlpufP7s3aJxxLaFIuCnHyBi1sSK5rjYh6I7+jMkkMQ24QxwVh9ha
         1DoW+I4jTIAmslainTJ52Qt35gWzPoEG75vrDb6PJWcqg1/a91Bp7m1C98/vu+OA3LB2
         qDWA==
X-Gm-Message-State: ANoB5pnF8m9Wo8Y4qIqoAz5Zim9X9r/QjNw4dN6nkbNswXAqzKMcOSDS
        S9LMGsDUi9O6FRaRiiYVygrhtw==
X-Google-Smtp-Source: AA0mqf6vgdo3w8XsWt2BU2xeJ62fXk2PUPbFG3KwmeuUEjhZnPxXNphDvnwrCKAFtddnvP7sN/aQkA==
X-Received: by 2002:a05:651c:1797:b0:277:1caf:679e with SMTP id bn23-20020a05651c179700b002771caf679emr2651522ljb.115.1668774855004;
        Fri, 18 Nov 2022 04:34:15 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m10-20020a19434a000000b004ac088fdfd2sm645833lfj.85.2022.11.18.04.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:34:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/7] dt-bindings: remoteproc: qcom,adsp: split common part
Date:   Fri, 18 Nov 2022 13:33:56 +0100
Message-Id: <20221118123402.95784-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118123402.95784-1-krzysztof.kozlowski@linaro.org>
References: <20221118123402.95784-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Split common part of Qualcomm SoC Peripheral Image Loader / Peripheral
Authentication Service bindings into a re-usable schema file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Keep resets, reset-names, qcom,qmp and qcom,halt-regs in qcom,adsp,
   because they are not shared with most of PAS bindings.
---
 .../bindings/remoteproc/qcom,adsp.yaml        | 81 +---------------
 .../bindings/remoteproc/qcom,pas-common.yaml  | 97 +++++++++++++++++++
 2 files changed, 99 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index db9e0f0c2bea..bd4082411bf5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -59,37 +59,6 @@ properties:
   reg:
     maxItems: 1
 
-  clocks:
-    minItems: 1
-    maxItems: 8
-
-  clock-names:
-    minItems: 1
-    maxItems: 8
-
-  interconnects:
-    maxItems: 1
-
-  interrupts:
-    minItems: 5
-    items:
-      - description: Watchdog interrupt
-      - description: Fatal interrupt
-      - description: Ready interrupt
-      - description: Handover interrupt
-      - description: Stop acknowledge interrupt
-      - description: Shutdown acknowledge interrupt
-
-  interrupt-names:
-    minItems: 5
-    items:
-      - const: wdog
-      - const: fatal
-      - const: ready
-      - const: handover
-      - const: stop-ack
-      - const: shutdown-ack
-
   resets:
     minItems: 1
     maxItems: 3
@@ -104,37 +73,10 @@ properties:
   px-supply:
     description: Phandle to the PX regulator
 
-  power-domains:
-    minItems: 1
-    maxItems: 3
-
-  power-domain-names:
-    minItems: 1
-    maxItems: 3
-
-  firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: Firmware name for the Hexagon core
-
-  memory-region:
-    maxItems: 1
-    description: Reference to the reserved-memory for the Hexagon core
-
   qcom,qmp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Reference to the AOSS side-channel message RAM.
 
-  qcom,smem-states:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: States used by the AP to signal the Hexagon core
-    items:
-      - description: Stop the modem
-
-  qcom,smem-state-names:
-    description: The names of the state bits used for SMP2P output
-    items:
-      - const: stop
-
   qcom,halt-regs:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
@@ -147,32 +89,13 @@ properties:
       Phandle reference to a syscon representing TCSR followed by the
       three offsets within syscon for q6, modem and nc halt registers.
 
-  smd-edge:
-    $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
-    description:
-      Qualcomm Shared Memory subnode which represents communication edge,
-      channels and devices related to the ADSP.
-    unevaluatedProperties: false
-
-  glink-edge:
-    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
-    description:
-      Qualcomm G-Link subnode which represents communication edge, channels
-      and devices related to the ADSP.
-
 required:
   - compatible
-  - clocks
-  - clock-names
-  - interrupts
-  - interrupt-names
-  - memory-region
-  - qcom,smem-states
-  - qcom,smem-state-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
new file mode 100644
index 000000000000..9729ba79f28f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,pas-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Peripheral Authentication Service shared parts
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Shared parts of Qualcomm Peripheral Authentication Service.
+
+properties:
+  clocks:
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+
+  interconnects:
+    maxItems: 1
+
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
+  power-domains:
+    minItems: 1
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 1
+    maxItems: 3
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
+  memory-region:
+    maxItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop the modem
+
+  qcom,smem-state-names:
+    description: The names of the state bits used for SMP2P output
+    items:
+      - const: stop
+
+  smd-edge:
+    $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
+    description:
+      Qualcomm Shared Memory subnode which represents communication edge,
+      channels and devices related to the ADSP.
+    unevaluatedProperties: false
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the ADSP.
+    unevaluatedProperties: false
+
+required:
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - memory-region
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+additionalProperties: true
-- 
2.34.1

