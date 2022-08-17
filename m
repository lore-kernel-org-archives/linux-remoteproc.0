Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7E7C32789
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 13:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbiHQNPB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 09:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239809AbiHQNOs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:48 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C844951A22
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:39 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id by6so13503371ljb.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Yb2tg6NLcz0SjyT+zhbpZCCAWG7Bnyw4PloKDdxoVAU=;
        b=StgnaHhGCg7OOpqTG13+gQqRFOCLdTRA/VCywEDqg9kMIxRkqhIjEL6/unZNraETkB
         OY78slefTO6VmDzp97WDvD8kTArUqhb1NLsuK7dpIINzEiwMK1YWNK9g8TqUfbVweYMm
         FIgJ0b+KVQtMsadPvgTAwA26rnWXysiwVIdai5xvQ4DdVGOA3ClgjDb5I0IEcgQ+Gv1U
         pyhxFEJkeL2O6+cfBaxxXSVEhe4+VnOd7U8+etGNUDTddXn7jHg1/sKyJW5B3MseCKzD
         NP8IjoOxxroQY3Y1ne8qNUgojmtamVj7SkkIGcdYG36ye/FMasRKQE/ytP2+enkQueNs
         RdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Yb2tg6NLcz0SjyT+zhbpZCCAWG7Bnyw4PloKDdxoVAU=;
        b=DIH+8oTmZbuD2iqKx7c05nLDdKxkCg+HfNQrtwRpOdEthO121SdolL8P85oyqRX47j
         4HVuqzT/m6SxB2fGCeJ6L8qrH/+LGqsPgrPRM62RODqlfllMdz3Z+6A2HhymTZUm+Sca
         qJUJrQpuLa11CJQYA5hyX92X6g65sEPkCsop7BhAIFDsrWPs6F/YDMNG0FlHBhQ6J2GQ
         XLXJnHTug1H2439ZtWXe1In7vniD04+IbpWkIue+s0BYn70Op8sEgFTLcvMcbBMlLoAU
         a1SNTFcYIPviqeJUyqhi/hDsDmXmGKi+nTYDCGo3O8hbKsSBn/S3m3J0/dih9DaV0Mws
         NIeg==
X-Gm-Message-State: ACgBeo07sPJaM9zVrMm4Ro0jLEY3QoHXViW76TzWFcrlmBti+EEpwN58
        fpiuVw6AdU7k7jMaouQPYxG7yQ==
X-Google-Smtp-Source: AA6agR4Jr9dVJN0cBFc7EFaxXfsdQSVgqEaGe2HDLtNEJ6H2epeCLVj35rKOvxNYeo5RnnOoO2U2wg==
X-Received: by 2002:a05:651c:10d2:b0:25e:5a65:9026 with SMTP id l18-20020a05651c10d200b0025e5a659026mr8217403ljn.193.1660742079394;
        Wed, 17 Aug 2022 06:14:39 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:38 -0700 (PDT)
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
Subject: [RFT PATCH 12/12] ARM: dts: qcom: msm8226: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:14:15 +0300
Message-Id: <20220817131415.714340-13-krzysztof.kozlowski@linaro.org>
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

