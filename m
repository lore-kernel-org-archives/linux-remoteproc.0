Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7450C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Nov 2022 15:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbiKPPyX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Nov 2022 10:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiKPPyW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Nov 2022 10:54:22 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2C83F063
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 07:54:20 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so30194930lfv.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 07:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x61XENO10P73sJaqpMir6Zd1RPLJtcnUpkPInROKPhs=;
        b=J+WyS+18pYK5gb5pSIbpZhQddz2jw48TXdkqfC4atduq9Gxrl+Ap8HpdT76hIZ0BvO
         JFyMyOjnLLtufdmANsMfPQ8ZrrkYf0+DDL3vjvecLFpcVUmZLbjENKb8ZMpYyA0SRneN
         oc7ixZBwarobSdjo4upPkKTwWeaBguKvRY3SBLOW4Gp8RiC6NmJvFxF0j+4/Qfohk4ob
         J66ateLT1og/Ef49xPalLbP0D8nH85R0tz/7yIgeFY0YHFmTMSxVbcucfDYzdd55KSeC
         DWjd45KToS23UiNyu7Y3wp/X7ZnTIMkPeW6PsYZuaGVZZcnwDOeQwVD91+epvB32zckP
         x8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x61XENO10P73sJaqpMir6Zd1RPLJtcnUpkPInROKPhs=;
        b=tizgLQlmO5cd2SGkmqCnWQmKi+Wa0/9Nkp//ZwDqoYKFVYsN02suiuoZGPRkuHqo/Z
         hTJdGgD+BgA8XDLI/GRkC4yH3NzyiSruFUPZ6gyVAAUyrEqy9TnoqV6CEoBgoFIRx6qq
         B7I4vQVu5cFiA+uOQwUYuw9AClHziLaG3dAFIIYYrxZFBFhpdguep+NhSHYMYZSCbcag
         0G0eOtawgOGJFTem0Y6SjozTHVJDm5CX5FXT6nozXomWn8VTCF1AC5rkEZLBWP98zpf0
         Jb3pWzQW5ic/iXFoSUflHY1tyuSwmhq0AFx4xIR8jf83HjI6AnPPpe8MlkrSfX6YpCXE
         eIXw==
X-Gm-Message-State: ANoB5plZ7PQ6E52qVOUXgolerUN2MaBqzU3fWei7knF0Usgr3sX1utNa
        GGMdnh6G5+vwDr2RhIaPy3HZqw==
X-Google-Smtp-Source: AA0mqf7Kx9Dbj5ynt4BC2nqBQdQuqsrtEUKsXay1mniKRqjawlRTFdGjV93sNPtcg61LNDtSsZr0tw==
X-Received: by 2002:a05:6512:224d:b0:4a2:be5c:688f with SMTP id i13-20020a056512224d00b004a2be5c688fmr6876505lfu.121.1668614058965;
        Wed, 16 Nov 2022 07:54:18 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0049462af8614sm2655128lfr.145.2022.11.16.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 07:54:18 -0800 (PST)
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
Subject: [PATCH 0/5] dt-bindings: remoteproc: qcom: split and reorganize PAS/PIL
Date:   Wed, 16 Nov 2022 16:54:11 +0100
Message-Id: <20221116155416.164239-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

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

Krzysztof Kozlowski (5):
  dt-bindings: remoteproc: qcom,adsp: split common part
  dt-bindings: remoteproc: qcom,sm8350-pas: split into separate file
  dt-bindings: remoteproc: qcom,sm8150-pas: split into separate file
  dt-bindings: remoteproc: qcom,sm6350-pas: split into separate file
  dt-bindings: remoteproc: qcom,sc8280xp-pas: split into separate file

 .../bindings/remoteproc/qcom,adsp.yaml        | 234 +-----------------
 .../bindings/remoteproc/qcom,pas-common.yaml  | 121 +++++++++
 .../remoteproc/qcom,sc8280xp-pas.yaml         | 154 ++++++++++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml  | 169 +++++++++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml  | 178 +++++++++++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml  | 188 ++++++++++++++
 6 files changed, 812 insertions(+), 232 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml

-- 
2.34.1

