Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08F4ECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 09:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbiIIJVs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbiIIJVO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:21:14 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDBB12D578
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 02:21:01 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id by6so1075107ljb.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Yb2tg6NLcz0SjyT+zhbpZCCAWG7Bnyw4PloKDdxoVAU=;
        b=f/7QeSSps5TESCFk8jMvoH4gZ+ybCQsYE2/4pGB5NK22t1fLqB1HRBruOnRDqC1/9o
         vvoHjMR8vSLvEHyJqvYJHtLNAwICFDq2lY0is6u1vshVHoEZPh9ILUitiMVr33ns9uUk
         F77D9r3kykYxlkVNFYJaUt4y1UnzFy5GkAzzF+bS6glstvqVK3J1OKf7JF/yDCTSRLPV
         X510QS+7XE7FZYFtroemve6D2B5qJC60i4mrxhK2JLES6Cvg/V0Io177YdJLT/HQddsc
         /O5I0WWlYxMxzKqitQIhOK0f6H2dKfDwX06mNtjUwMRCCnTGjkIQbEcCTeNH9o5m4kdu
         Iorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Yb2tg6NLcz0SjyT+zhbpZCCAWG7Bnyw4PloKDdxoVAU=;
        b=1AL8CLPZ1EFyIRsQ1Jk7notTPqlygbVaG9N0SbFfZ+pxnm3a2zpwM6OFsOoZYggUAD
         IW6JVBlhQOVySQScuP41O2e8UKfZ/oP6WgbXFiJRfH59Bnk/B73kbChOKNtxesAneC7M
         +J0Sa7miBghSgiGJFD/uwn4RRdc00Tqs6PCLa5BpFrZLILvomO3C923o3TZCGcJIrEdB
         tFINvxR/suyd8OWyWniwZPsu3jo1y/84Mof5uP5z3sF4pCV8xGhRTLvzuJO06KUG3IJH
         pAmmcdl6TmQyL2oyaG/aU9XP/oYwTpief1vDpXVshiaYUJ3lsTYwJm577zDhH1kE7JQj
         jSZA==
X-Gm-Message-State: ACgBeo2NT0ALRHHzmjDNdO8Oy1+tNEvoluVRpw7oTpG/qMRjO3KJKgmM
        GeX7PJHfM+UCzQ+RHIji1x7cgA==
X-Google-Smtp-Source: AA6agR4L8LIUifZts/uFRSogq6G/TlU4lexPTUJbQgl5rZWDaWwSt/lS1G4J1EhJjypzzo4lvAyZmQ==
X-Received: by 2002:a2e:a234:0:b0:26a:a85e:f782 with SMTP id i20-20020a2ea234000000b0026aa85ef782mr3625115ljm.74.1662715259166;
        Fri, 09 Sep 2022 02:20:59 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 15/15] ARM: dts: qcom: msm8226: switch TCSR mutex to MMIO
Date:   Fri,  9 Sep 2022 11:20:35 +0200
Message-Id: <20220909092035.223915-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom-msm8226-samsung-s3ve3g.dtb: hwlock: 'reg' is a required property
  qcom-msm8226-samsung-s3ve3g.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8226.dtsi | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
index 0b5effdb269a..efb5d1edc3a8 100644
--- a/arch/arm/boot/dts/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -44,13 +44,6 @@ scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_block 0 0x80>;
-
-		#hwlock-cells = <1>;
-	};
-
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -508,9 +501,10 @@ rpm_msg_ram: memory@fc428000 {
 			reg = <0xfc428000 0x4000>;
 		};
 
-		tcsr_mutex_block: syscon@fd484000 {
-			compatible = "syscon";
-			reg = <0xfd484000 0x2000>;
+		tcsr_mutex: hwlock@fd484000 {
+			compatible = "qcom,msm8226-tcsr-mutex", "qcom,tcsr-mutex";
+			reg = <0xfd484000 0x1000>;
+			#hwlock-cells = <1>;
 		};
 	};
 
-- 
2.34.1

