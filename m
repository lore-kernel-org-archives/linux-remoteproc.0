Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8E7C4361A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 16:03:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59FC4207A9
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 16:03:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731113AbgLCQDc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Dec 2020 11:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgLCQDc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Dec 2020 11:03:32 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38167C061A4E
        for <linux-remoteproc@vger.kernel.org>; Thu,  3 Dec 2020 08:02:52 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id p187so2565760iod.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Dec 2020 08:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U76MgfU/JgD+cwf4B5UzlaXPMYuwYvR1oC7emvGw4G8=;
        b=oiOjxTBbUfVKub7HvYBtz+H2+w6LVL57IVsxKMbQ8y3pY9WdOLNY0nlC/HZQXS8MSp
         X5PB4xWeCRmsU4l7XpLlARJuvr7yJRoDUg6ALpKP0VPddpFsvqsMwr4GOs9F4G359vBH
         B1KlD0zpJCI2tJl4nZ/q9WWRKtydLXnQQV5E7Afz5WvyoSIYSeTa1USd2ZxQgco2M1BW
         1RilXAHNwiOSza7z6K38ZScjfBzbOJIsPMJF/wesM8PghfOB4w1YK/o06gEAMP0IRp9l
         9B6hJfITG/ym87NwXH4SH+xSchQE9cM0y10W8iUxb/QtaURdkyV7NQkfhker7MWHvewB
         3WvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U76MgfU/JgD+cwf4B5UzlaXPMYuwYvR1oC7emvGw4G8=;
        b=BWKsS/wiuNYU5hN34eJxqkI4vJ2oDa1TcN+3Wxld09dOatuOYpknkBazc6mJgx2PiE
         C5hqRm7PT4Rr/ioCt2fnA9QkweH10qtKc3IME7S++IgDNJVKX+A7Um5E2+0/Xr4WRSOD
         KOcm4wnmiApEuTOKBY+IdV2LeUqJ5rDg4ekuRpwwyRiImRopTnURwnPJwVfaJWL1YyWh
         fLqG/jL6mgR3BRpLO5vdbzkArwis+llal6WOyWySHxeWqI3fmgf72IixsX5AQtRyHOW7
         Foi4J+xx4ofsyAHmWkJxYzTzHLCzAi1jXju1gP4RphLe6WU4j7WPeuxDJNVOP03+MjIs
         LrKg==
X-Gm-Message-State: AOAM533IGj2H+h5b2x7VKQqBFw1SjhhVLFcswsgkAvKmzuo87+hx33M/
        rXIOlzQpV5MU9PMtmqMxVgmaamTDQPLWGLCBro87Xg==
X-Google-Smtp-Source: ABdhPJxpiyo6lopYPhHWKXqqaUYjP85h1wZcdL5pGiR3z16pqaZljMXQRJDa9XEyQn3tfojsyydoTsREaslMDr2OBbs=
X-Received: by 2002:a6b:d006:: with SMTP id x6mr3631085ioa.53.1607011371369;
 Thu, 03 Dec 2020 08:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20201203030436.3583198-1-tzungbi@google.com> <20201203153338.GA1386676@xps15>
In-Reply-To: <20201203153338.GA1386676@xps15>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 4 Dec 2020 00:02:40 +0800
Message-ID: <CA+Px+wXmunYDT4LkPu8Kckc78brAZmxwmEWzoraf3yFp2M3nsA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc/mediatek: unprepare clk if scp_before_load fails
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        Pi-Hsun Shih <pihsun@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Dec 3, 2020 at 11:33 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Thu, Dec 03, 2020 at 11:04:36AM +0800, Tzung-Bi Shih wrote:
> > Fixes the error handling to unprepare clk if scp_before_load fails.
> >
> > Fixes: fd0b6c1ff85a4 ("remoteproc/mediatek: Add support for mt8192 SCP")
>
> https://elixir.bootlin.com/linux/v5.10-rc6/source/Documentation/process/submitting-patches.rst#L122

Fixed in v3[1], not sure what happened when copying the hash.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201203155914.3844426-1-tzungbi@google.com/
