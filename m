Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BCCC4167E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 May 2022 07:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240542AbiEQHCN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 03:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240551AbiEQHB3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 03:01:29 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8563A3CFF0
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:24 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id g6so32842865ejw.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CzOLeWMoI9zSx/zven+R8jYOl3Pysvttl5adaJeZPwE=;
        b=wm4Jf03mQs70D1AQO8mr+FSdwcopoi8EyQNknbgNQz5wnnLPo4I0y59kwyP4iHEUYC
         1SqcdEXEFLOr9pGaOCDROlHIlSSQNRUYEJUCUIlMFgjZqhNWZDkx+ElBMlMxCqzWSX/U
         WZ+VAv3JvEoGdzR4BUMg2CUXdOLWA96cV/FsZkZRhn1wscj4+1AJZ7ARgkdilmPMO/1l
         wR6bNrD9cK5C43Vrf5HJK/E2A/BKWY0J7U686WdNB1tjQwbir8NSgzn6AAT4uyOo1ECS
         xh9wOM3/Cwm2TpIlk6MA0xy/zbDU4xfn07kRtlmeT/n2AvC9KwUzy4dljEMCLhpusJe8
         V5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CzOLeWMoI9zSx/zven+R8jYOl3Pysvttl5adaJeZPwE=;
        b=zvUXxpnXbXHjgCxn2d6Pz2+kLxbxZOGFyNAj9tIMVqbhl+Pl/tUCjGvkTmLUsd/Q9r
         TXpdgAuEYQUgQx+9G5s573L2iA1PJd0ik3XmQYJYT7SM48IynKgZSGHjOzi7nKI5Nw16
         0DzY+sALTgvrLxmZJEcE4NXMns8M/W3zD1aayPT/ySgVjuFcOJhdVd5vRZT0mNgAXWtx
         N98f2Mq3CeuCaEKCALw+cs2g3ezR7P5av4Ate0r34Q5jt3r50UFrrW2vFSFaGn24fjOw
         JX8lea0iQwxoXfKXqH5gp6LFjiSKdKGoe5Qmx30KUyAiU7FY9YtKRKhht64snigoCgeE
         xx+Q==
X-Gm-Message-State: AOAM5312wC3uWD6rUQJYDMU/HlY3f/f5eZw7PiLzTcS312ulH+3ZCJm3
        l6XzcbXG7TbsmCUC6jKDdJeqYQ==
X-Google-Smtp-Source: ABdhPJyS4ug6RGlpiMRHX5YhbZbZdKpS4A8GRbN8on3xyqWHOCo07ADAj6g3CTyFB5ZKerIDTALrYw==
X-Received: by 2002:a17:907:2ce3:b0:6f5:130e:d98f with SMTP id hz3-20020a1709072ce300b006f5130ed98fmr17878330ejc.706.1652770883851;
        Tue, 17 May 2022 00:01:23 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:23 -0700 (PDT)
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
Subject: [PATCH v2 05/12] dt-bindings: remoteproc: qcom,adsp: simplify SM8150 power domains
Date:   Tue, 17 May 2022 09:01:06 +0200
Message-Id: <20220517070113.18023-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The SM8150 if cases for power domains can be merged with another entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 0b2db36e5d14..e3a193299c4a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -371,6 +371,8 @@ allOf:
               - qcom,msm8226-adsp-pil
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
+              - qcom,sm8150-adsp-pas
+              - qcom,sm8150-cdsp-pas
     then:
       properties:
         power-domains:
@@ -434,19 +436,6 @@ allOf:
             - const: cx
             - const: mx
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sm8150-adsp-pas
-              - qcom,sm8150-cdsp-pas
-    then:
-      properties:
-        power-domains:
-          items:
-            - description: CX power domain
-
   - if:
       properties:
         compatible:
-- 
2.32.0

