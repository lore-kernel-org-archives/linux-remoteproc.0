Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BB3C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sun, 13 Mar 2022 02:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbiCMCrH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 12 Mar 2022 21:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbiCMCrF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 12 Mar 2022 21:47:05 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC029100768
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 18:45:57 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id cx5so11493991pjb.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 18:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v9ynjd7oEnonByMr2gLfZybzQggHULZvnP/5MBiCxLA=;
        b=pm3J9UBltGcItHnGW1QzmD401cX/KeMqgRjjbMmoWYurnSL2INTROZe1TRGQcYbIy3
         cCSYafN76p+rdxcSQyIM/wkEXll5fThQk3ajiEF8HiWyJJzqhmg+iOI0eng0p2MpOVuB
         xQbWkMn3Lvv4elr3TMm9/B9oqVYZs5GP12qJIHIyhivll4seIN7LpOEOJJJpjNDpN3RF
         OajhRpZQ7PTHzC+myL8B7dfqxLBJYOzR+EQZCiCtAD1R0CDH3yAE2BDwngdElaXLGvRv
         tWCdKfOu721mvlY3G4PRqkPQBdjknVcIg5t3hr/QK5zeP0Hcs0vQKOlYzOi6mAhBuD1y
         0sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v9ynjd7oEnonByMr2gLfZybzQggHULZvnP/5MBiCxLA=;
        b=109saec7Hge1VhuvDkcvuhnRKJVqh5Wq0vf1+iN46fWkaTw/3s9lvZPcub9TTuADlm
         nsFanBIEh41CbWuuZu7ad/HUlclTplbJdvCsXdltzGdulbBXPt7RCpPlRZt4fRcrZbkm
         0d3q6C5vT+Xqezfo4VIJ+oBdu0pgHy/OtUh7rg+xldveXbZemUR14vpfVj3xeeiNtj8r
         JFmGCqXZ9B/FpyKhqu+DJK1UMptl9UUpCAxTVFFpXeuLUu9ldeUuNNJ13qo/H31csTPp
         6Jgxs/AJlfTtg61bHMalqGAC1xha9fpkwLyjjpYUkns3VGZh0uNi3gy6kdzAGyqdvMc8
         8IRQ==
X-Gm-Message-State: AOAM533pnsiZrncw7JzW6lP80Xt4p7JS1aHvzXuzK1aUo+Yz8p9t9mnD
        vZt54xl2MffQ3rOHhXxKWzU=
X-Google-Smtp-Source: ABdhPJyi3pvG0RslA7HBbJAZVCuxjzctqOO624MynZk4dUtSrRRNEwTfUx8ecghosbVZscVBIGF6AA==
X-Received: by 2002:a17:902:ea0d:b0:151:df90:779f with SMTP id s13-20020a170902ea0d00b00151df90779fmr18095264plg.1.1647139557265;
        Sat, 12 Mar 2022 18:45:57 -0800 (PST)
Received: from localhost.localdomain ([2001:f40:906:26d6:1e16:d3e6:5bef:9507])
        by smtp.googlemail.com with ESMTPSA id k4-20020a17090a910400b001bd171c7fd4sm16499924pjo.25.2022.03.12.18.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 18:45:56 -0800 (PST)
From:   tim.blechmann@gmail.com
X-Google-Original-From: tim@klingt.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, Tim Blechmann <tim@klingt.org>
Subject: [PATCH 0/1 v2] rpmsg: char - treat `ENOMEM` as `EAGAIN`
Date:   Sun, 13 Mar 2022 10:45:40 +0800
Message-Id: <20220313024541.1579848-1-tim@klingt.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <Yiy42BBHJO11GGhG@builder.lan>
References: <Yiy42BBHJO11GGhG@builder.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Tim Blechmann <tim@klingt.org>

This patch should allow the use of `rpmsg_char` character devices with
libraries that do a `poll`/`write` loop and expect `EAGAIN` when sending
fails and the user space application needs to `poll` to wait for more
space to be available.
`boost::asio::write` is a notable example of a library, which implements
such a loop.


Tim Blechmann (1):
  rpmsg: char - treat `ENOMEM` as `EAGAIN`

 drivers/rpmsg/rpmsg_char.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.35.1

