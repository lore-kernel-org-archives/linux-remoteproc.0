Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75624C433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 15:03:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52F6A610E9
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 15:03:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhEDPEt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 11:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhEDPEt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 11:04:49 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A75BC06174A
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 08:03:54 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id b5-20020a9d5d050000b02902a5883b0f4bso8493590oti.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 May 2021 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7RqrxjKfz082JmA0I2mWOlHPLVs3icQWS1e8qkoLqQM=;
        b=HD9OR3yw/FoECz3QKw12l5ZHgUH6xdDcATLTz7Cv/+chyusGtyn/5ldMX8sEqQ4n0m
         qhWtbT1L4/VKvOl1JQ4XOO+2JEB+eAzr/XIbO5BeUr3Uq4r2Dv7uCMmMleAdr7rFgqZh
         /6Hiw/0LcMFGLe6mHAlxo/ARqkKV6mfqToJrkpI9T7iokQ18zevtnvkT4WU1pUEYzZVR
         1Rk7rzUNZVTBwfDTQ3AqE7T2cK7z/hL72o+JDgvXqb4iiA9oMAcWqhgbBPlgorXptp9f
         oaADbzoU7vgvsPgcNBfmB4opfz1fu3XC6vATq13Cho7dDE5iHqgAuuVN4ijTxRY9RtFh
         yuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7RqrxjKfz082JmA0I2mWOlHPLVs3icQWS1e8qkoLqQM=;
        b=ZUGZXpUQqObuO3TVBOkBCgUCIDESSvKKuxPUBu0apCE54r3RrBmUmx1orpEm31ynMK
         Ilt9U6/NTlyNsQwxDMO/rqqT7/4SKiKc5si/rYdRnC+eLi0WwTIBQfptdSh/VO5/Rvqg
         IeJYe5w7ooFqRSvh4lrKU3CjUvqEWcNtqHu6IySU0yG9XlyWpJCs2SmUJ2I3zKrSlANb
         7QCtDqvjSkiFKdi+bWKc4yrjgpOA8TuRrG1qo3XxBNWWyh1hXpdDmmD8GLnAz909cpEL
         JsAICMnzap6YhCCmpiwzm3J1UR38uWuit1aHSQ3YTXXXovTkOCrLVNTqUC1K6TV7dXyx
         5+1Q==
X-Gm-Message-State: AOAM531XbszxnoEWijG+LdSzQWbpZ8SxFkdj76L5ZlzHflXA/oxAhonw
        GdnAh5CBfkKweX0evfUNhJ9shg==
X-Google-Smtp-Source: ABdhPJxKgBddPKK3LgQdy9pkUQ7KVnV0z2VcxR0ksHF2TG7WRsPfDYQvzHDL/4V7EnP/Sza3NbWGfw==
X-Received: by 2002:a9d:4e04:: with SMTP id p4mr8212021otf.311.1620140633754;
        Tue, 04 May 2021 08:03:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r189sm728490oif.8.2021.05.04.08.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 08:03:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Peng Fan <peng.fan@nxp.com>,
        Govind Singh <govinds@codeaurora.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Suman Anna <s-anna@ti.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jindong Yue <jindong.yue@nxp.com>,
        Junlin Yang <yangjunlin@yulong.com>,
        Raghavendra Rao Ananta <rananta@codeaurora.org>,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [GIT PULL] remoteproc updates for v5.13
Date:   Tue,  4 May 2021 10:03:51 -0500
Message-Id: <20210504150351.1468612-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.13

for you to fetch changes up to edf696f26855788cdff832ac83319e1f2aafcc90:

  remoteproc: stm32: add capability to detach (2021-04-14 09:59:21 -0500)

----------------------------------------------------------------
remoteproc updates for v5.13

This adds support to the remoteproc core for detaching Linux from a
running remoteproc, e.g. to reboot Linux while leaving the remoteproc
running, and it enable this support in the stm32 remoteproc driver.

It also introduces a property for memory carveouts to track if they are
iomem or system ram, to enable proper handling of the differences.

The imx_rproc received a number of fixes and improvements, in particular
support for attaching to already running remote processors and i.MX8MQ
and i.MX8MM support.

The Qualcomm wcss driver gained support for starting and stopping the
wireless subsystem on QCS404, when not using the TrustZone-based
validator/loader.

Finally it brings a few fixes to the TI PRU and to the firmware loader
for the Qualcomm modem subsystem drivers.

----------------------------------------------------------------
Arnaud POULIQUEN (1):
      remoteproc: stm32: Move memory parsing to rproc_ops

Arnaud Pouliquen (2):
      dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for detach
      remoteproc: stm32: add capability to detach

Bjorn Andersson (3):
      remoteproc: qcom_q6v5_mss: Provide errors for firmware-name parsing
      remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF loader
      remoteproc: qcom: wcnss: Allow specifying firmware-name

Govind Singh (4):
      remoteproc: qcom: wcss: populate hardcoded param using driver data
      dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for QCS404
      remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
      remoteproc: qcom: wcss: explicitly request exclusive reset control

Jindong Yue (1):
      remoteproc: core: Remove casting to rproc_handle_resource_t

Junlin Yang (1):
      remoteproc: qcom: wcss: Remove unnecessary PTR_ERR()

Manivannan Sadhasivam (2):
      dt-bindings: remoteproc: qcom: pas: Add binding for SDX55
      remoteproc: qcom: pas: Add modem support for SDX55

Mathieu Poirier (16):
      remoteproc: Remove useless check in rproc_del()
      remoteproc: Rename function rproc_actuate()
      remoteproc: Add new RPROC_ATTACHED state
      remoteproc: Properly represent the attached state
      remoteproc: Add new get_loaded_rsc_table() to rproc_ops
      remoteproc: stm32: Move resource table setup to rproc_ops
      remoteproc: Add new detach() remoteproc operation
      remoteproc: Introduce function __rproc_detach()
      remoteproc: Introduce function rproc_detach()
      remoteproc: Properly deal with the resource table when detaching
      remoteproc: Properly deal with the resource table when stopping
      remoteproc: Properly deal with a kernel panic when attached
      remoteproc: Properly deal with a start request when attached
      remoteproc: Properly deal with a stop request when attached
      remoteproc: Properly deal with a detach request when attached
      remoteproc: Refactor function rproc_cdev_release()

Peng Fan (14):
      dt-bindings: remoteproc: convert imx rproc bindings to json-schema
      dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
      remoteproc: introduce is_iomem to rproc_mem_entry
      remoteproc: add is_iomem to da_to_va
      remoteproc: imx_rproc: correct err message
      remoteproc: imx_rproc: use devm_ioremap
      remoteproc: imx_rproc: add i.MX specific parse fw hook
      remoteproc: imx_rproc: support i.MX8MQ/M
      remoteproc: imx_rproc: ignore mapping vdev regions
      remoteproc: imx_proc: enable virtio/mailbox
      remoteproc: imx_rproc: add missing of_node_put
      remoteproc: imx_rproc: enlarge IMX7D_RPROC_MEM_MAX
      remoteproc: imx_rproc: move memory parsing to rproc_ops
      remoteproc: imx_rproc: support remote cores booted before Linux Kernel

Raghavendra Rao Ananta (1):
      remoteproc: sysfs: Use sysfs_emit instead of sprintf

Suman Anna (3):
      remoteproc: pru: Fixup interrupt-parent logic for fw events
      remoteproc: pru: Fix wrong success return value for fw events
      remoteproc: pru: Fix and cleanup firmware interrupt mapping logic

Wei Yongjun (4):
      remoteproc: imx_rproc: fix return value check in imx_rproc_addr_init()
      remoteproc: qcom: wcss: Fix return value check in q6v5_wcss_init_mmio()
      remoteproc: qcom: wcss: Fix wrong pointer passed to PTR_ERR()
      remoteproc: imx_rproc: fix build error without CONFIG_MAILBOX

Yang Li (1):
      remoteproc: pru: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  90 ++++
 .../devicetree/bindings/remoteproc/imx-rproc.txt   |  33 --
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |   4 +
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  15 +
 .../bindings/remoteproc/qcom,wcnss-pil.txt         |   6 +
 .../bindings/remoteproc/st,stm32-rproc.yaml        |  11 +-
 drivers/remoteproc/Kconfig                         |   7 +-
 drivers/remoteproc/imx_rproc.c                     | 322 ++++++++++-
 drivers/remoteproc/ingenic_rproc.c                 |   2 +-
 drivers/remoteproc/keystone_remoteproc.c           |   2 +-
 drivers/remoteproc/mtk_scp.c                       |   6 +-
 drivers/remoteproc/omap_remoteproc.c               |   2 +-
 drivers/remoteproc/pru_rproc.c                     |  47 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  26 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  19 +-
 drivers/remoteproc/qcom_q6v5_wcss.c                | 599 +++++++++++++++++++--
 drivers/remoteproc/qcom_wcnss.c                    |  10 +-
 drivers/remoteproc/remoteproc_cdev.c               |  21 +-
 drivers/remoteproc/remoteproc_core.c               | 337 ++++++++++--
 drivers/remoteproc/remoteproc_coredump.c           |   8 +-
 drivers/remoteproc/remoteproc_debugfs.c            |   2 +-
 drivers/remoteproc/remoteproc_elf_loader.c         |  21 +-
 drivers/remoteproc/remoteproc_internal.h           |  12 +-
 drivers/remoteproc/remoteproc_sysfs.c              |  21 +-
 drivers/remoteproc/st_slim_rproc.c                 |   2 +-
 drivers/remoteproc/stm32_rproc.c                   | 205 +++----
 drivers/remoteproc/ti_k3_dsp_remoteproc.c          |   2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c           |   2 +-
 drivers/remoteproc/wkup_m3_rproc.c                 |   2 +-
 include/linux/remoteproc.h                         |  25 +-
 31 files changed, 1569 insertions(+), 294 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
