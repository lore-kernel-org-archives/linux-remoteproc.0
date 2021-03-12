Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F72C433E6
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:25:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 424996500D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:25:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhCLQZB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbhCLQY4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:24:56 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF55C061761
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:24:55 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id g4so16194371pgj.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLPYqdvg9MFVJ4vgEAAqaEwpKmLxtxoj80nZ7ASbFTw=;
        b=gGBk5i2sXg8XfPoDZIGwKeoBZ3o+Q2za8Akb+lk6i8b0iin+UFMLlkD86TAEbW0h50
         2pHwcpvBWGcACPe2uapXqofrp9XZpB/dU8I/WuqJRgo6eYFOobgJ2a0bY3m3FAbamCNr
         eJmEg5cAlZO1k52FhpswI+Nm9v13XUJhTWPcW4HTr+/V/G7IcK7KLY01rSHGrJEeVqIT
         eLmlozDgdi36Ema2omChbE9LcgPpxi/8om4ytlsKXRxaxMHJhEkha2/CHv96Tx/GgU7a
         PM6fAvU2Chub8oQDDV23TXxTiJyv9WzyBlZrUiXAhMW/o7TTW3mjVK2x13MlBeikTtzo
         Wgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLPYqdvg9MFVJ4vgEAAqaEwpKmLxtxoj80nZ7ASbFTw=;
        b=F6fNgscViIIEY2OJWmanxwstCDRVvCsTkjrSItMyk4N8whivFChTjQLA/yzq+O0Q1V
         JPmSFTT1XikCCPgVmMdeFfwKuxkUl83WgZpfpzmufbuHXXF/kQLgxU07T4uXefHJLlpi
         lYl51t+vCIt3+cRO31sv9m4rPi1Nmgc4cim6qmCJwn2Hr4LqWsfbq43ay7DK70QVgiIu
         pChnZLuMo5ZGnqidzGsC+YCRWj+01JAs+JnlAhk8plQx2iHhi2fM6kYbB5vnAKW9vpO1
         vG89DKDml3+VpaJdWpBnXbEPHNApPPrK/TbdGoWFnLX1y8zKMGXEAUa4Vbmt9LRg9u3t
         ueVA==
X-Gm-Message-State: AOAM533Pv+hZS9wqDzgHripaytg8NSNXPxgx5kQqjN7Vt/YWc80uFkOk
        BGjYK8PuWvrceU6SKxFlLqxlBw==
X-Google-Smtp-Source: ABdhPJwSpltrCO0OnpdZMIJb8pP+93hJhPCIK5TilQeex21X3PF2rwNf/G+LSkE/z7+rsuAaQIu6yQ==
X-Received: by 2002:a65:5a0a:: with SMTP id y10mr12576669pgs.285.1615566295421;
        Fri, 12 Mar 2021 08:24:55 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:24:55 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 00/17] remoteproc: Add support for detaching a remote processor
Date:   Fri, 12 Mar 2021 09:24:36 -0700
Message-Id: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This set provides support for the remoteproc core to release resources
associated with a remote processor without having to switch it off. That
way a platform driver can be removed or the application processor power
cycled while the remote processor is still operating.

This revision fixes a couple of minor problems with patch 11 and 12 as
pointed out by Arnaud and the kernel test robot (detailed in the change
log for each patch).  Other patches have not changed.

Applies cleanly on rproc-next and v5.12-rc2.

Thanks,
Mathieu 

Arnaud POULIQUEN (1):
  remoteproc: stm32: Move memory parsing to rproc_ops

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

 drivers/remoteproc/remoteproc_cdev.c     |  21 +-
 drivers/remoteproc/remoteproc_core.c     | 302 ++++++++++++++++++++---
 drivers/remoteproc/remoteproc_internal.h |  10 +
 drivers/remoteproc/remoteproc_sysfs.c    |  17 +-
 drivers/remoteproc/stm32_rproc.c         | 168 ++++++-------
 include/linux/remoteproc.h               |  21 +-
 6 files changed, 401 insertions(+), 138 deletions(-)

-- 
2.25.1

