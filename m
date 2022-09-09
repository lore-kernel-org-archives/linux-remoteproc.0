Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D9DC6FA86
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 09:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbiIIJVE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbiIIJUy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:20:54 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DE9B4409
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 02:20:49 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id z20so1110592ljq.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 02:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jWF6n+I4kNaTh0+wS5ew6McBkQX1vr8gLcwhdcZ+294=;
        b=p/KHTvVCaHHsa1z5hA8NiL8sWfLu9+dvBaijKn0LwxnPkZ9OiT2fgdfGT+9q50325K
         7RZcgevCY+Zp+gsGVaCrhiW1xHy7G5phx4y9zX/oueYpfcFgi5JLfeT3BzrKRlv7Y/0k
         lyNHBlnppSi0kyaisH+iROqaYiG7sJFcOyXzOz6W7JSEwTnRYovg0wl6fRtRyXkjYI6S
         VYQbLOci1HY3sCrqAtKmkTjRuden/lRqmjCpU+8nBgS+/qOarBdRI8AdquLrWmNQnZbq
         u/2AY6rBApBszRgvQQMRih9X7MvJ/x7dxpt3ELNynaN/Gp9rLT8FRguULnFb2pGKB7C9
         eFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jWF6n+I4kNaTh0+wS5ew6McBkQX1vr8gLcwhdcZ+294=;
        b=aWLHf0OSXYiIuGaQFDGsYXs3L1GIwcqZze6b4N6of2aa/cxbRNcC71yX7jn7U1DUIM
         9+pB3/IzwKMuZf6NYscbijPOFq4OaCOdt5ZyPvVm5SL3pfG9eXKFFaMbqrjLRfDbYVW9
         dBt+9B9axC2TLIC0xMfNzvOMMpojs103K7qHpr2A7bDRi5kQj2w8grqGhqwMqlOUNNVm
         sLIacktSJrMg+fMz/ieaDguY9nRJFk2DXulA7YrSAvQn3zFst84k4dhdWX5I2/8xLPda
         kojC25mxk/IeR7fIvAiawiwjJ1C+zWj/EXByCSuOvFoFwAtqmg+SWld8UNvQCaogu3rM
         xhHA==
X-Gm-Message-State: ACgBeo3yLm8LxMzQz692rTrdmTWjTe/rG9Y68zS6t+0QCQzXCE52tHFt
        beDDi58Meqffu2HRi6njb8kk0A==
X-Google-Smtp-Source: AA6agR4FGCIgKhPxgDZqQQFdea85jQ8MsnkmV+eyMlkFRqIl+6nLMXxmKwImZf8TOlNOOljexAPtJg==
X-Received: by 2002:a2e:9b46:0:b0:26a:ed14:d808 with SMTP id o6-20020a2e9b46000000b0026aed14d808mr2550309ljj.506.1662715249355;
        Fri, 09 Sep 2022 02:20:49 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:48 -0700 (PDT)
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
Subject: [PATCH v3 07/15] arm64: dts: qcom: qcs404: add missing TCSR syscon compatible
Date:   Fri,  9 Sep 2022 11:20:27 +0200
Message-Id: <20220909092035.223915-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

TCSR syscon node should come with dedicated compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3a94eb2cc448..c79600c28398 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -727,7 +727,7 @@ tcsr_mutex: hwlock@1905000 {
 		};
 
 		tcsr: syscon@1937000 {
-			compatible = "syscon";
+			compatible = "qcom,qcs404-tcsr", "syscon";
 			reg = <0x01937000 0x25000>;
 		};
 
-- 
2.34.1

