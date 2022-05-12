Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B7AC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 May 2022 10:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352409AbiELKBv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 May 2022 06:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352465AbiELKAt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 May 2022 06:00:49 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCB32317D7
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:34 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w24so5610484edx.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CmuWp0Z1UVnCg5DS3PV2nhWRslglfQ6c3PLNijBuXeM=;
        b=RgU+pV0cR8X12x3s8Xx8Odi4almmsZsrZohor5WGTrdi+lqF1xhOWH/zPIK7F1Ol4U
         JZwwByeGr+g0DIRfPAT0rFR/tAMKPTLuRty3tne+R8qugiUYvLWe8mNHT9idRMmAghQU
         Lg83JSRv6rhZIemXuLvwpagHrX4Yeo90kn5aJ7XJAbRWTHln2bejefhgov8rrsyhN/lO
         sS4WwdiGWOFYZXckwlwjJ4HTtnEzDlKJAAAP5MVVj9iLCjNai32fgvMMPS8iuqgh/s0G
         zjy4DewTK/oZfMpQk0A0uQH5YAQtyhGCdYCStXFliv4nHCJnteo5nk6arWg1tYkM1B6v
         TgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CmuWp0Z1UVnCg5DS3PV2nhWRslglfQ6c3PLNijBuXeM=;
        b=7JJYWzv6ActpsEQ462Koo7Citcrye2QdFeMCtX+IYLra2nYUaEHa/Njr2H6rN6EYdE
         YjLIoZ24avCQ63U+HbSDp7XNLUbjJY7bvLdAWzCOZXYlWcKVrxiQ3+pDKcsyaz8a+vUf
         SZpojs2k8whLGOYlKxCSoxj49dCpLMKpfDPmYoZGvqIRFvVu2cfaQ+tOP7AlUB7HYg+g
         0BWVnG+uiVp1QJAU9NkS73WSnfPJrs7qqrwpXN+gLkalxKL39z76oUCd6FOs7KkAvhik
         aptk123dER1+N3rofqPVCXadey73FkRoNmKsOj/WtnLuYFcDs46BITFcPGV+an6FKzF5
         gZpA==
X-Gm-Message-State: AOAM532IySr34dcWNEic8/NOgO+62z/cbHzg+mi7dtWlQV4s/zNw33EA
        UJkV6nC1QJPq9H4hfgj6SiKoNA==
X-Google-Smtp-Source: ABdhPJwyAO/WEqO2ApMogtBoxzawzBDWPuYeMjv2giNzk9gMuB/48Wz93YjmMFqvooQ99nWXBDBqKg==
X-Received: by 2002:a05:6402:4492:b0:428:a206:8912 with SMTP id er18-20020a056402449200b00428a2068912mr20551855edb.279.1652349625844;
        Thu, 12 May 2022 03:00:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/12] dt-bindings: remoteproc: qcom,smd-edge: define re-usable schema for smd-edge
Date:   Thu, 12 May 2022 12:00:02 +0200
Message-Id: <20220512100006.99695-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

'smd-edge' property appears in multiple bindings, so split it into one
place which can be re-used.  This reduces code duplication and strict
schema matching for smd-edge nodes (instead of just "type:object").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/remoteproc/qcom,adsp.yaml        |  2 +-
 .../bindings/remoteproc/qcom,smd-edge.yaml    | 88 +++++++++++++++++++
 .../bindings/soc/qcom/qcom,smd.yaml           | 53 +----------
 3 files changed, 91 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 4dfbfece1ec7..3072af5f9d79 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -148,7 +148,7 @@ properties:
       three offsets within syscon for q6, modem and nc halt registers.
 
   smd-edge:
-    type: object
+    $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
     description:
       Qualcomm Shared Memory subnode which represents communication edge,
       channels and devices related to the ADSP.
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
new file mode 100644
index 000000000000..fde2c450e8b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,smd-edge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMD Edge communication channel nodes
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  Qualcomm SMD subnode represents a remote subsystem or a remote processor of
+  some sort - or in SMD language an "edge". The name of the edges are not
+  important.
+
+
+  See also Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
+
+properties:
+  $nodename:
+    const: "smd-edge"
+
+  interrupts:
+    maxItems: 1
+
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the edge, used for debugging and identification purposes. The
+      node name will be used if this is not present.
+
+  mboxes:
+    maxItems: 1
+    description:
+      Reference to the mailbox representing the outgoing doorbell in APCS for
+      this client.
+
+  qcom,ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to a syscon node representing the APCS registers
+          - description: u32 representing offset to the register within the syscon
+          - description: u32 representing the ipc bit within the register
+    description:
+      Three entries specifying the outgoing ipc bit used for signaling the
+      remote processor.
+
+  qcom,smd-edge:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The identifier of the remote processor in the smd channel allocation
+      table.
+
+  qcom,remote-pid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The identifier for the remote processor as known by the rest of the
+      system.
+
+required:
+  - interrupts
+  - qcom,smd-edge
+
+oneOf:
+  - required:
+      - mboxes
+  - required:
+      - qcom,ipc
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    remoteproc {
+        // ...
+
+        smd-edge {
+            interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+
+            qcom,ipc = <&apcs 8 8>;
+            qcom,smd-edge = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
index e6f9ffa1c0ea..a609c3425816 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
@@ -21,51 +21,12 @@ properties:
 
 patternProperties:
   "^.*-edge|rpm$":
-    type: object
+    $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
     description:
       Each subnode of the SMD node represents a remote subsystem or a remote
       processor of some sort - or in SMD language an "edge". The name of the
       edges are not important.
 
-    properties:
-      interrupts:
-        maxItems: 1
-
-      label:
-        $ref: /schemas/types.yaml#/definitions/string
-        description:
-          Name of the edge, used for debugging and identification purposes. The
-          node name will be used if this is not present.
-
-      mboxes:
-        maxItems: 1
-        description:
-          Reference to the mailbox representing the outgoing doorbell in APCS for
-          this client.
-
-      qcom,ipc:
-        $ref: /schemas/types.yaml#/definitions/phandle-array
-        items:
-          - items:
-              - description: phandle to a syscon node representing the APCS registers
-              - description: u32 representing offset to the register within the syscon
-              - description: u32 representing the ipc bit within the register
-        description:
-          Three entries specifying the outgoing ipc bit used for signaling the
-          remote processor.
-
-      qcom,smd-edge:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          The identifier of the remote processor in the smd channel allocation
-          table.
-
-      qcom,remote-pid:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          The identifier for the remote processor as known by the rest of the
-          system.
-
     # Binding for edge subnodes is not complete
     patternProperties:
       "^rpm-requests$":
@@ -91,17 +52,7 @@ patternProperties:
 
         additionalProperties: true
 
-    required:
-      - interrupts
-      - qcom,smd-edge
-
-    oneOf:
-      - required:
-          - mboxes
-      - required:
-          - qcom,ipc
-
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.32.0

