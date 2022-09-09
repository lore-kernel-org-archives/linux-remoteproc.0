Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7F0ECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 09:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiIIJUt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiIIJUr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:20:47 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7FBB4EBB
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 02:20:44 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bn9so1091722ljb.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CEQ6kD7E3x3cGbQZ0xWqW+Ktcext0aENc2Q7rleIIpo=;
        b=UQbRgGgAD9DMTUfnKoGoUryiinB3JrR/+fLyeAF6ApFQ/GGvwVhkMpUYAG3K61OL2Q
         H/LYVddfrB9r4eGyEEYZiEfDoYfeHjbaLf9/7uoX8M5GhkDMlDyAfE6B0J3BkheHhSvT
         DQ8XwEpJ7IkA7atE5AfljkcQLqox8ldzdAXMpBE2RGB8JsRw3l7+Qbpox5kQ8EstKtYq
         8Q5ZFg5bIKxypbxCt9XQe0h8Vxr/MlQAT7MRPnXTFv9z+qvuJtL+vQ/7yW/u3EL+HrKA
         pL6H9uF8i3ssZDH7hiOhuN7VdfAXbFVosgmiXELdIsbPPiZBRVPtCiejocKDT5WgTmWq
         M/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CEQ6kD7E3x3cGbQZ0xWqW+Ktcext0aENc2Q7rleIIpo=;
        b=4Dr5LQ+YAsNObVuBO1WywNOVyNvJVFnuy/h7fpS6KRmxs5X25phdKsEjIactbQ/A3O
         JDEkqhvX/+9Qk9Tdh5N2wNKZO9haRH7xppiotj1fxUZ0bNr2Y4VrbHmalcLFFG93FpAw
         Bgz7ct6CdIrD2jkVhF/MIlVCaVwPI4ymBSDstU7cXs13QWzcGjuHY3m26tZCw5tD6yuq
         7dhi2K00NKewo86zHAjnNb2fJFguG/rD4HRfDarNw8/hwnhxvMzoR4Vw8YMDa9CoU5/X
         oED+QNs9Y+wVMg5NsBeGEhOEiX6/VSyAYXR3PXjAbUCSiXNmLjxCfV4dE5NKra6n/o99
         wbhA==
X-Gm-Message-State: ACgBeo2zyWazN50rSrEL2BEVWe1V42vZ8pGAspPzF42a5cqOIdY63C+G
        b3CVx5XmLm5WD9XdofkW0A78vkmML3Iucg==
X-Google-Smtp-Source: AA6agR4wosQnzzG9FY77Geu239a8YeXktmczFJO8DCKG+49rSSbuKPHSoXNQFdiVVS3he73xSaSrbA==
X-Received: by 2002:a05:651c:1611:b0:261:e11c:c2ef with SMTP id f17-20020a05651c161100b00261e11cc2efmr3497449ljq.340.1662715243162;
        Fri, 09 Sep 2022 02:20:43 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:42 -0700 (PDT)
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
Subject: [PATCH v3 02/15] dt-bindings: hwlock: qcom-hwspinlock: correct example indentation
Date:   Fri,  9 Sep 2022 11:20:22 +0200
Message-Id: <20220909092035.223915-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use some consistent indentation (4-space) for DTS example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/hwlock/qcom-hwspinlock.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index de98b961fb38..1a3adf75934b 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -43,9 +43,9 @@ additionalProperties: false
 
 examples:
   - |
-        tcsr_mutex: hwlock@1f40000 {
-                compatible = "qcom,tcsr-mutex";
-                reg = <0x01f40000 0x40000>;
-                #hwlock-cells = <1>;
-        };
+    hwlock@1f40000 {
+        compatible = "qcom,tcsr-mutex";
+        reg = <0x01f40000 0x40000>;
+        #hwlock-cells = <1>;
+    };
 ...
-- 
2.34.1

