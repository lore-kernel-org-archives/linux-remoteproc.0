Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93992C54EBD
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Jan 2023 12:06:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjAGMGm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 7 Jan 2023 07:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbjAGMGi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 7 Jan 2023 07:06:38 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7195C1FF
        for <linux-remoteproc@vger.kernel.org>; Sat,  7 Jan 2023 04:06:33 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bq39so5761023lfb.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Jan 2023 04:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSXHQVsWHUKcPua78jzq0240G90YXX9B3puQSrtRzlQ=;
        b=aLdS8WIwVzUnKD3OOVothsU8cRSe6i6WTTXfxdghfKAToc/EgJYF1t8itxIyi+FAJm
         +6G7fO4NXfpM2AelD6ehE03hjEzxiHU9fglq4FoaMd4VqIThfPQLP00eWEwF32GWd0Zq
         maDhd1rtLt766qfv9KOVdxZDyuVIZcaRr6DBEaR/25YCHKvhJHA9Gd8iZkMe/4AjWAxi
         6hvL7Wlr0jQxShhlymwDGqtVMEIJTOX9VnWhfp69RDIZq5c37kQG8Xm8EsfCr0MM3dJx
         qwh7OLEk5syf9nhI/wpmcPUKOlfXcGhKLl87yxGpa6WCcZ0xrCofqy+V80fPfJc5sDeN
         Jxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSXHQVsWHUKcPua78jzq0240G90YXX9B3puQSrtRzlQ=;
        b=t/j+aWJfBPgKX/AJARogCNd5oW+ncZowDzXL4IUHoFOCy7IjbcB5YcvLN45n8EYs4Q
         6k+Q8mv+bDMSjQZ2Ux4II1lQSeWaxOhdV4QtRzDQAIGrnsBhEpcC0ornnNR9L9XwrcPv
         tnqQpLmrYKgKiq2eAwko8cwCx6n9inQQ4GhCG9cYeN8Cn9Sd/f49SsqmQEgHhBsq/sfP
         gAU8at+v2vKNsagEYrh2mrqOPbqzAp673RVh90n4l+OE3WiohAa10c9FdRiZiWL1pfmY
         EaZWx++cyvbRPvivps61x7qE89r75N/zuQ65pZ5n1T8qpBQSIVIzdh0Xil7nA1/3oQ0l
         3ozQ==
X-Gm-Message-State: AFqh2krEGXgtN8KrKtz+K/kKs5f2nnqY59Wu8GPvDhhyg6HZsqGMiAdv
        AIkKGrrFzO/VYfOEqGET5KDHVQ==
X-Google-Smtp-Source: AMrXdXv+MwwoUNTU1/fdQD7I+AkcMbJbgndrHq5o4DAdMA5y3spl/MTsijx6tZHTYgMpXquYKW7q2Q==
X-Received: by 2002:a05:6512:3b2a:b0:4b5:5efb:7d26 with SMTP id f42-20020a0565123b2a00b004b55efb7d26mr20499266lfv.37.1673093192087;
        Sat, 07 Jan 2023 04:06:32 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id m2-20020a056512114200b004caf992bba9sm551424lfg.268.2023.01.07.04.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 04:06:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm6350-pas: Add SM6375 ADSP
Date:   Sat,  7 Jan 2023 13:06:21 +0100
Message-Id: <20230107120623.1903056-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add entries for SM6375 ADSP, as it's essentially identical to the one
on SM6350.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Rebase on top of recent changes, move to 6350 pas yaml

 .../devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 911529400142..a225f54de424 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,sm6350-adsp-pas
       - qcom,sm6350-cdsp-pas
       - qcom,sm6350-mpss-pas
+      - qcom,sm6375-adsp-pas
 
   reg:
     maxItems: 1
@@ -49,6 +50,7 @@ allOf:
           enum:
             - qcom,sm6350-adsp-pas
             - qcom,sm6350-cdsp-pas
+            - qcom,sm6375-adsp-pas
     then:
       properties:
         interrupts:
@@ -67,6 +69,7 @@ allOf:
         compatible:
           enum:
             - qcom,sm6350-adsp-pas
+            - qcom,sm6375-adsp-pas
     then:
       properties:
         power-domains:
-- 
2.39.0

