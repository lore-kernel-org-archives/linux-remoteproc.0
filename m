Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E0CC32772
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 15:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240491AbiHQPBF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 11:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240493AbiHQO7O (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:14 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D139C20E
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:07 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d14so19308146lfl.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=6warrciUNU85C9TsNI3LBxybGM3RjF+5FJPoKTjBVVk=;
        b=U43/iMTR0rTmxauRd/OTZ0MhgCiRa6a52tfzpcWSkRhzluzYk6R79Fk4KYqRaU/eCv
         pKS32LObQ+PXm9UrEX7fRXkfD3Kupqk3sErTYVaSvOeYkHYrQi0GCgNfzJYLdggre7dy
         861ky5etHjLEjEhaM46WFZG5U8ME+0AxjF+FLfyglZ7IBR9ZgqpwTpLiL8cJY+FRU6l2
         nFnsiQ6duJRsKUiuZ0jgXBqUN3aDYaSbKw6KAixqct11phPmsNDFNbmm4g8J7R4fI0Fd
         G/Can3efKfuOviwV+6p1awe6Ig/D45SpLE41sh2kQchjUbQojBpP/bszLtl0A89kGZl1
         vhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=6warrciUNU85C9TsNI3LBxybGM3RjF+5FJPoKTjBVVk=;
        b=Uj2a3COgsVXGQQJdMknoB5s7AvOjgG8gprZvtPPkTqXgYQE6k3Gidzesnwzd28PYib
         9qmYonPzX5zscy8bRA1rzEGvDvRIHF4NSh9ianw8nKr8YyDgG4E1Y1rRgnv+/RMxTFGP
         aS+cYmv8R11LhZlzduYQVPqitAjrlHcb1E6pqYvDMfNKqxj1FLCkTBy9o3egxms++2f4
         WmW3EJ84z2Prxe45baCJl44qroqQchS7tRXvcvZoNcXGqdLIjHlmxIOZjevj/ekglPdD
         KzHTLL13FDOVr3E+4mF5Gr4YYEg+MIJlw9DQLSytfz08AAUe1yk7+xNyZIbFQ4UYVh10
         XBuQ==
X-Gm-Message-State: ACgBeo2h3EA6sj5NfTLJn/JizPOKp3G1S+RuucKukBbSj5LTQkoFq4LK
        bTxyvCSe0U/L/TOZGRbsddfS+g==
X-Google-Smtp-Source: AA6agR5JPmEBZnNXL5d7dkr4KJ9rezRcmrBRKBJ9C6xEHAvfjjhaAOwqgRR2UcsUHxSsSJNxexQytQ==
X-Received: by 2002:ac2:50cf:0:b0:48a:f4ef:788b with SMTP id h15-20020ac250cf000000b0048af4ef788bmr8537207lfm.527.1660748345006;
        Wed, 17 Aug 2022 07:59:05 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:04 -0700 (PDT)
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
Subject: [RFT PATCH v2 00/17] ARM/hwlock: qcom: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 17:58:44 +0300
Message-Id: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

Switch older Qualcomm SoCs to use MMIO-based method instead of syscon.

Not tested on hardware. Please kindly provide tests.

Changes since v1
================
1. Use existing qcom,tcsr-msm8974 compatible.
2. Fix few other TCSR syscon compatibles (new patches: ipq6018, msm8953,
   qcs404, msm8996).
3. New patch: dt-bindings: mfd: qcom,tcsr: drop simple-mfd from IPQ6018
4. New patch: dt-bindings: mfd: qcom,tcsr: add QCS404

Dependencies
============
1. Context in bindings depends on:
   arm64: dts: qcom: improvements to TCSR mutex in DTS
   https://lore.kernel.org/linux-devicetree/20220817130342.568396-1-krzysztof.kozlowski@linaro.org/T/#t

2. The last five DTS commits (ARM and arm64) named "switch TCSR mutex to MMIO"
   depend on driver support. The changes are not bisectable, just like
   previously such changes were not bisectable:
   https://lore.kernel.org/all/20200622075956.171058-5-bjorn.andersson@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (17):
  dt-bindings: mfd: qcom,tcsr: drop simple-mfd from IPQ6018
  dt-bindings: mfd: qcom,tcsr: add QCS404
  dt-bindings: hwlock: qcom-hwspinlock: add support for MMIO on older
    SoCs
  dt-bindings: hwlock: qcom-hwspinlock: correct example indentation
  hwspinlock: qcom: correct MMIO max register for newer SoCs
  hwspinlock: qcom: add support for MMIO on older SoCs
  arm64: dts: qcom: ipq6018: add missing TCSR syscon compatible
  arm64: dts: qcom: msm8953: add missing TCSR syscon compatible
  arm64: dts: qcom: qcs404: add missing TCSR syscon compatible
  arm64: dts: qcom: msm8996: add missing TCSR syscon compatible
  ARM: dts: qcom: msm8974: add missing TCSR syscon compatible
  ARM: dts: qcom: msm8974: split TCSR halt regs out of mutex
  arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
  arm64: dts: qcom: msm8994: switch TCSR mutex to MMIO
  ARM: dts: qcom: msm8974: switch TCSR mutex to MMIO
  ARM: dts: qcom: apq8084: switch TCSR mutex to MMIO
  ARM: dts: qcom: msm8226: switch TCSR mutex to MMIO

 .../bindings/hwlock/qcom-hwspinlock.yaml      | 25 +++++++----
 .../devicetree/bindings/mfd/qcom,tcsr.yaml    | 41 +++++++++---------
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts |  2 +-
 arch/arm/boot/dts/qcom-apq8084.dtsi           | 11 ++---
 arch/arm/boot/dts/qcom-msm8226.dtsi           | 14 ++-----
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  2 +-
 .../dts/qcom-msm8974-sony-xperia-rhine.dtsi   |  2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 25 ++++++-----
 .../dts/qcom-msm8974pro-fairphone-fp2.dts     |  2 +-
 .../boot/dts/qcom-msm8974pro-samsung-klte.dts |  2 +-
 ...-msm8974pro-sony-xperia-shinano-castor.dts |  2 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         | 15 +++----
 arch/arm64/boot/dts/qcom/msm8953.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi         | 13 ++----
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  2 +-
 drivers/hwspinlock/qcom_hwspinlock.c          | 42 ++++++++++++++-----
 17 files changed, 105 insertions(+), 99 deletions(-)

-- 
2.34.1

