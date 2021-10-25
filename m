Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC426C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 Oct 2021 23:25:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA84E60E8B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 Oct 2021 23:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhJYX1g (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 25 Oct 2021 19:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbhJYX1g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 Oct 2021 19:27:36 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949E2C061745
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 16:25:13 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id v20so8984045plo.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 16:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BCxRPsSBo8R0jXRDbha92kpcMi7WqIaXL64kHlxgtM=;
        b=MgD/EnndEWPOuol0R3MjGsSXiZA88aSW/6PB++3IIkp/se7TI+seoHpw8euen4fq37
         PxUI8rRnp8WHyvweJ4+tWP/IFhyLARQvuL9v5UL3SPm56HkkwN2K4l97zS2KkxT5udnG
         UD3ZAartUjvEn8BuTvvgJo+O7NXHWz8WciQ+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1BCxRPsSBo8R0jXRDbha92kpcMi7WqIaXL64kHlxgtM=;
        b=suAjI3V12Fnw4YSSwHPngwHJy/DAKIGh6R7Bvo7dOlUNYtB8pjr8IzW4EOyFb8tRNc
         xFnO/SKWpeGEfQVBv2KFcTa3hWdmw3A4n//FiD7BpwPIcuBQWqrFVERd3oaaFMjB54A+
         GspTphTpSylmocMasIq9fuaohQV6050zwTmR6rmpSephnkEQgwOlahgp3o9BTyCyaZXW
         HmIZpe+92h1BWg+rF0j8+H2AIr5DrDcVG586KnQehtl40GUTfNgqRxv7l4Ya6r+gl6dx
         nyeSnotM4NekYKAIi4hlnFMpJR0mgrrLc0IHkbwzNxEldhUv99j/jPxEcRcFJ596UA8U
         J3Dg==
X-Gm-Message-State: AOAM531o8amcPW/FpFSpQ0vkpceVCO6ZM+Fp87dOlYr9xBMb6Lpe4vz0
        TKZ6hhZYoAXPG2T08oMsESOBvv3wWxskdw==
X-Google-Smtp-Source: ABdhPJwk7Lw6+8vuOgOb6DAh55PLDllEn0ZIlLVSIRPNwc6Rhlwx1EdCFwcqLlQbKc4gsdT4HU5s5w==
X-Received: by 2002:a17:902:e5c6:b0:140:7e1:fa12 with SMTP id u6-20020a170902e5c600b0014007e1fa12mr19237152plf.35.1635204312783;
        Mon, 25 Oct 2021 16:25:12 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:eac2:13a5:2214:747b])
        by smtp.gmail.com with ESMTPSA id ob5sm20891535pjb.30.2021.10.25.16.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:25:12 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 0/2] Fix two kernel warnings in glink driver
Date:   Mon, 25 Oct 2021 16:24:58 -0700
Message-Id: <20211025232500.1775231-1-sujitka@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


These changes addresses kernel warnings which shows up after enabling
debug kernel. First one fixes use-after-free warning and second fixes
warning by updating cdev APIs



Sujit Kautkar (2):
  rpmsg: glink: Fix use-after-free in qcom_glink_rpdev_release()
  rpmsg: glink: Update cdev add/del API in
    rpmsg_ctrldev_release_device()

 drivers/rpmsg/qcom_glink_native.c | 5 ++++-
 drivers/rpmsg/rpmsg_char.c        | 5 ++---
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.31.0

