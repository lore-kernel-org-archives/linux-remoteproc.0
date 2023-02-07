Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3853AC636D4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Feb 2023 09:09:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbjBGJJD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Feb 2023 04:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbjBGJJA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Feb 2023 04:09:00 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B303800D
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Feb 2023 01:08:57 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a2so12549337wrd.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Feb 2023 01:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OyK3vHKrq6gGpuhtDDtXY/KeObiiU6Y5ZZooZk7kW0=;
        b=jvYb8Fe/lnTEFnJlPtF6I60aWZs5FQ7b5+0QoXEFHNDvcKOqUCx3nNYwzsL0/noqxH
         a03kWTOnwWz6/E7oc/YlW5Jls8zocALS+HCKiKP55mK8d1hKLQTuwZxPOFGcSXsdkFLq
         YQb3xWzTKUxAQ8aM06KmVBYbU4A/rPG2PTRG5jsIDQMrI8np41wXzYgaVWmk9gDyIFX/
         FTMrX9gMG4jjFpPY+PnPmxhr+mdrl5WbtTQSo/s8K8v8UxJ4URORMGZsQLU28+aICQE+
         P4p9okzVhyFqVBZOI0jkmKK6T4v3q2uC56afboZ6PVcKSFe8U4K4G8vgC4RiykuFoA03
         etzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OyK3vHKrq6gGpuhtDDtXY/KeObiiU6Y5ZZooZk7kW0=;
        b=aJZgn1c14rYDl7E4qgnuYy3OL3TvfkUegjDWW+byzKawvk+mI36P5ly31NFgk3L5qE
         9rOLE2YmiTRbq96Zew1OIb755hFf2C1/4JFmnsSq3tLLMczcjULHUNcj7hsmPL1jsntv
         xsc3fkriwFyDv/jamY0TdXbnJ75HhwyDqBo3LCVJkogz3y1baydFsqsRx8ExWgmG7X2X
         agd2ZEKsbN2GRycw9bfxH7WJ4/rHL4sNInOurUqb/9HDEXReh986bHn3qvtkL+H3DQ39
         kaVGTSX+eeC3wAOMCYNu4VnU//XzXASTsSEvKaGvNpxyLeFtkC+tRc3yK5IJ0HYhD/NJ
         /KoQ==
X-Gm-Message-State: AO0yUKWxz3ErjVFLMUJZRLlg1RZpME0KLGidikHNZInRHGoHvxEzAW2f
        a2toqwBYcdsZw7c04ZK404Ca53gGbfie5mg8
X-Google-Smtp-Source: AK7set/haKDLFxsOjIZu8mPzMNM4u94WH0hfDFhysehqvw49MWps3ViRosdVgx0jgK+3OdqNJMYa/g==
X-Received: by 2002:adf:f80f:0:b0:2c3:f0a3:bd91 with SMTP id s15-20020adff80f000000b002c3f0a3bd91mr1970384wrp.11.1675760936014;
        Tue, 07 Feb 2023 01:08:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h3-20020a056000000300b002c3e5652744sm5081955wrx.46.2023.02.07.01.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:08:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] arm64: dts: qcom: ipq6018: align RPM G-Link node with bindings
Date:   Tue,  7 Feb 2023 10:08:48 +0100
Message-Id: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Bindings expect (and most of DTS use) the RPM G-Link node name to be
"rpm-requests".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index d32c9b2515ee..bbd94025ff5d 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -176,7 +176,7 @@ rpm-glink {
 		qcom,rpm-msg-ram = <&rpm_msg_ram>;
 		mboxes = <&apcs_glb 0>;
 
-		rpm_requests: glink-channel {
+		rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-ipq6018";
 			qcom,glink-channels = "rpm_requests";
 
-- 
2.34.1

