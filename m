Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE3AC64EC4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Mar 2023 08:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjCIIiE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Mar 2023 03:38:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjCIIhe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Mar 2023 03:37:34 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5DF38676
        for <linux-remoteproc@vger.kernel.org>; Thu,  9 Mar 2023 00:36:21 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id u9so3952559edd.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Mar 2023 00:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678350980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/SEpOpIkakui+KeMg3zz9ImxN2mZh/kxITlQnQLk08k=;
        b=cEEibjqkZl2hRaglcfe5+Mgr3v5dISNz87JPz0LxDpvCQv6l6Q1y1GWoaUa/Cmyun5
         iHJg9CCVjymvau/N6/QDGethK3WrtsIyRan//DtThOBj6kqxhXFo+9sr++Pv6cfliCPj
         Citgky1mUJFI9Wi3gQocYyyiFs4Vg+yxFAxbhrLWMIYtjMrvLNIqokSa9do64rVEPbEu
         vEmFuHrAvu1UWMeXQo0yFQbgwSTg92MZdrQh0D1rf+3IKaCUNpzH2lGbRdKs9vZPj/Jc
         xchqOfryqWSKTMKnKzBMs2Uxb2+AFsztEdiF8osr4seORuWc/jKG8g5RyB1pkO6K7lRE
         zL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SEpOpIkakui+KeMg3zz9ImxN2mZh/kxITlQnQLk08k=;
        b=BBY7otbbNUvIRbK+eN6qm2ayNwXmJWA/itMJjLAF5wzh3WZhtCf3dhoI9BSWSQlShD
         KMGydTMdOEbosJxcpxkXfqTWzrVQdnLJslJrLq8dugNzuJnkKV2/hmv2yvsQsIyJiMwX
         JbVpsIMs8Wv7ru/12RkjsVZlcRz8RuyK/TiJhCRcdRsxhzDPM1Ly9rP9vBj2GYpmcSto
         TCFw3OQTRPKSJBuZhfzha9LRHmyqFW5XNorGttunRAqR7D7jDRe4d7XyucfKavu2+kOk
         3kLVOpu+hjNzqFLJd8AapCpCdsVBXGkAp8tkWsRSgb/9peijAO1zlRuabE3umP0LakZl
         iJyg==
X-Gm-Message-State: AO0yUKX4o3HIdXu9lP8w09Cc46Jg/XloZr2Ku7x+K9x5rPbSvwcgBA5e
        UxP/HkZ5bpgzStDpeC09ObSGuA==
X-Google-Smtp-Source: AK7set/H5Curkw44DShH7kUbF2c0b2yHw5SAle0NeduHbjUmzuXXVRvS05xJJ8IDoy/r/n8yxOqF3g==
X-Received: by 2002:a17:907:7f9f:b0:889:1eb1:7517 with SMTP id qk31-20020a1709077f9f00b008891eb17517mr26477271ejc.30.1678350979928;
        Thu, 09 Mar 2023 00:36:19 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090681c500b008d269233bd4sm8506217ejx.204.2023.03.09.00.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 00:36:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: remoteproc: qcom,adsp: bring back firmware-name
Date:   Thu,  9 Mar 2023 09:35:48 +0100
Message-Id: <20230309083548.47205-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The firmware-name property was moved from common qcom,pas-common.yaml
binding to each device-specific schema, but the qcom,adsp.yaml was not
updated.

Fixes: cee616c68846 ("dt-bindings: remoteproc: qcom: adsp: move memory-region and firmware-name out of pas-common")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Use maxItems:1 (Rob)
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index b571efe6d550..2edadba91dfc 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -44,6 +44,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
   - memory-region
-- 
2.34.1

