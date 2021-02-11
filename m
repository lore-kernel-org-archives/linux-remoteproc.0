Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D21C43381
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:47:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9488A64E42
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:47:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhBKXr5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:47:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbhBKXrJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:47:09 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980B6C061786
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:29 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id t29so4709574pfg.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EkrytJ9LzBZQeMfRS4wLQprxHkYkItxpKGh4h54tQFM=;
        b=Oc6IEf1NnavzFlmiOhR4OVBYD33muPM4q1z/iKRkQxt10gl+5ZoYuYo4/r1DKNyJmr
         MFC0GIIU2/Iu+3D3DukC25EvTRCx8CmpnbdMRW7aEuF9TdVJ3uj2rBtpM4kC/9MpiVcJ
         iI9iz8yoavYbxR25JET4iDGqfdYM3adlNpGNfckZQerBIq5BTRSvZSZWFbP17KG7WaIS
         wpLXhupm8CNI5EEgwCqu4fQ5gNIkAFg0znnBU5Nl29aNqia6lr7UhMAWXbHD7xNqldgI
         PZNGT0D7eXzdcWvMy8bsun/XvdOeU2Ir0wXRc4XHe07F1CakLCO+D6Sy/b9g4i8ynBne
         Jmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EkrytJ9LzBZQeMfRS4wLQprxHkYkItxpKGh4h54tQFM=;
        b=qXIMDEaNqPOdLb4VRtTnn7h+CYHbatz1F35sTB/sG4yKCVKmS5cm2cXp3Em4S7yjqe
         nDHNlybieJqliziFQyq/LNf0FkZs517IceO63iqv31JT/47ALNoCKGoOpJLQeIRKqU+B
         NwIR2426NvEfRZhfKR/clrhCVgwhHe838HjLST1vvQsYcPKCiNJOQov9U9sv/MPV8qa2
         KMk73VJFJz+QATXSU+/PMCVAgCOzp+wmtLAv6CSVok1ybTWz50AVD2fnbcUyH3jb6b1v
         NLj3qjDiPAXPYfAwk5RlR4vKKAzy4tjdDapDfAaYQqU/mHDakcHkC5HaK/Lo5YIodnh6
         jFMQ==
X-Gm-Message-State: AOAM532c4f/Pnkv2jlK15lEz/Deofu2tirIMp0DH9yQ3ZyE9+mGb/W2b
        ksGvk1ZtKDGD8C6lTx8s6DZIPQ==
X-Google-Smtp-Source: ABdhPJy63E2JbTR7H47TOu+Msa/uRIC/V7BtGQA5Rn57FaeDRQtdVEqLTQ2Axcs0hq87m/0HtRYufQ==
X-Received: by 2002:a63:ff57:: with SMTP id s23mr563333pgk.90.1613087189038;
        Thu, 11 Feb 2021 15:46:29 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:28 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 00/19] remoteproc: Add support for detaching a remote processor 
Date:   Thu, 11 Feb 2021 16:46:08 -0700
Message-Id: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Following the work done here [1], this set provides support for the
remoteproc core to release resources associated with a remote processor
without having to switch it off. That way a platform driver can be removed
or the application processor power cycled while the remote processor is
still operating.

Modifications for this revision are detailed in the changelog of each patch but
the main enhancement is the setup of a clean resource table when a remote
processor is detached from.

I have tested scenarios where the processor is detached and re-attached when
booted from an external entity and the remoteproc core.  I was also able
to confirm that removing the platform driver of a detached remote processor
works.  Re-attaching the remote processor after re-inserting the platorm driver
also works properly.

Applies cleanly on rproc-next (43d3f2c715ce). 

Thanks,
Mathieu

Arnaud POULIQUEN (1):
  remoteproc: stm32: Move memory parsing to rproc_ops

Mathieu Poirier (18):
  dt-bindings: remoteproc: Add bindind to support autonomous processors
  remoteproc: Re-check state in rproc_shutdown()
  remoteproc: Remove useless check in rproc_del()
  remoteproc: Rename function rproc_actuate()
  remoteproc: Add new RPROC_ATTACHED state
  remoteproc: Properly represent the attached state
  remoteproc: Add new get_loaded_rsc_table() to rproc_ops
  remoteproc: stm32: Move resource table setup to rproc_ops
  remoteproc: Add new detach() remoteproc operation
  remoteproc: Introduce function __rproc_detach()
  remoteproc: Introduce function rproc_detach()
  remoteproc: Properly deal with the resource table
  remoteproc: Add return value to function rproc_shutdown()
  remoteproc: Properly deal with a kernel panic when attached
  remoteproc: Properly deal with a stop request when attached
  remoteproc: Properly deal with a start request when attached
  remoteproc: Properly deal with detach request
  remoteproc: Refactor rproc delete and cdev release path

 .../bindings/remoteproc/remoteproc-core.yaml  |  27 ++
 drivers/remoteproc/remoteproc_cdev.c          |  32 +-
 drivers/remoteproc/remoteproc_core.c          | 307 ++++++++++++++++--
 drivers/remoteproc/remoteproc_elf_loader.c    |  24 +-
 drivers/remoteproc/remoteproc_internal.h      |  10 +
 drivers/remoteproc/remoteproc_sysfs.c         |  20 +-
 drivers/remoteproc/stm32_rproc.c              | 168 +++++-----
 include/linux/remoteproc.h                    |  27 +-
 8 files changed, 465 insertions(+), 150 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml

-- 
2.25.1

