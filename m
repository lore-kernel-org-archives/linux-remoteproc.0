Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB94EEB64DC
	for <linux-remoteproc@archiver.kernel.org>; Fri, 21 Jul 2023 15:37:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbjGUPhD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjGUPgu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Jul 2023 11:36:50 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B083A91
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jul 2023 08:36:29 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso3463255e87.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Jul 2023 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689953787; x=1690558587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13Rk7PvVFVgZK5/Lw6qbyP9+OCjNsRZI/rlhzen0zEs=;
        b=bFqce4tOxRhS79xNa8XdfoI8bfrfZj7bVLuLQJ997jH83CCHETDazhJLM1T5cdgxmM
         mn6WfH2AEocg42ZQUfZsqGTRl/vTr/VBHpMsrFaEp8BkW2BpJ6nX1HxlNTnd+Qh6C7ZB
         8VclWolHj2b1BLXJh+0dk6YS/yRvnwQdZHWNQASWlBjTKBtgfARQJP8IGLqo5UXkePU3
         ITm65ItIj2eYO3X7bBmteeZ1aZ7Ket/3ghR4Me7jv1+wS5sTvsufRNJP376S48Jp0o2C
         Ldkjjqd47kwjpfQgTfJaDIltr98Wj16ENfqPxTmKEmMTfP5m1nRKQQLbEWvK7P/4g437
         g+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689953787; x=1690558587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13Rk7PvVFVgZK5/Lw6qbyP9+OCjNsRZI/rlhzen0zEs=;
        b=joCThYIXoa4O1wcR2qliQvqpq72jO5ZSut7LfolX+3jdrjwiwZULwL+Ty7bcC+EZ6b
         Le51ScoXbCOMarY9o3B101a+W7TTnYF+k2LSJFRE90RX9psvmPP3FEChbVa2dg/5nu7n
         Hz4YzxrKWc/ICi6iJWzJuoV77RttCxS7RopC5Jbw4Gd0DD+DmJunzf2LjNn/opVy4Wmv
         rCAKs0h51SOs4TCfFvrB948KM8x3vuE0mDhXGJBefgg+jQ8+SAO5FBRTbDiuliRP+4T1
         sizyB8f/trb6tXdh0+g1NMyBrNqd6UdJCbfYAL/MEZKfEn6GVswXevhaaBkK0NsgUcZA
         Ve0g==
X-Gm-Message-State: ABy/qLasDOzfdERYFRMfJXz5sMWNwarPoDXvrKxioOPcfWjnP452NVD2
        EB3CYH0MqKExhfF1IWNfY0yjyQ==
X-Google-Smtp-Source: APBJJlENs02T2o88jYqblKOTzLm3XOslc8hnQvsNXrUU2w8srbiPqe5hxM++s3Z2yuyXb/TqAUSs7g==
X-Received: by 2002:a05:6512:1095:b0:4f8:cd67:88e6 with SMTP id j21-20020a056512109500b004f8cd6788e6mr1581174lfg.44.1689953787678;
        Fri, 21 Jul 2023 08:36:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id t9-20020a19ad09000000b004fba1278e6dsm782535lfc.107.2023.07.21.08.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:36:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Jul 2023 17:36:13 +0200
Subject: [PATCH 10/11] arm64: dts: qcom: msm8996: Remove AGGRE2 clock from
 SLPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v1-10-cf6cd5c621d5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689953767; l=853;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UyucyOzYTTTxD70LJmIkWWdISyHLh4eJOt7zI+SIcSc=;
 b=SGaVWPNOwmDWM5smDku4+YSzJd6XCRol8QjB7HGBG4KbxEUG8XuLd31PXbP1vd5GvmUWy5bJ6
 05VGfY5ItaxCHgSeRCPhqSn2qdl0YCnUhPDoeVgqC6r6XlCP0W3gulg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The AGGRE2 clock is a clock for the entire AGGRE2 bus, managed from
within the interconnect driver. Attaching it to SLPI was a total hack.
Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 0e1cdb5335eb..ea383cf178e5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2433,9 +2433,8 @@ slpi_pil: remoteproc@1c00000 {
 					  "handover",
 					  "stop-ack";
 
-			clocks = <&xo_board>,
-				 <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
-			clock-names = "xo", "aggre2";
+			clocks = <&xo_board>;
+			clock-names = "xo";
 
 			memory-region = <&slpi_mem>;
 

-- 
2.41.0

