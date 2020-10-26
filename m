Return-Path: <SRS0=//YT=EB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F724C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 07:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F463222EA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 07:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnwlplfG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769792AbgJZHf2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Oct 2020 03:35:28 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36468 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1769791AbgJZHf2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Oct 2020 03:35:28 -0400
Received: by mail-pf1-f194.google.com with SMTP id w65so2897328pfd.3;
        Mon, 26 Oct 2020 00:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CI3vWPl8k1Jbjm4zcRL1dzvW2GroWE4ViyULbDeW7tE=;
        b=jnwlplfGJlvMbotV1BTE9FRhh6dY30lA13rcqxgkEQEwwQPijEo5WK1aUldXkkj4s8
         A57O+/fK6UYLCh0/kL5oPq4MMycvlZttramPfdNUZz0GiXO0bdLKxYKmqSVAwxjMeruM
         an7Okue+io5GKdxNx8Py0+Bn4VTYvEGjmqAz+9nSic+7roECf4X7dbxX/PoAeze+wl9D
         +OlXO8rYSaLWdznI/ySQlTFxi24T641m/qjWQELHr/uQZ9r2s2iYuMOEOO5Ynd37rmAI
         1x6Cq4PBaIKLlyqYG4sOLUFxjqJEF/OHx/O4PqT4/EWZNg5x2xzSs9nJyhGpRKUPiX2E
         8I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CI3vWPl8k1Jbjm4zcRL1dzvW2GroWE4ViyULbDeW7tE=;
        b=uiz4rv6ekHozujn1QqZoKnGyTRQJFj+pNESb8OBpSd18J0LKBGSqvmMgXvGdoB7TvJ
         DWRDHiOfV/pGqXuZkoTk32Sl3/98BD99sb+4OiBgKtPbpChFDj9Mgd9ca9xn/7VR1xOY
         QZs69CMCo2GCj9uSps5XzhfUurectFiL5NM8oHA7CBaJ/XY6guMgV+Jfiwpqvvlcr4rT
         HGp0hRT54y9CIq/mELYmyxFrMbsWeChTRLl7dhoMSHIbk6gEMFpuumv79YTjLayFZ8Fl
         35Dnaj+O2i1MCNGfrvLlh0gcq+uYEQ4PBLvCDMqkeyMRNPbkVxr+krg2ZIJ5aVYCNaLO
         e6AQ==
X-Gm-Message-State: AOAM532s9FIKIgg8XM5epSehoJj7I3e/UrZy3tJfbyW0aNtcnj/7EHzq
        jgPVnAWHZjHuencfJE1SS10=
X-Google-Smtp-Source: ABdhPJwWltliyR9yyP+QGJYPEogmll/0VkXsakMpR3a/mq+vvaCEdzc4l5+rIGz8R98A4RWPcDcYCA==
X-Received: by 2002:a65:4cce:: with SMTP id n14mr15363159pgt.349.1603697728029;
        Mon, 26 Oct 2020 00:35:28 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id gm14sm11616517pjb.2.2020.10.26.00.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 00:35:27 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH 2/2] hwspinlock: sprd: use module_platform_driver() instead postcore initcall
Date:   Mon, 26 Oct 2020 15:35:21 +0800
Message-Id: <20201026073521.24492-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201026073009.24164-2-zhang.lyra@gmail.com>
References: <20201026073009.24164-2-zhang.lyra@gmail.com>
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

