Return-Path: <SRS0=LqBZ=74=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3CCC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Jun 2020 21:39:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 899BA208C3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Jun 2020 21:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="az2M5soa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgFOVjC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Jun 2020 17:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgFOVjB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Jun 2020 17:39:01 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869BCC08C5C2
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2020 14:39:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id s88so471531pjb.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2020 14:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/k/xIvyaQ1ob1Iqs7BAGJ9OdBOtIbRdxPdyH1m1qNoY=;
        b=az2M5soaRvu79qQJWtcNdWb58eN0EYi4uHLIoFB8qhPelQulpBBixbAVGL5QHQ3bIK
         PjBEpVS4J22TOHDgkz+7Z1uMvtI0H8A+tn8gXUZ/MFA2k/yVcTzcUJqFW2Og6cXAtSgJ
         PyDy8TAS0uduA+vK6t4zJIaIbpG5XM/3YQELfenjExnfbxafx0/i5c94nk6CS0jnnr/Z
         z8gYV45f23kZv9Twyd36hfrWWxjbgPvmUkDxQHtLGD/9nKYkeB9ZuHh+KRcelFjxAisc
         kkwQoFDV1oMZ9bsfkURxD0r0Hxdu1E4Znh2ZgCWUyl6Ty3+8B4oARFBmYrin3iwyxEsQ
         OL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/k/xIvyaQ1ob1Iqs7BAGJ9OdBOtIbRdxPdyH1m1qNoY=;
        b=VHu9j2rIOrbj8v109SYQQEOVe+lNagquUqjGiShTwyKQunERCDG+HnUe9yV4H2y6B6
         gtpv6AsH0G1HLqvebiBkKi+Eo9aA2A5r4WRQeNTrfkcEevZdyjvAZjoHxvBRY5xUzwCZ
         dL3CL71E5MzeNZnscDQB9eBx46GCpUmrgjP0QJlCGu/PpSXB4eDuvLMCt9/FZ11/o+je
         FGku+Q+8XRy1OXaJSNHdeeBOCA/rQgJ00jb1+GDj5C6ZQb3TaK0fyiij/lksDrZtivtE
         lIMCuNG17+krGkF7qZ4K40b+ppiRLHPfX68e6jhbsneDRjttCd3iAyu4YxFP+umStfZd
         5EKw==
X-Gm-Message-State: AOAM532qBPg2l6C/TktQYHaWysneCoL3X8/Jt6s4LYXwtosv8Rc3Ad/I
        SG/zmdcXEhJzgNtwKiwYmFT1jQ==
X-Google-Smtp-Source: ABdhPJyKEXXiTlSrUGpV4NfoDP1vLaAUJCXWcpA8QSf63Zeyqz1YSebN2m+2zf5S0jlWP8LuOntc0A==
X-Received: by 2002:a17:90b:1081:: with SMTP id gj1mr1252369pjb.77.1592257140968;
        Mon, 15 Jun 2020 14:39:00 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o186sm8708227pgo.65.2020.06.15.14.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 14:39:00 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] rpmsg: core: Add support for name extension
Date:   Mon, 15 Jun 2020 15:38:56 -0600
Message-Id: <20200615213859.443152-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patchset adds the capability to supplement the base definition
published by an rpmsg_driver with a postfix description so that it
is easy to differentiate entities that use the same name service.

Applies cleanly on v5.8-rc1 (b3a9e3b9622a).

New for V7:
- Added Suman's acked-by.
- Deleted extra newline in patch 02.
- Avoided line break in strncmp() in patch 02.

Thanks,
Mathieu

Mathieu Poirier (3):
  rpmsg: core: Add wildcard match for name service
  rpmsg: core: Add support to retrieve name extension
  sample: rpmsg: Print out RPMSG device name extension

 drivers/rpmsg/rpmsg_core.c          | 113 +++++++++++++++++++++++++++-
 include/linux/rpmsg.h               |  13 ++++
 samples/rpmsg/rpmsg_client_sample.c |   5 ++
 3 files changed, 130 insertions(+), 1 deletion(-)

-- 
2.25.1

