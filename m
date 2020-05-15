Return-Path: <SRS0=tiv6=65=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9558FC433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 May 2020 20:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 688FE205CB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 May 2020 20:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fToAM0ki"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgEOU4p (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 May 2020 16:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbgEOU4p (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 May 2020 16:56:45 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3830C05BD09
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 13:56:44 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id b8so1387602plm.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaKdPWICHrxeaJbcoZswmrKCh+nf/OKEqhO0mqkBL0o=;
        b=fToAM0kiMpq2dR+CH7durVFF8CEZAkoYW5Ajg9aw+A6JVRq6NUDQ/2mUM4aTJeGWhM
         igUxe2lGMdSch78wRSDUQgegsr6mtTz52bCm8HKGuW20nxKomwLEz8Nm8Rhxgv7JG4mO
         Nz88xGftWDBFbs3f6ShvzXABvkeBKzkR/JCxbOhcBEK1vhioTn4f3oCbF2zlAWxH3hK5
         fWwSDe8dq+3dht/1R/ITLr4dyAQHcs92NFKxlDE1+yG9TEb+j3erLnuv3ZWyg3J/btm5
         cg1D3nw4v6zjwBbcjVrv1fggMD/jtgcPj/m9esPp+v5nyqoQqvPlWAfAENV4+j7ykNWL
         Tb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaKdPWICHrxeaJbcoZswmrKCh+nf/OKEqhO0mqkBL0o=;
        b=TtwPw4uLijJ4TC/fRVnqxpwuwmC+mDS8TggGh+23wQS9Vp/k0Fy0JUhLEZwHudC/hz
         LyacDTEG5Z49Q2ydvf2x6g4ic3hu391u0bYehjFNQba39T1sMC6iG7wF0aEI9C9CmHiT
         I/OU/xWd3mtOeD4KDKIQu+cKlbptyHuTU3dXIFMN9SNnjQ6WAnUxqE/2Rt4Czt0vZc4M
         CE1d7ohRQx65VPtP6Gcl7aUqeoshVIumpLZaZYkmE57wNLhx7VcmHPk8yrEjLsEeHGRL
         bLsMjPc5muNefArsK7oVEWWDTcEIUYCEdAn7n/1IVb3Cq07zmOIz4nRbXQ/vPKomgkK3
         iEYA==
X-Gm-Message-State: AOAM530MK6u0kw+bAjTKqt5QX9Ur8BSTkgJWmjCNqrs/jhgGrTBLPvTi
        gDmRxDYP1VsXMxkofpqUV244ug==
X-Google-Smtp-Source: ABdhPJxH1V+FMWeIMxm/3315pKLxhQfiK+9ClID6F/TqaIZyHMTMQTS7TTEXJmC2UjSoxRPUCo1Irg==
X-Received: by 2002:a17:902:6b05:: with SMTP id o5mr5085512plk.274.1589576204401;
        Fri, 15 May 2020 13:56:44 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id z13sm2208903pjz.42.2020.05.15.13.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 13:56:43 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] rpmsg: core: Add support for name extension 
Date:   Fri, 15 May 2020 14:56:39 -0600
Message-Id: <20200515205642.13529-1-mathieu.poirier@linaro.org>
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

Applies cleanly on rpmsg-next (4f05fc33bebd).

New for V6:
- Added example on how to use the new API.

Thanks,
Mathieu


Mathieu Poirier (3):
  rpmsg: core: Add wildcard match for name service
  rpmsg: core: Add support to retrieve name extension
  sample/rpmsg: Print out RPMSG device name extension

 drivers/rpmsg/rpmsg_core.c          | 115 +++++++++++++++++++++++++++-
 include/linux/rpmsg.h               |  13 ++++
 samples/rpmsg/rpmsg_client_sample.c |   5 ++
 3 files changed, 132 insertions(+), 1 deletion(-)

-- 
2.20.1

