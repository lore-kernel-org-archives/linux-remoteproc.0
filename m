Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ED7C61DA4
	for <linux-remoteproc@archiver.kernel.org>; Sun,  5 Mar 2023 12:59:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjCEM7Z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 5 Mar 2023 07:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjCEM7X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 5 Mar 2023 07:59:23 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E6812BE3
        for <linux-remoteproc@vger.kernel.org>; Sun,  5 Mar 2023 04:59:21 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id o12so27915895edb.9
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Mar 2023 04:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678021160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cqDGVxJfeCpM1mRAZY399+BTV0oE+jJf5kzKKg2IU3E=;
        b=qRkA0p95edE4IQicaYTQgfXODTtEH8aTr2m0l2OWlPPuZeBBltBUR6j0VCAHs1sjow
         qu3afzlaKQ92SoPas8/jyJcaVnpIyMbkjZoQyLzray4BJ4UVpDUDX25LOHz29OKIKoqs
         ft+1Ux8IiG2kdy7FFx0hSc6CpR/c+pSEmF406w9l88yJKSC1NT9VveIQ3O0H5MYgzuiT
         7Cdo/oTnkeBEZejEk2dmeoilt5WBvRBfoXt6hwyDGEf7NsVRO3MxqkBKkkoOizb9l+Ym
         0zMrcuYTBv8K49JOLwGBuozwYpOxGBf0MFw/InApnMs1GVQwEiBUaefo1TZCfL5xEmwY
         o+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678021160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqDGVxJfeCpM1mRAZY399+BTV0oE+jJf5kzKKg2IU3E=;
        b=URIyKV6tny7p0Wlx1XYRitTFksCDE7bgosHfGJyHjH+sEmobpOoP+cYBm9nI5Z4Tka
         TbIQW4B0SVRIEcX6trwBOhRlCf7G8k5ek4mKW92lxAIQKWWnEVphGRohufsCcXARplUE
         TTeCvN1D1mJFWHlwflKghfeP6M69gidt1Uk3WioVXdOt6s67bkCLkSa4twkkHibqjZ9p
         yuQjUSYC2hxbmZZkVm/dwX7o6UkDmJYq79NrAgSxF1ZTW0ziwiI2RFo1ZgqAyexXbmAx
         z6tTtdbGGLzdqJSbgokElj6Hi9vzkBOSLcZo7ZjlOUS7moGIdR6WC5UYK87jAjeSl7GX
         RLWw==
X-Gm-Message-State: AO0yUKXVXx99QqoVfUQHvKqIM2kDtxd8Cg2nVNFbqwny6kFzsrSLVp3U
        JIcIE9Pz/VPhg78FEFdYGF/FQg==
X-Google-Smtp-Source: AK7set/nhS55A3Mvm+Le9cZqCoAGCWogUwFqs7Lfvp3smPKXdX9BJLV8Qf16/5xI5Mg0KY3XJpgYlg==
X-Received: by 2002:a17:907:86a6:b0:84d:3403:f4f2 with SMTP id qa38-20020a17090786a600b0084d3403f4f2mr9882723ejc.62.1678021160509;
        Sun, 05 Mar 2023 04:59:20 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id qt2-20020a170906ece200b008e938e98046sm3168388ejb.223.2023.03.05.04.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 04:59:20 -0800 (PST)
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
Subject: [PATCH] dt-bindings: remoteproc: qcom,adsp: bring back firmware-name
Date:   Sun,  5 Mar 2023 13:59:17 +0100
Message-Id: <20230305125917.209262-1-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 643ee787a81f..828dfebaef6a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -44,6 +44,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
 required:
   - compatible
 
-- 
2.34.1

