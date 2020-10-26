Return-Path: <SRS0=//YT=EB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB47FC388F9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 07:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA947222EA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 07:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSkhR7sR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769619AbgJZHae (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Oct 2020 03:30:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37163 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1769590AbgJZHad (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Oct 2020 03:30:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id b12so1978415plr.4;
        Mon, 26 Oct 2020 00:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5vgATSqJDubiiUAoouS4SwnpLi0yKdwIQc1C/2b6Fss=;
        b=GSkhR7sR2r16FOr/A4qN9u2l/f44ZuVtGSZqUbWFeLDwqZfE0VoDBW3lGtyAJQjlrJ
         UZjNXh4WJt2NqufYpwrdrdecEZcOCLZ94jvYS9SC2jnNXt4wozh+32Lx6Nr7nlGlVbEq
         ukd9ep7Cvi2wb6xQvoCqe2+NoA9Hll4h8rye8vP1BNTiXKLrRKloLaIKK09id88gDt2l
         qEw5NZTCJ2pq5u228WJdYglTJqMgf3lEvRXRe7txdkdmZa9qac7Wn2VcXOragL1sSbSM
         GolPvTlfpl4WdvueXvBJR0p3A5AOQlP4PW30tGeRGKJgaEDcjj0MMhD0NLB6uWgwkQPu
         3FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vgATSqJDubiiUAoouS4SwnpLi0yKdwIQc1C/2b6Fss=;
        b=nsrWuZcCGCasd4hBqKx58Nc28twG52kERVrenLX4aDxLkdlHmareAHkZcXhZu1VxgA
         ixmv0qY6PICHZxjwtcOn1hNsvwycrv9mxOYbQ7XFp1KpeypKWDpvwaflQ4RquRQMhPc2
         bmmQGFQN98BJHu3ygG/djsVkVLQCKKwCX6O76AHq8kzRtSQRPnFL0OJO9ZfEUO3fWhh0
         mF4ZGZtwiYDVozKwFLdyKuSUUdu/YrP/4hWUPx/KtJe/boK5f9ouxD9AYPtF3MXGe2JM
         SkavWO/OTeHJfcHYiFe6ROsSK4uDVS3ViayO7Dmnohd7OL1AgKHpiXXzAJLz8fPv3moj
         3Scg==
X-Gm-Message-State: AOAM533VAaR1HS+cj2SUDsZXMaacXRej+XIxXgqVSwpbz5pqCnRGYy7n
        EeFWqr/i5xEQyiraBSQglac=
X-Google-Smtp-Source: ABdhPJwNvVMyI5v0koxjqQtJsefBJmycdMdETquI2b1T/Vzl8Q/K80KZ8axKvls0D/9g3hToeUgUDQ==
X-Received: by 2002:a17:90b:942:: with SMTP id dw2mr18994461pjb.159.1603697433114;
        Mon, 26 Oct 2020 00:30:33 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id t10sm11384930pjr.37.2020.10.26.00.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 00:30:32 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH 2/2] hwspinlock: sprd: use module_platform_driver() instead postcore initcall
Date:   Mon, 26 Oct 2020 15:30:09 +0800
Message-Id: <20201026073009.24164-2-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201026073009.24164-1-zhang.lyra@gmail.com>
References: <20201026073009.24164-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

The hardware spinlock devices are defined in the DT, there's no need for
iinit calls order, remove boilerplate code by using module_platform_driver.

Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/hwspinlock/sprd_hwspinlock.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index e7b55217293c..179231cec5a6 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -151,18 +151,7 @@ static struct platform_driver sprd_hwspinlock_driver = {
 		.of_match_table = sprd_hwspinlock_of_match,
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

