Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB6DC4321E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Nov 2022 18:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiKXSnz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Nov 2022 13:43:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiKXSnu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Nov 2022 13:43:50 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6584C1122C5
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id p8so3664235lfu.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEQC5O/KyRkWXHWn2kAQcPwkvnFfret4cFEbPNTIXf8=;
        b=xaPVbvted/OoZuAvvNKLO4MsbnShtocpbMHJLqCnCWyaTlmwwSM69jG2A1tGfqSxbO
         LdXHOs9MwV++ii6HW4bYfnMdPBuiB3HTMRynYkptxgegrVdh7rvzXmlKLNS20LrCIbha
         RQdN6FyIIsnzB1e3t1/7gJ6XzAD4R1hu8RNGqmz9vZl64DvecGSkixYP2Ax2aaXmkUeu
         RhDtkXan5ogKW5ESz1hgT4OjJ96x5a1Wgl2XBugtBRXOWOo3xddhNfFf2MoqZnxs3Lx9
         X9EYqzvkkp1lb04qZ//KIVyauM5ahOiawMAzCYfUgOM0mkWnL1cdj9mnO8S7wkoR9rmd
         vgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEQC5O/KyRkWXHWn2kAQcPwkvnFfret4cFEbPNTIXf8=;
        b=obsnmKNl8uShxLcDQvy79pcG8IEwlV+X/3jqmNVTPHV/AtsHVIJ2y2Ne521DoQ6PNy
         CGkP7sBtPBjX4lGtBhq/kBPHPifv8T714VoAfxlR82eqABxTvAic4ND08w0YuH+oLRo+
         k80ybPrlYoMmT0RFpnnWo0P6Pr5WGMSleS+49RjoSwCEwtMpgOa99NfWAXWHcN/jEjx1
         6E11W+WmQtuwc6NEEjLoZLuyJMt6+b2p3UhbteL2JFrcdt8RNJPQO+wd3hfTXD+RfnDg
         pv8MWS1EACTGEN95S/7AsI9AFwyLfNdA0YE/CBuLxbe3hG+d9nBEMf9PhrslBECfSfoE
         tBIA==
X-Gm-Message-State: ANoB5pm0bmZH6bErrDKE5PdUA7Uy/4FxMcjurq47FhOmNWlQglQ9qtrY
        kIUkp8MZb5GBGB22cQ716r+iHg==
X-Google-Smtp-Source: AA0mqf6JVg/AYXABCs9+QVo5yxJTB2c4c5NhBrVaHygfX1wkk/D8UauaycwNXUNIeQUidOOjBBG2Kw==
X-Received: by 2002:a19:4943:0:b0:4b4:ec76:17d with SMTP id l3-20020a194943000000b004b4ec76017dmr2630115lfj.63.1669315428919;
        Thu, 24 Nov 2022 10:43:48 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v7-20020a2ea607000000b0026e0434eb1esm159098ljp.67.2022.11.24.10.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 10:43:48 -0800 (PST)
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
Subject: [PATCH v3 05/15] dt-bindings: remoteproc: qcom,adsp: drop resets and qcom,halt-regs
Date:   Thu, 24 Nov 2022 19:43:23 +0100
Message-Id: <20221124184333.133911-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
References: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Some remote processors (e.g. QCS404 CDSP, SC7180 MPSS/MSS) can be brought
to life using two different bindings:
1. PIL (Peripheral Image Loader)
2. PAS (Peripheral Authentication Service)

They still describe the same hardware - firmware load for remote
processor - but use different methods to communicate with that
processor.

For these SoCs, the qcom,adsp.yaml bindings were describing the PAS
method, however for easier customization of board DTS, the bindings
combined additional properties from PIL: reset lines, qcom,halt-regs and
additional clocks.  The devices and Linux kernel drivers, when
instantiated as PAS, do not use these properties, so drop them from the
bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. New patch
---
 .../bindings/remoteproc/qcom,adsp.yaml        | 113 +-----------------
 1 file changed, 4 insertions(+), 109 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index db9e0f0c2bea..e3e617315aef 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -61,11 +61,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 8
+    maxItems: 2
 
   clock-names:
     minItems: 1
-    maxItems: 8
+    maxItems: 2
 
   interconnects:
     maxItems: 1
@@ -90,14 +90,6 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
-  resets:
-    minItems: 1
-    maxItems: 3
-
-  reset-names:
-    minItems: 1
-    maxItems: 3
-
   cx-supply:
     description: Phandle to the CX regulator
 
@@ -135,18 +127,6 @@ properties:
     items:
       - const: stop
 
-  qcom,halt-regs:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: Phandle reference to a syscon representing TCSR
-          - description: offsets within syscon for q6 halt registers
-          - description: offsets within syscon for modem halt registers
-          - description: offsets within syscon for nc halt registers
-    description:
-      Phandle reference to a syscon representing TCSR followed by the
-      three offsets within syscon for q6, modem and nc halt registers.
-
   smd-edge:
     $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
     description:
@@ -184,7 +164,9 @@ allOf:
               - qcom,msm8996-slpi-pil
               - qcom,msm8998-adsp-pas
               - qcom,qcs404-adsp-pas
+              - qcom,qcs404-cdsp-pas
               - qcom,qcs404-wcss-pas
+              - qcom,sc7180-mpss-pas
               - qcom,sc7280-mpss-pas
               - qcom,sc8180x-adsp-pas
               - qcom,sc8180x-cdsp-pas
@@ -238,60 +220,6 @@ allOf:
             - const: xo
             - const: aggre2
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qcs404-cdsp-pas
-    then:
-      properties:
-        clocks:
-          items:
-            - description: XO clock
-            - description: SWAY clock
-            - description: TBU clock
-            - description: BIMC clock
-            - description: AHB AON clock
-            - description: Q6SS SLAVE clock
-            - description: Q6SS MASTER clock
-            - description: Q6 AXIM clock
-        clock-names:
-          items:
-            - const: xo
-            - const: sway
-            - const: tbu
-            - const: bimc
-            - const: ahb_aon
-            - const: q6ss_slave
-            - const: q6ss_master
-            - const: q6_axim
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc7180-mpss-pas
-    then:
-      properties:
-        clocks:
-          items:
-            - description: XO clock
-            - description: IFACE clock
-            - description: BUS clock
-            - description: NAC clock
-            - description: SNOC AXI clock
-            - description: MNOC AXI clock
-        clock-names:
-          items:
-            - const: xo
-            - const: iface
-            - const: bus
-            - const: nav
-            - const: snoc_axi
-            - const: mnoc_axi
-
   - if:
       properties:
         compatible:
@@ -520,39 +448,6 @@ allOf:
           items:
             - const: nsp
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qcs404-cdsp-pas
-    then:
-      properties:
-        resets:
-          items:
-            - description: CDSP restart
-        reset-names:
-          items:
-            - const: restart
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc7180-mpss-pas
-              - qcom,sc7280-mpss-pas
-    then:
-      properties:
-        resets:
-          items:
-            - description: MSS restart
-            - description: PDC reset
-        reset-names:
-          items:
-            - const: mss_restart
-            - const: pdc_reset
-
   - if:
       properties:
         compatible:
-- 
2.34.1

