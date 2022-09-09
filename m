Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F759ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 09:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbiIIJVT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiIIJVF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:21:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B48109D22
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 02:20:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f11so1659490lfa.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 02:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qaIdW5O82kxfv9Y1sMxSlPwy2QYyGigvAsH9y7GzQoA=;
        b=Pe3F5Tr2dNQAdLyzJ1lLZktvkaHOHP0Jf8F52iT+MUTkPp1C8mfc2+Khy3GIac1FOB
         uqiUeVjkOHU7C3I9RwqEArSUJWq5mNXnOYhtuIfczzGqZae881jH7xWJD39w7jFCwZY3
         VjRhIJs3B1Bc5BXYmgyKjQh/oFEJ9f8XqyEZgSPNQzxhIzOVLUgCvSX/hlOi3QdUaJ/p
         R9VGxkL5c9iHP2Ng97Wga/KIAblOlldkWykuZMsxpNdX7ngpKwjjJH6n6YyjSwlZQGnv
         XHmCZoXV4hSXDPpAAOvDbWwJ4AXkE2ZLjHdUtj4ti64HdrMwbaCBYZnKs8SIn5BLiLrx
         4rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qaIdW5O82kxfv9Y1sMxSlPwy2QYyGigvAsH9y7GzQoA=;
        b=SGAC5w54bCyeS+L0sWyJZOHWJ76ZT1UxKala3VXof6Y2IW0AZ6nzJRO6RTqkofE6ah
         T9EMe81WUiQGMQzYyRKwi33PoG2/8coHUW5E2VCKVF3p1HErmdsaUjXYCAIL33wmKzmJ
         +Cd0Q/EC1lVs2aFYBJR14rx97KySB0tYyjc35XoHmUdDh0MxIZ7FZWZ9nDySZwCwiT7R
         r441ey6fM9JaiEY/ow5nWhlncTLlyO98/hTMO5ACdI+cRJYCTrXxNwcHTfUB98wtRK42
         aTDTvs6pr2pw//fgp3b4Yqw1EA+1tJryxymuL7RiE/A5pSMB1hs7wsf8chyXmhYpxRh/
         mP4Q==
X-Gm-Message-State: ACgBeo0nknlqMrGS02PflpPS3wPHsE1UkYPCiaH8FYU/T8GzDfOqE1ml
        Vg37C0R3MCYWV2x23WSA3oPQLw==
X-Google-Smtp-Source: AA6agR44fDvYIbtoSOS3Rc2m+6bRAMcMfqh0zcGzhgGVy9VEv5JpTdbOa281M6k2+ZgGXHNw0eybTw==
X-Received: by 2002:a05:6512:1052:b0:498:f8d8:f74 with SMTP id c18-20020a056512105200b00498f8d80f74mr653860lfb.683.1662715254298;
        Fri, 09 Sep 2022 02:20:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:53 -0700 (PDT)
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
Subject: [PATCH v3 11/15] arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
Date:   Fri,  9 Sep 2022 11:20:31 +0200
Message-Id: <20220909092035.223915-12-krzysztof.kozlowski@linaro.org>
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

  qcom/ipq6018-cp01-c1.dtb: hwlock: 'reg' is a required property
  qcom/ipq6018-cp01-c1.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 6b35f03c4862..a7c7ca980a71 100644
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

