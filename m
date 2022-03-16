Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80D7C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Mar 2022 15:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357023AbiCPPKW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Mar 2022 11:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356982AbiCPPKU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Mar 2022 11:10:20 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E94666AC0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 08:09:02 -0700 (PDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D901A3F312
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647443340;
        bh=0TkaUHsdiaalOGmdOdYbrrLuoBcQ76N1kyxAw52pHyQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=m6cfOaJ8YmFbDCX0hTNjR0s3WcbQpqE+wMoxpJhQXdrcjg5ScBOH4q4+yECfKKRAD
         JJfzXXEhxcwiYt4qzcoZv994qXM6ac5xR/Gl0mmxJmYNHhnwmJZGPCnv/YounXKvn8
         lqeQofoKSTgrGyd/61S6DQqywxDVTjBOd+Wbtih3IK4l77nslDH3Sv20jhlO1M+icO
         igqwIUN85dI2N8iQ1JzY/PWsFGow+UeHfWm8P/FX+qYgoBdt86kdJIGZv89XJRkRHB
         lX+QFZqqt7icuiBh3H9gLKksnzsdGp+UepeyMaQ4faHsTXIyLjj6XEU4Vbeets20Bq
         A1SM2LkTHocIQ==
Received: by mail-wr1-f70.google.com with SMTP id x15-20020a5d6b4f000000b001ee6c0aa287so664970wrw.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Mar 2022 08:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0TkaUHsdiaalOGmdOdYbrrLuoBcQ76N1kyxAw52pHyQ=;
        b=p9x9XpBgvAgZoXSn8FAiIFGJsZDB7uvdWxFvYwJiR3vaCWt3wF/0GBKPHP/F7BLq6J
         Lt6ztMi6WCkwnt5bdm6986cKdv0hAhbUmlj/OvO4vqpHHPTBnsvVUeITTmUhL+ilWaG2
         HNOWhM+RXY6ong/FnOz6sLBiPYVoptGHYxaiI2pLvJwFnrKdvsr/9L4qPbvUZYaInVxv
         MJhkplE7k0HxPMoPYz7H8PIZ2JMtZhYga7H/ziID2vn9MUcyA2sUKzyghOCuiDLAjoCS
         LeghC0oMZurRyDAv+iftQbs5HfnTQGwI3U1PLl2S1tsnqhJ6/zdunDFyQZlZVSi9HSWU
         3XHA==
X-Gm-Message-State: AOAM530mrLyV7XKEL56VW/PRDnmjGSkeGoSmnxszbBt8FpQrtQwGct3O
        G0UVanLyk62scgifLEyNSXIZ0XFlxj7hSswuaHx7e0KB3jjpD8tZj3zHlLd4zCQK66Yd24DwWQh
        AMC27ilzEPIrVcPWbRPHPRpBldNUCG4RBog7ImhdiWIzdY8s=
X-Received: by 2002:a5d:6442:0:b0:203:dff2:866c with SMTP id d2-20020a5d6442000000b00203dff2866cmr272617wrw.465.1647443340524;
        Wed, 16 Mar 2022 08:09:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnOg2aSuuzk/AN13SVnFGjUvC/KtTXL980cTeRfOeIj0D4M/X0M0ZN717fC4+xLvcCtZ4GNg==
X-Received: by 2002:a5d:6442:0:b0:203:dff2:866c with SMTP id d2-20020a5d6442000000b00203dff2866cmr272574wrw.465.1647443340291;
        Wed, 16 Mar 2022 08:09:00 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b001f04e9f215fsm1895105wrm.53.2022.03.16.08.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 08:08:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stuart Yoder <stuyoder@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        stable@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 09/11] clk: imx: scu: Fix kfree() of static memory on setting driver_override
Date:   Wed, 16 Mar 2022 16:08:01 +0100
Message-Id: <20220316150803.421897-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The driver_override field from platform driver should not be initialized
from static memory (string literal) because the core later kfree() it,
for example when driver_override is set via sysfs.

Use dedicated helper to set driver_override properly.

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/imx/clk-scu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 083da31dc3ea..4b2268b7d0d0 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		return ERR_PTR(ret);
 	}
 
-	pdev->driver_override = "imx-scu-clk";
+	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
+				  "imx-scu-clk", strlen("imx-scu-clk"));
+	if (ret) {
+		platform_device_put(pdev);
+		return ERR_PTR(ret);
+	}
 
 	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
 	if (ret)
-- 
2.32.0

