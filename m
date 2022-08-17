Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C77C32772
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 13:14:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239776AbiHQNOt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 09:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239775AbiHQNOj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:39 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370374DB14
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:32 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id x9so13509749ljj.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pqtLuKgHuRzFaU11WfzhWYMqklF7F2EiVQK9EioMBZA=;
        b=b1fRqbAJMcp7MUX2FEM9tYc3wbUwUDEQG6V91K9FJXB6NCYbi8D9eNXaJrQ6acEsTz
         4FYHfDxLG1IWsEYf27Ra+q3ewylMGr6Xlt5s6AwP0ZZARxJx1qenfuOhtsEvPZIBfhLN
         JXf9eBsveGFDNDonbR6vec/7MYpWHTOl1UKTNt2VhfOYkmYa0INSFHB9UDbcjsbHepRQ
         2Kh4eja2X9Ifz34Yf1mUydYTe5ohxUbtDHiLypPq6+uYugreCR2vA1Exbhin+QsWpAKc
         9ddmxkO0Dga2GL8S+R/Zh2FGXM1M+K/W4GEi1n3f5ysqo4If32H3SIPosvL7T+nDU8TX
         YyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pqtLuKgHuRzFaU11WfzhWYMqklF7F2EiVQK9EioMBZA=;
        b=yyyUZaowPNVVxvMRhkCW1g6BrE98BErYGnvxvfpUQTA10xhek6PHzHRuREfzewdtif
         TqDEverHftgPwv7Xk7DI3UAMRTgjuabZr7QvTQCUJG3dAclkgEPlwlK5fEisMHXByC5S
         jIWWafT9ikFmOxfdNeZkLGbMByHiQlgmSKoBrlctZVJLg8DQT+EFegaKswNWpiKtqrYd
         N74R+pYeJchoLz4V6xbiBmocEAjIORMS+ZRWO8B4kpFAo0CrjFl5aR4PMIMfcxJs6EDQ
         WZbr84J/SIo411v+yd4rwAmHrQcZBqtm09hqsNlDJWmhTLzCeo6HoiRs2SGsXo74d2SZ
         v8AQ==
X-Gm-Message-State: ACgBeo2RtvTTJiziuC9Tvhh4lWiMU4u1OXlkz6oimDLAqpUBvWYBp41P
        D+QJ45xdtZTqlpsfrLiKpGVWmQ==
X-Google-Smtp-Source: AA6agR48PdRddyjQg7Y2vLx7jqebiR+4tCUBl5bItx/oMtFmrBED6xdwL9PgJoF15SElq6AQmcJWLw==
X-Received: by 2002:a2e:9e56:0:b0:261:7544:d79d with SMTP id g22-20020a2e9e56000000b002617544d79dmr1742755ljk.296.1660742071792;
        Wed, 17 Aug 2022 06:14:31 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:31 -0700 (PDT)
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
Subject: [RFT PATCH 07/12] arm64: dts: qcom: msm8994: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:14:10 +0300
Message-Id: <20220817131415.714340-8-krzysztof.kozlowski@linaro.org>
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

  qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: hwlock: 'reg' is a required property
  qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 8bc6c070e306..6a9bca6c2c5f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -164,12 +164,6 @@ memory@80000000 {
 		reg = <0 0x80000000 0 0>;
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x80>;
-		#hwlock-cells = <1>;
-	};
-
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
@@ -762,9 +756,10 @@ spmi_bus: spmi@fc4c0000 {
 			#interrupt-cells = <4>;
 		};
 
-		tcsr_mutex_regs: syscon@fd484000 {
-			compatible = "syscon";
-			reg = <0xfd484000 0x2000>;
+		tcsr_mutex: hwlock@fd484000 {
+			compatible = "qcom,msm8994-tcsr-mutex", "qcom,tcsr-mutex";
+			reg = <0xfd484000 0x1000>;
+			#hwlock-cells = <1>;
 		};
 
 		tlmm: pinctrl@fd510000 {
-- 
2.34.1

