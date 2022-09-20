Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F30EC54EE9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Sep 2022 15:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbiITPFC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Sep 2022 11:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbiITPEk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 11:04:40 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5115A6069B
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 08:04:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so4277970lfb.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1xM5SAgV2yOSXYHddecL2UZpF+0bVuts3JrhIOTJ0WI=;
        b=vouRKThlJjw88OHq2SUh+XYt6pKT+FRXjASslnQxkvUrkMK2JWof/+EsBxutoatRyD
         cTtjAVgcWuOzE7TElZ5bmvn3vjtcQn4kYe17sCop0M405bVp1L9nMLyXjA0KWkqu6LA9
         Y7pKOGih9xsUtrVPPj0AwSNh7N0pWXWCx+4ZzXirQVmx7lqO9OrnPKnYBjdvjzmX37I0
         nEjIg7pVhiBNyEmE9Iyucn4VJ9NyYAc8pmW4fJdK6QI8zQb2aAX5aXwopygaeEFjeMze
         rD+ENmA2IUYFgO0Cd4pKFAlYPhh9srM0KkI5m/aCgrsCJrF0hNZPz+QCumb4aaEq6DW4
         hcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1xM5SAgV2yOSXYHddecL2UZpF+0bVuts3JrhIOTJ0WI=;
        b=sON7CeH/+CMkAt2uMgXjc+9TRcQNx+RRc8s2VgAnR2ZiWPtpWZAlGtUePzLJCyqR9n
         1gdtbTvO4q5XbM7TATYABjrcqjowxs2mJzqHF6Wcpn0Zjc0F59GZGohmxTissD+lpS5S
         slIeC19Ath9U9ilk2NlzVZak8i0b3UHFzv0eGLGHT3+tPG3qzOKTYUirYuC4znL+CH7H
         pX3mZqwl9vODvUiWpJMKrns0QFTtr4O/kraj7Ag/uADCYT1Hc2u6e+iC4MTnJE7xeYqb
         UApcn6H/UqMYfLG4qNEBmVWRp4ZAREVs1acS/g7TsDtEJ0Ovwjb4+ukrrImto0qFtafg
         QKNA==
X-Gm-Message-State: ACrzQf1s3n1CilZzDCGwrIZO/pXh6qk1gIUrXuVIDRf0mzI8Zi85e9iN
        RtB03GJhSrFDfGjzUMZdSUgo6Q==
X-Google-Smtp-Source: AMsMyM4d1SHbHak7lgC5YBSzGtwKUKMIgYEBZwk/Ap0BUknR0fGFQ8O88T8n+Rsceuoha+C8T08/5Q==
X-Received: by 2002:a05:6512:3502:b0:493:e21:b77d with SMTP id h2-20020a056512350200b004930e21b77dmr8181149lfs.580.1663686260031;
        Tue, 20 Sep 2022 08:04:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b0049f54a976e3sm8294lfo.58.2022.09.20.08.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:04:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] ARM: dts: qcom: msm8974: add missing TCSR syscon compatible
Date:   Tue, 20 Sep 2022 17:04:13 +0200
Message-Id: <20220920150414.637634-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
References: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
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
index 7a9be0acf3f5..a4e12daf3eeb 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1239,7 +1239,7 @@ tcsr_mutex_block: syscon@fd484000 {
 		};
 
 		tcsr: syscon@fd4a0000 {
-			compatible = "syscon";
+			compatible = "qcom,tcsr-msm8974", "syscon";
 			reg = <0xfd4a0000 0x10000>;
 		};
 
-- 
2.34.1

