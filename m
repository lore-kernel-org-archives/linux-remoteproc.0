Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19344C636D4
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Feb 2023 19:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjBFTdY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Feb 2023 14:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjBFTdU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Feb 2023 14:33:20 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398A323640
        for <linux-remoteproc@vger.kernel.org>; Mon,  6 Feb 2023 11:33:19 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n13so9462199wmr.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Feb 2023 11:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OQAWcnBlImqpI8dh4fMJUJ4uLuslVZFojFS90E2YNEE=;
        b=KbOLSuz5sGWWK7dHMkv8zGADe7M8qgs5BFVn7L46N6R3TXmVg9cJMtz3F1HjvU3McB
         3HNS8XdeC7qsXimdqUQu8woKnmJbknQ4un29W0Z3I7FOI3+ccbmW8P8J7j7I32MEzyeq
         h4wNqaKp72hM8THzFErBUXKjTv2xwzQguI/GGOJWgXbGMLXn4NXb7ugBDgwtJcMcgQH7
         8f4uBajafCKH63L3e5Kt/O+3EIAPvu9MlJddXTIkx3Fe9ziKliSCO59HWMuH4QA8/LFh
         9Pw59JDso5dJjRPINPuqMjdaNfCTqioWzJO+qpXlZaT4SZy1y96tigBTbpDFzvaANdWe
         Coyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQAWcnBlImqpI8dh4fMJUJ4uLuslVZFojFS90E2YNEE=;
        b=X+p7BYVPoZQah8+qrDN9KujCg1REzAocGRyS331lqtir4Mhk0OoFbz9oUQJX//Ofj0
         tbA2ffzVfx+khN3FuQjeuK/wIwbnFK2fgN9jCiD8qNFH4tSqKYrKdHlWi81UjPR4Bp3C
         bL23gMX8sQvqL5sXvnr3/f4XSP51xvksmGFtvY1GEEO7+KI1ig4v8NDN5UoWVZCQ24Gf
         B33ptzdozxITkbAhbAPv78Ww8AXBKGsxIN0/CF4vESbk8zlDO+/y3CyHl/DcteoH+TEl
         xARrSFD7TqYLy0ivjM0fnELlTc1t5KuJjjR6ilFU0JpbI2RgwOnRAUofN5yjlR0UhPiH
         IuOw==
X-Gm-Message-State: AO0yUKV9SSmQG16LovPunAK9KMagKNRnHHwZaGAdfP2/sIpHlLhUK7O4
        PNaT01oDBpogHlXGXl37QtZISQ==
X-Google-Smtp-Source: AK7set8Wq9hruDY7Cyh2+1+BQehRoY/JRRLJGz2O8xHgkkEXbm1aPoTVQ5cOlFCXglnhOTHEx8uZ9w==
X-Received: by 2002:a05:600c:920:b0:3dd:af7a:53ed with SMTP id m32-20020a05600c092000b003ddaf7a53edmr791250wmp.11.1675711997717;
        Mon, 06 Feb 2023 11:33:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c2cc400b003dfefe115b9sm9351021wmc.0.2023.02.06.11.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 11:33:17 -0800 (PST)
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
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: correct power domains
Date:   Mon,  6 Feb 2023 20:33:13 +0100
Message-Id: <20230206193313.30667-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Correct CDSP and MPSS power domains to match what is used in DTS and the
Linux driver:

  sm8550-mtp.dtb: remoteproc@32300000: power-domain-names: ['cx', 'mxc', 'nsp'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index ae612809e260..fe216aa531ed 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -99,22 +99,22 @@ allOf:
       properties:
         compatible:
           enum:
-            - qcom,sm8550-cdsp-pas
+            - qcom,sm8550-mpss-pas
     then:
       properties:
         power-domains:
           items:
             - description: CX power domain
-            - description: MXC power domain
+            - description: MSS power domain
         power-domain-names:
           items:
             - const: cx
-            - const: mxc
+            - const: mss
   - if:
       properties:
         compatible:
           enum:
-            - qcom,sm8550-mpss-pas
+            - qcom,sm8550-cdsp-pas
     then:
       properties:
         power-domains:
-- 
2.34.1

