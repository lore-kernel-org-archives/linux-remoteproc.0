Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED955EB64DC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Jun 2023 20:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjFZUB2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Jun 2023 16:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjFZUAy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Jun 2023 16:00:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32ABB1BC1
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jun 2023 13:00:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f96d680399so4947484e87.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jun 2023 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687809649; x=1690401649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oE1vA9oZECxb4lngoFC5l9QDNuTaz25Y3kIWdbl1G4=;
        b=vw1Zn2lkdQDV8C2mNkXXf2b6yxaSYrNGCJ/o/8rmXru/l9NDdM7l8Amw9sahWGfL1/
         b1cqNvH9gTWYlX+k8BYada27hhiz0RMgMNoJfe1nkmC89ya0YNMcpYJnXXFjMjRIsIpE
         rK2TFcb/eVhmOh3lL72hu1geZq6ASYxpWKfMKdneXpddc5fTN1Zxdi6tbQeVUgrmzR9b
         ZUk6ExFgrqnqIZhJtDuxOSk0N6QO4+n7QcX6SFG92kHPnFkf0wlQHoegIzsvDDhsr1RS
         /lCGwg7fR7Kjg1djr0IiaDrMwmlhFilMiOoIdvEjuJMuW0/Q1fXHwieLeWfT7chpSBL0
         +ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687809649; x=1690401649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oE1vA9oZECxb4lngoFC5l9QDNuTaz25Y3kIWdbl1G4=;
        b=gCr99zQxNlyhzHdVtHfphQSx5zUnxdruJe5UFZlhWVyyLvG7K1JxaqUPuFzwuEBq95
         E5HWIcj4BnV4TNifOE1aTB81IjWVfyRrpLdtudxnjP+vaJ8dew4VJ7wbeae3gHWsbjSd
         xbPDSgH/cmcm3xpfCskzxGkYFf9VsKc+/h5HWjEDldWZfuyMmAMQQ/zzXSmQ5udgN7LQ
         969i76tOxN/T9h4z/dpFw32jn/zXWi7Ei4Q19Yg9VkEXv6TKmZkaRF6Njy2k2XPMPXpn
         yx6bRqgnszElRtmLfdylECpm5MAtmd3ebyMCtQdRfRzv2O1BWI+g4zxY9CowQcAPFiMn
         7NRA==
X-Gm-Message-State: AC+VfDwMAxAs9Cc94x3ebm8T8jcYkPrg7fJqYisPYMghzPHX3r0A6ejb
        Nisula2FhNuJIzj6Ora8M37pZYkytusnKOq+aTY=
X-Google-Smtp-Source: ACHHUZ4OiBhU4ZhPCNUmYmycNqrSBBeUaIAmkQGKJPpildJC6x6za9LCFa2p42QVBFQtf9EZLkInIw==
X-Received: by 2002:a05:6512:3a96:b0:4fb:7642:88d3 with SMTP id q22-20020a0565123a9600b004fb764288d3mr2947490lfu.27.1687809649016;
        Mon, 26 Jun 2023 13:00:49 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2494b000000b004fb74cb9670sm628082lfi.125.2023.06.26.13.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 13:00:48 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 26 Jun 2023 22:00:28 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: pmi8994: Add missing OVP interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230626-topic-bindingsfixups-v1-6-254ae8642e69@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687809636; l=1039;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ZiBnl3ppLgPG+6RsUgiLkAxM9fVUIHOAF6RSdTbrPSM=;
 b=GKIu4T7ibjpsm2tmTrKQED9br3OgA+LWnPEAhuS767DpB016iimNdk40hfz04vB7l0+oZsFJq
 lBP0unrfJyqCBgyGG23dbfIJIghh/6j/QEmu65W3NnR/vGTVMi89B61
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add the missing OVP interrupt. This fixes the schema warning:

wled@d800: interrupt-names: ['short'] is too short

Fixes: 37aa540cbd30 ("arm64: dts: qcom: pmi8994: Add WLED node")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 0192968f4d9b..36d6a1fb553a 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -54,8 +54,9 @@ pmi8994_spmi_regulators: regulators {
 		pmi8994_wled: wled@d800 {
 			compatible = "qcom,pmi8994-wled";
 			reg = <0xd800>, <0xd900>;
-			interrupts = <3 0xd8 0x02 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "short";
+			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x3 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ovp", "short";
 			qcom,cabc;
 			qcom,external-pfet;
 			status = "disabled";

-- 
2.41.0

