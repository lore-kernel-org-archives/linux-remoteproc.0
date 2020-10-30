Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15490C4363A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 03:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACBF920838
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 03:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcgbACuH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgJ3DsD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 29 Oct 2020 23:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgJ3DsB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Oct 2020 23:48:01 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45184C0613D2;
        Thu, 29 Oct 2020 20:48:01 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id h6so4074338pgk.4;
        Thu, 29 Oct 2020 20:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SvAQt88Nti2V+feV/QlVUCDtPsB4Ur7fsvT8VcZnsT0=;
        b=bcgbACuH72su7pDDnfab31Hni99eoTCPaTi90I2VTVWR1RGEbQqptxdTftXx5FUDfs
         U9pKvoUgNK3grRCXO2pbnMUZcP1UG649PYFGLITLBYhBTE6B2oBpKOi+rhtpqhcLiPuo
         4L19Lt+/8PU39o3+zD9a4FF743rqXOks6q1im1EmYqzfNpQz3LNWiiH7EFyRxqcETplc
         pIDmGakROAheZqXMAct2GbFbAhhQ4OoZ0BFaHPOtX0KNMDezl+7dz9/YIm+6viUCL2RR
         S+qdXgs9OQMiKQE6B+HvfTAUxeTZz4hc+hmcS9jwPYf9sMzFIOTgv1PE3bw71C93eg8/
         sL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SvAQt88Nti2V+feV/QlVUCDtPsB4Ur7fsvT8VcZnsT0=;
        b=AyLLSfN9KAuRA/LsJ76MqFqtLSDAfJoqzcqeKiyqIEMFfnQz1Zrlf07gSJc5lwZEIo
         zFgKVxn/l6PzXoX/UbHngYiS/bAuFlwVvHQST6jxQ3/bwGzgLx0HyxDJMNqygEKkijDQ
         G866PagDdIkbeRljgFMlx0sTOcAO3NZ0ix9NxZb2bYqgxohwJtmGaYletMNTtsdqzzPC
         s8dF9pDuUzo1cTYGT5VH2O8wUB9RV0v0LOAheSv8zNzKYvR0Lm0ukukN/fqePuVHJa9V
         xWlDZsbxoM92C84hikNorv2/zUAHf7S0QpkPjWPCoCY0CaX0wsoJ75Q7ttrGgorDPxwF
         MoQw==
X-Gm-Message-State: AOAM533JaMrRaIpxla/k7hmLTweqvwzOfM3l1GA8JT1kttkUBrssIc4T
        Inbqoi0lgx1wQhU0gTOBDb9Ccsi0a7Y=
X-Google-Smtp-Source: ABdhPJxLlYFVN2eGtAleVeq8Ajpzy6ZK6HxlYw6KE4x5CIbgNRTAmTYe9X2ufB9Pu6n7jP7MbsqMcw==
X-Received: by 2002:a63:685:: with SMTP id 127mr460771pgg.158.1604029680941;
        Thu, 29 Oct 2020 20:48:00 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id f21sm4323093pfn.173.2020.10.29.20.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 20:48:00 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH v2 2/2] hwspinlock: sprd: use module_platform_driver() instead postcore initcall
Date:   Fri, 30 Oct 2020 11:46:54 +0800
Message-Id: <20201030034654.15775-3-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201030034654.15775-1-zhang.lyra@gmail.com>
References: <20201030034654.15775-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

The hardware spinlock devices are defined in the DT, there's no need for
init calls order, remove boilerplate code by using module_platform_driver.

Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/hwspinlock/sprd_hwspinlock.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 4c63e2546064..19d1924044e5 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -151,18 +151,7 @@ static struct platform_driver sprd_hwspinlock_driver = {
 		.of_match_table = of_match_ptr(sprd_hwspinlock_of_match),
 	},
 };
-
-static int __init sprd_hwspinlock_init(void)
-{
-	return platform_driver_register(&sprd_hwspinlock_driver);
-}
-postcore_initcall(sprd_hwspinlock_init);
-
-static void __exit sprd_hwspinlock_exit(void)
-{
-	platform_driver_unregister(&sprd_hwspinlock_driver);
-}
-module_exit(sprd_hwspinlock_exit);
+module_platform_driver(sprd_hwspinlock_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Hardware spinlock driver for Spreadtrum");
-- 
2.20.1

