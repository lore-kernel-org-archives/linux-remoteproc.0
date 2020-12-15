Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22ED7C4361B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Dec 2020 18:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4BC820578
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Dec 2020 18:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730337AbgLOSI5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Dec 2020 13:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbgLOSIh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Dec 2020 13:08:37 -0500
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913B7C06138C
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Dec 2020 10:07:51 -0800 (PST)
Received: by mail-oo1-xc44.google.com with SMTP id y14so1754373oom.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Dec 2020 10:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awpfnaoCuOfpiA9hFwy8M6uoUGEHYcKA+Gcyax3vkEU=;
        b=SLdbi27kWMyEok3alqZe20qkyd4B3CnVaAdIyEDPHD2vz0Gv0dwKJ1Gm6MFxx1DDSM
         xncXwtmCZPUcRw17HtC/OXEwXsiw/QOPLw37/d14RQHEO3Z0H6hRPFdfOhaQ45GmZrwf
         tztIUBHriOjGYSSWbU++5Qm1xQdFd/AkinC0U+ggnaoYezEIq2YYUYCw9RRltVip/+HX
         lhMeZd1XZ+t529RAHdoZJU3ubhgmeqA2qqM+QrBVNNJyq6wsSThMWO1B2NKXgOML8LBc
         T8mtEvl9YkZFt4yh/mOYFTMO3Vi5+ulrXmqmGJx3Gy82+FzLc3bK9up90bEBVBtk/40X
         2L5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awpfnaoCuOfpiA9hFwy8M6uoUGEHYcKA+Gcyax3vkEU=;
        b=ggoEhbGGpfLdxP0XWwn+YDNcq7g1Q7WVvwdNdfzwiJdEspFznyioIMUaJGcfUd4n0h
         6SywEVaAuJY87vQj4AA61IBJ60xpA8svIFp6+LPhgFpT1ceouZ58jnSSL2Bov02gqsH8
         W95Wp+D6ni6oUZlT6yEfqELG/ZdgEDVhHb3oo2njGka9mCIwxV2AsT6p7KwfoHo8V0CR
         ep+uN8eQajM8/jsg5W1TINTdr3I1LFG9JTScaLAekEVWHL5juSrJ/I2ueOnxgGNI1QRQ
         O9ayUTD3eiJGpLyhZ6G0whl19sju4iU1Gw3Uhes8zhdDj8RX6bxLSDRV9+D6BRiZxUG6
         Qa4Q==
X-Gm-Message-State: AOAM532scC0/aD+nUDAhU20G74jjM6JQnJ5JRf3U1SIZVyAOjnsNm3o9
        PqfhFJD5TS0o5J9X5jSh/L19sg==
X-Google-Smtp-Source: ABdhPJwTB7icEqbXpYRJR956FFUcB0QEiMvrok0dKNuzUQl6DCJ4w/MCFiEArZdT1/cuajSh7cNQXQ==
X-Received: by 2002:a4a:97a3:: with SMTP id w32mr5262043ooi.81.1608055670983;
        Tue, 15 Dec 2020 10:07:50 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z38sm4437434ooi.34.2020.12.15.10.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 10:07:50 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [GIT PULL] rpmsg updates for v5.11
Date:   Tue, 15 Dec 2020 12:07:49 -0600
Message-Id: <20201215180749.1528593-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.11

for you to fetch changes up to 950a7388f02bf775515d13dc508cb9d749bd6d91:

  rpmsg: Turn name service into a stand alone driver (2020-11-24 10:11:59 -0600)

----------------------------------------------------------------
rpmsg updates for v5.11

This extracts the "nameserver" previoiusly used only by the virtio rpmsg
transport to work ontop of any rpmsg implementation and clarifies the
endianness of the data types used in rpmsg.

----------------------------------------------------------------
Arnaud Pouliquen (4):
      rpmsg: virtio: Rename rpmsg_create_channel
      rpmsg: core: Add channel creation internal API
      rpmsg: virtio: Add rpmsg channel device ops
      rpmsg: Turn name service into a stand alone driver

Mathieu Poirier (4):
      rpmsg: Introduce __rpmsg{16|32|64} types
      rpmsg: virtio: Move from virtio to rpmsg byte conversion
      rpmsg: Move structure rpmsg_ns_msg to header file
      rpmsg: Make rpmsg_{register|unregister}_device() public

 drivers/rpmsg/Kconfig            |   9 ++
 drivers/rpmsg/Makefile           |   1 +
 drivers/rpmsg/rpmsg_core.c       |  44 +++++++++
 drivers/rpmsg/rpmsg_internal.h   |  14 ++-
 drivers/rpmsg/rpmsg_ns.c         | 126 ++++++++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c | 186 ++++++++++++++-------------------------
 include/linux/rpmsg.h            |  63 ++++++++++++-
 include/linux/rpmsg/byteorder.h  |  67 ++++++++++++++
 include/linux/rpmsg/ns.h         |  45 ++++++++++
 include/uapi/linux/rpmsg_types.h |  11 +++
 10 files changed, 439 insertions(+), 127 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ns.c
 create mode 100644 include/linux/rpmsg/byteorder.h
 create mode 100644 include/linux/rpmsg/ns.h
 create mode 100644 include/uapi/linux/rpmsg_types.h
