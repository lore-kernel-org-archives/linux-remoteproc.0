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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F58AC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 07:30:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF170222EA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 07:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4gcyMzX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769588AbgJZHaa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Oct 2020 03:30:30 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37158 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1769514AbgJZHaa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Oct 2020 03:30:30 -0400
Received: by mail-pl1-f194.google.com with SMTP id b12so1978360plr.4;
        Mon, 26 Oct 2020 00:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=drWl2FNvQSHLDmYecs0jaTk4+hw1areIUXV4tqKgkWw=;
        b=Z4gcyMzXjnLOt+sgpyzKq6mPQ29+xJudWEvAno4HNCBCBw+SPn0dXRljBH2cYsGNRO
         XW6jWYqNidjbX8kun3Mjse/54/dA8xjVaD8EYYOcWDlNpEyoh1TT622/B1vgBJwBd0ep
         kRGJNRUp/ILuOUBgKi9Z/wrrJj5IhVCe9fSpWA7+hGbGsgiImjBlgvoFFqsiM4di5cy4
         p2rPI9/8DfM/iOh4ypiSvyWdfrDmG9vfsy9vLOgYI25kN5hrjHpFzpyPRXmwhboN3gRv
         NUotVcGa+3AysmAb19I+XPEZfisoVyGX4B0MPrW61WHR1A2pp9R6BinoiCyG8dOm+38M
         ZLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=drWl2FNvQSHLDmYecs0jaTk4+hw1areIUXV4tqKgkWw=;
        b=S7JtzNHqdsnNOisskQoZ7vCR2PDdfgYhMVio8yg+4RJCDR1QV3MdTELirB06hIHfna
         B0O8YYbevgCM07lp4z4zGWgUKqY1RbS6H8uP/Qx0FZA9X7TZuvmpucTfFCO4V9tujYb4
         8qhNzFcRzniT9kCpA7kiWBSEpaFgp9tMfE+7jnUTqx1S8RK6CL1q8A459wftDiFboXNs
         ZFkvU1KWq6Y0fwOTu10CbY2Gw2r5m3iFaf20+k6kxhbYW5wArYNCg3z56do6Z/TusDF3
         QFCKDQDSvUOmp2SmYnbdx4DrManJwCUGTSRf7yOi598X5qtB2ntd3QHHrFyMwdLz9td6
         0XYA==
X-Gm-Message-State: AOAM533e137vkOa7obBDS59iGPxRPw2aPuSpwYXsky9hAiF3npgCqrWr
        PvLcYavjz6rIWS5v6/+398o=
X-Google-Smtp-Source: ABdhPJycPXffI2we4zUbrjmJLMGHDuxMFsMwOa9CVNv1NAXp1WMnH2i7ZTSibTHqAs4vxz7Y/bBRwA==
X-Received: by 2002:a17:902:654a:b029:d5:e98f:2436 with SMTP id d10-20020a170902654ab02900d5e98f2436mr8602087pln.21.1603697429382;
        Mon, 26 Oct 2020 00:30:29 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id t10sm11384930pjr.37.2020.10.26.00.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 00:30:28 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH 1/2] hwspinlock: sprd: fixed warning of unused variable 'sprd_hwspinlock_of_match'
Date:   Mon, 26 Oct 2020 15:30:08 +0800
Message-Id: <20201026073009.24164-1-zhang.lyra@gmail.com>
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

