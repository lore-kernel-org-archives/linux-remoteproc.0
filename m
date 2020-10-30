Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E84C00A89
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3497D206DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1KboTu9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbgJ3T5P (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5P (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:15 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E89C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:15 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id f72so551559pfa.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ew/hgsvRisXzOea/BiQC6oa3+KUQRn1pxw4aSv8Mebs=;
        b=D1KboTu9dsuM8gidff256oUqlsnwLBMzpCdteDNa+vC+x3PeMh30bdSjyi+Mj9N9ZF
         w0+OaCz5mMGDqC0P78sSwDvTmw923yIk+hRpPoyEkZIwQBc7Zg2G2UtjeCi+6YB1BWWW
         lIcvMa6W9y9LYoNHucO3MRKMZwoUKhBwtSN8J0Iw/6WlIKG4P1tvhdvnW6zEzLtq9IzR
         wD9w9h4Xnee8V/J8UNh3LO5cH0N2wBRqPWdDmDWtPb7dbD57WNkVS7FLl1kJ0auRU4GA
         z80xv3uqx7y2vEZwmiEG8uthlxvzJAJG+IoPx1/4tXTurP9JqUOV82h9h6q0s0rK2QOl
         9wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ew/hgsvRisXzOea/BiQC6oa3+KUQRn1pxw4aSv8Mebs=;
        b=aaip3HfVARrrKJIT9rfCkCTxCS+0y/HkfAqFLv05nFtiZ+DlcsjnExa8bqibR3h/56
         RwFOgZJVax3/OcURtFRSIFtXegbfiGq124m4vHxKDly49eWFfA94xng34hHq7dzG6LJz
         AWdfsNr93iKYdYxh2gyjT4dRKnY4kfiJUF/LFFwYZJWeD89XBE7ZaX5RGodmcJqidSjM
         H+ToFpdj1UdeuNm82hprGlxvl6MjmFIJjgK8otrDoIWid59GoI160cP87u04WqpUP6Pd
         am2ewwTIBQkIfWz+E9S8Y3cmwPft4CGYkD4yq8DIyZwmqtt12D8vxV/ws5TK4FMy5YSG
         RZLg==
X-Gm-Message-State: AOAM531HTpwKDGM6Y4GabUgApx+agm/zM2oWkWaOW/HxPOSDR1pnTjFl
        6SzMxmnE8oYAbdqZGUS06289bg==
X-Google-Smtp-Source: ABdhPJxeXGCpJHhAwBQHwpXqsKOZPA3IEHJpZ70ejWzeakA4FvrZf0hNNrN3tvPQjrDBXcOmKI9/NQ==
X-Received: by 2002:a17:90a:f993:: with SMTP id cq19mr4843655pjb.173.1604087834851;
        Fri, 30 Oct 2020 12:57:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:14 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 00/14] remoteproc: Add support for detaching from rproc 
Date:   Fri, 30 Oct 2020 13:56:59 -0600
Message-Id: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Following the work done here [1], this set provides support for the
remoteproc core to release resources associated with a remote processor
without having to switch it off. That way a platform driver can be removed
or the applcation processor power cycled while the remote processor is
still operating.

The only thing that changes in this revision are the last two patches where
device tree bindings to control how to handle attached remote processors have
been added.  More specifically two bindings are being proposed:

"autonomous_on_core_reboot": When rproc_cdev_release() or rproc_del() are called
and the remote processor has been attached to, it will be detached from (rather
than turned off) if "autonomous_on_core_reboot" is specified in the DT.

"autonomous_on_remote_crash": When a remote processor that has been attached to
crashes, it will be detached from if "autonomous_on_remote_crash" is specified
in the DT. It is _not_ used in this set and presented to show how I intend to 
organise things. 

I spent a fair amount of time coming up with the name for the bindings and would
welcome other ideas.  I will write a proper yaml file and CC the linux-kernel
mailing list once we have an agreement on the naming convention.

Applies cleanly on v5.10-rc1

Thanks,
Mathieu

[1]. https://lkml.org/lkml/2020/7/14/1600

Mathieu Poirier (14):
  remoteproc: Re-check state in rproc_shutdown()
  remoteproc: Remove useless check in rproc_del()
  remoteproc: Add new RPROC_ATTACHED state
  remoteproc: Properly represent the attached state
  remoteproc: Properly deal with a kernel panic when attached
  remoteproc: Add new detach() remoteproc operation
  remoteproc: Introduce function __rproc_detach()
  remoteproc: Introduce function rproc_detach()
  remoteproc: Rename function rproc_actuate()
  remoteproc: Add return value to function rproc_shutdown()
  remoteproc: Properly deal with a stop request when attached
  remoteproc: Properly deal with detach request
  remoteproc: Add automation flags
  remoteproc: Refactor rproc delete and cdev release path

 drivers/remoteproc/remoteproc_cdev.c  |  24 +++-
 drivers/remoteproc/remoteproc_core.c  | 183 +++++++++++++++++++++-----
 drivers/remoteproc/remoteproc_sysfs.c |  17 ++-
 include/linux/remoteproc.h            |  19 ++-
 4 files changed, 199 insertions(+), 44 deletions(-)

-- 
2.25.1

