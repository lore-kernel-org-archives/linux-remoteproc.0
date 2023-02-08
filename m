Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE82BC636D4
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Feb 2023 10:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjBHKQA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Feb 2023 05:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjBHKP4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Feb 2023 05:15:56 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFD638002
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Feb 2023 02:15:55 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1059640wma.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Feb 2023 02:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKDdeglkNeUYsDE7dNCq4DvipvOoaBQXMMUdKEcJp/s=;
        b=qTVFa5RgMhys3GGm+9g32DXDiQdSAtwy7Tat/X4xAnd7P8SEoasyyDRs1XC9nKwmeU
         0ZcERYTUzqS0h8Fifuvv030i2nnLbLTpe0Wa1Dx4VtAdieO6w3URXqUO79G/uP60dZUk
         fFDKxEbS3T2Stj+vlpB79Zjf2RDMMvWWf9JPpXoAnlpgfj/0clsFkoky6tUJfZD3r28T
         2wu4U556PcVC9fv3jXr53TRx0vLrRKig/P7QQzfaKosLHOQyTofjIX/ePz8m75QjTGfQ
         Rp6/2HcNJbA1vMk6dSo18wRNOe807ufBom05YO1/hhLrVU0yuTwtxC9b7ayiKt/rkoSd
         TtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKDdeglkNeUYsDE7dNCq4DvipvOoaBQXMMUdKEcJp/s=;
        b=0x7vLuNnwOlzDGRE3b2ino72QqSFEb3UhEnqJ7ciiKGFUUT2tUxzz38D9atybGEG3N
         CT237d8xY5w4ynHrQb9Jp52FDJBh1WIP7Va/qFGZ7EyngGKww8Sb/5/IJX3nO8MXYHjj
         W17LqOsxctjTzvgRvVu2A6ai/kj5Nzhr6shazOfF6gUg3Xmr/mwXPxffgyWk27nFBPsM
         2mw8BHnnxLKu0x760C2DEcszylObyaHulMV1ZntWgPTD2IP4SKmg4ZODQu2/SzF3Z886
         OnEDzwwp4SgvNOIWj5Owjjtn2tQq/h03bRZa7/fqerUfrca2RJS5BMQMvd4UpewxeDn3
         6LmA==
X-Gm-Message-State: AO0yUKXFBJM4HWdpihKKYAhF5L2NcxGNC/saXljmo7hbWN4a42VmCiSB
        A1C/RjpSnz9AoE+CmVgxGwETBA==
X-Google-Smtp-Source: AK7set9I7FQyv5QlH9tUgviBZftDZjVnw+tfEbullhD6mNVpLl6bzzA6hwk4pWCze2U3YVWY1ZsX7Q==
X-Received: by 2002:a05:600c:331a:b0:3d2:392e:905f with SMTP id q26-20020a05600c331a00b003d2392e905fmr5835162wmp.24.1675851353876;
        Wed, 08 Feb 2023 02:15:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 3/7] arm64: dts: qcom: msm8996: align RPM G-Link clock-controller node with bindings
Date:   Wed,  8 Feb 2023 11:15:41 +0100
Message-Id: <20230208101545.45711-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

qcom,rpmcc bindings expect RPM clock controller to be named generic
"clock-controller":

  rpm-glink: rpm-requests: 'qcom,rpmcc' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 55180586f7b6..e0d46dbd498f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -483,7 +483,7 @@ rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-msm8996";
 			qcom,glink-channels = "rpm_requests";
 
-			rpmcc: qcom,rpmcc {
+			rpmcc: clock-controller {
 				compatible = "qcom,rpmcc-msm8996", "qcom,rpmcc";
 				#clock-cells = <1>;
 				clocks = <&xo_board>;
-- 
2.34.1

