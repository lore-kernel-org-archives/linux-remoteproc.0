Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFACC433E9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6AE764FC8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbhCJVKz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbhCJVK2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:28 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E5AC061574
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:28 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id w8so2330199pjf.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O30AauLLCCWTiPzSso6IXev67cYW6S1/IqV74YHyhWQ=;
        b=FriG3dvtnkFMjLm8sZa8Oy0H4+IJZKzMN2i5TDzv3wnwRbG5qEUL5LWRJ+nUqu1crD
         gAabEJXuCjclUlvnm6CKTratENHDMeCpOXDPFY21F9kuEl9KR22S9Dlen8aJfLovVJB2
         GgDI5GLcXg8RUT/EgPnnBJk2KiH6Iv7ij+0HpAa8NKkeKmlFvec6BKB6KvsiSYYvvY6a
         KJmGWwDCbCXfMF6pGVXZLxcVJAnFS/i8SR0dPsrgClKULwnJ4Zo7SGY7OaGFqgH3OTjx
         m5+8EJjfv9uJ93aPMOVIRObo2c/bKqQ9KTYR/ObcYBK4hIIsDthRK/FAIlDn85EJ78r4
         mBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O30AauLLCCWTiPzSso6IXev67cYW6S1/IqV74YHyhWQ=;
        b=pdG1GxZGimjQWWBB5AdPy0SSyYvEqCvJVsEzzwOH6FQ4ip+bLd7ziqU6bmPu1FnMkE
         jpa/rzb9M0tmZgXogeZM33rP+PU5Rghz8iMURvnRqm6tOoJK1LrxlVVQk6f9Q25C2/9i
         kq8HQN6gSQ+z0aHf09CnPt4hUkSTwTt4fr7si4/hQMu6OpU2p2LIUNy2u3FxJ5l9hcYl
         IlIU1XwdrnqzoAG6JdhN4qMs/kICivhu6j50EK1ZH1c8BCp2BuoKw3YoUbXux1c3tdXy
         KMGZ01IPHk+D/s60Re+qs5mP8jhQ3R828xTKIKZMO0N+ohiyXrJOpWWig2XOZFPQaRXq
         7oKQ==
X-Gm-Message-State: AOAM5335jcbadf+gjfnZJT7rQjFVryFSoT1Kl8HBb9S/JyMwFqMdWOtY
        VvzCwTp1is12EzTSKsvKm8ASwg==
X-Google-Smtp-Source: ABdhPJwzBTPelGYUKqKxucbpmDS8MIjmdhCIWUnH1q2YfqvTIX/zU2DFb2Q6rmajFgiuydqlckaZgQ==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id mw15mr5468392pjb.92.1615410627547;
        Wed, 10 Mar 2021 13:10:27 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:26 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 00/17] remoteproc: Add support for detaching a remote processor 
Date:   Wed, 10 Mar 2021 14:10:08 -0700
Message-Id: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
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

The main difference in this revision is patch 11/16 (in V6).  It was split
split in two part in order to simplify handling of the resource table when
the remote processor is detached or stopped.  Other modifications are
detailed in the changelog of each patch.

Applies cleanly on v5.12-rc2.

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

