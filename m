Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7591C433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 19:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AD1E64ECB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 19:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236075AbhBXTSK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Feb 2021 14:18:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236074AbhBXTSF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Feb 2021 14:18:05 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BABC061788
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Feb 2021 11:17:25 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id f3so3492307oiw.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Feb 2021 11:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I8Pi+N3izjvLgN9WH2B+20tIF94LSgSHMSIUFc4Ty8w=;
        b=SARxZf6g0HBHC74fcmKG4XIyoQrIdJHeIzfJS4Uu0lrB+H2fG4v/3UQfSF4MmXXRSF
         Cid7wLKki5Y+qVLMyZQTvB7a04R2PP9huqmtzYQwX04XdbgZ3sMXU2y82pkb3hxBtGW1
         xvRoh6IxMJFhI4K44E9joQLN1kGoDREF2KUZjPekCVKCl0WKZvjeHcWfu/1n9J/If3+s
         u67/kBxLg0gEm2aBmfRQSIbuDIlSfxvFm0aGfDnPPxQ3GZPZRVdaLQ4WxrlYTPsQET5k
         lAqK9aeQ1DBjs0SlD6OH9dhncGs4RnkNsBw4I1M04v+uqgJjnkZ9CKPrzGJDdIRlMVTy
         HisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I8Pi+N3izjvLgN9WH2B+20tIF94LSgSHMSIUFc4Ty8w=;
        b=NzZwrxHhNLJv6leDMiHSpX+mYL/40qd8/iXEPG96DwrE7rbA3GUJO3AndLYpHkRn8i
         Xecz5yiO4bW9z1HEbEujLJKQsCnnRviHgAIEHou8x6wFnAgsobrDp7DJqtuN5yAJGG8I
         lhGqy0bU96xPEPIBwEYXckTZguehKu+SNHzZ+VX0XNz/a/w39qBAGNGO2CxiXvfK9MjF
         lfRJtswEdkDoswqQc7mRZMEL3G7H/hls90QtxcSZQgAooIqrWhbNi+jMcTsmEgEoeQx0
         1mnqIZlOW5SliRkKkUN6W9GY7NQfq2l3ehGEj3Kztm5Upf3x+huyPqslHO/Ogvfm3tEx
         2Shg==
X-Gm-Message-State: AOAM5330TQb8k1W4ozo60IFilSPuZW6S3o7t3vfUT9xUWeVoVVfo9vdx
        7MqbiE4Qe7TDKZ8Wp440Ph+SHw==
X-Google-Smtp-Source: ABdhPJxXMwpDIdouaiwB6M5ABCQNrEngwDXUvkUo+X1fy9IfVUb7bPHGFeWnkdBzdQrygyBntDwzrA==
X-Received: by 2002:aca:b286:: with SMTP id b128mr3751243oif.126.1614194245064;
        Wed, 24 Feb 2021 11:17:25 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h2sm575793otn.43.2021.02.24.11.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 11:17:24 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [GIT PULL] rpmsg updates for v5.12
Date:   Wed, 24 Feb 2021 13:17:23 -0600
Message-Id: <20210224191723.192631-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.12

for you to fetch changes up to 3e35772bc1e42287c8f4c70055deb5e3f5a3e8b5:

  rpmsg: glink: add include of header file (2021-01-05 22:22:40 -0600)

----------------------------------------------------------------
rpmsg updates for v5.12

This fixes two build issues in the GLINK driver and corrects some
kerneldoc in the same.

----------------------------------------------------------------
Alex Elder (2):
      rpmsg: glink: fix some kerneldoc comments
      rpmsg: glink: add include of header file

Bjorn Andersson (1):
      rpmsg: glink: Guard qcom_glink_ssr_notify() with correct config

 drivers/rpmsg/qcom_glink_ssr.c   | 17 +++++++++--------
 include/linux/rpmsg/qcom_glink.h |  8 ++++++--
 2 files changed, 15 insertions(+), 10 deletions(-)
