Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3A3C4321E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 May 2022 07:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236617AbiEQHCK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 03:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240623AbiEQHB3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 03:01:29 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31923E0DE
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:26 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id tk15so9304731ejc.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R8I3k1Yqw2llxG/1a2XlWwnnd2xdhA1wKFdWrbiPS8U=;
        b=rpP6u9dhtfbJ2ujNsvM5elT7o9rRnKtHKtlgqX6tCI8rvtRoENFV0lqtz9kZf1YFFs
         vRX40hOf85/gDz9jhGomNzfmnok2LJcKWZqkGqF2uPw1alD8ZJt6/VTVZ0l0roLZPgN7
         cPbDUmd6DQmP86nRENYZ61yn9Y27aHZETRyd/MhKcmTdkyzBNPIltdJ1bZZu1BVBWBRL
         hZpXUhEITSHUtljqakgS7AHqAx+j9RdlEBqnLqGK0re4J1bCgGncIAxxoOdAe92vnJoI
         Ok5oLTIABAx312SwRdRb1P/jWsCbHQ4+mFIA3j+JgjG/p8pB/OSc3SL9HrTPe8EIoNPV
         8Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R8I3k1Yqw2llxG/1a2XlWwnnd2xdhA1wKFdWrbiPS8U=;
        b=vWHXxXxrK/qfsH0dJ2/r5yjgXiDnKbt41BYHwAhFMAcFKPbzYk8LlWy2B7c/CEdRhI
         aH+oHv1OLy3fuyS23KIP9FJ/hzaEmWKSFzLq6vdZFo3hiXRmWjO7jmUDtbQLtPVnQJGN
         d02oXbKWf/E/R8+glfU7yoC3DFGwgPF+M4gd0+mD86YOwWYh/S1fv8KYfkSgvwxEgALo
         U0iuZlNN4ET6iRwTUvm/Jg0Nh85gqFzfq2dTy5vcXrohIubJ+5PWyMbyjoFGJlHbacV1
         s3jn1itm2SZ/LWfLleOLxA5qkb59mtyBBjTSQUwKPZBg7mH3rclqUcfu0823YjqGyZvn
         0Beg==
X-Gm-Message-State: AOAM531JRyYGRcoSP8p8Ij/YHCLPWEU/dA8eZKtiXOXw7UySA1DfXLai
        ijHxsYsad3XavaGrNx4IFNVuHg==
X-Google-Smtp-Source: ABdhPJz1Y4SrEBPvcX4hebTvSgeFoP+jhcQMEWGrivFENi9/I7lepkvBPtLsJsggCIExnMmu5/MP8w==
X-Received: by 2002:a17:907:968e:b0:6f4:d80f:f0c3 with SMTP id hd14-20020a170907968e00b006f4d80ff0c3mr17515802ejc.145.1652770886243;
        Tue, 17 May 2022 00:01:26 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 07/12] dt-bindings: remoteproc: qcom,glink-edge: define re-usable schema for glink-edge
Date:   Tue, 17 May 2022 09:01:08 +0200
Message-Id: <20220517070113.18023-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

'glink-edge' property appears in multiple bindings, so split it into one
place which can be re-used.  This reduces code duplication and adds
strict schema matching for glink-edge nodes (instead of just
"type:object").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/remoteproc/qcom,adsp.yaml        |  2 +-
 .../bindings/remoteproc/qcom,glink-edge.yaml  | 72 +++++++++++++++++++
 .../remoteproc/qcom,sc7280-wpss-pil.yaml      | 18 ++---
 3 files changed, 77 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index d04de60ae017..4dfbfece1ec7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -154,7 +154,7 @@ properties:
       channels and devices related to the ADSP.
 
   glink-edge:
-    type: object
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
       Qualcomm G-Link subnode which represents communication edge, channels
       and devices related to the ADSP.
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
new file mode 100644
index 000000000000..fa69f7b21eed
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glink-edge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm G-Link Edge communication channel nodes
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  Qualcomm G-Link subnode represents communication edge, channels and devices
+  related to the remote processor.
+
+properties:
+  $nodename:
+    const: "glink-edge"
+
+  apr:
+    $ref: /schemas/soc/qcom/qcom,apr.yaml#
+    description:
+      Qualcomm APR/GPR (Asynchronous/Generic Packet Router)
+
+  fastrpc:
+    type: object
+    description:
+      See Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
+
+  interrupts:
+    maxItems: 1
+
+  label:
+    description: The names of the state bits used for SMP2P output
+
+  mboxes:
+    maxItems: 1
+
+  qcom,remote-pid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      ID of the shared memory used by GLINK for communication with remote
+      processor.
+
+required:
+  - interrupts
+  - label
+  - mboxes
+  - qcom,remote-pid
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    remoteproc@8a00000 {
+        reg = <0x08a00000 0x10000>;
+        // ...
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_CLIENT_WPSS
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "wpss";
+            qcom,remote-pid = <13>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
index ade932468c38..3f06d66cbe47 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
@@ -106,8 +106,8 @@ properties:
     const: stop
 
   glink-edge:
-    type: object
-    description: |
+    $ref: qcom,glink-edge.yaml#
+    description:
       Qualcomm G-Link subnode which represents communication edge, channels
       and devices related to the ADSP.
 
@@ -121,21 +121,11 @@ properties:
           - description: Mailbox for communication between APPS and WPSS
 
       label:
-        description: The names of the state bits used for SMP2P output
         items:
           - const: wpss
 
-      qcom,remote-pid:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: ID of the shared memory used by GLINK for communication with WPSS
-
-    required:
-      - interrupts
-      - mboxes
-      - label
-      - qcom,remote-pid
-
-    additionalProperties: false
+      apr: false
+      fastrpc: false
 
 required:
   - compatible
-- 
2.32.0

