Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D93C6FA8E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Sep 2022 15:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbiITPFQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Sep 2022 11:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbiITPEm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 11:04:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7772BE3
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 08:04:29 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j16so4300621lfg.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uGVId7ajaDqTRILJwbUDyK1M1OoEGlOt7PBKotR6xVM=;
        b=rTCouT/5+rTbr/qoDH2r9+QQP1b0txBsTuK1g62F+FkXrWnr7by0oFOiC4rV+vZozh
         GjQGX0wVvO8kEVgop5xW2KblCelmgTncdFZ/EZH5dOl1S/w7H/hBDxkkBEQ+bKi3JUcp
         fd6HSpY6dg5GWbqVe5b2uELdK3zV+TR+Ex6vS4U2sdhAfJEtZR8+X8wAQpl41d5sFBBE
         qML3MdKvhxaH97IEh+C6oVDRNGbf2DZpr92JSAtM3w7mEQkLI8Edlc5oD3W+xUrlLlk4
         7lMrjDguImusQaJH+WaRXF6sVh2OfronV4ZIV/vs/jUv163QAIN4fpEg+i7hvAIESkrx
         OFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uGVId7ajaDqTRILJwbUDyK1M1OoEGlOt7PBKotR6xVM=;
        b=G0ikGSPyyAr/TFXJWITSSnMqquZq+XJQrE5jbCCQG1MuPBMKYpyRNOc5PaNbY4hmeK
         zTYLluvnMKGiucFwBXw713albh/3Mwryi97Q+UuFYOGawi5rRPMLnREChsepX/ckouzQ
         jh6U7FC7jzcnJOkDTC+x+OL5b7x4vyBY+qnIdjaJgOcVdQvsGv2yAzmwKkZfVz4vz+5o
         U1CXPycoeH0+rKtjKjiNXCXovGt/MkxjBClJIZVs7yaj5Rod2QV9RSyMeAnLF6Bdpd5t
         zhNKb7hrsfAxORGNsF8l5F0DDTUt2n6gi9QOSoc1CblGoe6+Dx8KwWjH0t+Snf5NnNiS
         i99g==
X-Gm-Message-State: ACrzQf2SQEub977Sf2Ow1AffZYkhOm0V6GYIkZml5Qp2RyOaN1MIkv6J
        7cQHq/UcbWAode/U1PTUW3pUcQ==
X-Google-Smtp-Source: AMsMyM4KZDnbUtIxrgZe74ARw4Teo3eNN5N0ZL8MWZrI3hDx/FYuj2pOhfDr9WHVD11ZLqbMRW07Ag==
X-Received: by 2002:a05:6512:36c1:b0:497:abef:cce5 with SMTP id e1-20020a05651236c100b00497abefcce5mr8578939lfs.472.1663686261140;
        Tue, 20 Sep 2022 08:04:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b0049f54a976e3sm8294lfo.58.2022.09.20.08.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:04:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 3/3] ARM: dts: qcom: msm8974: switch TCSR mutex to MMIO
Date:   Tue, 20 Sep 2022 17:04:14 +0200
Message-Id: <20220920150414.637634-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
References: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable, as
TCSR mutex is actually a dedicated IO address space, and it also fixes
DT schema checks:

  qcom-msm8974-sony-xperia-rhine-amami.dtb: tcsr-mutex: 'reg' is a required property
  qcom-msm8974-sony-xperia-rhine-amami.dtb: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index a4e12daf3eeb..7bc19b5375f6 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1194,7 +1194,7 @@ remoteproc_mss: remoteproc@fc880000 {
 			resets = <&gcc GCC_MSS_RESTART>;
 			reset-names = "mss_restart";
 
-			qcom,halt-regs = <&tcsr_mutex_block 0x1180 0x1200 0x1280>;
+			qcom,halt-regs = <&tcsr_mutex 0x1180 0x1200 0x1280>;
 
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
@@ -1233,9 +1233,10 @@ smd-edge {
 			};
 		};
 
-		tcsr_mutex_block: syscon@fd484000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@fd484000 {
+			compatible = "qcom,msm8974-tcsr-mutex", "qcom,tcsr-mutex", "syscon";
 			reg = <0xfd484000 0x2000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr: syscon@fd4a0000 {
@@ -1719,13 +1720,6 @@ reboot-mode {
 		};
 	};
 
-	tcsr_mutex: tcsr-mutex {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_block 0 0x80>;
-
-		#hwlock-cells = <1>;
-	};
-
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-- 
2.34.1

