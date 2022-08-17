Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D05EC25B08
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 15:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240559AbiHQPAV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 11:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240551AbiHQO7T (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:19 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D609C8DF
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id s7so734287lfp.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ylRikkO/bjiVr6cfpMQukwsajH9gmB7MCgQxpA3FZjg=;
        b=hXZ0c44OpCsGxovQZvqFrg6ZtkwO/t14H0ceAUtHqDHCqa8KJW2DuUN+ymtRMFnCSF
         DrMmUqVb4J35TvO+V0/pm/EBJADrXBNyYrgiL+v+1BxDvmQOQ3Oybbyt8+WF28ow+98C
         Uf6sTm62sTlS+YhFzUxmSSy3SDw/YxG44I9kR5drEBkpfmU5cwSF7O44q88OkiXuPtK3
         03pHrBbajebhA7eGM4O/jHMsCmXTp1tz/dDDyv//NOdKZH/Agn+MgIlKQJ2z/anlIuum
         8eG8a//VRxrWUM7udWAI51Gpfz0JImj2oMZ+MhjOE1sLNt4PCE615tefqX0RZhxPBJh8
         DETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ylRikkO/bjiVr6cfpMQukwsajH9gmB7MCgQxpA3FZjg=;
        b=bIYh1VONcQmYpfCgJe04jltR1TNSaNVrvG0Bkfi4OnmDxeMeDL2P8hvCsugzuesCoU
         Vvsh/IPelhzT8vXI8m2kaR0tghHnbeckeOOpxl9QmKWXjPoF1EtaECAuvk5zgI3iWI8W
         oQFLa+utaJaBVqq+3y2W0CrlJU0KpOaWXr6Z2F3JqCAktlovBl3B3hPGDXsPwGAmy4oE
         BD6Dzq9OPvEdtAWRlLc8oZTvfcZUZQCVjo9zW+o42/eeRsdcSSxFGpWLzND8RPjl/GzE
         a826GUMU+82G+vYzJgGAODPm9KuUZC4+aQHBMnuwwxPMz5LNTZQE7L8OL6AloKQPsI8D
         Z9DQ==
X-Gm-Message-State: ACgBeo2SweIVs05ufYhUk5+aK27O9ktIXTvt/qzR6YIFadXi8Zez6kwX
        8zj5pu13iPsuxpbvR5XTihwkBA==
X-Google-Smtp-Source: AA6agR4/Eymr0jqqYU2V2c9aS8hPcF8kSYC/oTFZTs6JgCeJlO5CFkyAC4ShXv8ozeVNTbqzWz+zAA==
X-Received: by 2002:a05:6512:3f92:b0:48c:ffd4:a05c with SMTP id x18-20020a0565123f9200b0048cffd4a05cmr8497777lfa.284.1660748351207;
        Wed, 17 Aug 2022 07:59:11 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:10 -0700 (PDT)
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
Subject: [RFT PATCH v2 03/17] dt-bindings: hwlock: qcom-hwspinlock: add support for MMIO on older SoCs
Date:   Wed, 17 Aug 2022 17:58:47 +0300
Message-Id: <20220817145901.865977-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Older Qualcomm SoCs have TCSR mutex registers with 0x80 stride, instead
of 0x1000.  Add dedicated compatibles for such case.  Unfortunately the
binding started using a generic "qcom,tcsr-mutex" compatible without
specifying the SoC part, thus it looks now quite inconsistent.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If anyone ever says "I want a generic compatible because I am sure all
devices are compatible", that's one more argument they are wrong. :)
---
 .../bindings/hwlock/qcom-hwspinlock.yaml          | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index 1c7149f7d171..de98b961fb38 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -15,9 +15,18 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sfpb-mutex
-      - qcom,tcsr-mutex
+    oneOf:
+      - enum:
+          - qcom,sfpb-mutex
+          - qcom,tcsr-mutex
+      - items:
+          - enum:
+              - qcom,apq8084-tcsr-mutex
+              - qcom,ipq6018-tcsr-mutex
+              - qcom,msm8226-tcsr-mutex
+              - qcom,msm8974-tcsr-mutex
+              - qcom,msm8994-tcsr-mutex
+          - const: qcom,tcsr-mutex
 
   reg:
     maxItems: 1
-- 
2.34.1

