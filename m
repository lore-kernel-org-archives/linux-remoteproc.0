Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E89FEB64DC
	for <linux-remoteproc@archiver.kernel.org>; Fri, 21 Jul 2023 15:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbjGUPgZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbjGUPgV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Jul 2023 11:36:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9174335BB
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jul 2023 08:36:12 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fddd4e942eso3000961e87.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jul 2023 08:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689953771; x=1690558571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTjKmbTUoKZtW5LXWjKkpdkle/49HkSEc09M87FklNo=;
        b=hlq0hxQUQmlpWkpjMS/jk9PyaX0Ik7KQwX8oy2OZUdcTwuiYNRECG7UkKxH2ABPysj
         vWvwhSGhDYvs++GCrr9t2E5H9F3+sWBA9+uuo3CYDngcdX6mjO6G6Slpo27mRQQyzVuD
         KFr1XBqUegbnX9ykut5XuXuHKvsAhghfh8kqbNIBfnEAesF0fp+KErDtylCtVKVw6Plv
         47VGq4iaeGLaeIfIxGoq+HMOG9sLopDMnWJndJ3EpqxJ4t85wWa4fAwJ+IqkqhIhLFwt
         XOnnjz+G1W9GTAqTParvahWzMjoVzRH82Yn3TzcQsgY0pC7/aWeGBflqhfTR00wBt+GR
         G/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689953771; x=1690558571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTjKmbTUoKZtW5LXWjKkpdkle/49HkSEc09M87FklNo=;
        b=MYMvax/7X9daJMkvHQJIsqIAYSTYNUOkV4//k23IxV4ePueJMfwx7dDg/setLoR8FL
         efqaKgmQZqoE30Sj+z8vmjR18FjvDwhOXZ+uEl8RJ95RKCZofKi97wqiOysaqCg0CPkV
         /Jr/a2Mq+HAlExzbImpwVPxYUkwnxOf3xIi94Jx3i776igA8hSw7ZnkXuI+14wosK0dT
         Z4NO7RueceKE0oSDdfFx+JWMdFlLJneYtntcH98ThoVldvztFhB7dtF+hUbXb09sn1Vq
         HyzDgFAuJhG0SdK0AfXNI/SbXbr32TPzcnRjq+dE5mm5GeCiji+vMQJPCn3lBS+m0bQs
         lRNA==
X-Gm-Message-State: ABy/qLb+u67h0GXr3qcM5kxsq/IwdRDnUvNG7XU9Ad0MY8ejLFc3f3Ov
        Ja8gvm4PFUp57eyr48PVJrU8dg==
X-Google-Smtp-Source: APBJJlHUicZ6/ambRORd9BD9VLQhmImUJLHUmsPmbWq/5qT6U1CKYe1Y0KCUzOSiVYtMelndfNlhSQ==
X-Received: by 2002:ac2:58db:0:b0:4f8:586a:8af6 with SMTP id u27-20020ac258db000000b004f8586a8af6mr1539094lfo.4.1689953770865;
        Fri, 21 Jul 2023 08:36:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id t9-20020a19ad09000000b004fba1278e6dsm782535lfc.107.2023.07.21.08.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:36:10 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Jul 2023 17:36:04 +0200
Subject: [PATCH 01/11] arm64: dts: qcom: msm8916: Drop RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v1-1-cf6cd5c621d5@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689953767; l=1386;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+PfDB+JO1ckaONFZ5XbEDUUOVQudNaE7JPqu+DdyCuA=;
 b=oRqZ6bfcsvDVVyCCaM2/xP8d81Wrkj9U8zvNE+TTofWT7DIaecb3U97xNpFWLS4Ht4TR8YEB5
 qU9L/iOANl0Aq5TMOw2WHPffz22Kdqf5jcoeuQy+kLQk9nwNf1vwePO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c4d673904698..ffdb620f6a70 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -519,9 +519,6 @@ bimc: interconnect@400000 {
 			compatible = "qcom,msm8916-bimc";
 			reg = <0x00400000 0x62000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 		};
 
 		tsens: thermal-sensor@4a9000 {
@@ -554,18 +551,12 @@ pcnoc: interconnect@500000 {
 			compatible = "qcom,msm8916-pcnoc";
 			reg = <0x00500000 0x11000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
-				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
 		};
 
 		snoc: interconnect@580000 {
 			compatible = "qcom,msm8916-snoc";
 			reg = <0x00580000 0x14000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 		};
 
 		stm: stm@802000 {

-- 
2.41.0

