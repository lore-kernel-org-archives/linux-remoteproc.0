Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7252CA0EC3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Sep 2023 13:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbjILNdU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 09:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235724AbjILNcr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 09:32:47 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A08B213F
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:32:18 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52683da3f5cso7258353a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525536; x=1695130336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKOk76xGHFUbMYlGoo5EB0SwWts0yrobcw5xDMLmD9M=;
        b=XVj6QXH92SrvFrwDvpwzI54xw4bGEUXwxs0jz699Fwhmzc8oESrgenGPbpdmnx6xLY
         dKP04NtASgWt58Qeuhrw18SZA19iU05OjnTbgH9chv6Uk3kIW9z3SYhZVEAgJyt9/67U
         BaFTaTe0oByyQMIFB9pqbmBUo5SmZGCC+/bp6lsbQUDPaIuubl0awak/BnnchDMtlZ6E
         BGknaWYRPtp0YbjNG/c3JN4VhXN25ZbeKA+tEpkm0u6ouGsN5fGOCOPO3v8mJPzKn6zF
         WSPBjlhhsjiGYgO2v/8gkLDCiInq+1/9MgMeAMxeLU4wQyETFPhD3BYsUsrf8e9faJwM
         qDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525536; x=1695130336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKOk76xGHFUbMYlGoo5EB0SwWts0yrobcw5xDMLmD9M=;
        b=ImLbvn2TdqiG0hUMbPG8GrYTJKeBZM7Zg/77rSe50BUoO8il8oJPLJS2asCer9qcjh
         M/XK473EMJKLAQkFmWWS323yb8o64HMJvIIeqFcYrtMAhfykmqDgMMSvc2clP/toBNem
         wymHmwqIFDcx7hPF77EM3vZwwfwSe0EOXyBm/IkQJkL7NznqZfe7bQQsdsh7dqLjiOxK
         HZWqLgBEXhik6H23wF36d9QgOq5/wSf4H2+m1NxxVvXuqqG0leNMBJMxeNiPx0Yb1+9n
         wt8sB/EYbH+ukbp9lHuTgqxeUi4HPBUdA7IlkpCyC7PTs9rBiUO8ooC1+q33Yw9jKZim
         /wzQ==
X-Gm-Message-State: AOJu0Yw2h8oiY8rHH2Mo8z7xRR1EBMPVng5bg9VR+u5DeiEep0TlLXlw
        B8sXAs3oj9lqwUeIQD0p+f622/fYGmCVywkZ5WyB+A==
X-Google-Smtp-Source: AGHT+IEXVUF3G/Xcm+nMiybcrFyyq4s8W7w7OhkeqVd3qfU2FWiQP5LwPnw4hZHXbTm8d+d1t5mTYg==
X-Received: by 2002:a05:6402:1d99:b0:52f:a162:f4c2 with SMTP id dk25-20020a0564021d9900b0052fa162f4c2mr1789820edb.22.1694525535894;
        Tue, 12 Sep 2023 06:32:15 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:32:15 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:31:51 +0200
Subject: [PATCH v2 13/14] arm64: dts: qcom: msm8996: Remove PNoC clock from
 MSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-13-1e506593b1bd@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=1234;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+4AEIxoF5np+WSzLavg0MzIg1Zm1W4ES6peXAOsQrzE=;
 b=a/q3ZM5c50UH+82ZWPiBaAUiYrtUYjAebMJvulsLiD6VOw94VYmKJaM0WeTyoWQN1YRB5vfBw
 ZsM5Pv0GBp7DTKfRmFqB3PphmdxTuw8TSaDyJgglP3kYtV8O3lbpD9p
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The PNoC clock is a clock for the entire PNoC bus, managed from
within the interconnect driver. Attaching it to MSS was a total hack.
Get rid of it and take the liberty to make the clock-names entries
more readable.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 7061a8e12c81..51db5ddcef88 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2479,10 +2479,15 @@ mss_pil: remoteproc@2080000 {
 				 <&gcc GCC_MSS_GPLL0_DIV_CLK>,
 				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
 				 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
-				 <&rpmcc RPM_SMD_PCNOC_CLK>,
 				 <&rpmcc RPM_SMD_QDSS_CLK>;
-			clock-names = "iface", "bus", "mem", "xo", "gpll0_mss",
-				      "snoc_axi", "mnoc_axi", "pnoc", "qdss";
+			clock-names = "iface",
+				      "bus",
+				      "mem",
+				      "xo",
+				      "gpll0_mss",
+				      "snoc_axi",
+				      "mnoc_axi",
+				      "qdss";
 
 			resets = <&gcc GCC_MSS_RESTART>;
 			reset-names = "mss_restart";

-- 
2.42.0

