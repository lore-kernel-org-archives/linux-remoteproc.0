Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF177C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Mar 2022 02:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242046AbiC3Ckx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Mar 2022 22:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242043AbiC3Ckw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Mar 2022 22:40:52 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C60EA76D3
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 19:39:07 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so3394088oos.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 19:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yfd2pacZwfLZJPHvVrPsqPPBhsNU2+TGNgnyGrMa2qo=;
        b=qs/2HS8rzDJc9kYzeKXAw0X0Cf/K0wWeI1+3L0OxJbikDgHTekjwVN45eGQkreib/t
         /pD9KgEdIxz5cMq9jNvHzB2qdObXpYEkKxDpnDwaK1z+eIbeTvU1/q1Zdr13P/EBbCBl
         8+yaGOCv9U37o484+T1g8Zx1eu/7MigrgDJYFfjDfizKgqiFPjK82NKUoAaHyZOsJuUU
         ZGPtAEOBvsWUi9rRQ9yiWmJmfmnUDt7PP+MQ6R9JMkUd8m1gEkiQuUFsVQtsZVRsILHw
         ILo39FJDuhpVwqnMwAguDnmf0U7GuOPgQXcXkxBnRCHsFOkglyBd/oh2ZIfFXAeClnk1
         l3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yfd2pacZwfLZJPHvVrPsqPPBhsNU2+TGNgnyGrMa2qo=;
        b=JWMbeOxuZofSDVkkG/qZ1uJ4HyWvIiiOBLrTYbnuaFoyYrgqRxxcLgTLFbmX4p07/W
         6352hzZ5zBsUDTbK/aaOtmh4XsRmNw7aSHxdfI65GVdMn36tvLaxDlhQG3ZERGZVYBEt
         k+JDSxjP0eJhenmmg7LqSDbj+Y8xM8X1yOdNQ5u4Ya0awXLiYd5BDryT41fBaAKqOY7Y
         MO93Ss1s95lv2VnCuWIBsM5w6Eqv0UOhZFLJI+JWNwWk6Rwckqge3hUGPUod1XX3K6cJ
         auV6U7IdW7K3li5ipzXqpemQRX+1eIlRJiQD6Sff+A208zkFeoE1fN7URO31AT3VPsod
         dSMQ==
X-Gm-Message-State: AOAM530mnqI2pEg/QB6W/PMU+3kHffSRlG9Z4MTZUoMbDoh9SyzjDCMg
        BNtx/23cfOeMC2bVPART3eor8Q==
X-Google-Smtp-Source: ABdhPJytZoTwr8j5QP8KWU7bCZ4Ws4NV9u5JLB2etb4WhJUZxgrEyby3ldu2+CSL/jzyN5DOLdEeuw==
X-Received: by 2002:a4a:8e17:0:b0:321:3fe1:77f0 with SMTP id q23-20020a4a8e17000000b003213fe177f0mr2137259ook.15.1648607947176;
        Tue, 29 Mar 2022 19:39:07 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s10-20020a4a3b0a000000b0032486bc11d0sm9712281oos.39.2022.03.29.19.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:39:06 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: [GIT PULL] hwspinlock updates for v5.18
Date:   Tue, 29 Mar 2022 21:39:05 -0500
Message-Id: <20220330023905.188282-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v5.18

for you to fetch changes up to 9a41358972eb35e6e45327035a67adfa4a223ed2:

  hwspinlock: sprd: Use struct_size() helper in devm_kzalloc() (2022-03-11 14:56:57 -0600)

----------------------------------------------------------------
hwspinlock updates for v5.18

This updates sprd and srm32 drivers to use struct_size() instead of
their open-coded equivalents. It also cleans up the omap dt-bindings
example.

----------------------------------------------------------------
Gustavo A. R. Silva (2):
      hwspinlock: stm32: Use struct_size() helper in devm_kzalloc()
      hwspinlock: sprd: Use struct_size() helper in devm_kzalloc()

Sinthu Raja (1):
      dt-bindings: hwlock: omap: Remove redundant binding example

 .../bindings/hwlock/ti,omap-hwspinlock.yaml        | 33 +---------------------
 drivers/hwspinlock/sprd_hwspinlock.c               |  3 +-
 drivers/hwspinlock/stm32_hwspinlock.c              |  4 +--
 3 files changed, 3 insertions(+), 37 deletions(-)
