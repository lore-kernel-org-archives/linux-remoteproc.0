Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D24CA0EC3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Sep 2023 13:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235580AbjILNby (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 09:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbjILNbx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 09:31:53 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAF310D0
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:31:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5008d16cc36so9619371e87.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525507; x=1695130307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DABEF/G0wTiJLHQeIezECcYyIyidOzxpzwuEiL5oGQ8=;
        b=ls7Y6eo0R/OJO+QSvzvPGXPSV0pD4bmuETal5WCdxtytsEEN8fIWgdgKLkorLViub/
         u6AxyonIbf4wZA9oD33jZuEGOeAhqMxqc5XG2Pv3Z34LtMArNfP9m5eSSmEayhUvoXt4
         21mQrj1wNukCimt9Q7i+SqKVIos3ca88nYj9K6bmNSOgbt+lg7RV7GXfBTexJlP1pvsZ
         0HVfzctEx2SQdqmSPvZn+2M9ASKbofr0au6bGNvvMXPkCiXc98uW8fQAyfTHT9SzIfaA
         63pP4/KycIngObvzwi0+43Va8/KJfG2Fnr5EmMAOJcexLalWNTRMo3r6Tg68uOZwIm3Q
         D6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525507; x=1695130307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DABEF/G0wTiJLHQeIezECcYyIyidOzxpzwuEiL5oGQ8=;
        b=OH8pRyfNQr5xbgo3M8xNx01kttzF1NUlD0x9/Na9hJbiYiENBJp0nxaP0RgIuqtNDH
         +YTh59vuSw4lbZQsGF6VAwm1p/pfR90lNmLSbLbJDAT9dJDnKrIueyzF/UrJuCINiwfu
         iRBkgrADtsVjTXCKhr74UQKr7WDxhi0Dfl+AouJOWGIGNJ82TpHznfb8nK3MTmf7M+xW
         eTTsIba1n8MvDk19TtKHBqVYuBhNsiXpG8vw/dsjvVvIGukbfPOW2xMIWFmU8YW+LKzW
         yDu5RbHWzEC9VtgIEnvYkVyt14tuZuNLaWfelEuUbdqzozZcbN+87dq9TYlTl8rF97CQ
         OYvA==
X-Gm-Message-State: AOJu0YxKcVcvTWZYEWQjI9o3FmWyxX/JXXjW+732IARapkP1VQa3iBp1
        Z5wqNjM8vXIzUak7bS6ZWdxZjg+tRgD59OfXGY4VyA==
X-Google-Smtp-Source: AGHT+IHEHh0RuaM89GO2hy33d9QpNiA2N0B89tFWDc2B23V2RZl4ySKvDHhVkP3r7XzN4VntItjF+g==
X-Received: by 2002:ac2:446f:0:b0:500:a08e:2fcf with SMTP id y15-20020ac2446f000000b00500a08e2fcfmr9054444lfl.47.1694525507137;
        Tue, 12 Sep 2023 06:31:47 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:31:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:31:39 +0200
Subject: [PATCH v2 01/14] arm64: dts: qcom: msm8916: Drop RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-1-1e506593b1bd@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=1386;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jgPLe87izszPiDVl35EMBCgsp6Vij2I7vaEdqKi1gBU=;
 b=2fKLEWzJA+nSA/bz6EqA9PkDhmKN7tvdi3UL3T8CJtwuqm+enkROCBJOZJCyfnGnGB+n0FMjD
 DM7sq1O8eOWDGxuI1JAPanQEN8YsRm7jUt5bJY+TEsyv1w4auLZg6gs
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
index 33fb65d73104..8c2ec09f57c4 100644
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
2.42.0

