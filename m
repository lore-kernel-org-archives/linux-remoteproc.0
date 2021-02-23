Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA8FC433E6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ACCB64FC1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbhBWXhb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbhBWXf7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:35:59 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888FFC06174A
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:18 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d16so25920plg.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SHL5XDAIKj8MSKK6Z+vTePkWS1Indwf4AZBtBlAyi64=;
        b=KBWghAnPjbcmDLzHTQQy4PpOC2g3Spr7nGT1p3HLpvMZVu/ke5G5tEf+tkyMc7Jboo
         ivAxl5EHjttgPBa0UmYIe89AYRDLeNi1P1/6VSDFCe9evBg1cDyxEVPs7emDJyHs6Dhr
         R5dDFRqgP5Nf6mMqpXqi5F4NB5cbmGDJgocrQ2ctRzoZZwV7gVECqgVkygYJRgxfvBce
         1t4RBo86MY51bj/RQMz5FbCfBihWCsacxOEawPxkbsoYWQE25jThNUNPaAZRPwkcWb1a
         JVQ4vTSqwknbEVP5C0U6jz9PRge9UhGF1pUZ7B9R7tu2MR21gF7hPAxRardks5lf7P/w
         9V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SHL5XDAIKj8MSKK6Z+vTePkWS1Indwf4AZBtBlAyi64=;
        b=Tnf5QHD7R2Q6+JlPUz5tKcja+1X2an3cfc11kJ09MjYU+qfhYCClSHO1ufQWPKTOeB
         TFAGOIMHtOB80ntprq0xuIPtO1gkuDoRs5Vlyfsce52yrrBYSUyrceERrZYaRj1IUi6L
         /KcvPFfW+9Z/WQ81Au1QxzJbu6pRxpYyjotgEasdR3BxhkcwJD6Q/oh6bjquaxEWHTiz
         xRpk3aoLxVicgpsXllnak7k0KeOFgxOqoY/rS7FD9Xh7BMNLou5jSqZob8yqOI1/BZO0
         r1/Rvu7JUJrfGSATOIew9/XPwIkUVd1hBWqSAmfNMSWTdHewxmqBn1EgJmC68hkQ+SCO
         FX/w==
X-Gm-Message-State: AOAM532dySu8bTcMIob4iRdRy9EkJ1DO06nrubeksCtWMvBXsxdb7H2I
        FyftovHzJBAU+YMLX+S/5j6pQw==
X-Google-Smtp-Source: ABdhPJwifdDLsrVJqk5R17vjdzA8fqNWlkWyr2tPKLL5zlQQ5O9oaEDIxoxVXdeN+c91+tEOj63K9Q==
X-Received: by 2002:a17:90a:ae14:: with SMTP id t20mr1194420pjq.90.1614123317354;
        Tue, 23 Feb 2021 15:35:17 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:16 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 00/16] remoteproc: Add support for detaching a remote processor
Date:   Tue, 23 Feb 2021 16:34:59 -0700
Message-Id: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
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

Modifications for this revision are detailed in the changelog of each patch
but the main difference is that going from RPROC_RUNNING -> RPROC_DETACHED
is no longer supported to avoid dealing tricky resource table issues.

Applies cleanly on rproc-next (e8b4e9a21af7).  I will rebase on 5.12-rc1 when it
comes out next week.

Thanks,
Mathieu

Arnaud POULIQUEN (1):
  remoteproc: stm32: Move memory parsing to rproc_ops

Mathieu Poirier (15):
  remoteproc: Remove useless check in rproc_del()
  remoteproc: Rename function rproc_actuate()
  remoteproc: Add new RPROC_ATTACHED state
  remoteproc: Properly represent the attached state
  remoteproc: Add new get_loaded_rsc_table() to rproc_ops
  remoteproc: stm32: Move resource table setup to rproc_ops
  remoteproc: Add new detach() remoteproc operation
  remoteproc: Introduce function __rproc_detach()
  remoteproc: Introduce function rproc_detach()
  remoteproc: Properly deal with the resource table when attached
  remoteproc: Properly deal with a kernel panic when attached
  remoteproc: Properly deal with a start request when attached
  remoteproc: Properly deal with a stop request when attached
  remoteproc: Properly deal with a detach request when attached
  remoteproc: Refactor rproc delete and cdev release path

 drivers/remoteproc/remoteproc_cdev.c     |  21 +-
 drivers/remoteproc/remoteproc_core.c     | 263 ++++++++++++++++++++---
 drivers/remoteproc/remoteproc_internal.h |  10 +
 drivers/remoteproc/remoteproc_sysfs.c    |  17 +-
 drivers/remoteproc/stm32_rproc.c         | 168 +++++++--------
 include/linux/remoteproc.h               |  21 +-
 6 files changed, 362 insertions(+), 138 deletions(-)

-- 
2.25.1

