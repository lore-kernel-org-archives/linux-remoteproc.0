Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EC7C001DE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Jun 2023 20:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjFZUAo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Jun 2023 16:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjFZUAn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Jun 2023 16:00:43 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F033171A
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jun 2023 13:00:42 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f973035d60so4713937e87.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jun 2023 13:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687809640; x=1690401640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ew8UatElinQVBbDWQGC104jo5vUD1VtlF84hGFnzhg=;
        b=EAe6QtmYYgTZelseWCLZ5EjotNUhXYzKz6i2W5LPHuT7Fgx6BY0Er7F5edr6pkkfQb
         8LJk2y+JZTunXE48IGHcFmw4j5aR5Ic4+SwYC9bRTRk3WM2jDFrsyariapKF+VyvegTo
         JJt/yVtrTTPBgPA1jjlR0sJhKXJDOStinipwR5qDOFSOtW6kGT7a1mL6PhTFKxF1Qqby
         jh8SdD0LH7clWQ7lEhrfTihibtQyJshXCRA5J1SVc1Dmhy4qXpuyMSUWkz1WJUkrNcnb
         1ZlV07l/cxsFBYUBmxgxvs3yZAcpCGUMXcKtiFtwSZzICpjgtxC5dqNTUVbdR3XBE84D
         Gofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687809640; x=1690401640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ew8UatElinQVBbDWQGC104jo5vUD1VtlF84hGFnzhg=;
        b=cpIcMI6r3g4mRkokVVzzaSNXvX1y5/6oZ4a7ofz1oYrQ14eHv5K5kzxUktp8KZmh5J
         IYhRIhFADOgvIW0h6ahpkJsxR4hpegsyt3wkclbvhJCP97WLmq8VKlLgQ1+BR8BdsjgS
         i7mdr1Siv34efA3ZUDAJcte/JjZHZUZsuqTXHnmSnxdubtm87ilbInrNoTGN8E8ssv/h
         dCip5FHv809KDudRRbhVlQ6Tv++JU5LasCKWjUgexnY5vpXOVLB3HG2GNUNkI15tpgQo
         uHoxRfLx+uIvk5AxaljhW8CBwyAMqFdSq4A+BAZNLTsRgn6W/gPlDy3irFzvTA8qv8N8
         zrPA==
X-Gm-Message-State: AC+VfDwX+1UZ7znxw+lczQ/UH59RWlmcgF+eT/cik8evlDi5vSFryBOB
        gLUsQPEyPbqcQW3ehDVkCn20SbomtlkhZKVo1lg=
X-Google-Smtp-Source: ACHHUZ48rX088vH0dhMGHftvtlxvi1YK3Clds1VpB2F/cRhWAq/7GpE+v7k0g0C/xt0AZckG9Iywcw==
X-Received: by 2002:ac2:5f4c:0:b0:4fb:7666:3bbf with SMTP id 12-20020ac25f4c000000b004fb76663bbfmr1813808lfz.26.1687809640337;
        Mon, 26 Jun 2023 13:00:40 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2494b000000b004fb74cb9670sm628082lfi.125.2023.06.26.13.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 13:00:40 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 26 Jun 2023 22:00:23 +0200
Subject: [PATCH 1/7] dt-bindings: qcom: Allow SoC names ending in "pro"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230626-topic-bindingsfixups-v1-1-254ae8642e69@linaro.org>
References: <20230626-topic-bindingsfixups-v1-0-254ae8642e69@linaro.org>
In-Reply-To: <20230626-topic-bindingsfixups-v1-0-254ae8642e69@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687809636; l=1157;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MDTupbJX2laygjY7lrmHa0kx1X7wxMzcrvh+5JykFVY=;
 b=kC6o6929j1t55J2hnXYqgbd4NnLclYK9YjNA7k63aZI53tl69GPgQjtg6jgH3tEMmNjunfaA8
 7HVChW9ztcNCPrB45d9eIuq/BqcLZKrjrJ7r7CvYser9Twh0m02WwCu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

There are a couple of SoCs whose names end in "pro", with the currently-
upstream examples being msm8974pro and msm8996pro. Allow such suffix in
SoC-specific compatibles.

Fixes: 5aa332c5e7ca ("dt-bindings: qcom: document preferred compatible naming")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index e333ec4a9c5f..607a1cf1ef94 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -31,7 +31,7 @@ properties:
   compatible:
     oneOf:
       # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+-.*$"
+      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+(pro|)-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,

-- 
2.41.0

