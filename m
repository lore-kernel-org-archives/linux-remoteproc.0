Return-Path: <SRS0=cP4F=BV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97682C433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 11 Aug 2020 05:31:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D6C120829
	for <linux-remoteproc@archiver.kernel.org>; Tue, 11 Aug 2020 05:31:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t4nNtp5s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgHKFbe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 11 Aug 2020 01:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgHKFbd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Aug 2020 01:31:33 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F80C06174A
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Aug 2020 22:31:33 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k18so6980086pfp.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Aug 2020 22:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GUK6wepr4yUdaqTzAXUTHb0IYklWza8loFfYwomVV0M=;
        b=t4nNtp5s9Gek4YbX8hYOsQuXIRmVOVpUnGuoucz4y4dnrLtYltXNlFDW/P5kPu8Gli
         mmhU3LIdw0oUKSVWD2bWY5P+3/JO4hk5G40YvhvoJlnuro8+iiI2TPRmbBVwTHo73ZDp
         qmRRM54JzFx1S9kjrBuh+Y09WYzLxwOnKhFHb8lo+dzdFbocGEV7uqIGSntQkfwlqNOD
         DpuPVj53M5xYzaQKavuUWsxrP841SyTU3y0gHxiZW3Cpy9eaU2PmonLQwROrQA9J/map
         jS/CZUvpkPHLXHP6KSU2tmZ4J7VqGyoA7UyTn3lrnOIM+E+5QTpKaOuQVucnj+k46wLA
         NsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GUK6wepr4yUdaqTzAXUTHb0IYklWza8loFfYwomVV0M=;
        b=dVDvLxmFVA1MAMjfkQ7xyn5Cujz4JUnlMlGCxLKhYgRb8h9fLPBM6s0li6Rgj1Qiig
         gpC8GQnxtQ7heOFLMbSVIzr/F0ac9V46by2qYqZrW7ufYJGbVACrZepvHEjESV2XY0yO
         vv+labEt4SWdqykNQhPplHJ4tRRlM/9mYBA4d4F3Tf8S9sU7u6KEYcYjQl11Ar+i7sJn
         uS54oLhc6RLz9E/tSVXl7lD9GTH1SRev52ap/9zjirKzdI3xLteoEtm3h+jwEP4MsYRN
         9X/TzDkPJdWIKjEvnxBtpGKGK1otWIE98/fgn3Ver6cpEGD7NfIYiBHVBtoxXm3aFP5I
         wRMg==
X-Gm-Message-State: AOAM531SvV5KCuhglxtx0mxHqYck+cmmGVPnSvAgDuJIAOZjVanNVbop
        FwSEIxk3vfVq5+Hgk/ab28Z2LA==
X-Google-Smtp-Source: ABdhPJxO9iur4RFCvounihwm5/xm3Tqm/LFdTjIEjls3p+LPz75FcWVkAuG458KLX6C1wNtF4v80fQ==
X-Received: by 2002:a63:1901:: with SMTP id z1mr21951886pgl.97.1597123891654;
        Mon, 10 Aug 2020 22:31:31 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v8sm4172807pju.1.2020.08.10.22.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 22:31:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [GIT PULL] rpmsg updates for v5.9
Date:   Mon, 10 Aug 2020 22:28:01 -0700
Message-Id: <20200811052801.404208-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.9

for you to fetch changes up to 111d1089700cdb752681ef44f54ab6137736f5c2:

  rpmsg: virtio: add endianness conversions (2020-07-21 20:37:16 -0700)

----------------------------------------------------------------
rpmsg updates for v5.9

This ensures that rpmsg uses little-endian, per the VirtIO 1.0
specification.

----------------------------------------------------------------
Guennadi Liakhovetski (1):
      rpmsg: virtio: add endianness conversions

 drivers/rpmsg/virtio_rpmsg_bus.c | 63 ++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 29 deletions(-)
