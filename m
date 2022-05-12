Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5262C43217
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 May 2022 10:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352379AbiELKAZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 May 2022 06:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352376AbiELKAU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 May 2022 06:00:20 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D862B22EA71
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:18 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z19so5588537edx.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emzH+JokSC0O/Ko2ZLGcXwOO6UT/JvwHW3bVaLoX1oI=;
        b=IR4qiHWxHg5QD/BjSENOSJVPuLhW9zy59KW+f5fyG6rxVek9cMHJajUEBcMA4YzJ93
         d1TefSNpzwjpwW+yDfM0GZN3y5PbxmucErU4dXaqW0Ew2ED6U8gL639BPGm/VdJiVlJt
         RFoHZzesauJ2F6xao0X93WUsPUL/VcJnAQ1udsI6FueNthd2ptiYnDZHoOyDaF33yfx7
         CYVZCRzX+qtFTiNrYE1kDGaRSdOBHv3YDLY0O3JfDQXZA8fhMfW35abzFTbvNWz5zlWk
         mU69IfMX+Cwr9Jh9dQVsNv2E5K5moXF/aCCEIvExmEjIuz9MeiOWMRVE1A+J1SEwEAlZ
         cxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emzH+JokSC0O/Ko2ZLGcXwOO6UT/JvwHW3bVaLoX1oI=;
        b=cvVv2hXTOg9vC9J2uSwPYfiiP9cyUytzc0qOTp8ezmL+0n+dg9D/2hEPIgx2wXRab2
         X765jNQ9qJ4INwLqnh4Je97Jk26bdhqCgvM2fyzVKydm0zvDgw9IZygoeTmwOH3AFL4J
         lzXLNg6/IvfGjVu4nb02KMt8thCJIMK342IfkVemfXFoKsBUGchwfoEH0PR4t+u0JCvQ
         94lg+g3zOo3G6hL63yHe7v/UNBlTLYnQ7AkUzOz4lJXBkkqrHJooiJsFBZm1tQC/HrbE
         KafUAxq+9e9lHHnRYuWWNG/lfTpcrTcp11Np9Qsb4WmRoHjULEJEiqLTQDIs9jEI/sOB
         ddGg==
X-Gm-Message-State: AOAM531S3eNWO4wmIccEF92FhfoywsO8h9H9WBp8qHVvV7Oo+b2MlB8M
        6pKwiTAWdmhmvC7TVZ/Ju8QeOA==
X-Google-Smtp-Source: ABdhPJwI/kkZa2f79DEgU8mGj/rNuBIgrTItBI+pcSdRN9/xrHd4kzXsSy712av4kUjt+8cA2AwxMA==
X-Received: by 2002:a50:a6c8:0:b0:428:5b3a:6c99 with SMTP id f8-20020a50a6c8000000b004285b3a6c99mr33119168edc.222.1652349617300;
        Thu, 12 May 2022 03:00:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/12] dt-bindings: soc: qcom,wcnss: remove unneeded ref for names
Date:   Thu, 12 May 2022 11:59:55 +0200
Message-Id: <20220512100006.99695-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The core schema already sets a 'ref' for properties ending with 'names'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
index d891ecfb2691..5320504bb5e0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
@@ -77,7 +77,6 @@ properties:
           Should reference the tx-enable and tx-rings-empty SMEM states.
 
       qcom,smem-state-names:
-        $ref: /schemas/types.yaml#/definitions/string-array
         items:
           - const: tx-enable
           - const: tx-rings-empty
-- 
2.32.0

