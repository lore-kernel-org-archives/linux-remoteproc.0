Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D3AC47089
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Nov 2022 18:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiKXSns (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Nov 2022 13:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiKXSnq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Nov 2022 13:43:46 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24155F8872
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:45 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id z24so2849681ljn.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Nov 2022 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U7lP3qWDAVJuWZTBOEagOeM+IpWxGPuX90YrziM7c8o=;
        b=qgJsAwsBj38fBI4eGgboaAwgTwE22X8i6M7t2Tb8nkxV80HVWPLRxtK6X1z+kNVbvr
         WY2PsnJW+YHGx+A86HP9fWS4kGMxvY6xDe25WPQ2rw1CR+CaSBV7k91MirCMxznM2APS
         qNA4o9qkvoo3PGzQ6o/ePDPlgCI0EQrqZI6Cpv/6nYSOyeqGZ1WoKXs4r4nxJJ2rzS4L
         urynfKE+hqD5pmQ/ou92Ah8JwUjYksb9jDdQ7g4G0kTk2lmeUWQAeWn4f5NUdZZKNUN3
         HjexgkuD0AqFOVES6KcYbuKk1nxdo4+hTO7m75N0ogrmeo338tX9xDS9sJjoxIQctGPo
         wNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7lP3qWDAVJuWZTBOEagOeM+IpWxGPuX90YrziM7c8o=;
        b=sUzO/HwBEYpX+Ab2decmeMe9MQfEiBsXZRkcm0w/WlzN+hY8b8ozcS3auoNQMULCOJ
         sqGhjeq8r7LWL6iMwUqD1adq0U7bpASUTPK1RMx+1BhBaTXV1GPXdNs16hAPEZQJWqza
         PLAXvd9Qo1mAmgcOyf4tUQsm31v9/jf4ZppGsbhIXEdkmuu+2myATfYCFAEViyeI4fHb
         AIBSOyHmPwsuOlHc49GpT0ohrJBloAnPwJ4dK+0pAXeQNcs1RbLnT/cKyEJgiU1aG36K
         IqFoY9Qk3xGbat15EXlTqeT0qqLRW8sPNhjsFj+esYeA6i8GcyqwjEYHqs1NAPwRvRjW
         AWhA==
X-Gm-Message-State: ANoB5pl3MxRBy+f+niysugDRiyIND6N0gqDb90XuiiB3SSL2HjpyRuA/
        rzjyxi+Yn+prbov6/YP0IR7HYQ==
X-Google-Smtp-Source: AA0mqf7CCiyKlkJuAKxtJUF1oNeQPY2vu4pE2i5FA/PB0d5fd0gh7n3qSPqZpOZDfmt0amkUkjlRKQ==
X-Received: by 2002:a2e:8645:0:b0:279:7b24:641c with SMTP id i5-20020a2e8645000000b002797b24641cmr2591012ljj.344.1669315423434;
        Thu, 24 Nov 2022 10:43:43 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v7-20020a2ea607000000b0026e0434eb1esm159098ljp.67.2022.11.24.10.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 10:43:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 00/15] dt-bindings: remoteproc: qcom: split and reorganize PAS/PIL
Date:   Thu, 24 Nov 2022 19:43:18 +0100
Message-Id: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Changes since v2
================
1. Allow only one or two clocks, after dropping clocks related to PIL binding.
2. Drop if:then: for the clock and put it directly under properties
3. Merge two if:then: clauses for setting interrupts.
4. New patches: DTS fixes, qcom,adsp: drop resets and qcom,halt-regs,
   qcom,qcs404-pas, qcom,sc7180-pas and last msm8996-slpi-pil fix.

Changes since v1
================
1. Keep resets, reset-names, qcom,qmp and qcom,halt-regs in qcom,adsp, because
   they are not shared with most of PAS bindings.
2. Add firmware-name to examples.
3. New patches: qcom,sc8180x-pas and qcom,sdx55-pas.

Description
===========
The Qualcomm PAS/PIL (qcom,adsp.yaml) bindings grew considerably with huge
amount of if:then:else blocks and 40 compatibles (still growing).   These
if:then:else blocks constrain clocks, power-domains and interrupt per variants.
Adding new variants is now tricky - it's easy to forget to add variant to one
if:then: clause.

Split the bindings into reusable schema and per-soc bindings, groupping them
when applicable.

This part is finished, but more and more compatibles should be moved out of
qcom,adsp.yaml, eventually dropping the file.

Best regards,
Krzysztof

Krzysztof Kozlowski (15):
  arm64: dts: qcom: msm8996: drop address/size cells from smd-edge
  arm64: dts: qcom: qcs404: align CDSP PAS node with bindings
  arm64: dts: qcom: sc7180: align MPSS PAS node with bindings
  arm64: dts: qcom: sc7280: align MPSS PAS node with bindings
  dt-bindings: remoteproc: qcom,adsp: drop resets and qcom,halt-regs
  dt-bindings: remoteproc: qcom,adsp: split common part
  dt-bindings: remoteproc: qcom,sm8350-pas: split into separate file
  dt-bindings: remoteproc: qcom,sm8150-pas: split into separate file
  dt-bindings: remoteproc: qcom,sm6350-pas: split into separate file
  dt-bindings: remoteproc: qcom,sc8280xp-pas: split into separate file
  dt-bindings: remoteproc: qcom,sc8180x-pas: split into separate file
  dt-bindings: remoteproc: qcom,sdx55-pas: split into separate file
  dt-bindings: remoteproc: qcom,qcs404-pas: split into separate file
  dt-bindings: remoteproc: qcom,sc7180-pas: split into separate file
  dt-bindings: remoteproc: qcom,adsp: correct msm8996-slpi-pil clocks

 .../bindings/remoteproc/qcom,adsp.yaml        | 414 +-----------------
 .../bindings/remoteproc/qcom,pas-common.yaml  |  97 ++++
 .../bindings/remoteproc/qcom,qcs404-pas.yaml  |  86 ++++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml  | 125 ++++++
 .../bindings/remoteproc/qcom,sc8180x-pas.yaml |  87 ++++
 .../remoteproc/qcom,sc8280xp-pas.yaml         | 139 ++++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml   | 101 +++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml  | 159 +++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml  | 166 +++++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml  | 174 ++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  46 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       |  18 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  18 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  20 +-
 .../dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  17 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  16 +-
 17 files changed, 1221 insertions(+), 465 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml

-- 
2.34.1

