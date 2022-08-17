Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE64DC32789
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 15:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240560AbiHQPAT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 11:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240563AbiHQO7V (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:21 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC9395ACE
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d14so19308551lfl.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=CEQ6kD7E3x3cGbQZ0xWqW+Ktcext0aENc2Q7rleIIpo=;
        b=feRYuCsolaZn/GfCklF8jvHuaRiNNWaaxl9G33ZyVBdxTW6U93OFlzOU5GIDeCTm8l
         1P0DlrEsYbZHJoXirIAj2g9O5O3Wqnu0dXkoAGP0mr2EdrYVOmxRGoDjuN5NRlF2GkDa
         7v4HuRWHwSvl0ZSHvAERaITHcq6zXUogpcpiyl3UQmXN1mZrWiJP43ury2Ts/valcbNN
         RfxIGraBgy333dd3NxqZN7TFNuaNQBr0TevBG5GcUZdnsWPqz2tVLzidrTK/Rx8x+/Q+
         ewEbmiK5rc+VifKQAwAiMFE/MWXmwIrZsSRRnDeH0OPiFm6VOKNRG7rM874GX6f1Z7kH
         XVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=CEQ6kD7E3x3cGbQZ0xWqW+Ktcext0aENc2Q7rleIIpo=;
        b=EGW4i2AA6TG83MFBV0J8FXPxkHtUnOxLZoa+v7bJH76eiVrJqEbBb4ApjPuwmweAOx
         NjAPVZpdjLdaHoBE2zdq91CEShii8s4jgTWdKSAuwxft6W7n/cEFeEFFv6E2pLxni8p/
         rNSA+glBfIffP7lfufpd+51FqJuJ9jVDznYLmEOUzhrczYSUHZZluvVOikiwXPaOD/GL
         A/TsEQNdUPHUkO2P8t0A2rbqf4JB0qj2eh1FSX2czuoCct7cmf4zAdjtu3S6dCAJONdB
         MJQ4rW9AkGLW9/OmfRkrCjPiBEzaySBnHziM5IJc9J7/OcoPlI+T7e/sFY4KfqAP/vew
         dRtQ==
X-Gm-Message-State: ACgBeo0lXP8NDf7IPJomJMduu01Xnj1WhDrAezx+gdvf89TdfBRQlErK
        IWswhhR8tDGjal4zLIK4+wtQCg==
X-Google-Smtp-Source: AA6agR6Nx2FQDa0zEk4vlasfmkFU5oeMYo2GN36ypPFcTK/xIcF3J8eP6iggQo6+Iy7irFasJanf+Q==
X-Received: by 2002:a05:6512:6d5:b0:491:a52b:2a47 with SMTP id u21-20020a05651206d500b00491a52b2a47mr6413522lff.608.1660748353048;
        Wed, 17 Aug 2022 07:59:13 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:12 -0700 (PDT)
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
Subject: [RFT PATCH v2 04/17] dt-bindings: hwlock: qcom-hwspinlock: correct example indentation
Date:   Wed, 17 Aug 2022 17:58:48 +0300
Message-Id: <20220817145901.865977-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
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

