Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861E9C43219
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Nov 2022 18:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiKXSoz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Nov 2022 13:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiKXSoY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Nov 2022 13:44:24 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9961A13396F
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:44:00 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id a15so2848650ljb.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yDE3gRUNG67QM74MH23NrqOxB5UmpZn9c+KMHml1Tg=;
        b=flDS2b0G431Ael55u4XvBgIdPcY0/tcfoay6S8aRcUCQQYnAeOGkAHzYtKgbzHDQZj
         Appvy3+589mSyojvsHBWQnIAftbxKUMLqknmn7ygiTbolRDE6iW9VYpc2jgEz29xbdiS
         6pPTrm5cl6+ZidZNKzWR0G653TMIQKQG+wMfVX8qBAay2AJm7VgXI/1S5s7xJ4+Qox8C
         5QT7rlR3OyjH3mx7s2fY3TKUcCOqjnUAQP2rBERFdPCn8VbgKs3IvX4GQfEL/8JdBXKz
         oKhArWVjy5+4awHVxZGmziaTBoH1gDijgEzrwxanSEuDwIB/cFH90WuhuvPFY0fR7KCY
         Zh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yDE3gRUNG67QM74MH23NrqOxB5UmpZn9c+KMHml1Tg=;
        b=5aNOv3JmAPL13MiMEPNOLwMP9JcNO+04jiYWH+Kb9SavWchPYfD2sAKmsvVGfwjnjP
         duOUQJICLK1MG4hrxLjGL4tcot0hmnE/oGiy682b6XZeBVfJyLLA4QfYalYfSStqVWmX
         33O427LILXYmm9BxDRmUHTtbHGKbFTYEhmEZK60yFyRbSr/yGHWLk4WP1LAq7LZ3Dnvn
         3PBlsvdj1B6SqY4OMnEPEzgyjiSHAvvMcpoFZxqZ6wQtG98YNDeE6RbDkL8yE/Wto0n+
         ggOtJ+HyxbJaYf8Ew3+z+mhEGhFLVbh/Hw8+tvM98Tksqfe3LgiOrw0zAMTjD8mlMrNa
         kIgQ==
X-Gm-Message-State: ANoB5pkJHrH1ebP1fg9YtMfPy9eemVAmXDlO2yN2MThNRHD0cR5Xb1gl
        djLqZJA+WMuPq7ICTQUFPSswAg==
X-Google-Smtp-Source: AA0mqf64hjLBIk366+jisGSi2sQaCYHQutz3nogH6c63mAGFQvmMIm4fkSYiAaSXqzY8nxpiryyd0A==
X-Received: by 2002:a05:651c:906:b0:279:1349:b2e2 with SMTP id e6-20020a05651c090600b002791349b2e2mr10464425ljq.382.1669315438899;
        Thu, 24 Nov 2022 10:43:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v7-20020a2ea607000000b0026e0434eb1esm159098ljp.67.2022.11.24.10.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 10:43:58 -0800 (PST)
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
Subject: [PATCH v3 13/15] dt-bindings: remoteproc: qcom,qcs404-pas: split into separate file
Date:   Thu, 24 Nov 2022 19:43:31 +0100
Message-Id: <20221124184333.133911-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
References: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Split QCS404 remote processor Peripheral Authentication Service bindings
into their own file to reduce complexity and make maintenance easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. New patch.
---
 .../bindings/remoteproc/qcom,adsp.yaml        | 12 ---
 .../bindings/remoteproc/qcom,qcs404-pas.yaml  | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 10c96445da11..9fdfa9476ca9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -22,9 +22,6 @@ properties:
       - qcom,msm8996-slpi-pil
       - qcom,msm8998-adsp-pas
       - qcom,msm8998-slpi-pas
-      - qcom,qcs404-adsp-pas
-      - qcom,qcs404-cdsp-pas
-      - qcom,qcs404-wcss-pas
       - qcom,sc7180-mpss-pas
       - qcom,sc7280-mpss-pas
       - qcom,sdm660-adsp-pas
@@ -61,9 +58,6 @@ allOf:
               - qcom,msm8996-adsp-pil
               - qcom,msm8996-slpi-pil
               - qcom,msm8998-adsp-pas
-              - qcom,qcs404-adsp-pas
-              - qcom,qcs404-cdsp-pas
-              - qcom,qcs404-wcss-pas
               - qcom,sc7180-mpss-pas
               - qcom,sc7280-mpss-pas
               - qcom,sdm845-adsp-pas
@@ -105,9 +99,6 @@ allOf:
               - qcom,msm8996-slpi-pil
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
-              - qcom,qcs404-adsp-pas
-              - qcom,qcs404-cdsp-pas
-              - qcom,qcs404-wcss-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
     then:
@@ -223,9 +214,6 @@ allOf:
               - qcom,msm8996-slpi-pil
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
-              - qcom,qcs404-adsp-pas
-              - qcom,qcs404-cdsp-pas
-              - qcom,qcs404-wcss-pas
               - qcom,sdm660-adsp-pas
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
new file mode 100644
index 000000000000..007349ef51ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,qcs404-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCS404 Peripheral Authentication Service
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm QCS404 SoC Peripheral Authentication Service loads and boots
+  firmware on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs404-adsp-pas
+      - qcom,qcs404-cdsp-pas
+      - qcom,qcs404-wcss-pas
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
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    maxItems: 5
+
+  power-domains: false
+  power-domain-names: false
+  smd-edge: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    remoteproc@c700000 {
+        compatible = "qcom,qcs404-adsp-pas";
+        reg = <0x0c700000 0x4040>;
+
+        clocks = <&xo_board>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 293 IRQ_TYPE_EDGE_RISING>,
+                              <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack";
+
+        memory-region = <&adsp_fw_mem>;
+
+        qcom,smem-states = <&adsp_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts = <GIC_SPI 289 IRQ_TYPE_EDGE_RISING>;
+
+            qcom,remote-pid = <2>;
+            mboxes = <&apcs_glb 8>;
+
+            label = "adsp";
+        };
+    };
-- 
2.34.1

