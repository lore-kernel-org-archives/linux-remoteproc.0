Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677E5C25B08
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 14:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240671AbiHQO7l (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 10:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240618AbiHQO7d (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:33 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8D79D120
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:24 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id u1so19343382lfq.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ANavTHdhnB5H/zimGyX1UGPrp6R0+SdK4bVct34NTMU=;
        b=V+g0+ED9MwDtJibWWYJqlh4m242iKsb8y9YinUV4Oa2+UriGLh/DZ07CGBU5SQT8vQ
         VsKe+GzAJeSO9gtTXexsaXShhB9kY+OJ7yD/DDCdxz3j1NOLlMnDA1/mvPV7meIvyljV
         XPMeYYgHbM9/HAnS/1sOl2zCdFmukOFNRwQN/ly7CprzbDFhrGmWPPNJaTTYbY8/K4C+
         1jFSLqvFtVSr8Z9dGfKHUyyc2NsnZeJkn8hD7oVrKuIxzZJeXD53ee2oo9Tawlgj62Me
         cei3oPHNMTUa2qVeb7TN5pNcxKTJKS2tfaX6qPMUMqzN0GUtJTbiNW3FdSnWdKdtx+3I
         QWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ANavTHdhnB5H/zimGyX1UGPrp6R0+SdK4bVct34NTMU=;
        b=g6N3/xA0zPHHCwP0CnmdifjmPncPrqsS34IRv+fw1YaIPWXWAWGPOsSg3+8vQXDfX5
         VvjxfT76IySAxHHziyAkfl/2fNyvSbPZUeV2UTxW7INOsjU0xzpnqoaup2W/oPHrhZkD
         8hEHpdMS/OcTKLHFjRKSfuwSGhBhbbXFhjH2to1KQOpMs76Vc5/y1H1A4QKeojYt+/+S
         XlmLC2U+dBC9EhvTv9dpWjSSWAtHo4hw3+Hc5qDOew6fkCDRVYA0Q9+BC6GIfqno9r0T
         +de1/qjQvZRWYAE0zVBfAqjWGHX8LnI+xDYEAespJBhvGHHgAjmmUtv6f6UlinyWZaVl
         lLpw==
X-Gm-Message-State: ACgBeo3/Gqhlm2rIkq0kvwg/yeN5lKtQ7jsIJsnVVTHET8BwkSwk9Pen
        YXtpgqOiV/toqUHkrYxDRyy5wA==
X-Google-Smtp-Source: AA6agR6PzUNjcLDCTtu9OaHGdNag+EHgbRCnoccmPfcY7h6GOYEQQ06FKNYGgkFXqEs1xPtTzbN8cg==
X-Received: by 2002:a05:6512:2349:b0:48c:ee14:7fc with SMTP id p9-20020a056512234900b0048cee1407fcmr8974141lfu.71.1660748360267;
        Wed, 17 Aug 2022 07:59:20 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:19 -0700 (PDT)
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
Subject: [RFT PATCH v2 08/17] arm64: dts: qcom: msm8953: add missing TCSR syscon compatible
Date:   Wed, 17 Aug 2022 17:58:52 +0300
Message-Id: <20220817145901.865977-9-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 8416a45ca4fd..ed05897d33f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -722,7 +722,7 @@ tcsr: syscon@1937000 {
 		};
 
 		tcsr_phy_clk_scheme_sel: syscon@193f044 {
-			compatible = "syscon";
+			compatible = "qcom,tcsr-msm8953", "syscon";
 			reg = <0x193f044 0x4>;
 		};
 
-- 
2.34.1

