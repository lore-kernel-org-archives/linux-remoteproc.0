Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD186C32789
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 13:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239681AbiHQNOx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 09:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239782AbiHQNOj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:39 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EE44D81D
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r17so18939508lfm.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Ye4bqmRVQU/UtyZrgiLeA6KXU6bvQ0m892CxJrKhdQ4=;
        b=ed6cpMDb8WI+kpHuNPDw3tEHtLzGoeIM7/DhxZ8qY1spbgm2GgkLKM2vYL41UwjWTW
         Jr9TR0jKQQ5WmNC/Ebsaac+0rh0uwoGkYKo3oiCmJN6xlqoF2bO2Ltl+ci+4TMMgchCU
         FjSnDVVPFsVUXiiCcbt9tO1SmhcoEjt1SW0ez7B++yxaAZw7dskA50tLPmv+EVyh2vg7
         MltuQedxRcmvs4pBtnEZ8xEHWm/RYJHmvWfyR+i2TopkLd8TfOeeCbZGXGYJh7wu+1Hs
         /1WVWpH11/l7UHlZ+uMA4g/d/7NfcdEaXD97rSId0OpsKfyf+3LM6T3bHvGt1t3I+lzk
         Whvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Ye4bqmRVQU/UtyZrgiLeA6KXU6bvQ0m892CxJrKhdQ4=;
        b=oDJSXIpBCY4fUwFp8H3q+XR3Pi9rKkYdnmyPl+eXfabuPbSTQlRC/Kt0WLKavDyDSs
         ce6zQ2IueGzln3tIZmq2L00tHAUfZVorf+0GARBLF3FIfrasVx/9vbkvs4sjW92MMgEz
         0GAn8ct/T+swFpPw5mNo09St6Qz65KpYklCVRBYSsjXJdprT1tcLbl9n4W2jVp1zGoOn
         Qb4q9PKgLZZ1dvErp+0yWgmM5OWbIxm+h3soxN4dZ7KqhBaQJPMhF1OHDiFiPXaLNomy
         09v4PfypeSlI3XT+2yFAKpuaaJhePT1IEA1KpJnQ7xoX+0v7F8p+9KHKrhpFhwUadNDC
         z5rg==
X-Gm-Message-State: ACgBeo047FKBy7iMv7IRAQMBZz9M/ZYHZg0cdMZbbGnsAEgKZ14eQMO2
        qI5p9uF7VnZzDGpnEtgeuW3b9A==
X-Google-Smtp-Source: AA6agR40LiTC3alpKQxZw8Z8Ahc4i1D+Q9jCLV9rHVJrjn5TH84JSJC2mmd4LlwEX2Gei2nrCKh5+Q==
X-Received: by 2002:a05:6512:3047:b0:491:4104:cf93 with SMTP id b7-20020a056512304700b004914104cf93mr6591392lfb.546.1660742070296;
        Wed, 17 Aug 2022 06:14:30 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:29 -0700 (PDT)
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
Subject: [RFT PATCH 06/12] arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:14:09 +0300
Message-Id: <20220817131415.714340-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/ipq6018-cp01-c1.dtb: hwlock: 'reg' is a required property
  qcom/ipq6018-cp01-c1.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index aaad7d9059f6..ae56fccebe21 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -129,12 +129,6 @@ scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x80>;
-		#hwlock-cells = <1>;
-	};
-
 	pmuv8: pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
@@ -252,9 +246,10 @@ gcc: gcc@1800000 {
 			#reset-cells = <1>;
 		};
 
-		tcsr_mutex_regs: syscon@1905000 {
-			compatible = "syscon";
-			reg = <0x0 0x01905000 0x0 0x8000>;
+		tcsr_mutex: hwlock@1905000 {
+			compatible = "qcom,ipq6018-tcsr-mutex", "qcom,tcsr-mutex";
+			reg = <0x0 0x01905000 0x0 0x1000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr: syscon@1937000 {
-- 
2.34.1

