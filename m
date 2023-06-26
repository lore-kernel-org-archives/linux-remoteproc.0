Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AC9EB64D7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Jun 2023 20:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjFZUA4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Jun 2023 16:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjFZUAw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Jun 2023 16:00:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022301984
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jun 2023 13:00:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so2430473e87.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jun 2023 13:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687809647; x=1690401647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKfIdLUUH2RS/LUserqASM5cmaLcT+sMjCEMVJp6OG0=;
        b=qsKd6ggy1Axj9lwIWB2x+mFB2qIylwRI7aUVdF0KWYKyzCnHXgocW+DxYET2wtcQJ7
         ms7H9kIvTWV4I+LzJv6w0tdtv5EvUSwYtKWosuxUMUY4I7HrPLkYFmhawBfQY9uGGOjq
         z1aVRVxrhiAPdsqDx6vvrQQaPQ0m3Dyu2G4MLf2E2xIyfHKXOBHkRWP8l9URAz8IH5Ho
         C8biajrPGizw8+ceEXeUdlcSR+CPY4xKtJ7C3FGCCuKIJ10wRPUy/TznqAzhRmJXDNMM
         bWxiXvh/HCylYruibx/6DXyA8PXwL3LprjPQXQECtlDi26AebNyGljYSLKMGNbqgn533
         ZX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687809647; x=1690401647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKfIdLUUH2RS/LUserqASM5cmaLcT+sMjCEMVJp6OG0=;
        b=iWtE0NI/RadyApTM3dfSYxz0w6yA7cfwA//WeO+uqalljvU7vUH0H607i+9pv8H16H
         wsUQQ8DsJCXG6VGVnEKnoxbWbH9y8jsmtEazc5yMDyazcIvw+5uACVrc/JBGa7GxPPMU
         ixMarsWH9wqXBck5xGA8wAZEXjjdO4vU21XMnO3AoBIzQIz8NA+zIalx/eswJRNw6oHk
         qxwEEw+8qgCWqBp6jIxMlK23tVCIeSg0NW94I5G8qyO/xaiG8O7eV37H/hXwMnf0z29E
         w/85EdgK2B6+yZTL+IKDxoNhla4UJXurbtrYefUEuK2yer6FBveltIcMu+cBDynpDmb0
         S7YA==
X-Gm-Message-State: AC+VfDwAB8OKfin8wjz8yNJp6681EWGTItvWHTQ8Ly6DlUKJidETH136
        XjC3qCALAtMQJJGS6K3L0G1pQu0aeOplX2B+hJE=
X-Google-Smtp-Source: ACHHUZ4NLSXysy6psp13JHUXwmMYc7ARbE87NuhMyBupcqaANX/p2M/kcomktzH1OGLoppl6tRXEnw==
X-Received: by 2002:a05:6512:447:b0:4f8:5fce:3683 with SMTP id y7-20020a056512044700b004f85fce3683mr15653218lfk.20.1687809647097;
        Mon, 26 Jun 2023 13:00:47 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2494b000000b004fb74cb9670sm628082lfi.125.2023.06.26.13.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 13:00:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 26 Jun 2023 22:00:27 +0200
Subject: [PATCH 5/7] arm64: dts: qcom: pmi8950: Add missing OVP interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230626-topic-bindingsfixups-v1-5-254ae8642e69@linaro.org>
References: <20230626-topic-bindingsfixups-v1-0-254ae8642e69@linaro.org>
In-Reply-To: <20230626-topic-bindingsfixups-v1-0-254ae8642e69@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687809636; l=1018;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=KUd2AC4tc+iLheKuH/ERKh2OsQIUCXg4x0GOwnEVQBc=;
 b=3BhxLUb7/d4mmkWDECw8N4IewedZ36153EHBhClQZe07ll84G9Q/ATFQMLlZrTTxPAYqXzcp2
 RexIcXisuOjBJwBAaW0zxlo66RnSjeHVuZBf22YFCMJCNhOFJp14BO1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add the missing OVP interrupt. This fixes the schema warning:

wled@d800: interrupt-names: ['short'] is too short

Fixes: 0d97fdf380b4 ("arm64: dts: qcom: Add configuration for PMI8950 peripheral")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8950.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
index c09a9681bc0c..1029f3b1bb9a 100644
--- a/arch/arm64/boot/dts/qcom/pmi8950.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
@@ -87,8 +87,9 @@ pmic@3 {
 		pmi8950_wled: leds@d800 {
 			compatible = "qcom,pmi8950-wled";
 			reg = <0xd800>, <0xd900>;
-			interrupts = <0x3 0xd8 0x02 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "short";
+			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x3 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ovp", "short";
 			label = "backlight";
 
 			status = "disabled";

-- 
2.41.0

