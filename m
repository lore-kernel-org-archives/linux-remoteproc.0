Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6BCC04FE0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 27 Jul 2023 17:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjG0Rdc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 Jul 2023 13:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbjG0Rdb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 Jul 2023 13:33:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CE52D75
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jul 2023 10:33:29 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso2212476e87.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jul 2023 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690479207; x=1691084007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zU/cjwRMTTz2495il9q5eV7STYjp78SNHViO7CJZv4=;
        b=aawJwoZtdtlmzFYOH9u38ujoIumO7jTEeokK1PlW6G4RYjskCVvfxlQuM4q1rIrW5c
         uEeDIeQ6ikVcKR508t9ozGw+K3YUik1eK8/IIoRuqJu4nyi8OQ5npMAvkJx4/KNhfXts
         h4dRUvNzbp5tUO4pjrkDGrcK+ihh4pDEihVLl1D7hWQc37yUPsxm9v8QI9Xw6r902zXO
         /nOk/67a0rB/z8QQ1ntwWmW+dEUX+43fDzeHPt8j8A40Z2Oopfx3hUZMg6KU0/b1zYwp
         PfrjpKia56s3+1klgDK9OSrPYFHN6rcu92CxGSmbWOawxtiUti5xQUz0VeBme4AhYz0S
         Hl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690479207; x=1691084007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zU/cjwRMTTz2495il9q5eV7STYjp78SNHViO7CJZv4=;
        b=IN0gEuiyXppCVXnZ0Q7d+NQ/6V6JWYwIsEzESLJ22dRQy1n9DnEUM/e0T3hKVEXmz5
         oVa6gFvD9/Aiio2fQfzLF9FlWj4ZS8CiBsBgc+t1mQgqmbO7ZnXlOYOF35oYzVmEZP97
         PNdGQg1DPf97R9VTaffZy3W7eftWNgc/Cdv4c0q5xKPXSWKy7HHLm1Ou1qJdd855FwjY
         X+QdAXmbNax5jN/FZH8wIo4O4AyeXG0fXKqX/OteM7OAX+fPHj9/ztV/LC4Bn0iE30Wj
         d/ohqan0dHN1jzmC9Yb9+1grXtq+F6EFZfY+7qtGT/+EfQ3iLBIQu/pViG/GP3FNU03g
         Tgjw==
X-Gm-Message-State: ABy/qLYVsu9gSCFMtqdiRbjrr8Bk2rrrFCbri96YrGFfAbTZWxOgOzev
        IUbIIGVQSkreowrfsip0gMtXsQ==
X-Google-Smtp-Source: APBJJlFLZ+7kfHF1+btz2Bf3Qwq8581ll27cAP4w+uf+K6K4zg9kauFawNUx8bbmAESVTdSDqToJFA==
X-Received: by 2002:a19:7512:0:b0:4fb:9da2:6cec with SMTP id y18-20020a197512000000b004fb9da26cecmr2285617lfe.7.1690479207657;
        Thu, 27 Jul 2023 10:33:27 -0700 (PDT)
Received: from [192.168.1.101] (abxi99.neoplus.adsl.tpnet.pl. [83.9.2.99])
        by smtp.gmail.com with ESMTPSA id g4-20020a19ac04000000b004fe07f06337sm412089lfc.53.2023.07.27.10.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:33:26 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 27 Jul 2023 19:33:22 +0200
Subject: [PATCH v5 2/3] remoteproc: qcom: pas: Add SM6375 ADSP & CDSP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230725-topic-6375_rproc-v5-2-a8e9cde56a20@linaro.org>
References: <20230725-topic-6375_rproc-v5-0-a8e9cde56a20@linaro.org>
In-Reply-To: <20230725-topic-6375_rproc-v5-0-a8e9cde56a20@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690479202; l=1093;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dhLWSUNPf4MHw81JBZTsRJ2sX68bGcNHGXn7nRcPQs0=;
 b=gzkyaQ6/ofOUqpvt1ivZImnV4ynsHOFETL170ObvEWPjt1AMTQE+p/TkX2lH3oFt/1iF7Xuvg
 p7Wkmpb9aT3Brn5oZqoegSVEj1t38p8oYRTs7SGZ+EK1Wko2IPPTaEi
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a config for the ADSP&CDSP present on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b5447dd2dd35..0d58b5be9a77 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1180,6 +1180,8 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
+	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},

-- 
2.41.0

