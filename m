Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96637C54EE9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Sep 2022 15:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbiITPEv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Sep 2022 11:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbiITPEi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 11:04:38 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E55543ED
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 08:04:20 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id g20so2152477ljg.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 08:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SVZ6k+oM0JCP4OT8+67fkZtMwtYdCVTR4DStHO3hiQc=;
        b=TCQUnPGF1UuuBoi6/uhKU93aTXQN/UD3K0JA7QSOz1/xzTet2+lmsaLsDYz2kvg0QB
         WZE7cq8G8/2D3yEbZEbGHQRC3rOiShdM5R2gdM8DEj5ouK78j1ekB6RU3SEG+xM/Y25q
         coZZXSvLyAGWCzp5m5yMF8Xa3SLh+jHYtuo+1GbzJZgPevWy9cbN6sOXh63F3rRGfJlt
         kINaIJdjVikOmbmEAhIbBIhyiXyJFjmLwpmomrJnHm0WE1TuBbU1fd3BE50Sk7djyoLI
         Q/Ua6D8WhnreJsct34iSp0BpWWsQ7N2ybsx3e8uFY16sj+8H7g9N/NSDdIJQ+VSu1EAG
         qSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SVZ6k+oM0JCP4OT8+67fkZtMwtYdCVTR4DStHO3hiQc=;
        b=wzzN09hdeN6sVbbh7+hzil/cg4NxxN7HDYKawZjxclYo0jyHb3acMKcehkdNjxaksQ
         Y7o4mHFUwaqO8w//uR+avW4CWPzSa7Gi7lQSNJ5kXpbuoP5nMy+LADTbRkzvTOu5I/Z2
         6fuYH+JMZCVVa765hGdu/e92mFYXifNicC62CbOvIRzi2oW7kbfhrqrbIi9ZN/eZGD27
         Lr0d6lBJd928GZOpJNX5JdHaOSaUNWRR3ciHFxTSdQYBFz7tEybr0XZGcMacllFnCZS4
         x7t1XpdHPUCOTnNlNy0/gcvZikL4wIVJdNWeRyzLHSmG8b46zu1YQA2EyzyhxBoqTGfV
         BvXw==
X-Gm-Message-State: ACrzQf15fd9Ybxgum6eKnEmMOzTox+nQTbqPkex3U77N9rKmnefUw+mK
        vla6hKH7ivw6uZMqv3c4jVyUWw==
X-Google-Smtp-Source: AMsMyM4DR4FdEL3K5QffgANOg+HXdWCQW+PXjnEIBuHuGq/Qi/MmRcI+cYdSeqEr91reB+lbMPkikQ==
X-Received: by 2002:a05:651c:482:b0:26b:e964:3f00 with SMTP id s2-20020a05651c048200b0026be9643f00mr6821597ljc.464.1663686258847;
        Tue, 20 Sep 2022 08:04:18 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b0049f54a976e3sm8294lfo.58.2022.09.20.08.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:04:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: hwlock: qcom-hwspinlock: add syscon to MSM8974
Date:   Tue, 20 Sep 2022 17:04:12 +0200
Message-Id: <20220920150414.637634-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
References: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TCSR_MUTEX region contains two set of registers: mutex and halt.
Add syscon, so the TCSR mutex device (hwspinlock) can use MMIO based
method and in the same time share regmap with other devices for the halt
regs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/hwlock/qcom-hwspinlock.yaml         | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index 1a3adf75934b..ee2726149cf3 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -24,9 +24,13 @@ properties:
               - qcom,apq8084-tcsr-mutex
               - qcom,ipq6018-tcsr-mutex
               - qcom,msm8226-tcsr-mutex
-              - qcom,msm8974-tcsr-mutex
               - qcom,msm8994-tcsr-mutex
           - const: qcom,tcsr-mutex
+      - items:
+          - enum:
+              - qcom,msm8974-tcsr-mutex
+          - const: qcom,tcsr-mutex
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.34.1

