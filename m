Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC9CC56202
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 21:42:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BE1822403
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 21:42:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nP0XcB/E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgKTVmr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 16:42:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgKTVmr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 16:42:47 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34ED4C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:47 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id j19so8432673pgg.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dGx7nkSRSOVB3yrhS2MIzy8whpUJXJfKVaIkI4vsSM8=;
        b=nP0XcB/EoAS0ZTzM1sPdQQyChokGsEwcZHuGmkGuwR1gvwVRsEVlEZwpZNREwVL4Mg
         5XOL5/gmF4nfcspINYHLVuBIaoBqiBUwfJEfGTuE3fL9A/fQVUP4rcJv8wNEWMUsb123
         uw+QVdjQAoUA+1oR335Deo7n8p1FJtqn8MXo6Vi+xr2rUICOtvMIAZKxo8ov0ruu1y8z
         62bU9XHeeSXQlp8MUUEchmafjS/9DqTdjFlAJCmvPOgQ2F/5AOCH4dJtLXiSYgpemNf2
         eHoJ/eMourfaXNx8+EFvdJeFpnlJgo77Bor3SExtPzLfv8RT82qvDOWNFwpvESS3P0NQ
         PMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dGx7nkSRSOVB3yrhS2MIzy8whpUJXJfKVaIkI4vsSM8=;
        b=Yh8jCzFlG8AqNZ1mXupdDr3wKyN3y9RuPi75UgGd3Hw4bfCYvAxfc2g+6y3b7klotU
         0moRReCjMZAMNEh25jVbwLSRlTOqKdVf5SX8hQ0IwPuhkIbW9f39zyejnjOliKqiq+js
         E9Gg2SiMXejVlObhBon/KHo7e8wnYYK7n69tc2vU0/2iKcCKJseCtLEhthz4aTltam7C
         M8fcLf0FM/NjV0MpyBfCKwHRuwCbwFum9EM+/m9BEdT+ErmZ0w2mrp8Ip6bz3WAmlx31
         1u1O+H46wTEfWtgPYoglGUPpLTczgUCxNoJBr6haTsp4OBww5FkGNeobOz4gqPNCR9y+
         b3RA==
X-Gm-Message-State: AOAM5313RxQA5W7j/RmUufGfRyR6NNrujRRyg1p81OrR7rKfxhtbdbag
        viS2S93RyFSebJYuJy6NO9gZRw==
X-Google-Smtp-Source: ABdhPJwpkmxeXoiY32/7plx/oiEDwJxxdXvmxvBuYauPRqc7zCnt0e5sO1YG2uK0hI85rwdSFr9RiA==
X-Received: by 2002:a17:90a:eb04:: with SMTP id j4mr6482430pjz.103.1605908566588;
        Fri, 20 Nov 2020 13:42:46 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm4713197pfj.157.2020.11.20.13.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 13:42:45 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/8] rpmsg: Make RPMSG name service modular 
Date:   Fri, 20 Nov 2020 14:42:37 -0700
Message-Id: <20201120214245.172963-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This revision addresses comments received from the previous revision,
i.e V6.  Please see details below.

It starts by making the RPMSG protocol transport agnostic by
moving the headers it uses to generic types and using those in the
current implementation.  From there it re-uses the work that Arnaud
published[1] to make the name service modular.

Tested on stm32mp157 with the RPMSG client sample application.  Applies
cleanly on rpmsg-next.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335

-------
New for V7:
- Fixed error path in rpmsg_probe() as reported by Guennadi

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
 drivers/rpmsg/rpmsg_core.c       |  44 ++++++++
 drivers/rpmsg/rpmsg_internal.h   |  14 ++-
 drivers/rpmsg/rpmsg_ns.c         | 126 +++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c | 186 +++++++++++--------------------
 include/linux/rpmsg.h            |  63 ++++++++++-
 include/linux/rpmsg/byteorder.h  |  67 +++++++++++
 include/linux/rpmsg/ns.h         |  45 ++++++++
 include/uapi/linux/rpmsg_types.h |  11 ++
 10 files changed, 439 insertions(+), 127 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ns.c
 create mode 100644 include/linux/rpmsg/byteorder.h
 create mode 100644 include/linux/rpmsg/ns.h
 create mode 100644 include/uapi/linux/rpmsg_types.h

-- 
2.25.1

