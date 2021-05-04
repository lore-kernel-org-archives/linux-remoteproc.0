Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15346C433ED
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 15:03:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5DB16100A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 15:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhEDPEZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 11:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhEDPEY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 11:04:24 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7319C061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 08:03:29 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id n184so9025697oia.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 May 2021 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TT0/iR1OPkegR+Vfhbk08FoUYubbeX4JiVGCSzah8XU=;
        b=n0PpoXLZGlyohVmymhVyjheE5yAwxUh7kFQkwhnChI6+BesTNJKBiBEUt4dEYRU6jx
         rE4CZnVNn//Bo7jVbdIFd7kx2rLXEG7ah4ArXwS6ePDub+tsIbOVoOowVrLBLO5oajai
         fAEUxhBY90gXBj55iNbnKfHl+dPC0RhO5ePYhtUZEfzu8QJXSwROhvl06XNZfYhN+0Vb
         R9AoZUBNfPwdBH9Ds0kYWIf4gyEt3y+aN+7dHzmkLBiEZ31RWimtulU8hjtlYMohVpHK
         aRMVcck7QQ/6aAq473/NFF9RNYKxV53N5X4wXYsACtkdiQB36AvI91LKMsPZPyCZAiVe
         GVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TT0/iR1OPkegR+Vfhbk08FoUYubbeX4JiVGCSzah8XU=;
        b=tOLMP1g2Zh1Pi6+onxnJ1e+wstebK+FvuXlnnXqthqlzdKLdoGSacsI4WcbmkkTY3K
         7yfGcDv5Ua50n7GJEdDF22TG73kSYGXv1r37S5egRi864t1ag2DGYU6Vu4/4S2wTbalb
         pPIEQkT5m1pyigdtdryZEaMxOmyDebK4X8I/stqNdJ5TsZgIILWWLWPt2MNj3WDX2VmB
         G65Su53SAOorfHS43gvxqFxlPkCPNzQmIv5/3ztqzAIjazzGDGhFcFJhBlRfqCi2rJe0
         cu8Os6BiY/v73s+T5rkJGbsHDfW2/XG0bXv4nqh9lHFHHsVmvlAavWW8gwtoEGlx2cKI
         M2iw==
X-Gm-Message-State: AOAM533ETBFOd+s/IwPa19jU4mz/r2HyFRhD44sBfudPVy9p7qs1rNZt
        4bw36xHtBu9xae28KP1nZpI/Eg==
X-Google-Smtp-Source: ABdhPJzBf250O96VMId5CAzo+BDxT7Q6vZSBZWxt29+B265VaJvOxNLcVMbvFLibLuY0dZNfqB8JTg==
X-Received: by 2002:aca:c413:: with SMTP id u19mr3382044oif.41.1620140603379;
        Tue, 04 May 2021 08:03:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c25sm847050otf.22.2021.05.04.08.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 08:03:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] hwspinlock udpates for v5.13
Date:   Tue,  4 May 2021 10:03:20 -0500
Message-Id: <20210504150320.1468505-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.13

for you to fetch changes up to 1cb8f3e2d8fe7533c26df9925a83bd3d185b312e:

  hwspinlock: remove sirf driver (2021-03-17 21:22:06 -0500)

----------------------------------------------------------------
hwspinlock udpates for v5.13

This removes the SIRF hardware spinlock driver, as the platform is being
removed.

----------------------------------------------------------------
Arnd Bergmann (1):
      hwspinlock: remove sirf driver

 .../devicetree/bindings/hwlock/sirf,hwspinlock.txt |  28 ------
 drivers/hwspinlock/Kconfig                         |  11 ---
 drivers/hwspinlock/Makefile                        |   1 -
 drivers/hwspinlock/sirf_hwspinlock.c               | 105 ---------------------
 4 files changed, 145 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
 delete mode 100644 drivers/hwspinlock/sirf_hwspinlock.c
