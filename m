Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B23C28B2B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 14:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240669AbiHQO77 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 10:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240666AbiHQO7k (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:40 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E19B9C506
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:35 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x19so19340445lfq.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BzLkT0nncnpwU42zLJxcSRVkF2Ex1yz3Pc4ZA2GSLC8=;
        b=f3Id0Vw2tmaJYcTPwqsRMRN12Srwfol/O4dNeDqvO6kbI4YHTPeBKlOHJV2VozYnWG
         8lS3+hVbHCjUFw2wis/spkVV05Jk4sKHschc/rRfgG0uJzFTiZ1aptrLvqX+UbzOAnZM
         6ENBhPZ6lR4CeYe56mdnX00BNBTusREQ1y19PRtiKLX4S2Pl4f7oIOfDlrTrGl5VYZ6L
         37Ajhq85s9gpyOTXcTqAZLCXiFSZiY4vArXxx8lDztyOD3uzsbhVEedHvkusOr60xdw/
         mO8Ojoz+tgHdZDwAEYDWuKOuAMCmhk9DpPDvW7ZBgKJ4m/QILYlt3+qaED/JQin9DQrM
         qFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BzLkT0nncnpwU42zLJxcSRVkF2Ex1yz3Pc4ZA2GSLC8=;
        b=m5VTMmOo2iMUVY3t1n1KNJPqvO7kUL0ofkQc5OAO5/4on2nT4ZQRfigdJSxV1kqeJn
         ldyjEtJLNwykVE1R1AE3xQuyNAqNA687SLbi2WWVL7D5N6boCkdpg3etLDv6EVhmwL7o
         oTqxQKBL5BNzJrvlJnNBQAJQi7NT8y2XzjGnn1ACabmKV8FEDXRgPDy36I9mPwfdk481
         V+U3Dm8tuGfleFjY7VKCfIQphgJMX9INqqu9DMZdUjkDm/NPJaSk4q0XtkY5j8OvEcPh
         tffnGmAy6Bv/LEhic5LSmPfaboPw/QWUdXkopdsgOoISZZiaCcK8CMLwid5l9sQWCDQH
         Lzvw==
X-Gm-Message-State: ACgBeo0VsVr4OAxl/jPMVmWA0IhvrxYZVPwq6LlDfEdYp5up2IU+EgrH
        S58cCTG1dbbKl31GHk7SxXlmAA==
X-Google-Smtp-Source: AA6agR4VCFoFEGTQhVbgTo6zVhkZfNfa5gjuQEynDVdo9WI4ZrDm20j5z04U8xl0msUC6I4xIaGJWw==
X-Received: by 2002:a05:6512:3c8d:b0:48a:f74a:67b6 with SMTP id h13-20020a0565123c8d00b0048af74a67b6mr10051711lfv.231.1660748363803;
        Wed, 17 Aug 2022 07:59:23 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 10/17] arm64: dts: qcom: msm8996: add missing TCSR syscon compatible
Date:   Wed, 17 Aug 2022 17:58:54 +0300
Message-Id: <20220817145901.865977-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

TCSR syscon node should come with dedicated compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 166374566a49..5f45d0589265 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3499,7 +3499,7 @@ frame@98c0000 {
 		};
 
 		saw3: syscon@9a10000 {
-			compatible = "syscon";
+			compatible = "qcom,tcsr-msm8996", "syscon";
 			reg = <0x09a10000 0x1000>;
 		};
 
-- 
2.34.1

