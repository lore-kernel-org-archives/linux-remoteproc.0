Return-Path: <SRS0=OpIw=7V=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F48C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 18:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82A24206D5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Jun 2020 18:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gayhdD3W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgFHS3r (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Jun 2020 14:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgFHS3q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Jun 2020 14:29:46 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6911BC08C5C2
        for <linux-remoteproc@vger.kernel.org>; Mon,  8 Jun 2020 11:29:44 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u5so9135371pgn.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jun 2020 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AtU95d/mLDsHX64dIamJL4aE1CnFpCmhkczXPqyifoI=;
        b=gayhdD3WkYAf25JyFoJVQvX8QzkcwVV8CrhZ+egfs75qL6pM8D/rjtTUc4GhxDlADi
         Xl6GEczeW62hr53fEoQgfnDTFLCmdhflbgPsKPKmd9Ro87RHZeb9p0MaK3LUXi9X/hdM
         8lOC1MFwQnm8H11hBskwarSKUiQKfze1+Om2XuYZOcXDHMgbJu6Pw/N0M1TXNafuALD3
         g1/Ce0BcIbOUZk6CshWMDvY6pPKQsyqQJMRnbVh5b3Z7P3Y4cLkTsqZCGTb6eQuXlY7d
         7AH8ZFDzZNiVDcx+1DOY4bTzD/C6ON+ZVXxgwjgXJ1rVOLyeEMLMeKdT+2VTmXHRTuJQ
         pYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AtU95d/mLDsHX64dIamJL4aE1CnFpCmhkczXPqyifoI=;
        b=o9A1hM1WC2rxC2jqHLLLlWXVmOODeMMwIyDMbVoQwcj+s6sFq8gdZqSLEUcnJZQMBu
         hBRuP/1TNuKCmkXY2OJT0mWpbPPdulbGUQvMHt5fhTrt9OgGT2gldNOCq0vUbD5w5hYi
         YOOFaYZtvLCEWxfzmWpsjsy7oz3IliE/KTvXA5EEAWMEF02SseO9joE6wxNPNhnYQ197
         HO6YoO34Dgm8vnrDyg1G03+amN1lRI+O5jp3Zcq2ayDRRSGWnuyCIAw6jTeAdvI2An3i
         na60s/eQcHlSp4Jcebnp5CUiNzJSbUuUmwUC3mKEnyvSjPgi8VaID5kHV8lz+Koyenii
         /Ixg==
X-Gm-Message-State: AOAM5303IaYZTSRlijWGJ9m6cEoXfFIYKEOQs4RiaEPHSwTf9whRPiqs
        j3DU1EX5Yn6cmoVbrF6s4avjFQ==
X-Google-Smtp-Source: ABdhPJxNIelEeuAtLp2kMOuBh5SJVOKzM6Fzo8ViNbw789dGdmNVHLTndBzXaX3rJw96B9BrEsnm2Q==
X-Received: by 2002:a63:9d0e:: with SMTP id i14mr20486241pgd.55.1591640982858;
        Mon, 08 Jun 2020 11:29:42 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e12sm7932922pfj.137.2020.06.08.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 11:29:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Wang Wenhu <wenhu.wang@vivo.com>
Subject: [GIT PULL] rpmsg updates for v5.8
Date:   Mon,  8 Jun 2020 11:28:56 -0700
Message-Id: <20200608182856.2302518-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.8

for you to fetch changes up to 4f05fc33bebdc7d69259c412dd21d09751827dbd:

  rpmsg: Replace zero-length array with flexible-array (2020-05-12 15:00:48 -0700)

----------------------------------------------------------------
rpmsg updates for v5.8

This replaces a zero-length array with flexible-array and fixes a typo
in a typo in the rpmsg core.

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      rpmsg: Replace zero-length array with flexible-array

Wang Wenhu (1):
      rpmsg: fix a comment typo for rpmsg_device_match()

 drivers/rpmsg/rpmsg_core.c       | 2 +-
 drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
