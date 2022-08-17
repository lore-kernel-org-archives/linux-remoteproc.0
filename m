Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E91C28B2B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 13:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236535AbiHQNOy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 09:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239744AbiHQNOk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:40 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E1F4F64C
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:34 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o2so18987613lfb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=6hkmj/RZGZV2ubSm7Y6EYAIQdJcarVin5p0NjjE8aKM=;
        b=LuJ/DuHx4XaFQtsZbUlL5O+XQwKTuYuMk1wiqb2amgN7AammjIOHIC0tBnk4Wys2Ea
         PIFR30NaUfWwcbUKlW0Cn7JUiQILZXgSb7N4S0M5y3CYgFbmVj4IekoVv4rMmnPUp8++
         VFOvVJV8pSa+Kf+lKGjc03HE62HpnYzTeAtq4Ukp4tfcgpqYBsV18zQSHSJ9vBbCov0z
         uxEM/UwcXaIYlLxJLzFXFZTC08y5t45MuJkCHEHxHzu/W07vV0jqz5S4Zo748TYDibyz
         HhjwhTQxCCw8Jry2oJUV3JALsJMo2em/tfd7Wf+qy+4kWqQe7czpjwF3Y3W2bbD8SgKM
         3DTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=6hkmj/RZGZV2ubSm7Y6EYAIQdJcarVin5p0NjjE8aKM=;
        b=DMqoYuo4nbQVKT3topW+Gxlz95WKDRiG9+T//1P7ODT+rVNB5wLrNS0P176fhYw/vi
         tpmsYvJV42g1/JtQBu/f3a38TyUZzA2v/0vOup1MrBuTAvz4Fch6anGmac4xe3Kd8gYz
         ukcJ6/Be1EFIaHY9kPS1w9AhBYvWMlkaCRuAo8owZmFHG6vq/FG/EQMlSKH8oudoGI5k
         c7ZT4o3J0BhTFHxFxQ6fb7qAOiVuPUqbJf5+6SUFAjFJrIE6/5MnhUuSYjVsP0LqrK3+
         +VewoqbWfhF/eifzDpWgbR4TTg/fm6yiM358edHRfT9ipsjUlZosXvV6MppS5mQXgULJ
         zzIw==
X-Gm-Message-State: ACgBeo1SIJWdXPUXlC2+Ub0uEITPxrqf1WMqX6mSjtVetgNx5IEzQvKL
        HBRBYygCSEMNBf5Ugi35CjJR5g==
X-Google-Smtp-Source: AA6agR6uz6PgHJJgHSkUYGIHiHszn0Dz+54GDEd24Jx76kQfPHB9W+lxiMZ+hmy/E2YYJ90MXmVbyg==
X-Received: by 2002:a05:6512:3e1b:b0:48b:6ae:ce4d with SMTP id i27-20020a0565123e1b00b0048b06aece4dmr8496799lfv.142.1660742073304;
        Wed, 17 Aug 2022 06:14:33 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:32 -0700 (PDT)
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
Subject: [RFT PATCH 08/12] ARM: dts: qcom: msm8974: add missing TCSR syscon compatible
Date:   Wed, 17 Aug 2022 16:14:11 +0300
Message-Id: <20220817131415.714340-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

TCSR syscon node should come with dedicated compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8baca2a77717..0a9f252c88a7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1234,7 +1234,7 @@ tcsr_mutex_block: syscon@fd484000 {
 		};
 
 		tcsr: syscon@fd4a0000 {
-			compatible = "syscon";
+			compatible = "qcom,msm8974-tcsr", "syscon";
 			reg = <0xfd4a0000 0x10000>;
 		};
 
-- 
2.34.1

