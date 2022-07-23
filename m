Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B96C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Jul 2022 08:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237100AbiGWI3i (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 23 Jul 2022 04:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiGWI3g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 23 Jul 2022 04:29:36 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06D02AC59
        for <linux-remoteproc@vger.kernel.org>; Sat, 23 Jul 2022 01:29:35 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b34so2584339ljr.7
        for <linux-remoteproc@vger.kernel.org>; Sat, 23 Jul 2022 01:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=resent-from:resent-to:resent-date:resent-message-id:from:to:cc
         :subject:date:message-id:mime-version:content-transfer-encoding;
        bh=Xmn9d8wzhnb5rJgQvodKI4xlV+AmvezLKvvvO2g+5Xw=;
        b=ZW3VfalZealplyPdQKkDKqldRoqSFEIvFQhAYOgAqgB0w2ardjvN5asCtAPSWkvW9Z
         lBkLpdV2LHJTIiva2U3yngFYjiVIwlNg4HvO+A2otu+nu8WlaH/5lRGVWMOnYavZOKgA
         OP7HM1uvCET0raNVV+ZxddKY1zHap0kDdR4oDHaKjGLN8KThEBTxUhIkJdrERrz5JKRn
         j2hOCITuH0MIV+ZXR3qtdcTH6gv2hYcpjl/ZNOjbjVacNQf1VNU92jzQt3udBf3aUWWP
         NecTSEuBi8b9elvmT/lX+uPdqmupJWkI9ReCbIl3MCCdCDMy2QbHUEOvhdUk0nLblrlL
         Hrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:resent-from:resent-to:resent-date
         :resent-message-id:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xmn9d8wzhnb5rJgQvodKI4xlV+AmvezLKvvvO2g+5Xw=;
        b=5KkGjxJBpeXxZoZP0xogmi9k6sYX7nEKLxGPSsn2OCu9J90T/j4HvKhvqxzLeBs+58
         YBHYoD7w1f+NmPUPRu/+rgwt5BKwRtFDmLLm94OGvWBCaUtIKkH17njQAcTmrshqT47b
         bgyT73cLEE6H/NGgnQgB1BAdAALsIIA6eZcLVgkW5sJ9+Wk0o/2txusClf5tN2IlZMKH
         Yk0v+hqvCMqX7v8lq1Wwm0TjoZG6Tedlb715s9WC9ZTB00PTEbq0ULtjF0JDziTnfI2e
         01IgEgVmOkkjG10ALQEu8tMrHcLQJHLv6inwtqqmQsvbgdRMEqDtj3bbiEmJ+PGg7J+J
         snhw==
X-Gm-Message-State: AJIora9jx697HdH8+31wIncX+kxb9Qp1upxo1fhSl7ZkXfKx1mgAUK8m
        o9IUmg84XXiyDfBdmLfXdRw4Wq/1N/cG+otF
X-Google-Smtp-Source: AGRyM1sGu2otVburJxKLU+tBpHbmFRcJAj7nsXaV9iwINokRKKckkWvBe9QrsM2JDAemyJaYn50RMQ==
X-Received: by 2002:a05:651c:2208:b0:25d:9ab8:b368 with SMTP id y8-20020a05651c220800b0025d9ab8b368mr1254099ljq.359.1658564973191;
        Sat, 23 Jul 2022 01:29:33 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id u4-20020a2e9b04000000b0025de8d95352sm1333460lji.1.2022.07.23.01.29.32
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 01:29:32 -0700 (PDT)
Received: from krzk-bin.home (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id n22-20020a05651203f600b004886508ca5csm1545801lfq.68.2022.07.23.01.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 01:24:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: soc: qcom: smd: reference SMD edge schema
Date:   Sat, 23 Jul 2022 10:23:57 +0200
Message-Id: <20220723082358.39544-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The child node of smd is an SMD edge representing remote subsystem.
Bring back missing reference from previously sent patch (disappeared
when applying).

Link: https://lore.kernel.org/r/20220517070113.18023-9-krzysztof.kozlowski@linaro.org
Fixes: 385fad1303af ("dt-bindings: remoteproc: qcom,smd-edge: define re-usable schema for smd-edge")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
index 62bebb5f83bc..9b3efe97f47c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.yaml
@@ -21,7 +21,7 @@ properties:
 
 patternProperties:
   "^.*-edge|rpm$":
-    type: object
+    $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
     description:
       Each subnode of the SMD node represents a remote subsystem or a remote
       processor of some sort - or in SMD language an "edge". The name of the
-- 
2.34.1

