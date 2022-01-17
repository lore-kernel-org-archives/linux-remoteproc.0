Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EC8C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jan 2022 22:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234067AbiAQWKd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Jan 2022 17:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiAQWKc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jan 2022 17:10:32 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1E3C06161C
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 14:10:32 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id e81so25603510oia.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 14:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0wHEClbaoLpWxCk4WR9pAVhItlqzJGA8f6LdA8ExZCI=;
        b=asTLhMt2KIrEwgDj6GhhXKzwpsMH2V4hZpP0IaPG8u9i1I/g0DA6d389IseFcnUO/b
         yhbo+9PuammaV5NEzSpzNlTyx3NSn1ne2HS1dzYDW9Hw27ON1RHlMIoayUphVY/ieV+m
         131CUuhEFCIM6ieuUmFDs9AlHXtplwB/iBErsgCSpj2lC7ENlxk/ImZhPmuEUD5SZn7M
         f4ykThE3lBf0sNiCR7nmqqt/0UUZht4pWfifEgWTvrtKKQm/Itd8t4gXQ8u2Mo5ZKxmN
         TpmP/P8zWnBHD6RyKcl8FIOxbIIKJmO+BA0ylRu7fz/rIK0HS4k9PY4DsWRrfblUJ0Ey
         kllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0wHEClbaoLpWxCk4WR9pAVhItlqzJGA8f6LdA8ExZCI=;
        b=I/NAxTaha+Hp4/su+Xe/yuggahZMMmknPS0UQFlWYNzdS0bXWHuOG7utYn3PzWYBYd
         PyTJuA0UcOcTpLRxYln/EiKC99xQ1T9cUTJcnshPqAKrKyNXae4FV1FYEWCRr+vF9gvK
         26yhxJ86AA6SA5q/PGbf7iMO5QzYVbfBlOj8EDZVJtGpgKJHn9Otc8d29ghgMvIY8Bak
         IiM6Nc+TLSnP4CKrf11syygfWhn+pQKHKHGXxCdVNDEaGVMvLqRpbyYVEoaEtrwlm1pJ
         Ik0GNRDP2WoUMQrtcY5BLvCkWCwkVKhodKBZqMHXgu3TUAyF+NB5wi2cQYXnVijxmied
         /Y7Q==
X-Gm-Message-State: AOAM531z8L1PmRGO/BuwTIAHT73QPko9psNDcCRPYciOzhnBPijCin8D
        4WsTFrgVM6VzKbouMQ1v+zCGtA==
X-Google-Smtp-Source: ABdhPJwkZlkeaKC5UZeuKvRNtRn5ZllA43DqXJCLMeGqLodF1naGBPSGRQuJMihMBHVvH9Crgoch8g==
X-Received: by 2002:aca:ef08:: with SMTP id n8mr18545244oih.61.1642457431848;
        Mon, 17 Jan 2022 14:10:31 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bh18sm4207675oib.24.2022.01.17.14.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 14:10:31 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>,
        Hari Nagalla <hnagalla@ti.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Peng Fan <peng.fan@nxp.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] remoteproc updates for v5.17
Date:   Mon, 17 Jan 2022 16:10:27 -0600
Message-Id: <20220117221027.1695011-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v5.17

for you to fetch changes up to cfcabbb24d5f4e52ce2e7797cbcfacd8fe932fb6:

  remoteproc: stm32: Improve crash recovery time (2022-01-03 11:40:45 -0700)

----------------------------------------------------------------
remoteproc updates for v5.17

This introduces support for controlling the Cortex R7 co-processor in
Renesas Gen3, support for R5F clusters and C71x DSPs on TI J721S2 and
compute, audio and modem subsystems on Qualcomm SM6350.

It fixes a couple of sparse errors related to memcpy_to/fromio and
corrects the kerneldoc spelling of "Return:".

The stm32 driver no longer attempts to communicate with the remote after
the firmware has crashed.

----------------------------------------------------------------
Arnaud Pouliquen (2):
      remoteproc: Fix remaining wrong return formatting in documentation
      remoteproc: stm32: Improve crash recovery time

Christophe JAILLET (1):
      remoteproc: imx_rproc: Fix a resource leak in the remove function

Hari Nagalla (4):
      dt-bindings: remoteproc: k3-r5f: Update bindings for J721S2 SoCs
      dt-bindings: remoteproc: k3-dsp: Update bindings for J721S2 SoCs
      remoteproc: k3-dsp: Extend support for C71x DSPs on J721S2 SoCs
      remoteproc: k3-r5: Extend support for R5F clusters on J721S2 SoCs

Julien Massot (5):
      soc: renesas: rcar-rst: Add support to set rproc boot address
      dt-bindings: remoteproc: Add Renesas R-Car
      remoteproc: Add Renesas rcar driver
      remoteproc: rcar_rproc: Fix pm_runtime_get_sync error check
      remoteproc: rcar_rproc: Remove trailing semicolon

Lars-Peter Clausen (1):
      remoteproc: ingenic: Request IRQ disabled

Luca Weiss (4):
      dt-bindings: remoteproc: qcom: pas: Add SM6350 adsp, cdsp & mpss
      remoteproc: qcom: pas: Add SM6350 MPSS support
      remoteproc: qcom: pas: Add SM6350 ADSP support
      remoteproc: qcom: pas: Add SM6350 CDSP support

Mark-PK Tsai (1):
      remoteproc: Use %pe format string to print return error code

Mathieu Poirier (2):
      MAINTAINERS: Removing Ohad from remoteproc/rpmsg maintenance
      Merge tag 'rcar_rst_rproc-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into rproc-next

Peng Fan (2):
      remoteproc: coredump: Correct argument 2 type for memcpy_fromio
      remoteproc: imx_rproc: correct firmware reload

Sibi Sankar (1):
      remoteproc: qcom: pas: Add missing power-domain "mxc" for CDSP

Stephen Boyd (1):
      remoteproc: qcom: pil_info: Don't memcpy_toio more than is provided

 CREDITS                                            |   5 +
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  28 +++
 .../bindings/remoteproc/renesas,rcar-rproc.yaml    |  65 ++++++
 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml       |   3 +
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       |   8 +-
 MAINTAINERS                                        |   2 -
 drivers/remoteproc/Kconfig                         |  11 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/imx_rproc.c                     |   9 +-
 drivers/remoteproc/ingenic_rproc.c                 |   5 +-
 drivers/remoteproc/mtk_scp_ipi.c                   |   4 +-
 drivers/remoteproc/qcom_pil_info.c                 |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  38 ++++
 drivers/remoteproc/rcar_rproc.c                    | 224 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_core.c               |   4 +-
 drivers/remoteproc/remoteproc_coredump.c           |   2 +-
 drivers/remoteproc/st_slim_rproc.c                 |   2 +-
 drivers/remoteproc/stm32_rproc.c                   |   2 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c          |   1 +
 drivers/remoteproc/ti_k3_r5_remoteproc.c           |   5 +-
 drivers/soc/renesas/rcar-rst.c                     |  43 +++-
 include/linux/soc/renesas/rcar-rst.h               |   2 +
 22 files changed, 442 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
 create mode 100644 drivers/remoteproc/rcar_rproc.c
