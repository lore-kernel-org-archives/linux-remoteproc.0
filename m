Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CF5C43217
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Nov 2022 12:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241411AbiKRMeT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Nov 2022 07:34:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234724AbiKRMeS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Nov 2022 07:34:18 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2E88C0AD
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Nov 2022 04:34:15 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id d3so6637021ljl.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Nov 2022 04:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FlHzCCH4KJwO0lgQdL8J9FjkLpXQgQjYuKByJocNfQU=;
        b=DhjurLkGZCt16EyCU9+P6tF42Bok0r6ikcxjd2UIhW93t7m++orv1R9GEA3MXkilBZ
         ZbtCPSq+D25dpx+k7esuGOUfqCEqGed/mtV4J0qjRslGgFoLVdl37/BF3OyOJoKjtLsq
         fh8mURuL0Y1PDTW8lQt5LX2QZNJbtl71fX1Vb2/L9HZbFOwcX7eJUZV2GL52/VLDscCs
         0o8RDBwCyeButTgipa28nsq7e4MxdeezJ9j8tNcEcgnEri8Uh3I9nvRGIaqOVl/f/qS3
         7XlcgBPsmplWYrkbZ6cl9wwcLzNlKS8IE7EqGhyBzQF3T+5rlyW00LfWFIcBJhUsiuaW
         xpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlHzCCH4KJwO0lgQdL8J9FjkLpXQgQjYuKByJocNfQU=;
        b=wx4mis+/ioMoVHJvaSsMBdqw93wEY7DVUVFcMtexB+R7V79TeLGZEdZvLtoHpHitub
         CfaqI5GhGrrXIpdUyk/zTRM4OmunmfxZXeJTI0f2ZTwISn8BacDn3T0rhcfrqxx2tF8l
         BOEA+4cuogXRPtW6ruuIAYXyHIwQCHBTZBU+bGziW7Lpv7AyyVqfzsFhxvb5yAQ6DkPY
         bQS7Uju4uAvmx+8WssGb5xp380beU4pqaLJAaTMHIlLGLRmwHC9clwwZMlEe7NgLB8pg
         J7GJu5gBQ1BRXq2eVpUwWXOuyUffXrlTNU4NQm74PxX4uVVQevR3mFCzn9GUldLM0xLD
         HnRA==
X-Gm-Message-State: ANoB5pk+jazjryfO5oeoY73yT1aBOcoyKYAzrOid/V0V0FdYOSKs3vMQ
        BSyeD3oOAeeM53YO0DjekhtRcA==
X-Google-Smtp-Source: AA0mqf7P1tz/5Tp9Df40oRr7GKytpVeScjeKcyYNn9SReYrD1IefrvrwYnl2oZBUqw+vK7Y99P29Qw==
X-Received: by 2002:a2e:a90d:0:b0:277:5e9d:508a with SMTP id j13-20020a2ea90d000000b002775e9d508amr2606716ljq.191.1668774853811;
        Fri, 18 Nov 2022 04:34:13 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m10-20020a19434a000000b004ac088fdfd2sm645833lfj.85.2022.11.18.04.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:34:13 -0800 (PST)
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
Subject: [PATCH v2 0/7] dt-bindings: remoteproc: qcom: split and reorganize PAS/PIL
Date:   Fri, 18 Nov 2022 13:33:55 +0100
Message-Id: <20221118123402.95784-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

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

Krzysztof Kozlowski (7):
  dt-bindings: remoteproc: qcom,adsp: split common part
  dt-bindings: remoteproc: qcom,sm8350-pas: split into separate file
  dt-bindings: remoteproc: qcom,sm8150-pas: split into separate file
  dt-bindings: remoteproc: qcom,sm6350-pas: split into separate file
  dt-bindings: remoteproc: qcom,sc8280xp-pas: split into separate file
  dt-bindings: remoteproc: qcom,sc8180x-pas: split into separate file
  dt-bindings: remoteproc: qcom,sdx55-pas: split into separate file

 .../bindings/remoteproc/qcom,adsp.yaml        | 241 +-----------------
 .../bindings/remoteproc/qcom,pas-common.yaml  |  97 +++++++
 .../bindings/remoteproc/qcom,sc8180x-pas.yaml | 101 ++++++++
 .../remoteproc/qcom,sc8280xp-pas.yaml         | 160 ++++++++++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml   | 101 ++++++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml  | 173 +++++++++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml  | 184 +++++++++++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml  | 194 ++++++++++++++
 8 files changed, 1012 insertions(+), 239 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml

-- 
2.34.1

