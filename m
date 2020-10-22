Return-Path: <SRS0=sj05=D5=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BD4C388F7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Oct 2020 16:54:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3410A2463F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Oct 2020 16:54:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1KcChnA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898275AbgJVQy3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Oct 2020 12:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441442AbgJVQy2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Oct 2020 12:54:28 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5B7C0613CE
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2020 09:54:28 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id n2so506697ooo.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2020 09:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HbmzpBTxspDnsuQ19KUiuNb2cB7WdjwRDDAzIPG8JG0=;
        b=a1KcChnAFb46+ymjgrkNkdR8r5nMx1GiGVe30CmnEJdRP4pio2earim6Cx+wcmMUGV
         wnLRcR0kiFRo/JApv5bPZX6xKIKz/506HwITrSf9f37iIq9Ngiu6YqPO0eyXCaXQLK34
         TDa8ug6XpulJky1dFtSj7amtI7ObXldMslyPI6NuTAx/b9HouwtCTFg18ESb0LriGL2t
         9STbAVLKjWYOo+fo66vdettIOkg5UUVTf3cUSQKReGVtarQhBubs+B7mMr8DF42A53Tt
         D/Rk2orLnnXes0NNUpXac6hkRZ73wGqddPIaAm3/xNPfWD01zoPuW2AjOzUFQoZnAubV
         1LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HbmzpBTxspDnsuQ19KUiuNb2cB7WdjwRDDAzIPG8JG0=;
        b=ldIoPoLvFgZGIdlUeu8ugnkIfQaSkJI5jiD0OvJ/GiJOXrvjWVO17NSyMbuJKV25az
         rh6ph1ws17TKtTurALBCNM8WKcxrH4vKq1FsmNYXTzBVEJeUuGpZkjmfbudvwAMjmIqE
         Z6Xl4Xb3SDqHHHQR45lSF3JU53/GHyQUm9uQ7smvwdKvUHm68x1+s78M7Qi6ZKxfOKSi
         YPHCTAjaO4qk4HA55iBXvOEyvn3nhh7xfamSnba1djHbuNy5q+0EZrH4thctZlqUxNa3
         KiSESAwJqI07IxMMZrd/oSoaAlBdXT5HdVs1e15QxYZA16XD+BfAgtJKgLNlhHYrHlg5
         atNg==
X-Gm-Message-State: AOAM5319Z8ghAoNwW78Fcfg9RERBOtEw6Aj1nyxCEnN9+/kbWf7GUvz/
        3pzJEJJvWYCUULCE8zZplvc4LubFeFgbRQ==
X-Google-Smtp-Source: ABdhPJz8CZJIiuq9Chow25/cadtSsNotaRPgvcuFIfcF0hTRW414Ugw6ghkDwt5+uegyuD81I33edA==
X-Received: by 2002:a4a:b601:: with SMTP id z1mr2617084oon.83.1603385666245;
        Thu, 22 Oct 2020 09:54:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 33sm529443otr.25.2020.10.22.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 09:54:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: [GIT PULL] rpmsg updates for 5.10
Date:   Thu, 22 Oct 2020 11:54:24 -0500
Message-Id: <20201022165424.23320-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.10

for you to fetch changes up to 4e3dda0bc603c1ca84680a56bfc49e8fe2519c89:

  rpmsg: glink: Expose rpmsg name attr for glink (2020-09-15 03:51:13 +0000)

----------------------------------------------------------------
rpmsg updates for 5.10

This introduces rpmsg_char support for GLINK and fixes a few issues.

----------------------------------------------------------------
Arnaud Pouliquen (1):
      rpmsg: virtio: fix compilation warning for virtio_rpmsg_channel description

Chris Lew (3):
      rpmsg: glink: Use complete_all for open states
      rpmsg: Guard against null endpoint ops in destroy
      rpmsg: glink: Expose rpmsg name attr for glink

Dan Carpenter (1):
      rpmsg: smd: Fix a kobj leak in in qcom_smd_parse_edge()

Deepak Kumar Singh (1):
      rpmsg: glink: Add support for rpmsg glink chrdev

Nicolas Boichat (1):
      rpmsg: Avoid double-free in mtk_rpmsg_register_device

 drivers/rpmsg/mtk_rpmsg.c         |  9 +----
 drivers/rpmsg/qcom_glink_native.c | 70 +++++++++++++++++++++++++++++++++++++--
 drivers/rpmsg/qcom_smd.c          | 32 ++++++++++++------
 drivers/rpmsg/rpmsg_core.c        |  2 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |  7 +++-
 5 files changed, 97 insertions(+), 23 deletions(-)
