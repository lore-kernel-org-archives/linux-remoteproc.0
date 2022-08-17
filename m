Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5F7C25B08
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Aug 2022 13:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237021AbiHQNOv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Aug 2022 09:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239774AbiHQNOj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500714CA0B
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id s7so356818lfp.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Aug 2022 06:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=G7nHz7460NiblDwkfaLZP3QC942cYsdIM8XAFA/ajO4=;
        b=Ux60q81hVODEZ/9jXK6w497/gC2vI3P1tZbdFxdC7xZz26+r69kF7Ay82VhNZborZk
         L/TqTpH907LPYU7oDzCO2WHPks/3Nt5X5SXUJt65mFu8kNFDwxa2RgNQENDyIenqsVji
         KO4CkIbSeSKX6cthFiFYToS+bSBV0y1bDXlXjNNZhsJRiAG35W3hnRUoprjD3PZyujeA
         /w0blmU9lUw5MSxHa/bbaVsvGmEwGq6tl6LuFQgr6OkeFyryD2WmIW+V5OaMkW0rnjGE
         vWHe0c/ZBQit5GGf5CKS04xciRk1+vWigIp5+kxAiPRRZJNyegN/DGfWEj23co0DWa7J
         igLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=G7nHz7460NiblDwkfaLZP3QC942cYsdIM8XAFA/ajO4=;
        b=R7JlAnntcCUgGI3TIwZrQhib9xPg+cBEwcpqmc2TZfvcyIllU3THE8P4DrN0AF7Eg/
         pghgSObDk3JCbLY6omC3watLV5414mApSYsMvIGozmC8QKTGtfLdQnSHRlzDjgMfntpA
         PDl031iuUb3/t9vParm5PpDIf83WHeuzzw66RYdg2yWkzNtoJ2+MjfENXuLyczqbwXiB
         JtxgqpNVj5ZWs00/pmSI3NqPxrkFHTK+67QlMFdRdK5atC13qH2zFdZBEaUKODM0lxOO
         vBTL63Bv+l7K2zDbEpGZi6/O5hc8TNFzfEpoOR47urKAt81RjLmaz0QjIDT0m8DqTrOv
         lv7Q==
X-Gm-Message-State: ACgBeo0Lef0pFBHram6E4Qy3UhfJlvY5reuydfGQUmq+FU1XspuGMPK+
        EW1LNf60J53NAA50xNHoVCBKxQ==
X-Google-Smtp-Source: AA6agR7VvZ0QXXkcR5lT43JZl+4AdD8B89Fw1v6q71SdS7UPGz75Z3tQMAGOjjFa6BZ9G5qRomKT6w==
X-Received: by 2002:a05:6512:3e0f:b0:491:313d:5b6a with SMTP id i15-20020a0565123e0f00b00491313d5b6amr6822082lfv.223.1660742067199;
        Wed, 17 Aug 2022 06:14:27 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:26 -0700 (PDT)
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
Subject: [RFT PATCH 04/12] hwspinlock: qcom: correct MMIO max register for newer SoCs
Date:   Wed, 17 Aug 2022 16:14:07 +0300
Message-Id: <20220817131415.714340-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Newer ARMv8 Qualcomm SoCs using 0x1000 register stride have maximum
register 0x20000 (32 mutexes * 0x1000).

Fixes: 7a1e6fb1c606 ("hwspinlock: qcom: Allow mmio usage in addition to syscon")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

