Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EBDC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Mar 2022 02:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241962AbiC3Ci3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Mar 2022 22:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbiC3Ci3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Mar 2022 22:38:29 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DAC1C8D85
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 19:36:44 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id a7-20020a9d5c87000000b005ad1467cb59so14046396oti.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 19:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DHEZxSjzJlAPP2uqRqoKSVFTqS9GuHL/yTxHB4u0XZ8=;
        b=deFHZEmJxRWJscAbTS7+14TIUG1p6cMQHdj7ZGHJ4PaVtO5K8L09p7k69yoG/405N7
         37WH0U7LaCMTM+sQp/yb/ETrRwwvORNrZZPFtvsiZRpoi44RRZnu+INkK7tHLFuitYzN
         E3U868ePSbdsHP5H5axaka1tO5sYb1ErrJzCLiJEMuQiPboQRemlpKDYkjBcvltLyJXA
         8GqVwlC57PMQKicBKnOgwEMOjiJ2HF3cjTfmYUQOPsNf8/7y/vfuAxBiSI6MAMoDIucV
         k5pvfxSZzVw5FHaZKbLebwK6sOtrRbWlFWy3gGc0oZyUTfIBmAnd1VH35oHCHiaeCE6e
         hgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DHEZxSjzJlAPP2uqRqoKSVFTqS9GuHL/yTxHB4u0XZ8=;
        b=hvmg3YhvqOTlIIPUVgkLchc4LLRLxCun6a/HNI+BydNTUaa9jMoFGxLCxHwk0SZb7S
         IQ38Hc6JVQLJNbQQPZjoLMb0X/nJenjVJS7/7ltN5UmTlo9rFWXpjQcdx/fufVCv4NbL
         IxmA6pZDzP360QOtMx+a/aocYI04w9TqguekH3qhYzG9Evdo1b9KpAfOz+wiyieGml3C
         R1cUObtR7TeIhHh/jHSP+/dsgtEU4EChnLifKj1/113K1CEudor/6Zsw9wqcHs7w3zUf
         o8ZHWuQM9Iv3tKaVT/iMH9pHIsvVqev3bz1L6QBiimCTk0lRtel7VV4nAPIspkwhOF2l
         uSqg==
X-Gm-Message-State: AOAM531RhSYQX1iTkCc/Mvdzoiet7C1sEajgdLmTOMtrfwDSJFc37EmI
        m+ewICR5yaKeEB5GXig/TbB8/gGNA7hHyg==
X-Google-Smtp-Source: ABdhPJyX7nFTb5fNtNKAkBvNdRMgmjcVXyBvRPthDL9QsoLtpEcBDKHG3ePy6i/5GKwyn13gvdCwmw==
X-Received: by 2002:a9d:77d7:0:b0:5b2:29b0:70cb with SMTP id w23-20020a9d77d7000000b005b229b070cbmr2366290otl.276.1648607804090;
        Tue, 29 Mar 2022 19:36:44 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id f8-20020a4a8908000000b0032472938f95sm8411542ooi.17.2022.03.29.19.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:36:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Tim Blechmann <tim@klingt.org>
Subject: [GIT PULL] rpmsg updates for v5.18
Date:   Tue, 29 Mar 2022 21:36:42 -0500
Message-Id: <20220330023642.187977-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.18

for you to fetch changes up to 8109517b394e6deab5fd21cc5460e82ffed229c6:

  rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls (2022-03-13 11:49:53 -0500)

----------------------------------------------------------------
rpmsg updates for v5.18

The major part of the rpmsg changes for v5.18 relates to improvements in
the rpmsg char driver, which now allow automatically attaching to rpmsg
channels as well as initiating new communication channels from the Linux
side.

The SMD driver is moved to arch_initcall with the purpose of registering
root clocks earlier during boot. Also in the SMD driver, a workaround
for the resource power management (RPM) channel is introduced to resolve
an issue where both the RPM and Linux side waits for the other to close
the communication established by the bootloader - this unblocks support
for clocks and regulators on some older Qualcomm platforms.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      rpmsg: qcom_smd: Fix redundant channel->registered assignment

Arnaud Pouliquen (8):
      rpmsg: char: Export eptdev create and destroy functions
      rpmsg: Create the rpmsg class in core instead of in rpmsg char
      rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
      rpmsg: Update rpmsg_chrdev_register_device function
      rpmsg: char: Refactor rpmsg_chrdev_eptdev_create function
      rpmsg: char: Add possibility to use default endpoint of the rpmsg device
      rpmsg: char: Introduce the "rpmsg-raw" channel
      rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls

Konrad Dybcio (1):
      rpmsg: qcom_smd: Promote to arch_initcall

Luca Weiss (1):
      rpmsg: smd: allow opening rpm_requests even if already opened

Minghao Chi (CGEL ZTE) (1):
      rpmsg: use struct_size over open coded arithmetic

Tim Blechmann (1):
      rpmsg: char: treat rpmsg_trysend() ENOMEM as EAGAIN

 drivers/rpmsg/Kconfig             |   8 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |   4 +-
 drivers/rpmsg/qcom_smd.c          |  13 +-
 drivers/rpmsg/rpmsg_char.c        | 238 ++++++++++++++-----------------------
 drivers/rpmsg/rpmsg_char.h        |  46 ++++++++
 drivers/rpmsg/rpmsg_core.c        |  15 ++-
 drivers/rpmsg/rpmsg_ctrl.c        | 243 ++++++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |  10 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
 include/uapi/linux/rpmsg.h        |  10 ++
 11 files changed, 428 insertions(+), 162 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
