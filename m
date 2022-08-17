Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C3CC25B08
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 13:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239668AbiHQNO2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 09:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiHQNO1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:27 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64490286CC
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:22 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id v4so253107ljg.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=yr0qSXKWvuCUzSvzydmBZDyY0XaWgq0dxUbMgXS9CA8=;
        b=k3KB3iqQAItg/j+LVnImlemXiSO6+5rOXuibgEZhbn12A5XeCRZqVLUQvFBWKrMXhL
         wHGAHLHrOlhviQ94alFATP9K5lSBsusdy6x1vrE35jdTL6xJKAmaGOWXlltOzsEkR7YX
         5lLufTeKHRVNoo/gqQOpzCsRDl0SusVXNGOsS3hgZqq3cDMlCr2B946LyDFlhmSR98zS
         xU/8qbvfQ1ySABSD/TEZ5ZRtZ9KeYY7Ao0pblZMO5owR8G8j62ATyUndWC7mZEDF0Vw5
         WLfWRV0Wr2S9LDnpg/d+sq5nLFo+cCvgCu4JiFLkVsllY+CAnf4XR/SGp92Y4VMgXkPn
         sCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=yr0qSXKWvuCUzSvzydmBZDyY0XaWgq0dxUbMgXS9CA8=;
        b=KruMarNIrBdnKnbBK58So0olFAoNhheRu1d320ZJZZiKzoKj3lxO7ggXC5FIKBYVgL
         NTej1PQNhdqLpUHSzP1ZPQrrmD0DJS6AP4zS2P5g3CGuXRoPGoeCtwKMl/7BQKGup7FF
         LsyOfRc9cFPCrbX1IFdSNOdM6+XyoVzUJwE/o1KrShYlrakN5F9t3w9c5/AFutQF9Qnc
         wkRBavPEH0mXUMZ96CD6HsNyHOGyp1Md9kBOYsXptVcsJIkK4XfkPf0wDsVeDW3HsQ2/
         hem/xpemblQJTfIjtfCj5VZpdmiSdyIgPTm2GHn0PBfx3c2FEJslvZXJxdKitsmS+36m
         ucRw==
X-Gm-Message-State: ACgBeo2uAm8b4NtpxbMF6ks3SDC5P9R97z04vzQHIMjprD+5fHn4SYTA
        CEvR0xuMH7ZZaISr02xty9O3b+kwD2TOM5rG
X-Google-Smtp-Source: AA6agR6aNj0wxF+CSoJesSR3A39nwgjWZForctkJ59VdUfdgNIhrnYUDSD1BP5qHHcHuHzPkX5x3Vw==
X-Received: by 2002:a2e:6e13:0:b0:25e:87b1:fda8 with SMTP id j19-20020a2e6e13000000b0025e87b1fda8mr7457999ljc.250.1660742060794;
        Wed, 17 Aug 2022 06:14:20 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:20 -0700 (PDT)
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
Subject: [RFT PATCH 00/12] ARM/hwlock: qcom: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:14:03 +0300
Message-Id: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

Switch older Qualcomm SoCs to use MMIO-based method instead of syscon.

Not tested on hardware. Please kindly provide tests.

Dependency
==========
Context in bindings depends on:
arm64: dts: qcom: improvements to TCSR mutex in DTS
https://lore.kernel.org/linux-devicetree/20220817130342.568396-1-krzysztof.kozlowski@linaro.org/T/#t

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  dt-bindings: hwlock: qcom-hwspinlock: add support for MMIO on older
    SoCs
  dt-bindings: hwlock: qcom-hwspinlock: correct example indentation
  dt-bindings: mfd: qcom,tcsr: add MSM8974
  hwspinlock: qcom: correct MMIO max register for newer SoCs
  hwspinlock: qcom: add support for MMIO on older SoCs
  arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
  arm64: dts: qcom: msm8994: switch TCSR mutex to MMIO
  ARM: dts: qcom: msm8974: add missing TCSR syscon compatible
  ARM: dts: qcom: msm8974: split TCSR halt regs out of mutex
  ARM: dts: qcom: msm8974: switch TCSR mutex to MMIO
  ARM: dts: qcom: apq8084: switch TCSR mutex to MMIO
  ARM: dts: qcom: msm8226: switch TCSR mutex to MMIO

 .../bindings/hwlock/qcom-hwspinlock.yaml      | 25 +++++++----
 .../devicetree/bindings/mfd/qcom,tcsr.yaml    |  1 +
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts |  2 +-
 arch/arm/boot/dts/qcom-apq8084.dtsi           | 11 ++---
 arch/arm/boot/dts/qcom-msm8226.dtsi           | 14 ++-----
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  2 +-
 .../dts/qcom-msm8974-sony-xperia-rhine.dtsi   |  2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 25 ++++++-----
 .../dts/qcom-msm8974pro-fairphone-fp2.dts     |  2 +-
 .../boot/dts/qcom-msm8974pro-samsung-klte.dts |  2 +-
 ...-msm8974pro-sony-xperia-shinano-castor.dts |  2 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         | 13 ++----
 arch/arm64/boot/dts/qcom/msm8994.dtsi         | 13 ++----
 drivers/hwspinlock/qcom_hwspinlock.c          | 42 ++++++++++++++-----
 14 files changed, 83 insertions(+), 73 deletions(-)

-- 
2.34.1

