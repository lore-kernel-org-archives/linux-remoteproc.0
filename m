Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA011C433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Apr 2021 16:08:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5CE36023C
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Apr 2021 16:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233527AbhDIQIN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Apr 2021 12:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDIQIM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Apr 2021 12:08:12 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4ECC061761
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Apr 2021 09:07:59 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso1436309otv.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Apr 2021 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8S+2fYEeMVwFqCwfJgeBBpDxfhhAdcH8iaoIoajPSJU=;
        b=H8qwhyJWrXJPiSuHlG7cZHWEbypJ/9bfaLCdc8y9pS1WAkUMtmvNMDFlwLdUYFXc/z
         qfTKaejISonfZiO0a/I/jWwmV8fLoI0kS5fawymabWz2OjleOP2jsVPFbThqjKQKx2af
         Pt6+1fFMPsjWG4FDb9cAtvvEJrqguUVvrrYpCUulct12NOu6ckNBDgvYjLB6wIoVzMX0
         PipHynlT9cyf1/hGmJmKiBsGCW3wqIDzZuWlh5YOMAhvmMO1s637DWisPPkKwwGms70A
         3ORInnfVSv+Jr37CqhRMYTiwFAvm44A/6x6rdzgEtQhnwSTDkPTdMIbn93FZR9UhlA0B
         dFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8S+2fYEeMVwFqCwfJgeBBpDxfhhAdcH8iaoIoajPSJU=;
        b=WHBx9T/iC115Q2cq26QpvWkYE7gGBcgSO8iXXrTtsGlPCuFGBiyyRI+WY3t4z4EAVA
         ew4ZcRwyuNDQUbM0FpOwZAJhiE2/ASYXT1BgbEmVtV/OJ3aI8TaDA5x1YRsO+dRUkoJu
         z/6ifRio3g1EayAYiArzD/dkTxO3RzCvopOlV7LeiRso5lmws7PLDO0A5k3v6leog8kW
         NCujCQrz+0yFopGxtdvh57VEKz41Rb2PH696KKJ+9siZPpcSJfjgDKHPH4NvWvn+BZOV
         kn9u7ZPRMgBVx8yaoOBO3ZyBD+Jcs7JOdfSaNgCmGAaaYldiskvpGmK1RHDNoIwwkYkQ
         Pl+g==
X-Gm-Message-State: AOAM530oJ5z/YUn8hh3t6Tltuj3b2bSuJjNM0lLsmpJy55ObFfO398gs
        nyTkavWrFNUFiN7xd4A5/WgtEA==
X-Google-Smtp-Source: ABdhPJzwv/4c9FWTOwYkpSuHqty/UHM9VsG6gL/I0CaJvHNGHTAgLMmQLbEXXCsWK8pdzGL++MnDWg==
X-Received: by 2002:a9d:5a8d:: with SMTP id w13mr12842440oth.145.1617984479324;
        Fri, 09 Apr 2021 09:07:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 68sm670611otc.54.2021.04.09.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:07:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Dimitar Dimitrov <dimitar@dinux.eu>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suman Anna <s-anna@ti.com>
Subject: [GIT PULL] remoteproc fixes for v5.12
Date:   Fri,  9 Apr 2021 11:07:58 -0500
Message-Id: <20210409160758.775271-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.12-fixes

for you to fetch changes up to 9afeefcf06fc7b4bdab06a6e2cb06745bded34dd:

  remoteproc: pru: Fix firmware loading crashes on K3 SoCs (2021-03-17 14:15:07 -0500)

----------------------------------------------------------------
remoteproc fixes for v5.12

This fixes an issue with firmware loading on the TI K3 PRU, fixes
compatibility with GNU binutils for the same and resolves link error
due to a 64-bit division in the Qualcomm PIL info.

It also recognizes Mathieu Poirier as co-maintainer of the remoteproc
and rpmsg subsystems.

----------------------------------------------------------------
Arnd Bergmann (1):
      remoteproc: qcom: pil_info: avoid 64-bit division

Dimitar Dimitrov (1):
      remoteproc: pru: Fix loading of GNU Binutils ELF

Mathieu Poirier (1):
      MAINTAINERS: Add co-maintainer for remoteproc/RPMSG subsystems

Suman Anna (1):
      remoteproc: pru: Fix firmware loading crashes on K3 SoCs

 MAINTAINERS                        |  2 ++
 drivers/remoteproc/pru_rproc.c     | 20 +++++++++++++++++++-
 drivers/remoteproc/qcom_pil_info.c |  2 +-
 3 files changed, 22 insertions(+), 2 deletions(-)
