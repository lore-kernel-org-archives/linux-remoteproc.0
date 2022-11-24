Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67938C4321E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Nov 2022 18:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbiKXSom (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Nov 2022 13:44:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiKXSoQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Nov 2022 13:44:16 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F1E1255D1
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:57 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id t10so2886410ljj.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCbDdhCU6C696Dgr+KcJeNudOEXfabgqqfUOikaclDw=;
        b=ticfd9zXk1SZb3vS/CpEeZdloSzMmHFPTjOp+yblbvqqJM2+BAWsxWZ3iVkKUzQXyO
         aUF1amlU4+ivjNDzIeyxEcdqcDreqnuZioyWzqdKtYSMhDsmfZPya3B1DrYH4GokyewD
         6m3H/MDLof2hHuzmCbkXfALmTwIYbLdZeNwZRUpUYspNXBVJ1m5fYXTWagEGCxtj0OWU
         QEqMAqKc9RClFieP6JY3TPIdf6Dl+bwzhFbQ8sfDCIdEJ06J50ZM4cHXs5leNARYPQqm
         PTD2e9EtYtGFE3W01uQc2W/6nkvEUZzSJTYcqCtOppjZx0jen/mm5OYr7LZVpJkFvCvG
         rOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCbDdhCU6C696Dgr+KcJeNudOEXfabgqqfUOikaclDw=;
        b=C1aMT4OSx5H407w8v0zFtNtbIAAmbIuLcOh0imrujXYm+vb3C+nLPY32r/uThXcVPM
         bZyruyOjXhlfhaZWPs334kVAIxytLl798oe2IBlkpF5QoEF6yxXUwdhGq+kEiBjxN4qm
         9i9N8zD7DD5+6ot5HTkv7QMiLDQW46B8YPjH8MSI/dII4WofBbVOi0DqMMqOKX+owTh8
         52e3//fk9zdcV0jkIm+FKtUSnj2Zm8WkuyueYV3yGbviG7TFttlag256YkABUHsOWhIM
         D9C0mv4BkMv5fTFwoI2ckr0CnBO8TvAqzHRigNV8z+linXMX2VbHgYDCMjN4CEer5yOz
         8Zug==
X-Gm-Message-State: ANoB5plJ2ui3KOp5BNIuFvlGhfpoI0YGAbThTWnd5FlDyRkS2pPPwrAs
        HEgpNL4iS1Wpw8OyuJFWXB7jig==
X-Google-Smtp-Source: AA0mqf5zrdfY8PIExPw6CNMHhKVL8MHem/oKJMBXM6A05hrEFFbifhxZeMrsvPwFJMIfkKwYTOZI8A==
X-Received: by 2002:a2e:6a17:0:b0:277:fae:902e with SMTP id f23-20020a2e6a17000000b002770fae902emr7126150ljc.267.1669315435420;
        Thu, 24 Nov 2022 10:43:55 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v7-20020a2ea607000000b0026e0434eb1esm159098ljp.67.2022.11.24.10.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 10:43:54 -0800 (PST)
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
Subject: [PATCH v3 10/15] dt-bindings: remoteproc: qcom,sc8280xp-pas: split into separate file
Date:   Thu, 24 Nov 2022 19:43:28 +0100
Message-Id: <20221124184333.133911-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
References: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Split SC8280XP remote processor Peripheral Authentication Service bindings
into their own file to reduce complexity and make maintenance easier.

While moving correctly constrain the number of interrupts per specific
device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Drop if:then: for the clock and put it directly under properties.
2. Merge two if:then: clauses for setting interrupts.

Changes since v1:
1. Add qcom,qmp (not part of qcom,pas-common.yaml# anymore).
2. Add firmware-name to example.
3. Correct maxItems: 5 for interrupts.
---
 .../bindings/remoteproc/qcom,adsp.yaml        |  26 ----
 .../remoteproc/qcom,sc8280xp-pas.yaml         | 139 ++++++++++++++++++
 2 files changed, 139 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index b14a83da37c2..67a68a8edc44 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -30,9 +30,6 @@ properties:
       - qcom,sc8180x-adsp-pas
       - qcom,sc8180x-cdsp-pas
       - qcom,sc8180x-mpss-pas
-      - qcom,sc8280xp-adsp-pas
-      - qcom,sc8280xp-nsp0-pas
-      - qcom,sc8280xp-nsp1-pas
       - qcom,sdm660-adsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
@@ -76,9 +73,6 @@ allOf:
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
               - qcom,sc8180x-mpss-pas
-              - qcom,sc8280xp-adsp-pas
-              - qcom,sc8280xp-nsp0-pas
-              - qcom,sc8280xp-nsp1-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
     then:
@@ -123,9 +117,6 @@ allOf:
               - qcom,qcs404-wcss-pas
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
-              - qcom,sc8280xp-adsp-pas
-              - qcom,sc8280xp-nsp0-pas
-              - qcom,sc8280xp-nsp1-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
     then:
@@ -240,7 +231,6 @@ allOf:
             enum:
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
-              - qcom,sc8280xp-adsp-pas
     then:
       properties:
         power-domains:
@@ -252,22 +242,6 @@ allOf:
             - const: lcx
             - const: lmx
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc8280xp-nsp0-pas
-              - qcom,sc8280xp-nsp1-pas
-    then:
-      properties:
-        power-domains:
-          items:
-            - description: NSP power domain
-        power-domain-names:
-          items:
-            - const: nsp
-
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
new file mode 100644
index 000000000000..c08274aaa6f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC8280XP Peripheral Authentication Service
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm SC8280XP SoC Peripheral Authentication Service loads and boots
+  firmware on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc8280xp-adsp-pas
+      - qcom,sc8280xp-nsp0-pas
+      - qcom,sc8280xp-nsp1-pas
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
+  smd-edge: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc8280xp-nsp0-pas
+            - qcom,sc8280xp-nsp1-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+    else:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc8280xp-adsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: LCX power domain
+            - description: LMX power domain
+        power-domain-names:
+          items:
+            - const: lcx
+            - const: lmx
+    else:
+      properties:
+        power-domains:
+          items:
+            - description: NSP power domain
+        power-domain-names:
+          items:
+            - const: nsp
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@3000000 {
+        compatible = "qcom,sc8280xp-adsp-pas";
+        reg = <0x03000000 0x100>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        firmware-name = "qcom/sc8280xp/qcadsp8280.mbn";
+
+        interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack", "shutdown-ack";
+
+        memory-region = <&pil_adsp_mem>;
+
+        power-domains = <&rpmhpd SC8280XP_LCX>,
+                        <&rpmhpd SC8280XP_LMX>;
+        power-domain-names = "lcx", "lmx";
+
+        qcom,qmp = <&aoss_qmp>;
+        qcom,smem-states = <&smp2p_adsp_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_CLIENT_LPASS
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "lpass";
+            qcom,remote-pid = <2>;
+
+            /* ... */
+        };
+    };
-- 
2.34.1

