Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD4CC678D5
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Jan 2023 12:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbjAGMGo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 7 Jan 2023 07:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232491AbjAGMGk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 7 Jan 2023 07:06:40 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365D95C931
        for <linux-remoteproc@vger.kernel.org>; Sat,  7 Jan 2023 04:06:35 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bt23so5700009lfb.5
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Jan 2023 04:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOiHupmcGyEf5UGEte8W6FCxWinJIDVJiVA55jrOYzc=;
        b=GIlO3UN55vL3h7JbdJvH33jKpscEKWu6I5VytHsyJHn7XTOuXw+XIaszHE25w2myzU
         4vgAfKMJ5UYtzlccwzKOwJ64J5s+tKse/9JtEXVvggowUDd6kmXl9Lxxs2bpMj2W6xTF
         SpWj4yPYkB3/72h05lp87WvlrhDazS/pNCeDBBnqAbs+En4xmMeSrJEwqPQNxmjPc1Ci
         pW+T1l3+BhPJeRFU1Q2t0THYG5NwsDviKcfy+xkv3r9NctZ9TLwyOVi2OzZzIcpV/E/I
         zKxRRFK/m/zX3uJW3WHa/rJJEj9WO9RUmP+FtpZY/72lNx/mAvadC/C76Sk+sfhKb2lJ
         UL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOiHupmcGyEf5UGEte8W6FCxWinJIDVJiVA55jrOYzc=;
        b=MwHyPr3dArJDaOw2SkOzsArmeuzRFxXjeEVbB23pJ7/e/mMynzuTFEjF447uC0RYVx
         1K+n8/73c4X1Trs0jV4r3sKJk8qKDs+TCv9VtfHTN6U5a/nB1pxCM5viH4lt8xawBkb1
         ky95tpPwENn73K23iia8YyLQGCUX47a5cH4jzdGEFM+8Ny6HKkx9GE/GuMo7CcsC0HVR
         /xKrNERZeicWbcvQLJqq4kV83/VwJfpDrgonB//l5TZZcQYj9TtgWbdvzleFu9zEQnma
         M2pxIMu9OUPEK+tJjSvRT98h8C/TyJGG8M9lMXBQyzCWfZairZNyGYugCmHRGracdg4R
         DEEg==
X-Gm-Message-State: AFqh2kpzi0ghtXSU7u94Wc0+vrBryNC2lqIY/fZe9RBQZ9qyFSt5FT1i
        rWdCEUiqsora+AbcXjJ0gBPt4Q==
X-Google-Smtp-Source: AMrXdXszbs3bt64CyDgYipBy5p8y1VLbYTo03RqArCREdFRnc69lP5EZzaewo1+P06yBp+PT+8+uCg==
X-Received: by 2002:a05:6512:3c9e:b0:4b6:a6e4:ab7a with SMTP id h30-20020a0565123c9e00b004b6a6e4ab7amr19349343lfv.8.1673093193582;
        Sat, 07 Jan 2023 04:06:33 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id m2-20020a056512114200b004caf992bba9sm551424lfg.268.2023.01.07.04.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 04:06:33 -0800 (PST)
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
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8150-pas: Add SM6375 CDSP
Date:   Sat,  7 Jan 2023 13:06:22 +0100
Message-Id: <20230107120623.1903056-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230107120623.1903056-1-konrad.dybcio@linaro.org>
References: <20230107120623.1903056-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add entries for SM6375 CDSP, as it's essentially identical to the one
on SM8150.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Rebase on top of recent changes, move to 8150 pas yaml

 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index b934252cf02b..082ae70a3fcb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sm6375-cdsp-pas
       - qcom,sm8150-adsp-pas
       - qcom,sm8150-cdsp-pas
       - qcom,sm8150-mpss-pas
@@ -51,6 +52,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sm6375-cdsp-pas
             - qcom,sm8150-adsp-pas
             - qcom,sm8150-cdsp-pas
             - qcom,sm8150-slpi-pas
@@ -74,6 +76,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sm6375-cdsp-pas
             - qcom,sm8150-adsp-pas
             - qcom,sm8150-cdsp-pas
             - qcom,sm8250-cdsp-pas
-- 
2.39.0

