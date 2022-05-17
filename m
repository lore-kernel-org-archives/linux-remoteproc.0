Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88851C4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 May 2022 07:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239657AbiEQHBa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 03:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239876AbiEQHB2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 03:01:28 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A2620BC9
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:20 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id z2so32808885ejj.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=moO0mfzAsMtnfgS0NS7AObTvGTtLS3H0rOk3lb8ST4E=;
        b=aPGWNN3PAd3qCX5gCedlMYKZImBmit6DpCCYVTshbdtR+j+xvc2yU+HVk1RMXd6W6v
         1YkjAwxijgbh3d5sRwRypmdK5vt0wcFNlgoe7bCfFUSMyZAbpFoZoO4TIkL6A36o3GD0
         22f2v+HNc7k3R0+ODOqzxg5F7NeSAcyO8jpyWW4qRLhOAKuJxYQ63isb9IzmmGM4SmId
         N91X7IZEuOIjlw3KXtY91cOVwDr1oVtKiIJSBCHee8cSeZgAGO4Q5bmnx3C0lgcMg/kd
         nFe6Z+GP8qyclKNsrvJ/NWditH7WdWHSOjkoRRDmtzptwViPWZ+b6KedgfbvL2NfJRYU
         KOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moO0mfzAsMtnfgS0NS7AObTvGTtLS3H0rOk3lb8ST4E=;
        b=6Erdd32sEpYIpFASrYLHquS3+ubIr8RKnIle1+rAdQE88Y6UwYG8cblQBeOi/RiOAP
         IMiRV1yrlSpzxUjC3BnaetX2/wyz71IA4nAs5K9xJfmLHURWs7Nl6i7Bi/8SrPYM3RfZ
         wL/xr+a6+UNhfqFHKEgmkCogcKZ6Ev85JYsmltz+hc+QXdMPec62RXwjNTQmjDhUs7gt
         N55fXUDAuwlnWDXsvHwnMSvgnGujNHzAFHiqkDo7PsAp9VKlGajN2+VFJ72aXH8O113f
         Qf4J+CpwnjR/9YwBXITyBaqnD6Q1KFx8yjGEHsSZi1klo2irKnaQSvJg5+IcxjdDhn4c
         2WGQ==
X-Gm-Message-State: AOAM532SGB9q4e2MnTlj+XAPXHzC2WcKP3X1FYcm2jYH506wSyACrFnB
        xMuxL2oizUfnc3kO1iYxO0hSJQ==
X-Google-Smtp-Source: ABdhPJy/n8xO8YnxRehXQ1gZbEjZKoNLgBvMQ6gADrK7/3iIaYZ9CTI5ZfDCECnI+q9RXedO2sEsCw==
X-Received: by 2002:a17:907:72c5:b0:6f4:678:8742 with SMTP id du5-20020a17090772c500b006f406788742mr18676120ejc.607.1652770879157;
        Tue, 17 May 2022 00:01:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:18 -0700 (PDT)
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
Subject: [PATCH v2 01/12] dt-bindings: soc: qcom,wcnss: remove unneeded ref for names
Date:   Tue, 17 May 2022 09:01:02 +0200
Message-Id: <20220517070113.18023-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The core schema already sets a 'ref' for properties ending with 'names'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
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

