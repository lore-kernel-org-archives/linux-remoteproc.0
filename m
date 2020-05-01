Return-Path: <SRS0=WYtW=6P=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F87DC35280
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 May 2020 20:49:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 498F5208DB
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 May 2020 20:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0dRml1c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgEAUtx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 May 2020 16:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgEAUtw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 May 2020 16:49:52 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6845DC061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 May 2020 13:49:52 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 18so2065201pfx.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 May 2020 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hXAdaGaXRta6KT56wF80f6j0jHW2DTzetAOm3SFzuUw=;
        b=F0dRml1csjaR+wa188avvk7pYH98/mHlVJ+kep9LgokmW5Bau6dn784EMalg7EGQ6d
         p77NQw/YQyKhuYEDcn0VXKqOQJV6UAP1Mm3Ov6rSUiX+yFMq12NeuwI5FkqbJst5a1ZY
         01sCliHB+Ls2VaoeIOTGUbHXKjGeeQAi+7oWHJC82qUC0KQqKPFroKo3wevJ6MGma5Ad
         /UbusFf3qGwVp3qWYxOANv9w16f3dTG/uvySzYAiAk8UU9l6WojgN2SjDIzzcqqJED1u
         j7kfIcCGvAsqWVxAH0M3NdVt7hEHKHe3ak0wRAsdSmskQ6aboE4N+bYbJQcFx0VZttQ8
         sQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hXAdaGaXRta6KT56wF80f6j0jHW2DTzetAOm3SFzuUw=;
        b=HPLygZ26pLurbphiu9UsiOjOIJT+oZhd7X7oL6rEGc1SbPbTCp4cPpY5tDwofYUqBD
         EwPI7g1ew+cuurjbm35fzv/tRrtIUbtsyCsebcxpV3e8yyyKFdm6q54kkX1mSUN/s3fp
         mo8SyEZKP386LiR5drFW13bUmYVZadF9yUXJ5uz15ylDI1QYlix43vswu++4ZLXrMr5A
         k/PyDg/7PsK8iOg3avefR3EdNCKSnkJHBEwurxGCrhxx+r8GJMJ48Qjrfa9+3+Pk6NnO
         9L+iUnKKQnuokVL4nfQ3EGFXiaVn37g/4gskhn+IirtM6ABcuhgbHv73gFAlkf5vv8Gv
         zy4w==
X-Gm-Message-State: AGi0PuZb81RtBZLAsDJGIlE6yNmgyGqjDpiC4UjaGQhUqVtAmR1w8pbR
        Z7oSht3ZmiT2yjRMp116EFU0bw==
X-Google-Smtp-Source: APiQypIbmdKChxluHJzylRwTPSOANq6/6dM/KeHq/NarbXYmuJLee7SmapwH5kI3fP0NaWlRP2TN2Q==
X-Received: by 2002:a62:76c1:: with SMTP id r184mr5963768pfc.155.1588366191996;
        Fri, 01 May 2020 13:49:51 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 23sm497072pjb.11.2020.05.01.13.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 13:49:51 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] rpmsg: core: Add support for name extension 
Date:   Fri,  1 May 2020 14:49:48 -0600
Message-Id: <20200501204950.18629-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patchset adds the capability to supplement the base definition
published by an rpmsg_driver with a postfix description so that it
is easy to differentiate entities that use the same name service.

The first patch is the same as in v2, the second patch adds a function
helper to retrieve an rpmsg device name postfix so that clients don't
end up writing their own implementation.

Applies cleanly on rproc-next (2fb75ceaf71a).

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/patch/11429713/

Mathieu Poirier (2):
  rpmsg: core: Add wildcard match for name service
  rpmsg: core: Add support to retrieve name extension

 drivers/rpmsg/rpmsg_core.c | 112 ++++++++++++++++++++++++++++++++++++-
 include/linux/rpmsg.h      |  12 ++++
 2 files changed, 123 insertions(+), 1 deletion(-)

-- 
2.20.1

