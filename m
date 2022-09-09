Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD882C6FA8E
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 09:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbiIIJUw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiIIJUr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:20:47 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EE0B1B83
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 02:20:46 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a8so1626761lff.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=p22VHkiyfyJQ/2cmDiOXf73kBtRCLk4DV4mGJPl32s0=;
        b=T+/lWIY8v0qbAYeoyntJ0FQNj5wU33lo4K5Spce/QU9XjaHLtpN7Vk+iszIb7VtMdg
         S31FyJhBd2gMoSsQy856YiJf0hmLG9rthIhEhIsy/XAgBr53ZAlOaxbAKJpeYLEvDM/p
         DedQOV2vuejdGKV7xedWegc7UQFwOEtfOjJnvdqixcPUswSmHr4AIqQakzOAyF5dKzJx
         23/9X0a89l6aAUBNHDiiQENwdc4f8OzD5CyLPTFFoPV9DCEmQxnCU47MoKqdAK7P4eZm
         juHJBF+dLgTTpOBCPycex//xouuclW6585+dv79G9brhthWARf8RAferIXgfY+LEKFsG
         nn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=p22VHkiyfyJQ/2cmDiOXf73kBtRCLk4DV4mGJPl32s0=;
        b=phY3kN2Cyv+vETYNFa62aTCJNz++zLEoZ3Ryco/ZztrspLYEGpG9pSn6Ra39ozA9O/
         Jk+JIGOQ5h9+nl/8l1mC2QggYssJ6Xs9ZaoTU/iWCeVldeXp2hvsa47uh1OOCVhm8TeW
         7NCU4+q5XNlxqnedA0KdHKDbgnQcV/QCfUGmYX7HHYVG8qF4KJrqZYVG66l9wVr0kiNj
         FAlC5cmqeoXcKGCZiCB84U4o3t+ZEx314CejveDOc0hlsLA1ReB9qassrUQkd6ILnNck
         hsxK9qHPCAeDg8RKAOXi8a7/BxSag92EXu43FV942bWXqljg+qf7LLhYNw3uxxdtS/VM
         jgPg==
X-Gm-Message-State: ACgBeo0HJ0vzHvTb1UM58tuMETTTRXKm3CM4xaheRgW/wz+c/RZeTx7u
        N4tqwPgjgTDwKXeBxUnVBbo4Bw==
X-Google-Smtp-Source: AA6agR76T7wG7Oj/rg4yBhTT1c6TwJjrayUmvtzsa/GBbqcMFntL6b1sri3PQCjNtkP/D0EkB4GCeg==
X-Received: by 2002:ac2:5c52:0:b0:498:ec75:c73c with SMTP id s18-20020ac25c52000000b00498ec75c73cmr2367460lfp.164.1662715244381;
        Fri, 09 Sep 2022 02:20:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:43 -0700 (PDT)
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
Subject: [PATCH v3 03/15] hwspinlock: qcom: correct MMIO max register for newer SoCs
Date:   Fri,  9 Sep 2022 11:20:23 +0200
Message-Id: <20220909092035.223915-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Newer ARMv8 Qualcomm SoCs using 0x1000 register stride have maximum
register 0x20000 (32 mutexes * 0x1000).

Fixes: 7a1e6fb1c606 ("hwspinlock: qcom: Allow mmio usage in addition to syscon")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 80ea45b3a815..9734e149d981 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -121,7 +121,7 @@ static const struct regmap_config tcsr_mutex_config = {
 	.reg_bits		= 32,
 	.reg_stride		= 4,
 	.val_bits		= 32,
-	.max_register		= 0x40000,
+	.max_register		= 0x20000,
 	.fast_io		= true,
 };
 
-- 
2.34.1

