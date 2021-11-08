Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49891C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 17:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2561D611C4
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 17:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhKHR0r (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 12:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbhKHR0q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 12:26:46 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6068AC061570
        for <linux-remoteproc@vger.kernel.org>; Mon,  8 Nov 2021 09:24:02 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so10630475otm.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Nov 2021 09:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6WxNy+sbprXqh5vUpIWWndzj2Xknzdzzhl1WXIKKdHQ=;
        b=jGRpem+QkB3LWgMkD1Rnnfu6Yf5Z+jVo0M55XBh3r847EYt0OfjzNGjaPk5xuBakSy
         RlwUxyz48wK1ogpcuTDgcHs4uTnGnHpr51twgj2PHLneYxMhWyTDHMUp4nJ2+bLwAU+R
         7l0esbWNGbAXZ5MspFa6gVYyTrM7mXevu3/yolaB73rYX9qtk6CxQiGISZQ04MyjHM3l
         DE3I91clpu4dXZh2Dx/Eb4Rjau+PkSBwew9QINYrHTuqvKhZUmXliIuIMjI67m4IivvN
         NniEYiZgXrZySmIBeNtjas/D6raW1GjvarZpHFkwl0LZCiF9S45azGPe1edyN16ra4YY
         Opfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6WxNy+sbprXqh5vUpIWWndzj2Xknzdzzhl1WXIKKdHQ=;
        b=5nMCP6IEFK2jcq+XF/1pxBdF9ukhmgaGGTDgmA2/zhv/77V4ynkRGaUrl1j/gl4BT/
         VjajPVYPwXaTka5u1sTSA/RyGKdNc0ZIFFJHmJtyDpFSq7WNS8aFRjRPLlmOhXQeHFyL
         gGWi2yfouzwJE+xMJmoLTdNYx0fgjColJmEcsPEdlefcYEtJ50CNKsdjyYQqJTbAVQze
         fkNMcj6iSM6F+OdEEri7lgL5NOJzyz7I8nE66bvmsnhyWLI0eo5Om5PS7g6r82XEmHmA
         rqVyVB3I1rQOVpnDVwlC5ufnQ3Z02keiIFigsjK3eGEmxi/qtLDGB+47M62eqF0tUpvu
         K7bQ==
X-Gm-Message-State: AOAM533oKm+e/sSUOR2cyCRoswuYikBXZMdq+SfAFrRHfUIfB5H2qbQu
        S2FdDzImf56rdgS7XjU9Y+3ly/wIYmb+fQ==
X-Google-Smtp-Source: ABdhPJwnI/0a8eSi6T5sh6kjSDOylJYlYzjZs/9j5wYlWMNfnHQj5nFJ1qQvJFLzV0DvMv8An3yI3A==
X-Received: by 2002:a05:6830:91a:: with SMTP id v26mr462006ott.313.1636392241682;
        Mon, 08 Nov 2021 09:24:01 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y1sm1595919otu.58.2021.11.08.09.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 09:24:01 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Alexandru Ardelean <ardeleanalex@gmail.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Chris Lew <clew@codeaurora.org>,
        Kees Cook <keescook@chromium.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [GIT PULL] rpmsg updates for v5.16
Date:   Mon,  8 Nov 2021 11:23:57 -0600
Message-Id: <20211108172357.2477129-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.16

for you to fetch changes up to b16a37e1846c9573a847a56fa2f31ba833dae45a:

  rpmsg: glink: Send READ_NOTIFY command in FIFO full case (2021-10-15 11:02:11 -0500)

----------------------------------------------------------------
rpmsg updates for v5.16

For the GLINK implementation this adds support for splitting outgoing
messages that are too large to fit in the fifo, it introduces the use of
"read notifications", to avoid polling in the case where the outgoing
fifo is full and a few bugs are squashed.

The return value of rpmsg_create_ept() for when RPMSG is disabled is
corrected to return a valid error, the Mediatek rpmsg driver is updated
to match the DT binding and a couple of cleanups are done in the virtio
rpmsg driver.

----------------------------------------------------------------
Alexandru Ardelean (1):
      rpmsg: virtio_rpmsg_bus: use dev_warn_ratelimited for msg with no recipient

Arnaud Pouliquen (1):
      rpmsg: Fix rpmsg_create_ept return when RPMSG config is not defined

Arun Kumar Neelakantam (3):
      rpmsg: glink: Add TX_DATA_CONT command while sending
      rpmsg: glink: Remove the rpmsg dev in close_ack
      rpmsg: glink: Send READ_NOTIFY command in FIFO full case

Cai Huoqing (1):
      rpmsg: virtio: Remove unused including <linux/of_device.h>

Chris Lew (1):
      rpmsg: glink: Remove channel decouple from rpdev release

Kees Cook (1):
      rpmsg: glink: Replace strncpy() with strscpy_pad()

Tinghan Shen (1):
      rpmsg: Change naming of mediatek rpmsg property

 drivers/rpmsg/mtk_rpmsg.c         |  2 +-
 drivers/rpmsg/qcom_glink_native.c | 90 +++++++++++++++++++++++++++++++++++----
 drivers/rpmsg/virtio_rpmsg_bus.c  |  3 +-
 include/linux/rpmsg.h             |  2 +-
 4 files changed, 85 insertions(+), 12 deletions(-)
