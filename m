Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3A6ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 09:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbiIIJVH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbiIIJVD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:21:03 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DBBFA681
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 02:20:53 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z23so1120711ljk.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Xww6smUMHoeYSoc1lrk/iGogtyIyA10+5kx+EaqITKI=;
        b=axgj027VZK/9LTcRstZXmGjqQrxxZO8RTNvBGF6IU/WY+0mj2up3ACNP822VBaxgSs
         ab8ZoZt+9ANDzZKR4ps5JACwMSvyprgkElGz+J6s4FJ8O4ctU8HPCjftBW/R19MOwjYY
         nMXggXdiiv57Xwavo/OoVdqnFmFCpryPd2GP5Nl6ho8Hq6nNqISyMxtikRB8TGnMMUMT
         BLhsWSeov2XrBkIlVTC7d0BlFhaNcXQBdnJ9lz3jdB+D+cWOtNY2W0FzkVpybK7iRZZ3
         2BjznfqDPHqpTNk7ILwo370EcJQbt1doy2zgqtjWiDsCqtx5aTQyyVjjbm6AFg/PiT5B
         1vjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Xww6smUMHoeYSoc1lrk/iGogtyIyA10+5kx+EaqITKI=;
        b=kuxYVTgFHNPkPithHPzLm8yET8qotq+FY5RgRSlR3MTzX9qlQKHr7Q4xlgu+p1WeMG
         +dtraC/LbXRsbWnnmOk5icYK2johel15RYFf0O2Kh1tBO9ElcLBiRLIAkSSlHTgB/Fkd
         HTJGZW9/4ice33OHRV/grtCX6k70tedabbJrZz2J9ipuVr0J7olJxDc3o+AnBJJb4IYU
         IyikiLPAOvM2QtcExkicInFYgplhmhKHi7Cl79n17gEcqghkIQx6yz1FLNK2x1ta/yGW
         GLYVNTkeqVKwwLVPg1wjQRAxeEqXlFJtmOYk2mXhn/SebmqEG9U68Q8xKs9ef6jrJfHP
         AnJg==
X-Gm-Message-State: ACgBeo1yk2gvZE6I/Z7Zs2erzQzqPoHSlIlau+THr6yJd/s4bjvJ0Fte
        9HexviKea77uOTHXwiAaGcPsFumOl4j6sw==
X-Google-Smtp-Source: AA6agR6PNk/JNhXt2yxGcmOjGpyxlNllnpEuxz1Qz33adqPEclQdVh1XbpFhqvZapeDqiUw/lrf05g==
X-Received: by 2002:a2e:bc86:0:b0:26a:ce95:681 with SMTP id h6-20020a2ebc86000000b0026ace950681mr3111518ljf.107.1662715251847;
        Fri, 09 Sep 2022 02:20:51 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:51 -0700 (PDT)
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
Subject: [PATCH v3 09/15] ARM: dts: qcom: msm8974: add missing TCSR syscon compatible
Date:   Fri,  9 Sep 2022 11:20:29 +0200
Message-Id: <20220909092035.223915-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

TCSR syscon node should come with dedicated compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8baca2a77717..90a6d4b7605c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1234,7 +1234,7 @@ tcsr_mutex_block: syscon@fd484000 {
 		};
 
 		tcsr: syscon@fd4a0000 {
-			compatible = "syscon";
+			compatible = "qcom,tcsr-msm8974", "syscon";
 			reg = <0xfd4a0000 0x10000>;
 		};
 
-- 
2.34.1

