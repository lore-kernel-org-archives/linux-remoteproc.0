Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79399C4167B
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Apr 2022 20:10:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351697AbiDAUMg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Apr 2022 16:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbiDAUMf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Apr 2022 16:12:35 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E68215473
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 Apr 2022 13:10:45 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g20so4222314edw.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 Apr 2022 13:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vZSpTcuUm8K1XcOnNjGfRvdX99iMAx27okwDjYgvL64=;
        b=s514l3cehwTECRMHAc4oVh8Lhac5rDM7VsZkihN1to6DI5SOrc/DmRwA66MZNpOGeN
         z1KAOi70gQsdnwn1BEUXtd9eMOSfcgdFjNyWXQtXFuyGKJVi/EsXwNDusRU2WBZe7+5g
         BA2+5Zcbv+WHmg0p4cGHgSSpNcsXZKxlRVnBCrVfRNwLvwbva71VHr7yFlMEDcVb++c2
         3B0VR371koPWu9tIs2/3ZTl73e5UoamFfqj79J2QMgmNtJENQWj/wYjczFyKAkRQ0sfG
         uSIkn0cy5+Ty7wxteoxqdbE3chIr0GYBJK7unkvRWSRhjN5Kxm8xBJOBuEOrhLyDPBVL
         fURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vZSpTcuUm8K1XcOnNjGfRvdX99iMAx27okwDjYgvL64=;
        b=5T+YGs+CwwJFXvfRkX6Xj8kbuw63KsPoC8o8rakceD8rrZKt2GTjE2r5fzr41ANXMN
         EZGEg7PuLS/uruvqm4Owhy6UTL/J3TbfkMLA66c7DDIcHvofQaRpIC5XY0ZRHrCYspV8
         QeXImk05q5Ym1SFN8t0khZWWTW1QtnrFO9f7QzoXTi4aj/Nnt44/LDEFMnCbtiGSOcex
         fAMoDicXvNwJnvcbKq8lRMvVCdofczOa06HM2M3utRZGPnZ+oHycQIrI+ndD1CwJRKPh
         HKpDp7zP97mvZ/tgtv1E7gJnQJI8PE2mZS9O0k51ublbO87J+ybUczKhJ5g2xh2imVVU
         jWsw==
X-Gm-Message-State: AOAM531dxEIshG7MPuWd0WCwFKsEL0L6XwUwYMpt6/THbOBV/Zqv1ipk
        NUDgN952CVILuFmZ7OqYVXnw9Q==
X-Google-Smtp-Source: ABdhPJyu5vqa1NpW1FvnOrBS6maT+upb58FT6mJWm3l3rhXpz0gVmoF9622SkOdt3PUlF4HSdh1GuA==
X-Received: by 2002:aa7:da81:0:b0:419:11e8:1039 with SMTP id q1-20020aa7da81000000b0041911e81039mr22622742eds.285.1648843844267;
        Fri, 01 Apr 2022 13:10:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bx5-20020a0564020b4500b00418fca53406sm1509041edb.27.2022.04.01.13.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 13:10:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/10] arm64: dts: qcom: msm8994: remove SMD qcom,local-pid property
Date:   Fri,  1 Apr 2022 22:10:27 +0200
Message-Id: <20220401201035.189106-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
References: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The Qualcomm SMD does not use qcom,local-pid property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 8c1dc5155b71..1ff7e2c03ce3 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -233,7 +233,6 @@ rpm {
 			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
 			qcom,ipc = <&apcs 8 0>;
 			qcom,smd-edge = <15>;
-			qcom,local-pid = <0>;
 			qcom,remote-pid = <6>;
 
 			rpm_requests: rpm-requests {
-- 
2.32.0

