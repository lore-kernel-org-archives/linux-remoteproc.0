Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78AEC43461
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 15:03:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F727610E9
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 15:03:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhEDPEh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 11:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbhEDPEg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 11:04:36 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4557C061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 08:03:41 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso1160894ote.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 May 2021 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l8oxEK0+HwDjIWVBD1cWvA/dkEeyw6Fa4y4+NCRnCdk=;
        b=rptIgdPwijnJU9k8ZIhkIFHQKzmOWBMLdboLN4DiHSB6ajKrCDv/dUP3BxQlhhw3Fi
         kfFbRLMqTN08J8VcsaNVVoP22D0ecMO9+itmMPNnROXzJPWMdR6dj7bD0E5J6LwIjGSJ
         kf174jRXWuEjO31IOeXhTcvQmsqdHwMlqI1W+jWAnZwUUNa2u+4NRNkiVAwa7LoqZ1Ek
         otcAEcnBKmXZfYGQEqKptnfu78zK1R8M0jH0c/rvs4cQy6tavakW8MoVzLftyOMicsP4
         +3BOd6rLeyUi+oqqtqzthd+MsveW/nOyLSZHjPqd2akN6xLjiKvrkiEAtITSbD69Z5TG
         xNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l8oxEK0+HwDjIWVBD1cWvA/dkEeyw6Fa4y4+NCRnCdk=;
        b=qBK5T6nXhioOJAS2SVwOsGx9FqgG1xRGDjlTiAir/rDn6WaH9WvuwBcr5RapITtsIg
         1LQKh58nfogZUqmqAxg5k8Bal92t/P9kzIawpOzHzreSY3wmaLJk3NXKMqxYFuyEn7qS
         wlHVdEyzjMi/bFv5NBneTEP1ciZnProV1kG23XXheGSwF2ak1FDYeQr+rksGnLtdXZNZ
         0m0meLLMkzVhytiobseuhpoJbOliQtYaJfyvaz1aWYF8DqyoZEWAL/nS58wpYrx5UVrI
         2/AXUbUYkEQxjjr+xZIl2XJMf/86eLYJRd1NhTkn8z6eXWcURfM50ZTv6yuyrsslBuFV
         V0Fg==
X-Gm-Message-State: AOAM531suizIBobQPWePzJJYXwLMMgyhuTYAuipVT1wjvnYfQdYoNAvn
        FAMy55Q5fPsw18/X9WkXCvNU0pk61pRk+w==
X-Google-Smtp-Source: ABdhPJw26S/9SPWC8/ajfC1G/sCNkJ7Mf+PS89amtiIxRCPcoQMPRpwZLMhDqBH2I5myNvfiBqew/g==
X-Received: by 2002:a9d:4787:: with SMTP id b7mr1211201otf.280.1620140620503;
        Tue, 04 May 2021 08:03:40 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i130sm747856oif.49.2021.05.04.08.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 08:03:40 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [GIT PULL] rpmsg updates for v5.13
Date:   Tue,  4 May 2021 10:03:39 -0500
Message-Id: <20210504150339.1468558-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.13

for you to fetch changes up to 26594c6bbb60c6bc87e3762a86ceece57d164c66:

  rpmsg: qcom_glink_native: fix error return code of qcom_glink_rx_data() (2021-04-09 11:08:42 -0500)

----------------------------------------------------------------
rpmsg updates for v5.13

In addition to some bug fixes and cleanups this adds support for
exposing the virtio based transport to user space using the rpmsg_char
driver.

----------------------------------------------------------------
Arnaud Pouliquen (6):
      rpmsg: char: Rename rpmsg_char_init to rpmsg_chrdev_init
      rpmsg: Move RPMSG_ADDR_ANY in user API
      rpmsg: Add short description of the IOCTL defined in UAPI.
      rpmsg: char: Use rpmsg_sendto to specify the message destination address
      rpmsg: virtio: Register the rpmsg_char device
      rpmsg: char: Return an error if device already open

Jia-Ju Bai (1):
      rpmsg: qcom_glink_native: fix error return code of qcom_glink_rx_data()

 drivers/rpmsg/qcom_glink_native.c | 17 +++++++++++
 drivers/rpmsg/qcom_smd.c          | 16 ++++++++++
 drivers/rpmsg/rpmsg_char.c        | 11 ++++---
 drivers/rpmsg/virtio_rpmsg_bus.c  | 62 +++++++++++++++++++++++++++++++++++----
 include/linux/rpmsg.h             |  3 +-
 include/uapi/linux/rpmsg.h        | 13 ++++++--
 6 files changed, 109 insertions(+), 13 deletions(-)
