Return-Path: <SRS0=NYIK=EC=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2E2C55179
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A264A2076D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ic4R8eed"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822712AbgJ0RwV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:52:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41124 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1822722AbgJ0RwV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:52:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id c20so1345341pfr.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2020 10:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bnr9bCFH4BOnkHPYuyRH456jUmw7jY7AN38VGoSonfA=;
        b=Ic4R8eedZZIUVUac/9063eUF14JBhGhsEca21Ml2qGU3xaUKovtpXJTuqIdIGtdJVE
         T8IXkZrboxb3TlH1Q3ndc/sMxw/PcGpH8hR6LFqkIDM7nBkNwlfRPstbTnTyS5g0knyr
         6ubKo8zsF1O0a5wOgtrn2GQ3TFBI/Rvd96ui5fvYFadt4f0fPJPhRiSqwP+aI4ePD1Fe
         GsnGpdAnPROsZBK3TZBMuq2tehyqU3bQ5yd5ft6tAD8FQCoYFxdVGEx6E0OU5PMFOuYb
         YbT0jhXpFpGRceCBAt7B9DWsaFn1Hrzyd5IIlrjY7qqLtgFLKGRLwxy31ZGPC1i3QGH4
         ilYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bnr9bCFH4BOnkHPYuyRH456jUmw7jY7AN38VGoSonfA=;
        b=FnPAaI1tgqLeyeo6MnoOXXwvdoE/ySlJXzkm7RaoU+sfL99oSK9AwAUuJp5L5cfp22
         yiKTJciriEmPMgTl36JjysKohdJD6R+wTZpNQInoXeXQpVAlfEPJi6R/I8VZ7S9v/K1l
         RxBLxvXsh6/u0tNac59Mgj3zcV6udfztg0pXq90it9WBuQbkkrrmYcQ4FVR3Yk4QQtjM
         E3olzancYvV8D3eMBL4UnuEePGSAMTKCCM+3f4GVeM4ckvvif3Ql2OM0V6I78gHP9KqX
         Vuxd12S587F9TSY/1IQsxAnhspg4jV0Wz91fGWSfeX30bybfNWu2KiRIQO+f1ux6O+XG
         1ByQ==
X-Gm-Message-State: AOAM531tG6ddjcq6inT54fZ7RkIH8JgoczT1RprlaSHyb+g//ZwWOCMg
        Tl3zgBhf8vsbzDYT1oxb/j0DgA==
X-Google-Smtp-Source: ABdhPJyP8J4pvzpRAmDmwOVXOsP5hqNyotIxr//y73L51aEOThv+GHLBGKpfDVRFwYv0JCGKO2uGSA==
X-Received: by 2002:a62:158c:0:b029:152:6669:ac75 with SMTP id 134-20020a62158c0000b02901526669ac75mr3344342pfv.5.1603821140430;
        Tue, 27 Oct 2020 10:52:20 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r8sm2761225pgl.57.2020.10.27.10.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:52:19 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/8] rpmsg: Make RPMSG name service modular 
Date:   Tue, 27 Oct 2020 11:52:10 -0600
Message-Id: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This revision is a simple rebase and doesn't provide any new
functionality.

It starts by making the RPMSG protocol transport agnostic by
moving the headers it uses to generic types and using those in the
current implementation.  From there it re-uses the work that Arnaud
published[1] to make the name service modular.

Tested on stm32mp157 with the RPMSG client sample application.  Applies
cleanly on v5.10-rc1.

Thanks,
Mathieu

-------
New for V4:
- Added Arnaud's RB tags.
- Rebased to v5.10-rc1.

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

 drivers/rpmsg/Kconfig            |   8 ++
 drivers/rpmsg/Makefile           |   1 +
 drivers/rpmsg/rpmsg_core.c       |  44 ++++++++
 drivers/rpmsg/rpmsg_internal.h   |  14 ++-
 drivers/rpmsg/rpmsg_ns.c         | 108 ++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c | 185 +++++++++++--------------------
 include/linux/rpmsg.h            |  63 ++++++++++-
 include/linux/rpmsg_byteorder.h  |  67 +++++++++++
 include/linux/rpmsg_ns.h         |  59 ++++++++++
 include/uapi/linux/rpmsg_types.h |  11 ++
 10 files changed, 433 insertions(+), 127 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ns.c
 create mode 100644 include/linux/rpmsg_byteorder.h
 create mode 100644 include/linux/rpmsg_ns.h
 create mode 100644 include/uapi/linux/rpmsg_types.h

-- 
2.25.1

