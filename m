Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301B2C43219
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Nov 2022 18:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiKXSol (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Nov 2022 13:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiKXSoQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Nov 2022 13:44:16 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196C112BFD4
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:57 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id j2so330919ljg.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7Ovu2dQSWjj+PMtEiS086lrhl+cBObJWo88HoZZPz0=;
        b=NlQa0yimv+aayQe08WqHkEOJ5WuOAqW50BgQfAn/IWceRrK31Ek80SUc6zYVOq27UW
         mzjIjVTsgnX8Xrk7zqGwpm6kMLiU/476IcR1tttSYd/F+qXY7ZHDFPI9VKJ67ArtOQrR
         ZLSgN1hTScHMbOHLfKndv/2xzx3aD6T8prtC9PJbyEDRv/FtetWXnx9RW4nAQ4Irl/oO
         CSlVsnUaH2DUkcLt3ciumCG4PBhEYdqnEXY0J8RFTdoRjOHBvHVUgc+YS1oRXtU38idc
         aj6CrV4mj0avlajifEDaNnGd2qOtJHnJx8JSTV/nqqI3oXrelb/UY5gsUdPLnymb3UpB
         bJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7Ovu2dQSWjj+PMtEiS086lrhl+cBObJWo88HoZZPz0=;
        b=lG3THXrmbmY1cpuxf+TdGLIAxEpJ4VuMyJCilPfOuKOblx0FmOz96WC5MpoHuFHyJj
         XT/VDRqiFQkucV57t5pI2kpAVp6cE1AypFpRGrSmQ4PK1TcncvXeeQnXl6nHscZq+xLC
         7XnNq5H6MNh/f1MPGEz6remYZVuDi6BAT8kAXXiPmhHEWq+LyFcCa3kyC6xgkVz2NgYA
         D09qVm+8j5T6OXJ2nynchlmxOzXBuGiGh+7LGouiD4QGyyNhxwKzoHcYUHeNcJcgHqb/
         L9CRc3p6/G024zNgD3gYQduEBo+OJi/fBp+rohls8iZB5lxTf0/i3RNdW9uKLnf1eaNK
         UL+Q==
X-Gm-Message-State: ANoB5pkffMsR2a7kzBRG5V9BKbTZ45MSDMAz2JnSk5CRrjAWfDR2L+YI
        7DgFsHTtzjFL2SFK2kkP3DA6Vw==
X-Google-Smtp-Source: AA0mqf6+n/uIv6RhQ9/6RcnsBq6UkRWNwq6almJKc0AV70Zep9OZu2TkD9lH4LdQNXhap+lK9IPLqw==
X-Received: by 2002:a2e:be8b:0:b0:278:ea67:a38c with SMTP id a11-20020a2ebe8b000000b00278ea67a38cmr5015842ljr.63.1669315436597;
        Thu, 24 Nov 2022 10:43:56 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v7-20020a2ea607000000b0026e0434eb1esm159098ljp.67.2022.11.24.10.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 10:43:56 -0800 (PST)
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
Subject: [PATCH v3 11/15] dt-bindings: remoteproc: qcom,sc8180x-pas: split into separate file
Date:   Thu, 24 Nov 2022 19:43:29 +0100
Message-Id: <20221124184333.133911-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
References: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Split SC8180x remote processor Peripheral Authentication Service bindings
into their own file to reduce complexity and make maintenance easier.

The binding is incomplete due to lack of upstreamed DTS - no example and
not all power domains defined.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Drop if:then: for the clock and put it directly under properties.
2. Merge two if:then: clauses for setting interrupts.

Changes since v1:
1. New patch.
---
 .../bindings/remoteproc/qcom,adsp.yaml        | 27 ------
 .../bindings/remoteproc/qcom,sc8180x-pas.yaml | 87 +++++++++++++++++++
 2 files changed, 87 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 67a68a8edc44..7b93064fa0ae 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -27,9 +27,6 @@ properties:
       - qcom,qcs404-wcss-pas
       - qcom,sc7180-mpss-pas
       - qcom,sc7280-mpss-pas
-      - qcom,sc8180x-adsp-pas
-      - qcom,sc8180x-cdsp-pas
-      - qcom,sc8180x-mpss-pas
       - qcom,sdm660-adsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
@@ -70,9 +67,6 @@ allOf:
               - qcom,qcs404-wcss-pas
               - qcom,sc7180-mpss-pas
               - qcom,sc7280-mpss-pas
-              - qcom,sc8180x-adsp-pas
-              - qcom,sc8180x-cdsp-pas
-              - qcom,sc8180x-mpss-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
     then:
@@ -115,8 +109,6 @@ allOf:
               - qcom,qcs404-adsp-pas
               - qcom,qcs404-cdsp-pas
               - qcom,qcs404-wcss-pas
-              - qcom,sc8180x-adsp-pas
-              - qcom,sc8180x-cdsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
     then:
@@ -133,7 +125,6 @@ allOf:
             enum:
               - qcom,sc7180-mpss-pas
               - qcom,sc7280-mpss-pas
-              - qcom,sc8180x-mpss-pas
               - qcom,sdx55-mpss-pas
     then:
       properties:
@@ -224,24 +215,6 @@ allOf:
             - const: cx
             - const: mss
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc8180x-adsp-pas
-              - qcom,sc8180x-cdsp-pas
-    then:
-      properties:
-        power-domains:
-          items:
-            - description: LCX power domain
-            - description: LMX power domain
-        power-domain-names:
-          items:
-            - const: lcx
-            - const: lmx
-
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
new file mode 100644
index 000000000000..3026cfde5582
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC8180X Peripheral Authentication Service
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm SC8180X SoC Peripheral Authentication Service loads and boots
+  firmware on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc8180x-adsp-pas
+      - qcom,sc8180x-cdsp-pas
+      - qcom,sc8180x-mpss-pas
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
+            - qcom,sc8180x-adsp-pas
+            - qcom,sc8180x-cdsp-pas
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
+            - qcom,sc8180x-adsp-pas
+            - qcom,sc8180x-cdsp-pas
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
+        # TODO: incomplete
+        power-domains: false
+        power-domain-names: false
+
+unevaluatedProperties: false
-- 
2.34.1

