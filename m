Return-Path: <SRS0=sj05=D5=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2864C388F7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Oct 2020 16:38:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E62B2463F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Oct 2020 16:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PR/b4oSB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2901895AbgJVQiO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Oct 2020 12:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897479AbgJVQiN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Oct 2020 12:38:13 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A23C0613CF
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2020 09:38:13 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id c5so1652218otr.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2020 09:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SsYWuy5NoBRPy7jUEIZ5+gkdCoUV88ijObMsU0llGGI=;
        b=PR/b4oSBq3kFmWmr7dgtGtkGb+4OA7VaKXGRiOS0zRbSuBLmJu7Nhqfw9sZuth/RvE
         1RCEJU7L7b/dCh0B9pGW26di7g4+Lpka8XPmB6kxmrcp1TbpxK19reC4C2CIuNkuPRX/
         78gq2HNKDvLerYp5tjVwZfQ4DC85soX1V7adT9yUHO95aZOUWrNLR7PweWZijdkBsyTu
         DO2GWbJfuJ5ayrvX8wz0FhPfvbEEbYPSqg25xe56jATECjJ0rbrLx4urpmQNxEVND8uu
         Nvc+JN9CiQF+LKhJLEsw2JkWg6lYl8yn5/ds+e0MnYCHYsTsJ2YKLw+DL4OzFfhKh2CZ
         aydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SsYWuy5NoBRPy7jUEIZ5+gkdCoUV88ijObMsU0llGGI=;
        b=jGk/ESaPW3XuKg9CuVIYD8QqsBjuskNAjZ6xA4JkkCTR9OW61hX0i9+jJTYF1qV3lw
         EtwArkj0ST9z+cGaCiA9QtGKH0F8SQS9gdzUIUspFpKbIWqmFVpOQVbO/QgimlWNS4Yo
         ksZ/GNa6f6QSkSoOkwwK+IpVUaEn2QKtRwkkv7tAeghFEbTEttgIf3S2YwFoLu3EVYnK
         lRq6VV4884is8OSKLMQSsBSw0+mN1IEEhVEG2Ma0obBkfRQpTSg3YNI9Yv4PUJeqvrF+
         AVgFUdeGp+S9IXiRaAc3SqP985y/+WVAtoPJajb/tRB4LmvL1ofJfDKvJImyBdBwo5LV
         W0Qw==
X-Gm-Message-State: AOAM533Ii64axrlDVH6rx47DvpJ88SjR9SDcAN1Sew5QH27/lIyRg45R
        lzAdhiy9acYR3xrvcahVLxUhrA==
X-Google-Smtp-Source: ABdhPJxo2SY5J5AKn+mkVnRSgOhcDBXKSLMC3YxFer9m/oYTrIXEoeRPbqh+NcW27+mG5+4f0BJiGg==
X-Received: by 2002:a9d:518e:: with SMTP id y14mr2302569otg.138.1603384692827;
        Thu, 22 Oct 2020 09:38:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t27sm521387otc.14.2020.10.22.09.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 09:38:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Colin Ian King <colin.king@canonical.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Pi-Hsun Shih <pihsun@chromium.org>
Subject: [GIT PULL] remoteproc updates for v5.10
Date:   Thu, 22 Oct 2020 11:32:46 -0500
Message-Id: <20201022163246.21438-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.10

for you to fetch changes up to 141bc97c1bfe31397b2a12e5676d0c2692c8e07e:

  remoteproc/mediatek: Remove non-standard dsb() (2020-10-15 22:14:42 -0500)

----------------------------------------------------------------
remoteproc updates for v5.10

This introduces support for the Mediatek MT9182 SCP and controlling the
Cortex R5F processors found in TI K3 platforms. It clones the
longstanding debugfs interface for controlling crash handling to sysfs.
Lastly it solves a bug where after a warm reset of Qualcomm platforms
the modem would crash upon first boot.

----------------------------------------------------------------
Alexandre Courbot (1):
      remoteproc: scp: add COMPILE_TEST dependency

Bjorn Andersson (1):
      remoteproc/mediatek: Remove non-standard dsb()

Colin Ian King (1):
      remoteproc/mediatek: fix null pointer dereference on null scp pointer

Mathieu Poirier (1):
      remoteproc: stm32: Fix pointer assignement

Pi-Hsun Shih (1):
      remoteproc/mediatek: Add support for mt8192 SCP

Rishabh Bhatnagar (3):
      remoteproc: Change default dump configuration to "disabled"
      remoteproc: Add coredump as part of sysfs interface
      remoteproc: Add recovery configuration to the sysfs interface

Sibi Sankar (2):
      remoteproc: qcom_q6v5: Assign mpss region to Q6 before MBA boot
      remoteproc: Fixup coredump debugfs disable request

Suman Anna (4):
      dt-bindings: remoteproc: Add bindings for R5F subsystem on TI K3 SoCs
      remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem
      remoteproc: k3-r5: Initialize TCM memories for ECC
      remoteproc: k3-r5: Add loading support for on-chip SRAM regions

 Documentation/ABI/testing/sysfs-class-remoteproc   |   44 +
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       |  281 ++++
 drivers/remoteproc/Kconfig                         |   15 +-
 drivers/remoteproc/Makefile                        |    1 +
 drivers/remoteproc/mtk_common.h                    |   32 +
 drivers/remoteproc/mtk_scp.c                       |  199 ++-
 drivers/remoteproc/mtk_scp_ipi.c                   |    9 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |   16 +-
 drivers/remoteproc/remoteproc_coredump.c           |    6 +-
 drivers/remoteproc/remoteproc_debugfs.c            |   23 +-
 drivers/remoteproc/remoteproc_sysfs.c              |  119 ++
 drivers/remoteproc/stm32_rproc.c                   |    2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c           | 1395 ++++++++++++++++++++
 include/linux/remoteproc.h                         |    8 +-
 14 files changed, 2087 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_r5_remoteproc.c
