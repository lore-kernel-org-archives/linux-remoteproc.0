Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB89BC3F6B0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 14:23:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240130AbiHQOXK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 10:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240103AbiHQOW6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 10:22:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D349083A
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:22:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id d14so19178219lfl.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 07:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RLFtxKe+OhZckW6UWUlO5nQyi+aAQydRisAUQ2pGnOo=;
        b=xqUTUYdhUtcYoktp6glAcArIaK4BJecsnSG+eYbnh+bBkTvA/igs7Cm3Y+DX06ff34
         dH2MyV38XqULqXLco2U2xv1SzQW4kIGxdd6Yr5ndocQeuOPIdzCOBf+mPnKhaHhJIK7R
         v3C0R2bOJqjJkKxbVO32Fr0CR0uiyiiKpunD9GkSut+dTB8sN0z4eCurCYaFedel0QQJ
         bMAW+47BHd6JipjDY0MEgyU+Jwrpeu13lLdT1dDlYk2OqCyP/ImEgeXKNAxAJ2BCDm+L
         B98+zNRAbeao+uDz/LV3hmSOCH+zyLHlnA2HeDVdvtDl98Z2PCB2i5rqLz2dExWHwN2I
         ua2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RLFtxKe+OhZckW6UWUlO5nQyi+aAQydRisAUQ2pGnOo=;
        b=dRzcb+w1V2ohhi4UtEPslc2RX5KSvdNOwr9Hcj28k7j/rwWeT8BLPmVgT9xyO5caBt
         ufHCROF9n/3fIiejVhy1ObzyYtOleS76Hux7wYmtQvFMXGlTRgRzby7DUB44B3vLEYO1
         E9fK+zye7jTvSsHKWYNjmbrU7QWDGKQfdXtUzHmDuFm3MkztDKZvO/SjtbCZ4zK1huq5
         bM8iPNhJ9QgtDl7lFSgc+1KtTORLcfk+z11G5NE/8ng5S5vbsrGoK1fOKvOOM1Qgkk1H
         YnQcjnqSdh4eVdIbIqZd4H68iHzolFt+5lqKRtZOkXPzxpWX5wTaLp/JHJz9U1feR69k
         Xhbg==
X-Gm-Message-State: ACgBeo2/BWm51NfESDl0WOiMVsEHfxUvQiOOr268COPMzM3BFN7GE4bm
        rnMgTeuMNKqRDARyLws33p3F5A==
X-Google-Smtp-Source: AA6agR59CBGcXaV0hie1fj1kHHlCqZogn30/K0KtyO73p7KQ0SRzgXOusSqZ3nNin28PDKqXiffn0Q==
X-Received: by 2002:a05:6512:1045:b0:491:f371:ad5d with SMTP id c5-20020a056512104500b00491f371ad5dmr5839628lfb.425.1660746175435;
        Wed, 17 Aug 2022 07:22:55 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u1-20020ac258c1000000b0047f7722b73csm1704647lfo.142.2022.08.17.07.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:22:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yu Chen <chenyu56@huawei.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Carvalho Chehab <mchehab+huawei@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] dt-bindings: remoteproc: qcom,pil-info: add missing imem compatible
Date:   Wed, 17 Aug 2022 17:22:45 +0300
Message-Id: <20220817142246.828762-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817142246.828762-1-krzysztof.kozlowski@linaro.org>
References: <20220817142246.828762-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

syscon and simple-mfd cannot be used without device specific compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
index 9282837d64ba..a7711e3c998c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
@@ -30,7 +30,7 @@ additionalProperties: false
 examples:
   - |
     imem@146bf000 {
-      compatible = "syscon", "simple-mfd";
+      compatible = "qcom,sdm630-imem", "syscon", "simple-mfd";
       reg = <0x146bf000 0x1000>;
 
       #address-cells = <1>;
-- 
2.34.1

