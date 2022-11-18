Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC9CC43217
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Nov 2022 12:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241879AbiKRMev (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Nov 2022 07:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241876AbiKRMeb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Nov 2022 07:34:31 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CCE8C0AD
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Nov 2022 04:34:24 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id t10so6669010ljj.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Nov 2022 04:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgzFpCzI8B2uXD6MokXq+lK9vzCjNqEEJmXSaPDrhbY=;
        b=jBPMlBm3DNRITFRa2ci3giO9q+xRos8iH0QVb+s8XacjOXIEmPG3VurZt4BdkKuUBB
         DTs+muxaynTU2wAZuK+8vNYBBljixPF6XSISk0PJLqHi5WPqOqfXaaAC6kqed+yHcPVi
         Z/VG7o6EfV9aBT1zO3/9hYDIPGMqg5TWvDW4osi8nQ/wVyvgf+GWRbcBlz29HpaUgEbX
         ZDcProPwoZrrjENIqnB8/Fhql6yg/L3TszRb7gurxGqKSCtevWq2HsvQmNlIXPu+hfOQ
         hBgtlLJIfPnEXLw+HQrN5GE3udIK+SEguTF4RZxAV+NxQ5yA8x7lz0IfGxVOqMlNWwU7
         qEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgzFpCzI8B2uXD6MokXq+lK9vzCjNqEEJmXSaPDrhbY=;
        b=pgoKqGBIsXRKM/4+ef6glZ5TBlfrIVB0nC4yqyMvrGWRzra+t/qeBzdOOGh4/+HdGe
         qw/6dMpi5ePlYcQpfdStW4ok/rH3tR64BGVgWF61AuyG9OQr0nIZ+7LE0G5iZ5TZmzOB
         HlxVBJyDr0E3VrpAEgP1BBFF4jFKC2DBYP8FcUDNhgH/1F0BtLKIbinKNQItlNI67cKX
         3TBlBxrxE41NcOozutLvHTekLJNxpt4eUJyqVkHQO/r27ffmOBzla9WCBmQypP7i3YZ/
         kiZoi2QdD8Jg6zZ6VW+TPGguSImoCw4p6/GO87jcIVFAecRrL/5aoE2AQyBu+SGJZX3q
         VtrA==
X-Gm-Message-State: ANoB5pkfzmx8ZdtJmyft8Z5zgYDPiw3NlGColaUHmZhllPzAgBkhmAXS
        yXXwrl+5T4x4+FZFUf0BO+B2Tw==
X-Google-Smtp-Source: AA0mqf6KxcK5wCNohwnNhQpc+G4qT5ssBFPbM5UwddedcYyJujnxufqKb9YY8FvOx8uoo1RTyYcG2Q==
X-Received: by 2002:a05:651c:1993:b0:26c:4fb:b084 with SMTP id bx19-20020a05651c199300b0026c04fbb084mr2310631ljb.383.1668774863204;
        Fri, 18 Nov 2022 04:34:23 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m10-20020a19434a000000b004ac088fdfd2sm645833lfj.85.2022.11.18.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:34:22 -0800 (PST)
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
Subject: [PATCH v2 7/7] dt-bindings: remoteproc: qcom,sdx55-pas: split into separate file
Date:   Fri, 18 Nov 2022 13:34:02 +0100
Message-Id: <20221118123402.95784-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118123402.95784-1-krzysztof.kozlowski@linaro.org>
References: <20221118123402.95784-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Split SDX55 remote processor Peripheral Authentication Service bindings
into their own file to reduce complexity and make maintenance easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch.
---
 .../bindings/remoteproc/qcom,adsp.yaml        |   4 -
 .../bindings/remoteproc/qcom,sdx55-pas.yaml   | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index bb7646446881..28e37d47d57b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -30,7 +30,6 @@ properties:
       - qcom,sdm660-adsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
-      - qcom,sdx55-mpss-pas
 
   reg:
     maxItems: 1
@@ -197,7 +196,6 @@ allOf:
             enum:
               - qcom,sc7180-mpss-pas
               - qcom,sc7280-mpss-pas
-              - qcom,sdx55-mpss-pas
     then:
       properties:
         interrupts:
@@ -275,7 +273,6 @@ allOf:
           contains:
             enum:
               - qcom,sc7280-mpss-pas
-              - qcom,sdx55-mpss-pas
     then:
       properties:
         power-domains:
@@ -335,7 +332,6 @@ allOf:
               - qcom,qcs404-cdsp-pas
               - qcom,qcs404-wcss-pas
               - qcom,sdm660-adsp-pas
-              - qcom,sdx55-mpss-pas
     then:
       properties:
         qcom,qmp: false
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
new file mode 100644
index 000000000000..cbeaa00ca4d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,sdx55-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDX55 Peripheral Authentication Service
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm SDX55 SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdx55-mpss-pas
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
+    minItems: 6
+
+  interrupt-names:
+    minItems: 6
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MSS power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mss
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
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@4080000 {
+        compatible = "qcom,sdx55-mpss-pas";
+        reg = <0x04080000 0x4040>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover",
+                          "stop-ack", "shutdown-ack";
+
+        memory-region = <&mpss_adsp_mem>;
+
+        power-domains = <&rpmhpd SDX55_CX>, <&rpmhpd SDX55_MSS>;
+        power-domain-names = "cx", "mss";
+
+        qcom,smem-states = <&modem_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts = <GIC_SPI 114 IRQ_TYPE_EDGE_RISING>;
+            label = "mpss";
+            mboxes = <&apcs 15>;
+            qcom,remote-pid = <1>;
+
+            /* ... */
+        };
+    };
-- 
2.34.1

