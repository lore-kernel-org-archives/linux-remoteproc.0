Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B60C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Nov 2022 18:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbiKPSu2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Nov 2022 13:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234270AbiKPSuB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Nov 2022 13:50:01 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4105A682B1
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 10:46:24 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id z3so13920918iof.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 10:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AYZUkvgv+E//bTo56AFZokdkAZhaN68ZEx7c69uyIrs=;
        b=HXXNQk3IBNKuxXRBdKmiAUAKzvakYEqBKL+J6KeuAz432nElDyA8zbGEw4MYuMC466
         j9iSQPYOuUF2uqbeiYHUPEw6khrefZNMYIljvF1sQMjUyAJBesDiQF6N+y51CT3tGiE5
         bc6lRZhJnwyhkEmGL2T9BQuDlV1NFVlxHrqK5J6xbchf2WLyKrGbw+hkLLZcZML6GjOA
         kHibFjl8oNuYoKjgo5oO66GXjCh1zPp/VDbTTmzOamaaDYGCAEhAnJNUgMN5UOh7sSlZ
         dM2RHiDjL+JcpnWYEMogZKALvP9dAZKNSUK6B2ki6xqcdVoFBOBDEizMPUeQD/V9HuSA
         fUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYZUkvgv+E//bTo56AFZokdkAZhaN68ZEx7c69uyIrs=;
        b=xki+Y/epFFlPFevSFmql2NU+JAAQnuo1EVB+SfX5/wfzWiayZYmUMo5HmiQO2cdn6T
         8jJjVhTdOGNfmAAfFSNAJL4u6fZ/i67wBsuqcLUvgoBjukgGxNymNtZ6cn82r+ilpvLV
         CXb4F4v1oC8kqejMphQxz4DuEVeQ/QUQU47TOqTlqRWD09y/onK9JIj2Uq2VLaMFUuaD
         F21JBM+2x6rCHN+/bp2sCR0HF8T3xh2x9NXVCE5fB43KNTxCMS8W+Q/rztwvYdycS1Xa
         nc7z0gFeyQHPf0PzHEnUuZDcC60lhcnSBnsz2xIPakMhTHzD8m3NGRbofJTYzheK0JSq
         kAgQ==
X-Gm-Message-State: ANoB5plY6MuYe3t4uL40CBy1ULYI6JMQhUpZ/BtT9nrRq8H+XJHV9z9Y
        mDHKpmxBEFqPvUhYowZxUow8rRlXOXxSkRksGlD/K6N0h68aAQ==
X-Google-Smtp-Source: AA0mqf6TZGpptVdNhAWigAksSi1gxOQ/hskq+9kI2uZf3XitgmPcg6zp5H9zK2H9Vaii1Gupg/516hgSoeGrxy4sUzM=
X-Received: by 2002:a6b:1585:0:b0:6d5:9493:57c6 with SMTP id
 127-20020a6b1585000000b006d5949357c6mr10773669iov.15.1668624376627; Wed, 16
 Nov 2022 10:46:16 -0800 (PST)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 16 Nov 2022 11:46:05 -0700
Message-ID: <CANLsYkwPAR==WTyHiodcop9TBG=M42QUwqMUtAuo5O=5z--z2g@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for November 16th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v9 0/6] Introduce PRU remoteproc consumer API
[PATCH 0/2] Add single core R5F IPC for AM62 SoC family
[RFC PATCH 0/1] remoteproc: Enable getter for drivers that manage 2+ remotes
