Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8720CC4321E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 May 2022 10:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352452AbiELKA6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 May 2022 06:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352451AbiELKAt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 May 2022 06:00:49 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168A22310AD
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:31 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ch13so9077216ejb.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 03:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LazXu2ADGNpRx7NCnnIVEulufa0K62/IELeSMelv/jU=;
        b=BHyoR/E36GrxjWs1c3eg3CzZO5xdXaVzfgKr8REoysiJBIoXmDeomsLrgQjPUGVJE4
         N0BTTEMn1hP2YM42kGbnQIz8vqZcwvr/Fzv4dVpI/vftfY5DZ+1Mgjo0Z7ggC++2uvRW
         gdJ7bNr4fgRHeU/DdcdbyqIspcud1++SG9XgVCgdwvPaWPbgIRsiPU7e/bL8/g/ojB5n
         pvthfGrkCsJb0+JwWkY6uuZYG9/gPVxqr315nh7DilaKhNWXoFNKWFBeR+bKNqwOefkA
         T/tIorJrXSW5nfinvxog5CrTs5+oWLo3HSG+eDBnzA5kFznjF53riH6o5EinWjJvbxz9
         Ms3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LazXu2ADGNpRx7NCnnIVEulufa0K62/IELeSMelv/jU=;
        b=bgVuDuO2v2i0hbJQL9daXEPnWWIk1Adk/H9Ay0Dm1PX4JhT3yh2t5KMXED9ELLP8dH
         wWDunnM27DvRdv3TYoUGP6KTvZqCQA83sT/5unRdnUstZoAYzLNvIWMCRwj4KHAa4nwC
         QOIXXGu2tsvZ5fgtEcR81QQlJFTByo/4zMrslLmzwsoe6KGwZLtyniO21MRZWMH/kdQg
         33x4M0YC3FbbCd+nLigSzdoGKPGbbMKSSn+29wDaKfeByY73UvB47/3PKXBunqkml5vM
         NTSQd0XvrU7b1CjSGYA65Vglo4Auv3+s4RJCJfRndlNOqQWj2Vx8yRPZBaRHZdTy46ux
         zURw==
X-Gm-Message-State: AOAM530Pghi5h6MN+zw6iOZUA5spCThY7Job4CuBFHAuFJ5RVaI1gzdm
        WIabb2UFAkk8X5jqPAp8Brc8qA==
X-Google-Smtp-Source: ABdhPJygUmKIFX9w14FfJap+NS6E/NvTIZIMP5lxsuHYESeGzfT7um6Ms1/YGk+DLjZEZIkjSaU50w==
X-Received: by 2002:a17:907:3d92:b0:6f4:5ddd:94d with SMTP id he18-20020a1709073d9200b006f45ddd094dmr28281564ejc.268.1652349629473;
        Thu, 12 May 2022 03:00:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:29 -0700 (PDT)
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
Subject: [PATCH 11/12] arm64: dts: qcom: sm8350: remove duplicated glink-edge interrupt
Date:   Thu, 12 May 2022 12:00:05 +0200
Message-Id: <20220512100006.99695-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Specifying interrupts and interrupts-extended is not correct.  Keep only
the extended ones, routed towards IPCC mailbox to fix warnings like:

  sm8350-sony-xperia-sagami-pdx214.dtb: glink-edge: More than one condition true in oneOf schema:
    {'$filename': 'Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml',

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 743cba9b683c..e8c341faa8df 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1677,7 +1677,6 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
 				mboxes = <&ipcc IPCC_CLIENT_MPSS
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
 				label = "modem";
 				qcom,remote-pid = <1>;
 			};
-- 
2.32.0

