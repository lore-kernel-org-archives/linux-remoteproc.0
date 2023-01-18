Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB83C677F1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Jan 2023 16:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjARQYj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Jan 2023 11:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjARQYV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Jan 2023 11:24:21 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDE93D93D
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Jan 2023 08:22:45 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so1470825wmq.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Jan 2023 08:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJhhwuYzq1Okb5/4x8Q7mNbhcHN2GG5v0qhyd4tEid4=;
        b=uwsUKsmC2V17s84crcW8TRooIA5Rn0Q1yi+v8X06HeswNhLV+psovM+vY86swB0Uja
         9ZO2TwwtjqufNFDcMVjdgEJi7EnZ7AOcFyXHlph8/VV5ukGNydv2HgcJ+KqSjy+KKju6
         Lot76QQigWhJLkhuMiXfAf5B/OA2VD8lc1rdymF/9/rLhhws44OPFhXcm53WcVthZSnU
         pX4+v80EZGi+3fYJkrMuZUNLcEqRvKLOHxe7AodCRSofeQq457Jj5/g/LSxRlWhgLrW/
         JkWFA6Txm/zgl7bRB4ZJtuRUNyShMkXyvxy5RL1gqmxHA+UnmHImm5lrzPkyg3iaPZAa
         OcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJhhwuYzq1Okb5/4x8Q7mNbhcHN2GG5v0qhyd4tEid4=;
        b=u5Rpj3GH/GNtP+5aNaXTkUuQj4Y8ylXZg7YDLJc9hbMCgvGTQNGnXyXAzk3rXSqcGd
         pVUjp4ygtUylNNwV/qMvmXaSeTZezIp2NzP+8IopVi4cv0Inti7h3+Btz/dar6rTpmbW
         vp3cBJX18vf5TFcAm08f/6sB0GoL0/17rtQlQRbsUdnlGiw4qugEw5E1oQ0y6GiacFES
         ayL8aOBGYDscLg8Qcgq0x81L7ssq2cQj8F2PvzIjlcAdtRQkb4ayyElZxBlg1YPJzMdM
         +Vq2QMi2YXFXueE/NDOm9Ln7wck1FPxivqTo7727dcqIBY3xJqaIeq6nzbZWYQlBkQzL
         Xi5Q==
X-Gm-Message-State: AFqh2kpAibctrXXZn4wjFwYRs8YIGKV6iwgpsDcgINhwCqIocOoIh59M
        kpE7aWdrCaV8W+oQIUGMWRAH1g==
X-Google-Smtp-Source: AMrXdXsIc/v2+fEOdkqPKYNvyN8uXLNGCFxgDDsXSjYSe5vF1CdC2jX21aOkGe6a06P1C6/8JMNBmA==
X-Received: by 2002:a05:600c:4191:b0:3d4:5741:af9b with SMTP id p17-20020a05600c419100b003d45741af9bmr15911084wmh.0.1674058964422;
        Wed, 18 Jan 2023 08:22:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b003db0dbbea53sm2744393wms.30.2023.01.18.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:22:44 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 18 Jan 2023 17:22:40 +0100
Subject: [PATCH v4 2/5] dt-bindings: remoteproc: qcom: adsp: document sm8550
 adsp, cdsp & mpss compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221114-narmstrong-sm8550-upstream-remoteproc-v4-2-54154c08c0b7@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v4-0-54154c08c0b7@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-remoteproc-v4-0-54154c08c0b7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc:     Alex Elder <elder@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.11.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This documents the compatible for the component used to boot the
aDSP, cDSP and MPSS on the SM8550 SoC.

The SM8550 boot process on SM8550 now requires a secondary "Devicetree"
firmware to be passed along the main Firmware, and the cDSP a new power
domain named "NSP".

A third memory domain for the DSM memory zone is also needed for the MPSS
PAS bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
new file mode 100644
index 000000000000..ae612809e260
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8550 Peripheral Authentication Service
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm SM8550 SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8550-adsp-pas
+      - qcom,sm8550-cdsp-pas
+      - qcom,sm8550-mpss-pas
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
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  memory-region:
+    minItems: 2
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+      - description: DSM Memory region
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
+            - qcom,sm8550-adsp-pas
+            - qcom,sm8550-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+        memory-region:
+          maxItems: 2
+    else:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+        memory-region:
+          minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-adsp-pas
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
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MXC power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mxc
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-mpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MXC power domain
+            - description: NSP power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mxc
+            - const: nsp
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    remoteproc@30000000 {
+        compatible = "qcom,sm8550-adsp-pas";
+        reg = <0x030000000 0x100>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack";
+
+        memory-region = <&adsp_mem>, <&dtb_adsp_mem>;
+
+        firmware-name = "qcom/sm8550/adsp.mbn",
+                        "qcom/sm8550/adsp_dtb.mbn";
+
+        power-domains = <&rpmhpd_sm8550_lcx>,
+                        <&rpmhpd_sm8550_lmx>;
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
+            mboxes = <&ipcc IPCC_CLIENT_LPASS IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "lpass";
+            qcom,remote-pid = <2>;
+
+            /* ... */
+        };
+    };

-- 
2.34.1
