Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63872CA0ECA
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Sep 2023 13:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbjILNcK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 09:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235616AbjILNcC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 09:32:02 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FE810DD
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:31:54 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401b393df02so65799485e9.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525512; x=1695130312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15fMag9VX7XAPE7WmbOLmSr+PWzruauhSVe+u6uS4NU=;
        b=tyJVniVCLG7XFxxT6w81c+kkAR0T5+VVUrwidJ9KPC5MDwsNQplbwjll9L34vrCbq9
         53jsdnX1dL/4W5cyc6lk4Tj6ZsnTBpUdtbdKLQUpFW5l3ZBLepE589kYxfP9eKtuyovA
         wQqudQ8exEedPRONHxshT/FWV5wtQrEQvjIot5lApVelBUY9DysPMEc5gzTUkoybwMT4
         5PhzKN2vNWqw2V2KeouRP/1cNplAT1pI0ry8GFBVas6pig0gmmLA+sbhOmR7LV9+sYRt
         haTZ8TKDLCZoB6R1nLnHaWMpC2nks1utVCXNGEP9ONbasZSlcw2C9Q8tTYW3oWzU14gZ
         drXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525512; x=1695130312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15fMag9VX7XAPE7WmbOLmSr+PWzruauhSVe+u6uS4NU=;
        b=S2gXRRkFSN/S6lU17Mao6GfwNhYYE9hXkMHDJRuX4dcChPfReqvjo/JuOfY6vt8128
         55ooQEIlJqCFEL9T6AunNkFR60WtzNW5E1Ss4UgO3K8vRywXzAzMT4TKTkNVX58Y2wwb
         PYq34NubLlpysRhZ26mSo1xZDZ2R/C7qttUISiKR6ZhPSCpDp3BDPvrLiiwuggZIqc19
         35mG6fsoe7+4rV+Jb/ttcy7X8nmsvO6U+/7IVjYi+Lx7k8iTwDiYJ7JiQc/T8XBAOJV1
         BSX8tZ6+ZPJXBLs+HaQs/L6y2yPG0MJa+J2Ka+QO46T17JyomI5YxKScmkK1lyMfvBwU
         00Jg==
X-Gm-Message-State: AOJu0YyQPQERh4V5juXD/IJW6jcGI+hAWM6x1BK47JXr73XcqP9bUBhg
        bpjcGQzrCs+sC64MbzwXTfVStNs4/n5tJ4ihaTMd7Q==
X-Google-Smtp-Source: AGHT+IHd3ESe9Shu68oMdeAkDreczDIAgdPhaKrNx9GOH0Mj5Uh2yWT/aRZ1vr4DmjfizwKtYKk2IQ==
X-Received: by 2002:a5d:6ace:0:b0:318:fa5:d84e with SMTP id u14-20020a5d6ace000000b003180fa5d84emr10328320wrw.70.1694525512184;
        Tue, 12 Sep 2023 06:31:52 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:31:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:31:41 +0200
Subject: [PATCH v2 03/14] arm64: dts: qcom: qcs404: Drop RPM bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-3-1e506593b1bd@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=1392;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=pDVqi5u1eyS8PF+LLrKBDGtxabkYLIBhlo/it+9/q/s=;
 b=eEGSlqgAFu1mD7wz/jcb6jk10/d5zKRZp1o3SpDMYtk0OyzPD6rNVhhHK0f3HqD1/bzDhdFIi
 AqQmWf6aqv4C1tlXP+J+YqtrCmf/Jp3XN73wYwld8apbiDkMHA3h8+o
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 2721f32dfb71..317a0df30b83 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -558,9 +558,6 @@ bimc: interconnect@400000 {
 			reg = <0x00400000 0x80000>;
 			compatible = "qcom,qcs404-bimc";
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				<&rpmcc RPM_SMD_BIMC_A_CLK>;
 		};
 
 		tsens: thermal-sensor@4a9000 {
@@ -601,18 +598,12 @@ pcnoc: interconnect@500000 {
 			reg = <0x00500000 0x15080>;
 			compatible = "qcom,qcs404-pcnoc";
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
-				<&rpmcc RPM_SMD_PNOC_A_CLK>;
 		};
 
 		snoc: interconnect@580000 {
 			reg = <0x00580000 0x23080>;
 			compatible = "qcom,qcs404-snoc";
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				<&rpmcc RPM_SMD_SNOC_A_CLK>;
 		};
 
 		remoteproc_cdsp: remoteproc@b00000 {

-- 
2.42.0

