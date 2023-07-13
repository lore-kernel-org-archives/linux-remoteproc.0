Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A29C04FDF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 13 Jul 2023 07:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234277AbjGMHXJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 13 Jul 2023 03:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233928AbjGMHW4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Jul 2023 03:22:56 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8C419A6
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Jul 2023 00:22:55 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-307d20548adso492125f8f.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Jul 2023 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689232973; x=1691824973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW6ucyBlPaXPLxhxGyKJLKFBicJXxXMRT8wQieSVLcc=;
        b=a75IyubDe9U1hEUKqxIL36g8vj3+5t/2j5ofDIOSZR4U628P2xqfokU24KGbUtaUUC
         dQSYE7jOlDQFaQgpNUIp+n1e22Yc66xVI0+njn2Saa5Mgfje4In9pBWtJCqKpKZokOxq
         dbi60B2cCmcbE8W9mRl64bxPOZokbxK6cSM79qcd9iPDHHUIDUlv88KbL7LM1/4+izq/
         9SJa0Gs/3VA2eNeDujMzdfyBXYT6GTY3WZghEHlQRwH3NBC2fi2cBxzypglDVQJ/YNJC
         A8fVg7nfM/mKNn6S5+LgfPjszs+8RO7HYAU20LVODHeITktK+eNXCPVwEV5OzbiKHA8G
         ianQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689232973; x=1691824973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW6ucyBlPaXPLxhxGyKJLKFBicJXxXMRT8wQieSVLcc=;
        b=WnORrn6Omsyq1T3qYQtUXf3hISr4p41V1VirSbrEp3zt87sIyr8RQwCsudQ6RNEdxY
         loU18azLlh3yqI+u99k4lQf1e3DT1gNRuhyp+vnBLqgY4PR2nM/xPgmZ5PzSJy5rL51u
         aJHdRZT9b8c/GydsalpLn3U86cISJCG5Vdwvjk1rObvvdDM/pyeJ9UhtBd7dRa62ezmh
         t9q51TN5IX7fFax7VTU2fA0KZVKU2Ie1Oe+UCDrWt5vvQ6aDHDndr5JSt7iVXO5dHj2s
         2d2qz6s1iaKwLWcECAmAUik4RaSmZzFH/rOs8PIpZXal8YOq0U62h8nxsSwAz5yFTjIw
         1v0Q==
X-Gm-Message-State: ABy/qLazZxccm6/q+ghCe8Qc8bVm4TAP8DPT178K3wp3Bp8cEQfr8T1A
        xjvDWmMPT8vlRq5L+8RwyMXjhg==
X-Google-Smtp-Source: APBJJlFVGUsqZ4FQTLTVpn9EV3aQ28WUtoMGwF7oOJFs6AbukV5SlFQoumyRUSDdCkenLSXfNGXPIw==
X-Received: by 2002:adf:e781:0:b0:314:15b1:d611 with SMTP id n1-20020adfe781000000b0031415b1d611mr753448wrm.0.1689232973592;
        Thu, 13 Jul 2023 00:22:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w16-20020a5d6810000000b003144b50034esm7071384wru.110.2023.07.13.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 00:22:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v2 3/4] dt-bindings: remoteproc: qcom,sm8550-pas: require memory-region
Date:   Thu, 13 Jul 2023 09:22:41 +0200
Message-Id: <20230713072242.11268-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
References: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The memory-region is defined in device specific binding, not in
qcom,pas-common.yaml, thus also require it in the same place.

Fixes: 084258d60712 ("dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index fe216aa531ed..58120829fb06 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -53,6 +53,7 @@ properties:
 required:
   - compatible
   - reg
+  - memory-region
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-- 
2.34.1

