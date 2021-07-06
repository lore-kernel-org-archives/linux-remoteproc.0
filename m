Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8370CC07E96
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 21:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 659A861C94
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 21:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhGFVFZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 17:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhGFVFY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 17:05:24 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABD7C061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 14:02:45 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so145427ota.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jul 2021 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hqllhjvy+JBsSCDAkjrZiAVB90dLi/AxPLsyAiU4K+g=;
        b=dk/DHZVzt8tIwEO+gChHOFOAVM7dUHMs3hVqeYDLYR9/gpHFnwmmOGevqCgyQt1VQ0
         No9uPR9DI/sbvNRPp34lm2eQDXBURHfspwU00EvPX5NZsfEE7ufyK4DCrcQnB32OyWY6
         rSJ+z1LcHcwmfV3sfzXVOfpPaRqqzrWuXtCbweFJqzalIg4QhV642KADVFXUQwmauTLE
         5kVKOtoGTvhxTuvazwn/6gSxQtdVD4fgds/jlAhFLQrsDLVubK4o2fPMvAiPc2X+/1aH
         +S0tAGsWErGO7R/yKkXAownJzdjkGkjYSDGBhOzM1LnWJkVkhLGI8ujak76MvfngEyuX
         VdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hqllhjvy+JBsSCDAkjrZiAVB90dLi/AxPLsyAiU4K+g=;
        b=HZp7ilKRECfn2NJg9Ejf4X1Cn0Z+vwjInVLX/BIEg4k+pvtJwbvQse28pbK6IzdKgd
         J9TLW2kLNakOHo9XbZZvjePz12eYIJoA21st0e3/Tl23CBO3JRkBWI/ihyyQ8o3VDIJO
         WJ1y8inZ+aKtKLssbOR0Em+C/7/dx5HJhd4wGhK6HAFPDEuD10JktI2zxzZJOU+1qURw
         3VrX///83/nE6aQrHEIkWJ/5w1f/+5s6h2m6HstzD+RmCRg86F8nFyi/Aldco2UjZ8kg
         fAeRXSa3799KlVGP0fJs0avHI+gTK43XxGl1/UtlrWv8PY5gboXN2IRS+YIOaj8Nhr3x
         ZZow==
X-Gm-Message-State: AOAM530sQMysSqYOMfm0oxM+39qO11b3h7rttw1cXcfgqOWYED+MbBPX
        M7hDdPhwbnHfBFo2UzcN0p1ssA==
X-Google-Smtp-Source: ABdhPJzB16qrXoUTUZkx/sa7f5on0guLIeaNVO4uztaEqkXNOpQOxU4OYc0EwmwCIoPL3PWv6H+L6g==
X-Received: by 2002:a9d:7b56:: with SMTP id f22mr16165717oto.71.1625605365192;
        Tue, 06 Jul 2021 14:02:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5sm3086988oot.29.2021.07.06.14.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 14:02:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Suman Anna <s-anna@ti.com>
Subject: [GIT PULL] hwspinlock updates for v5.14
Date:   Tue,  6 Jul 2021 16:02:44 -0500
Message-Id: <20210706210244.1229537-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.14

for you to fetch changes up to 234462bc7f2303afce4b61125d2107ecd7611bff:

  dt-bindings: hwlock: sun6i: Fix various warnings in binding (2021-06-14 15:54:10 -0500)

----------------------------------------------------------------
hwspinlock updates for v5.14

This adds a driver for the hardware spinlock in Allwinner sun6i.

----------------------------------------------------------------
Suman Anna (1):
      dt-bindings: hwlock: sun6i: Fix various warnings in binding

Wilken Gottwalt (2):
      dt-bindings: hwlock: add sun6i_hwspinlock
      hwspinlock: add sun6i hardware spinlock support

 .../hwlock/allwinner,sun6i-a31-hwspinlock.yaml     |  48 +++++
 MAINTAINERS                                        |   6 +
 drivers/hwspinlock/Kconfig                         |   9 +
 drivers/hwspinlock/Makefile                        |   1 +
 drivers/hwspinlock/sun6i_hwspinlock.c              | 210 +++++++++++++++++++++
 5 files changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/sun6i_hwspinlock.c
