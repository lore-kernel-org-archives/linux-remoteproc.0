Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839BBC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 07:05:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1333B2076E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 07:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raN/YRAG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgKLHFU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 Nov 2020 02:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgKLHFU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Nov 2020 02:05:20 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10143C0613D1;
        Wed, 11 Nov 2020 23:05:20 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id h6so3403188pgk.4;
        Wed, 11 Nov 2020 23:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dyxx2XJQiNDCv/WmHVpd5EzRtiEhfhhvFw+XLHySmes=;
        b=raN/YRAGMJ0POWQlfZCAyJIMj46V8ZRHSSTAjOyso0EdM2yWNFtjGx1XNUymHTsC6D
         q8wFhTtn3oDox3Bc8JhZDCXvVfCT3/qzkDx6dTTzUnA9FAlFx1DehXkVBiyNX+NbBimJ
         PE3TWsPCZg14e8gH+i/MPxdenxJCJIbUTaMxQK2J27HHVwMKsKZleZnbsfGbA4SrSxCt
         Q57gB0VI3+mtlzpxrhuJjQYIoYKr4w3GlLW/ldR3bcQwdGD28LydRWgl4bBDJJOGYnBV
         iaf3DD3c9+c3GWvMXQQrnSXJCf2FqrL7qCaNxCWstSfqZYrAbmabePD4vuLALw5E0u8x
         hNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dyxx2XJQiNDCv/WmHVpd5EzRtiEhfhhvFw+XLHySmes=;
        b=kAEwYLdn2QMXuZKiYE2mfGUAe0xUNeZtljM+934luPYYLqOyjPsc6tLQwAZtULQdWe
         1V9TqXL7AsUcv/HNgobLfGLqbpSQ9jF8DSKCbYNm2Z2yiOrdVKemjPOw3AAkAzx0/iQs
         tY6MNGSCWom+5N0Xnt8NZwRHmECrejqiNMcylC7AXnbCfL8l55FbnvvVEjv/Mugvuj3D
         4frtvxW6QU1r6bNfA5t6074VBSh1oCpOwRveh9K5vy+D/42sLeChWUhJtJWyElLhsSa0
         P7A2CFwd2yhg3zrVhhxUiw5XYoYc9NG4O8TfpElhDacr6RNIIzbOSbO3NPZpcdPZMBrY
         Fo0Q==
X-Gm-Message-State: AOAM532fwjWS9+XgkD4Z9UQwJd0z9sawV8EL+86vbU2oUwcNfCkpbvDY
        6NvnrK76sjKJKnxkZuo5HYQ=
X-Google-Smtp-Source: ABdhPJyiMYrSZtBw6Fx20XM5X9VjxyOwiquUK+3rbQ562CdWT5U3uuCWUsrt7vi3w0wvN9k+VDWPsA==
X-Received: by 2002:a17:90a:6907:: with SMTP id r7mr8597888pjj.208.1605164719703;
        Wed, 11 Nov 2020 23:05:19 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 15sm2088138pjy.0.2020.11.11.23.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 23:05:18 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [RESEND PATCH 1/2] hwspinlock: sprd: fixed warning of unused variable 'sprd_hwspinlock_of_match'
Date:   Thu, 12 Nov 2020 15:04:10 +0800
Message-Id: <20201112070410.14810-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

The macro function of_match_ptr() is NULL if CONFIG_OF is not set, in this
case Clang compiler would complain the of_device_id variable is unused.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: d8c8bbbb1aba ("hwspinlock: sprd: Add hardware spinlock driver")
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
* Resent this patch only since the 2nd patch in this patchset has been
  applied [1].

[1] https://www.spinics.net/lists/kernel/msg3720202.html
---
 drivers/hwspinlock/sprd_hwspinlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 36dc8038bbb4..e7b55217293c 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -148,7 +148,7 @@ static struct platform_driver sprd_hwspinlock_driver = {
 	.probe = sprd_hwspinlock_probe,
 	.driver = {
 		.name = "sprd_hwspinlock",
-		.of_match_table = of_match_ptr(sprd_hwspinlock_of_match),
+		.of_match_table = sprd_hwspinlock_of_match,
 	},
 };
 
-- 
2.20.1

