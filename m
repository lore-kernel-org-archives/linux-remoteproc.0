Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50C7EB64DD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 13 Jul 2023 07:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234020AbjGMHXH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 13 Jul 2023 03:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbjGMHWz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Jul 2023 03:22:55 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05BA1FC0
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Jul 2023 00:22:52 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-314313f127fso519378f8f.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Jul 2023 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689232971; x=1691824971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmaEro9qJ+WFWPEtna9Xd9AaFut1CJeCBKXroVRKWyA=;
        b=aO3We/ZHVK3x643+13sbALV/fjoZ0JX5kLClWbUkWadlJXQExPQ+a6uyyR6q3JqDql
         3wWrH13etRYzewDyDT59hQsvyhF69kyVejN9p54LR5rYbYO7ZAQZokha7KWHbCc32TuB
         K/5eZcar7dU4+mVApUR6/AJtQm+eYfktAChRRz5QHzSCG/YjtCajurNJ1SLdLDhsdOOl
         QcZlpgWvBeZo2OYXAWk2Ng1NPow466N4W3hbo6vg/DvIbJ4mHvZ/y5YJ9eVLW/VXfPgs
         4AYkmvg8EFi6JYOnuZrtmqgc/vWxb9xX8gQd5L3nk9tw2ogNf6dU5o6YzAPwc6XU6fUP
         y17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689232971; x=1691824971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmaEro9qJ+WFWPEtna9Xd9AaFut1CJeCBKXroVRKWyA=;
        b=VRrz49EGBVStUqhhpeAsli54bks4ml4zfr2pmskW/kBCGFZ1upDivwU2RsBfQQZm5e
         2AMq9ReGFTu17K/YwG5Cz8ip4aP5Mgzb4IFAMFwVd9ViG1MEvdMSO83cwB3rkPz3Twul
         9Xk9hBSwTTYccDTMvmycs4wCH2XYjiNTeejWPNk+Q69//xZM4r8JnesVaRBofuswNpiI
         vfNCtdO5CU/R/5TRqPxS21OBfjQv9yjSXN4t+38nq2xcSnxqyuicvG7hObT45XMuRE9l
         h1FojkDEBpMXN1e+DfMUF50xVI5A2W2BcJkEe2d+/5deIunVonQMj4Wi/WxETNwbFjIM
         a3lQ==
X-Gm-Message-State: ABy/qLYp+F+HeOY8Zlh+p1yYNjfagUgYUVofjlxhROQcFd1v/M3dnONg
        qb7NmgcmUpzCD/eNWUOyYhyxtA==
X-Google-Smtp-Source: APBJJlF2vgolfAUH7v2PBrJB/paT8oZd4Xut4J89geb6W/RLwFzzXXjvxfVMy7ZSSQp9ohXrAzVzYw==
X-Received: by 2002:a05:6000:1009:b0:313:f990:c631 with SMTP id a9-20020a056000100900b00313f990c631mr540269wrx.44.1689232971432;
        Thu, 13 Jul 2023 00:22:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w16-20020a5d6810000000b003144b50034esm7071384wru.110.2023.07.13.00.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 00:22:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v2 2/4] dt-bindings: remoteproc: qcom,sm6115-pas: correct memory-region constraints
Date:   Thu, 13 Jul 2023 09:22:40 +0200
Message-Id: <20230713072242.11268-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
References: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Qualcomm PAS devices expect exactly one memory region, not many.  Also,
the memory-region is now defined in device specific binding, not in
qcom,pas-common.yaml, thus also require it in the same place.

Fixes: 838c558bb8bc ("dt-bindings: remoteproc: qcom: Add sm6115 pas yaml file")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index f5d1fa9f45f1..1ac5b99b2fad 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -32,7 +32,7 @@ properties:
       - const: xo
 
   memory-region:
-    minItems: 1
+    maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
   smd-edge: false
@@ -44,6 +44,7 @@ properties:
 required:
   - compatible
   - reg
+  - memory-region
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-- 
2.34.1

