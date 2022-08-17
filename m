Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB121C32793
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 15:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240493AbiHQPBF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 11:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240692AbiHQO7o (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:44 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55BD9C8F8
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:39 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a9so19307491lfm.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=fC7hlheaTm5w1H34Wr2YOUv8Ed7fsZ6b8bVojzbwAbY=;
        b=tYIn2f1vFpzKxc5wpKdYpd3cMd7jpxKiVxOXefbx/mDPQncG5P20pJxV345Gd5EDS1
         TLnyaTnkIIyb5v4re0S1HfUri+3i9GK2XYO4pWp67+sbIKmi/uJXGZy5vnuEZfiJhYhe
         CzcflfqEA9jOPwWf2eFi4V9/CJYK0qeP+ThG3rDGlt3c/4S39vRWTXphNopWljrZ3U2l
         CSn5ztf9F9FB+O8pDekITRLW1+fKnMGqUwnXOrFMWWbOyVPvD/luGwq6WoeguORryJVO
         kQ7JvltW1i7PEd1+0RoF06V1PkTwcfMiiVWjVDZYplCmrjq7p9goMeeSr5Sold9P9aV4
         rEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=fC7hlheaTm5w1H34Wr2YOUv8Ed7fsZ6b8bVojzbwAbY=;
        b=RpP5QAEUyNQtIie+lPNxd6Eu1nCRwBk+lN99/c1+Q5ae/lDHwOjG0paHntcbqBpoO0
         5OJpoWyOfrFzq/EztlcXTLFwrI0139HGpM4CSm3/Mpx2OabPlBfZg/kKUPQ+k5p0dkJl
         NUUVroI6jhIXPpUKY8TOfj79q67p2KK8BIazpioe8V8PQJxJ3nxmN5vsJtkrq8w/Wc1s
         6UVAkeT1W06NL/BGUiNRbAGyDmr0VKh6h+cZ+giKHgZaalsmEKPliPwUGyI3eY8anK3W
         ksa+G7PSJ/xYa+8qjqfCmWtP1hwGeFV1PrPjK5ojorhWZzLD1PVzqE/xk+N18x9FOR94
         dVKw==
X-Gm-Message-State: ACgBeo2cFK3LLHQP2K/KxzU3TSqrzivnvOuBxptwa0/rfQNUbfqrob6o
        IA53i0ok18GgnG3GQ2kyelCj/Q==
X-Google-Smtp-Source: AA6agR6EjC8fExgxxhpMAxuYoXd8u8z/6yGq+tGnwMOrrF1nrZFMatiDC8Dy5Jw+TwAsJ95iumBa1A==
X-Received: by 2002:a05:6512:201a:b0:48d:1101:cc9b with SMTP id a26-20020a056512201a00b0048d1101cc9bmr9599863lfb.152.1660748367409;
        Wed, 17 Aug 2022 07:59:27 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:26 -0700 (PDT)
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
Subject: [RFT PATCH v2 12/17] ARM: dts: qcom: msm8974: split TCSR halt regs out of mutex
Date:   Wed, 17 Aug 2022 17:58:56 +0300
Message-Id: <20220817145901.865977-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TCSR halt regs are next to TCSR mutex, so before converting the TCSR
mutex into device with address space, we need to split the halt regs to
its own syscon device.  This also describes more accurately the devices
and their IO address space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts        |  2 +-
 .../boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts   |  2 +-
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi |  2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                   | 11 ++++++++---
 arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts   |  2 +-
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts    |  2 +-
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts    |  2 +-
 7 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 3051a861ff0c..2709a99e5c4c 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -38,7 +38,7 @@ &otg {
 	status = "okay";
 
 	phys = <&usb_hs2_phy>;
-	phy-select = <&tcsr 0xb000 1>;
+	phy-select = <&tcsr_2 0xb000 1>;
 	extcon = <&smbb>, <&usb_id>;
 	vbus-supply = <&chg_otg>;
 	hnp-disable;
diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index ec5d340562b6..5fd94dd6a427 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -251,7 +251,7 @@ &otg {
 	status = "okay";
 
 	phys = <&usb_hs1_phy>;
-	phy-select = <&tcsr 0xb000 0>;
+	phy-select = <&tcsr_2 0xb000 0>;
 
 	extcon = <&charger>, <&usb_id>;
 	vbus-supply = <&usb_otg_vbus>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
index 5a70683d9103..118b231f3137 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -136,7 +136,7 @@ &otg {
 	status = "okay";
 
 	phys = <&usb_hs1_phy>;
-	phy-select = <&tcsr 0xb000 0>;
+	phy-select = <&tcsr_2 0xb000 0>;
 	extcon = <&smbb>, <&usb_id>;
 	vbus-supply = <&chg_otg>;
 
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 90a6d4b7605c..ada232bed2c8 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1189,7 +1189,7 @@ remoteproc_mss: remoteproc@fc880000 {
 			resets = <&gcc GCC_MSS_RESTART>;
 			reset-names = "mss_restart";
 
-			qcom,halt-regs = <&tcsr_mutex_block 0x1180 0x1200 0x1280>;
+			qcom,halt-regs = <&tcsr_1 0x180 0x200 0x280>;
 
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
@@ -1230,10 +1230,15 @@ smd-edge {
 
 		tcsr_mutex_block: syscon@fd484000 {
 			compatible = "syscon";
-			reg = <0xfd484000 0x2000>;
+			reg = <0xfd484000 0x1000>;
 		};
 
-		tcsr: syscon@fd4a0000 {
+		tcsr_1: syscon@fd485000 {
+			compatible = "qcom,tcsr-msm8974", "syscon";
+			reg = <0xfd485000 0x1000>;
+		};
+
+		tcsr_2: syscon@fd4a0000 {
 			compatible = "qcom,tcsr-msm8974", "syscon";
 			reg = <0xfd4a0000 0x10000>;
 		};
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
index ff6e0066768b..c264d17e0953 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
@@ -89,7 +89,7 @@ &otg {
 	status = "okay";
 
 	phys = <&usb_hs1_phy>;
-	phy-select = <&tcsr 0xb000 0>;
+	phy-select = <&tcsr_2 0xb000 0>;
 	extcon = <&smbb>, <&usb_id>;
 	vbus-supply = <&chg_otg>;
 
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
index 983e10c3d863..2691a6dbbb8b 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
@@ -379,7 +379,7 @@ &otg {
 	status = "okay";
 
 	phys = <&usb_hs1_phy>;
-	phy-select = <&tcsr 0xb000 0>;
+	phy-select = <&tcsr_2 0xb000 0>;
 
 	hnp-disable;
 	srp-disable;
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 3f45f5c5d37b..d2bef3896c82 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -216,7 +216,7 @@ &otg {
 	status = "okay";
 
 	phys = <&usb_hs1_phy>;
-	phy-select = <&tcsr 0xb000 0>;
+	phy-select = <&tcsr_2 0xb000 0>;
 	extcon = <&smbb>, <&usb_id>;
 	vbus-supply = <&chg_otg>;
 
-- 
2.34.1

