Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD88FEB64DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 21 Jul 2023 15:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbjGUPg1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbjGUPgZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Jul 2023 11:36:25 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF960358E
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jul 2023 08:36:15 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so3348222e87.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jul 2023 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689953773; x=1690558573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3NPnuiSNZUn11LWRbZ2MODGSya3GaAu8O7pEYeyDVM=;
        b=DE/ZPdRase7WTfWSEA9TOdQZa3d38SY0IUuQ+PtXCunHKthoPsnE5NACVmx5gVyR4y
         ga8k6/EXKLnQPtfmffSXaQ9ZlvcA0rRW6ld99S41Ua29vvqNwEOEcqPM4PU/m8zBG/mk
         qWwMrWVggOhmWe5Ae4sezHC2bb81SQ3LBkb7N7WQTjj9SODdH7HGR3hznVdoSlNYBNFz
         z73MF+myvNYlaRdgveXAyU97ofvtOpsNOXldKY9cRQQMk3AnkQzQjVXk3loM1SX6mGI8
         Urng17AibZyc2HgwW1+JF4JwlHbHclRLje24JQtTtWQuoErwoDbm13eu2ziY4E8Xbxp5
         j6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689953773; x=1690558573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3NPnuiSNZUn11LWRbZ2MODGSya3GaAu8O7pEYeyDVM=;
        b=V1XvL8aryeBg6wRU3T6ogMNEST0iU+89iUOgRn/Xf9jfk+IsepYqQfehSrRl8ts63F
         uAiKLVunelmB8WVM6x43P+ItSLpY0mS9XsR08w4VpJP/SyYTSFdzEDpzmXrwhYIEHPE4
         Mx4jiIl3ytWHaK6JIEICVLgF2D8rWCAGsuGcEomuiYOIEAUJT9ZUtN8WVzvqeF0s6J2t
         ZaVNxuOWy9wFsf2RnZdLFXZ6sDQgKBckIS32MZQHdv2DO8u+UfjzhWqz59gRrsxp4AxJ
         yZ9gQlxX1RqlXUgzYFg5yyKjlqGkgmEcOVxs0qLmKQGNPe1ziSaSPbWl27qrMUQqXMSE
         IFdg==
X-Gm-Message-State: ABy/qLaoYPSytGqYgl9HMjiJSX8O9cmcRHQmP3/JHlwU9j6FQyO49DPt
        tu+6jLmupc4jQSG0QiMd07EV7w==
X-Google-Smtp-Source: APBJJlGO3EGsyLQ9CvV4g1OEE1jzrhCMzMfFuyk9Jk42JYsj0c1+IiV1WiuOFP8bRH755EcAnIKkyA==
X-Received: by 2002:a05:6512:b97:b0:4fb:97e8:bc1c with SMTP id b23-20020a0565120b9700b004fb97e8bc1cmr2051339lfv.54.1689953772699;
        Fri, 21 Jul 2023 08:36:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id t9-20020a19ad09000000b004fba1278e6dsm782535lfc.107.2023.07.21.08.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:36:12 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Jul 2023 17:36:05 +0200
Subject: [PATCH 02/11] arm64: dts: qcom: msm8996: Drop RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v1-2-cf6cd5c621d5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689953767; l=2848;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jEC2qszgf6wzq6do5/+vqhfRa/a+2pz+WPIQyhPAgwA=;
 b=ZEFbgKrCPxnNy+DNrWd/Cxs9ehtwTfhte9Rt3QZRVcfa8eIiUIO8Vy6IKS7MmwtY3rGFqSWZu
 UmMd6EO2I0yD/mp+TkCVgMYGO8pAayTPawhiV9pfW6HhAzZBxUXCVg8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 440557c8eca4..0e1cdb5335eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -798,9 +798,6 @@ bimc: interconnect@408000 {
 			compatible = "qcom,msm8996-bimc";
 			reg = <0x00408000 0x5a000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 		};
 
 		tsens0: thermal-sensor@4a9000 {
@@ -851,18 +848,12 @@ cnoc: interconnect@500000 {
 			compatible = "qcom,msm8996-cnoc";
 			reg = <0x00500000 0x1000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
-				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
 		};
 
 		snoc: interconnect@524000 {
 			compatible = "qcom,msm8996-snoc";
 			reg = <0x00524000 0x1c000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 		};
 
 		a0noc: interconnect@543000 {
@@ -882,19 +873,14 @@ a1noc: interconnect@562000 {
 			compatible = "qcom,msm8996-a1noc";
 			reg = <0x00562000 0x5000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_AGGR1_NOC_CLK>,
-				 <&rpmcc RPM_SMD_AGGR1_NOC_A_CLK>;
 		};
 
 		a2noc: interconnect@583000 {
 			compatible = "qcom,msm8996-a2noc";
 			reg = <0x00583000 0x7000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a", "aggre2_ufs_axi", "ufs_axi";
-			clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
-				 <&rpmcc RPM_SMD_AGGR2_NOC_A_CLK>,
-				 <&gcc GCC_AGGRE2_UFS_AXI_CLK>,
+			clock-names = "aggre2_ufs_axi", "ufs_axi";
+			clocks = <&gcc GCC_AGGRE2_UFS_AXI_CLK>,
 				 <&gcc GCC_UFS_AXI_CLK>;
 		};
 
@@ -902,19 +888,14 @@ mnoc: interconnect@5a4000 {
 			compatible = "qcom,msm8996-mnoc";
 			reg = <0x005a4000 0x1c000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a", "iface";
-			clocks = <&rpmcc RPM_SMD_MMAXI_CLK>,
-				 <&rpmcc RPM_SMD_MMAXI_A_CLK>,
-				 <&mmcc AHB_CLK_SRC>;
+			clock-names = "iface";
+			clocks = <&mmcc AHB_CLK_SRC>;
 		};
 
 		pnoc: interconnect@5c0000 {
 			compatible = "qcom,msm8996-pnoc";
 			reg = <0x005c0000 0x3000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
-				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
 		};
 
 		tcsr_mutex: hwlock@740000 {

-- 
2.41.0

