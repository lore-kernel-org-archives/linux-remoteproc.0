Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395E6C4361B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Dec 2020 18:08:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04CEF20578
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Dec 2020 18:08:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgLOSI2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Dec 2020 13:08:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgLOSIS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Dec 2020 13:08:18 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA66C0617A7
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Dec 2020 10:07:38 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id f132so24292620oib.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Dec 2020 10:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aWT20cxGDnE+dNIxUaJWQEqPNcNAaFYi+yHn0ak9yqY=;
        b=Ar1Etn1abBefJjCVtgl/nkMWVHndI9Y5bRpOMmsPzFda+OV4u8idKMnl3Pe96J0oEH
         NkcTwp4VZsR+CS3U3fP4isewKiQb6ybba7QUc7WG41QpkaAV19YS9+/1+KDvwaXu+uPp
         /PVWZ0dDWJ7ZY4vTmVFsyMVuCdKfnX3mi3GEvGH/PZs1HUv6gYwIMnOmYtYZIc9/yJOG
         G0Y8SUs71CEw7Db+OFiAjrvS+kptYuRLVAtGjb1iJou4SJYSlnXQtzj2111O3gcaJ1Fe
         FXY1WROoZBw66i48Q9JT11gN20E7qafrBDBa/D6mxHl6V+HFHSCh/FzUFeiZAqbZCTJO
         AjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aWT20cxGDnE+dNIxUaJWQEqPNcNAaFYi+yHn0ak9yqY=;
        b=H6GStUXccXxfUgQl3PSoiuTht9u/y8GTp2CvAjJSRTh2SF3sp3zyfrWjGjDcy7z8CA
         cDqQuItl7DdHUxGEpPBAWQCHOkrFlKWAS/UllnTfdREp0s1Mf7lhPSTH9POUmtAbtDGU
         sXaYqy4xIlu6mNdAStTGDVHBABV6ZoSCmzQaXp6tYKSXro1IQk6ytNQKTPd/BjDgOjq6
         Ii1+xBibsQo1vUceloUgvICu8OHu7hGrUPJcRUrXfr/FcVXOWOEkcqB1RjZzu8mim60c
         caxyiZCTPyU0clRwGcAVBsX77Dx2VREZag82LSTmQgVTXpwhma8kyUdv1khzP62am6OT
         wknw==
X-Gm-Message-State: AOAM533kCSE+vcYcThkiTOVypF9va5pEwiLNDLTh38Ov0A7Yn7XN1IyI
        yOpAlrVJIZkWW/4wjHrw53rIpaJigXi8+w==
X-Google-Smtp-Source: ABdhPJwK+5A9TPLHf3urLGkpH6nkUE2PbxcaEVEGg6uBnCbM+6OjzkKh518fON34xzTwLrjfQMvRQw==
X-Received: by 2002:aca:ed51:: with SMTP id l78mr65136oih.144.1608055657471;
        Tue, 15 Dec 2020 10:07:37 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s26sm585458otd.8.2020.12.15.10.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 10:07:36 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [GIT PULL] hwspinlock updates for v5.11
Date:   Tue, 15 Dec 2020 12:07:35 -0600
Message-Id: <20201215180735.1528535-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.11

for you to fetch changes up to c3e9b463b41b45c4556a13043265097e2184226e:

  hwspinlock: sirf: Remove the redundant 'of_match_ptr' (2020-12-10 13:34:40 -0600)

----------------------------------------------------------------
hwspinlock updates for v5.11

This contains a few minor cleanups and build warning fixes for the sprd
and sirf hwspinlock drivers.

----------------------------------------------------------------
Baolin Wang (2):
      hwspinlock: sprd: Remove redundant header files
      hwspinlock: sirf: Remove the redundant 'of_match_ptr'

Chunyan Zhang (2):
      hwspinlock: sprd: use module_platform_driver() instead postcore initcall
      hwspinlock: sprd: fixed warning of unused variable 'sprd_hwspinlock_of_match'

 drivers/hwspinlock/sirf_hwspinlock.c |  2 +-
 drivers/hwspinlock/sprd_hwspinlock.c | 17 ++---------------
 2 files changed, 3 insertions(+), 16 deletions(-)
