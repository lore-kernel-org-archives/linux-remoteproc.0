Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00968C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 May 2022 07:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240180AbiEQHBi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 03:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240808AbiEQHBe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 03:01:34 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989383CFF4
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:32 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id z2so32809039ejj.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 00:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bc1mIt/3dkcIrUfw+Wx32EX6v+iTPPZGITrndOapvM4=;
        b=Fjh6poNxasG94ErQpFcdlbjAl0+dlDmlCBoaT6HDLJGKC2Kw5OTZ92q8Dr7fo/kBF3
         BLNhTmSo5/UVu2d9ilG70dsB8hTy4sLrmiex8pe6YJnw3utstVhoF1BcSiHY/9fMkZBL
         xH4r97n04dXzIzRWhJvmJU+5eBiVSVbT6hT31XGH0IhBX+7iugUTRaSR1H4ewVuUO4nA
         l9XGL7TQX4/ozmnfXw11EBk8btdV96qaweYJ5tsPVAMzCFpFjbBx6YvvpiGTbhOTrLgL
         w5hKS9/BnpqQZc0GdsSBzhNdf3UODOS2hof9D/XKWnW0dLTLVx7fhOkn5thbJCdos7qx
         V+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bc1mIt/3dkcIrUfw+Wx32EX6v+iTPPZGITrndOapvM4=;
        b=e8ig5F7VYhI6f8euEZy7bImc+OLdhAwzUrm9CmnksLewQikRVmaQsSk0vNhxbqrtNj
         u0m4ioi+EAR/TWRuVgMCfZdbFQOVy21xUWtcZ21kXSRinTp3ud5QYj9rIbC/xLSr11os
         7wOFdYahDiM1jdo9yRjo5DanVCQTwYjVJ0eUEWqkmn0KFCKfS7nn6RQz9CwIr+fHtGnJ
         +AtO3oRs94tE452FvIIfn6OKg2MLNV9YFd+2rM2f6VR5jncI1P0Lf5nk6QD4CA7OWduJ
         OQotm3O+IlvcKw3FHhqjNaFWBLV2Y+3LACsXyhu8ex21w/xzyupzv6xKjArwzquGdC3q
         DplQ==
X-Gm-Message-State: AOAM533E4c486EhJWGqGDuh/u0JhlOLXcv+2YGko6GhyIfh/Ajy3SeD3
        MdrB12EsXV7eXoFVHZjac8F46Q==
X-Google-Smtp-Source: ABdhPJzkUfAuTvwacS7XtUrVOynLJXz12kNbe6zJA4OEiOtW6jW6Kj8UltSzl8K/mI/BNt0o0hkPBA==
X-Received: by 2002:a17:907:94d2:b0:6f4:b5f9:6f3a with SMTP id dn18-20020a17090794d200b006f4b5f96f3amr18025368ejc.313.1652770891993;
        Tue, 17 May 2022 00:01:31 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 12/12] arm64: dts: qcom: sm8450: remove duplicated glink-edge interrupt
Date:   Tue, 17 May 2022 09:01:13 +0200
Message-Id: <20220517070113.18023-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Specifying interrupts and interrupts-extended is not correct.  Keep only
the extended ones, routed towards IPCC mailbox to fix warnings like:

  sm8450-qrd.dtb: glink-edge: More than one condition true in oneOf schema:
    {'$filename': 'Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml',

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7d08fad76371..4e796f27d6fc 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2282,7 +2282,6 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
 				mboxes = <&ipcc IPCC_CLIENT_MPSS
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
 				label = "modem";
 				qcom,remote-pid = <1>;
 			};
-- 
2.32.0

