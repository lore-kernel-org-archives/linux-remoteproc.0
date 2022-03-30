Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248EDC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Mar 2022 03:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242157AbiC3DCm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Mar 2022 23:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238088AbiC3DCl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Mar 2022 23:02:41 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E165B716F
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 20:00:57 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id t21so15997479oie.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 20:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uNFWdiLOQ2v9u23dgUqa15YJW6/w3bRd0yjEQLcdcr4=;
        b=KEkWd1SMtZYZDEFRpUDIjVy5iCSaiD4jEmLknTJo/tvMItdGcgd0Seqk0fR1Yw38G/
         Dw3MJ29cY/wVuByN0WIW0PWMYR2buO8lLko4eF6KrTXa1Gp6HqY4hQHeOU9NsFpH7Tg4
         JemfCRPQDLNcAby/3LZYEjqxPjtx7hPgeTjX5xfAz7cdjxTOzU73tYloCDRDOgmgyvI7
         b9HlSp+RHrx5O1uabDDg2FIVo2gKx6qagwbitjPmzaVbAkm/g2zWYVMP+cvrUykppZV8
         f/QyIls07S6zJGF0vQROMbKcAOlaYgc4fCPQQ14Vp/ndyAgYp4NTw3a2C4Q2NeqW8So8
         spcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uNFWdiLOQ2v9u23dgUqa15YJW6/w3bRd0yjEQLcdcr4=;
        b=2Fxl8ihHuPZCKhaTeTbp4Mp2YzKEY+zl8Vc87rI8E4kncruVidpQwP8nXchhFCagxz
         bo/dl6TCnhGwvN3w1J0Gosy3sAYkONLbSJI6d5Q/XXMaly3Z1SfeTWVvNk7SBpbvaYtn
         VMVM17lXAeX1k3WFNFviga08g9zAv2kY/cTSYx1q39535LKTVNKb/3Yn5pC3FyypOe4D
         ybnHB4HMEe/FmE57wct7aK8TMwtxG7+4mEkbmlREeMua98aVdhW1lJ5e8WrBasaaynqh
         +rjCjgXldPFg4oaJOVqymngquANpSa79Tzjvl75aG2RazBeTUUQ0CDGRnxKFYOhHiPUW
         9w0g==
X-Gm-Message-State: AOAM53083AbW6kUn+tqRvJLf7dNf7S1Si+03DhZ2x7Y32gGvR1Dw0qZG
        LAYq4UGbdDSK4GLzO52GhVPjuw==
X-Google-Smtp-Source: ABdhPJyr/FlTwpxm26nw7IcuV0f5gcGfjKVOLSrHhZyUlwa0t4kDYeyyLTyzHCnFy6Qk2nKNJJXStQ==
X-Received: by 2002:a05:6808:23cc:b0:2d9:dc76:1f36 with SMTP id bq12-20020a05680823cc00b002d9dc761f36mr970242oib.292.1648609256406;
        Tue, 29 Mar 2022 20:00:56 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id y3-20020a056870e50300b000d9be6436f1sm9002789oag.29.2022.03.29.20.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 20:00:55 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Rakesh Pillai <pillair@codeaurora.org>,
        Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
        Alistair Delva <adelva@google.com>,
        Puranjay Mohan <p-mohan@ti.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [GIT PULL] remoteproc updates for v5.18
Date:   Tue, 29 Mar 2022 22:00:55 -0500
Message-Id: <20220330030055.189960-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v5.18

for you to fetch changes up to 59983c74fc42eb2448df693113bf725abbda05f9:

  remoteproc: qcom_q6v5_mss: Create platform device for BAM-DMUX (2022-03-11 20:21:56 -0600)

----------------------------------------------------------------
remoteproc updates for v5.18

In the remoteproc core, it's now possible to mark the sysfs attributes
read only on a per-instance basis, which is then used by the TI wkup M3
driver. The rproc_shutdown() interface propagates errors to the caller
and an array underflow is fixed in the debugfs interface. The
rproc_da_to_va() API is moved to the public API to allow e.g. child
rpmsg devices to acquire pointers to memory shared with the remote
processor.

The TI K3 R5F and DSP drivers gains support for attaching to instances
already started by the bootloader, aka IPC-only mode.

The Mediatek remoteproc driver gains support for the MT8186 SCP. The
driver's probe function is reordered and moved to use the devres version
of rproc_alloc() to save a few gotos. The driver's probe function is
also transitioned to use dev_err_probe() to provide better debug
support.

Support for the Qualcomm SC7280 Wireless Subsystem (WPSS) is introduced.
The Hexagon based remoteproc drivers gains support for voting for
interconnect bandwidth during launch of the remote processor. The modem
subsystem (MSS) driver gains support for probing the BAM-DMUX
driver, which provides the network interface towards the modem on a set
of older Qualcomm platforms.
In addition a number a bug fixes are introduces in the Qualcomm drivers.

Lastly Qualcomm ADSP DeviceTree binding is converted to YAML format, to
allow validation of DeviceTree source files.

----------------------------------------------------------------
Alistair Delva (1):
      remoteproc: Fix count check in rproc_coredump_write()

Allen-KH Cheng (2):
      dt-bindings: remoteproc: mediatek: Add binding for mt8186 scp
      remoteproc: mediatek: Support mt8186 scp

AngeloGioacchino Del Regno (3):
      remoteproc: mtk_scp: Use devm variant of rproc_alloc()
      remoteproc: mtk_scp: Reorder scp_probe() sequence
      remoteproc: mtk_scp: Use dev_err_probe() where possible

Bjorn Andersson (1):
      remoteproc: qcom: q6v5: Add interconnect path proxy vote

Miaoqian Lin (3):
      remoteproc: qcom: Fix missing of_node_put in adsp_alloc_memory_region
      remoteproc: qcom_wcnss: Add missing of_node_put() in wcnss_alloc_memory_region
      remoteproc: qcom_q6v5_mss: Fix some leaks in q6v5_alloc_memory_region

Puranjay Mohan (1):
      remoteproc: Introduce sysfs_read_only flag

Rakesh Pillai (3):
      dt-bindings: remoteproc: qcom: adsp: Convert binding to YAML
      dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
      remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS

Stephan Gerhold (1):
      remoteproc: qcom_q6v5_mss: Create platform device for BAM-DMUX

Suman Anna (7):
      remoteproc: wkup_m3: Set sysfs_read_only flag
      remoteproc: move rproc_da_to_va declaration to remoteproc.h
      remoteproc: Change rproc_shutdown() to return a status
      remoteproc: k3-r5: Refactor mbox request code in start
      remoteproc: k3-r5: Add support for IPC-only mode for all R5Fs
      remoteproc: k3-dsp: Refactor mbox request code in start
      remoteproc: k3-dsp: Add support for IPC-only mode for all K3 DSPs

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    |   1 +
 .../bindings/remoteproc/qcom,hexagon-v56.txt       | 140 ----------
 .../bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml  | 161 ++++++++++++
 .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 219 ++++++++++++++++
 .../bindings/remoteproc/qcom,sdm845-adsp-pil.yaml  | 160 ++++++++++++
 Documentation/staging/remoteproc.rst               |   3 +-
 drivers/remoteproc/mtk_common.h                    |   3 +
 drivers/remoteproc/mtk_scp.c                       |  90 ++++---
 drivers/remoteproc/qcom_q6v5.c                     |  21 +-
 drivers/remoteproc/qcom_q6v5.h                     |   3 +
 drivers/remoteproc/qcom_q6v5_adsp.c                | 228 ++++++++++++++--
 drivers/remoteproc/qcom_q6v5_mss.c                 |  19 +-
 drivers/remoteproc/qcom_wcnss.c                    |   1 +
 drivers/remoteproc/remoteproc_cdev.c               |   2 +-
 drivers/remoteproc/remoteproc_core.c               |   9 +-
 drivers/remoteproc/remoteproc_debugfs.c            |   2 +-
 drivers/remoteproc/remoteproc_internal.h           |   1 -
 drivers/remoteproc/remoteproc_sysfs.c              |  21 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c          | 208 +++++++++++----
 drivers/remoteproc/ti_k3_r5_remoteproc.c           | 287 ++++++++++++++++++---
 drivers/remoteproc/wkup_m3_rproc.c                 |   1 +
 include/linux/remoteproc.h                         |   5 +-
 22 files changed, 1305 insertions(+), 280 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
