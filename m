Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569D3C07E96
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 21:02:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34EDF61CA6
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 21:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhGFVFJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 17:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbhGFVFJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 17:05:09 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE97C061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 14:02:30 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so147671otl.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jul 2021 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6tpPDKSyclPkpydXHW+7x354s3vmNtT37qSCP18M/g=;
        b=euDsx0wv6JsNg+UuOnI+iHIY6OjuCQ3qFs0aM3Fwkh/Bpa5NrpflciBSAU+Ve7fi2+
         ghiy0GAdgFios/9AWztTGbNmNMnzeCGRNl75SJYHXhO8kgZAhc85/YnuOfUJJ9pSdWnb
         +4W4BoYnJ6wS90A7QdTBO6QpXtJ5jaU1TycU74waSoGu+py4PKvbBb1EzddVU7rk9LuX
         13BekPIxnNTRW6Y5TX6KLCofcRila7N3ncr6KwaLfXNyQvxFeGHG+zZtFLYdh/klZWlK
         1xqyih0ha36ZE5448N0u5WhQxFfADW81LzsZjYExUX+ckkuHQ1muTpf030dGnIKrUiEB
         xkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6tpPDKSyclPkpydXHW+7x354s3vmNtT37qSCP18M/g=;
        b=pB3BcvxJrUvaHHn4tFEPsFjUu4+FC1r2eiORK061558ahxk1EmnVq4jYRhQ+Tw5Db0
         p3qmJnFUGu5J4d8HTSO8XaVeWOWDuwDqBeIbedgVT8jbHVmKegd9Oug0dC1KX/m8BZaX
         0N7yUUAcduhluhajLMnQ8QeqiiJQPk/I83MMj4KUffRibvtfMYu9WZdqnKIe95DICHqo
         niIF9HEOgbWW1PIwOOQiphNEw6MdqbaLho8zqrPloy0r6B2ZmWP7cxaOOnMUtPzsc+do
         6N+bwicXlZOvLupNQRk++5SLBhwLSkFdzAOmSOc/NoSQlqAiDD07dofMJdaBQQYRXMlc
         mATQ==
X-Gm-Message-State: AOAM531KIAgHN6SY2CnrMS6+QJTbULqHr48LUwquuoA8S2lEGF88EIpG
        mBcKYzTFQJgppJRcJJn1crVlSQ==
X-Google-Smtp-Source: ABdhPJwBGd2mCyBY0IVJtj8TwxaCHznMMLoEapifmCIIHFqK2e9hQi1ZsGCI7mwLGuxPrVZI7lG/Lg==
X-Received: by 2002:a05:6830:1bed:: with SMTP id k13mr10376346otb.271.1625605349603;
        Tue, 06 Jul 2021 14:02:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 3sm2987863oob.1.2021.07.06.14.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 14:02:29 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Suman Anna <s-anna@ti.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [GIT PULL] remoteproc updates for v5.14
Date:   Tue,  6 Jul 2021 16:02:28 -0500
Message-Id: <20210706210228.1229484-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit c16ced60f3bf4aeba85e638f2186c468d7892ee0:

  dt-bindings: remoteproc: k3-r5f: Update bindings for AM64x SoCs (2021-05-27 22:10:22 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.14

for you to fetch changes up to aef6a521e5bf61b3be4567f6c88776956a6d8b32:

  remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss (2021-06-25 17:43:35 -0500)

----------------------------------------------------------------
remoteproc updates for v5.14

This adds support for controlling the PRU and R5F clusters on the TI
AM64x, the remote processor in i.MX7ULP, i.MX8MN/P and i.MX8ULP NXP and
the audio, compute and modem remoteprocs in the Qualcomm SC8180x
platform.

It fixes improper ordering of cdev and device creation of the remoteproc
control interface and it fixes resource leaks in the error handling path
of rproc_add() and the Qualcomm modem and wifi remoteproc drivers.

Lastly it fixes a few build warnings and replace the dummy parameter
passed in the mailbox api of the stm32 driver to something not living on
the stack.

----------------------------------------------------------------
Arnaud Pouliquen (1):
      remoteproc: stm32: fix mbox_send_message call

Arnd Bergmann (1):
      remoteproc: stm32: fix phys_addr_t format string

Bjorn Andersson (3):
      Merge tag '20210327143117.1840-2-s-anna@ti.com' into rproc-next
      dt-bindings: remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss
      remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss

Christophe JAILLET (1):
      remoteproc: k3-r5: Fix an error message

Manivannan Sadhasivam (1):
      dt-bindings: remoteproc: qcom: pas: Convert binding to YAML

Peng Fan (11):
      dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
      dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
      dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
      remoteproc: imx_rproc: parse fsl,auto-boot
      remoteproc: imx_rproc: initial support for mutilple start/stop method
      remoteproc: imx_rproc: make clk optional
      remoteproc: imx_rproc: support i.MX7ULP
      remoteproc: imx_rproc: support i.MX8MN/P
      remoteproc: imx-rproc: Fix IMX_REMOTEPROC configuration
      dt-bindings: remoteproc: imx_rproc: support i.MX8ULP
      remoteproc: imx_rproc: support i.MX8ULP

Siddharth Gupta (4):
      remoteproc: core: Move cdev add before device add
      remoteproc: core: Move validate before device add
      remoteproc: core: Fix cdev remove and rproc del
      remoteproc: core: Cleanup device in case of failure

Stephan Gerhold (3):
      soc: qcom: smem_state: Add devm_qcom_smem_state_get()
      remoteproc: qcom_q6v5: Use devm_qcom_smem_state_get() to fix missing put()
      remoteproc: qcom_wcnss: Use devm_qcom_smem_state_get()

Suman Anna (6):
      remoteproc: Add kernel-doc comment for is_iomem
      remoteproc: Fix various kernel-doc warnings
      remoteproc: k3-r5: Extend support to R5F clusters on AM64x SoCs
      dt-bindings: remoteproc: qcom: pas: Fix indentation warnings
      dt-bindings: remoteproc: pru: Update bindings for K3 AM64x SoCs
      remoteproc: pru: Add support for various PRU cores on K3 AM64x SoCs

Yassine Oudjana (1):
      dt-bindings: remoteproc: qcom: pas: Add power domains for MSM8996

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  12 +-
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   | 228 ---------
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 547 +++++++++++++++++++++
 .../bindings/remoteproc/ti,pru-rproc.yaml          |   5 +
 drivers/remoteproc/Kconfig                         |   1 +
 drivers/remoteproc/imx_rproc.c                     | 209 ++++++--
 drivers/remoteproc/pru_rproc.c                     |   3 +
 drivers/remoteproc/qcom_q6v5.c                     |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  22 +
 drivers/remoteproc/qcom_wcnss.c                    |   5 +-
 drivers/remoteproc/remoteproc_cdev.c               |   2 +-
 drivers/remoteproc/remoteproc_core.c               |  72 ++-
 drivers/remoteproc/remoteproc_elf_loader.c         |  12 +-
 drivers/remoteproc/remoteproc_virtio.c             |   6 +-
 drivers/remoteproc/stm32_rproc.c                   |  16 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c           | 151 ++++--
 drivers/soc/qcom/smem_state.c                      |  36 ++
 include/linux/remoteproc.h                         |  50 +-
 include/linux/soc/qcom/smem_state.h                |   8 +
 19 files changed, 1028 insertions(+), 359 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
