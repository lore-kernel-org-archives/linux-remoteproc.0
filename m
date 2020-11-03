Return-Path: <SRS0=eTbm=EJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4527C00A89
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 02:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E1172225E
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 02:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HudkQ9py"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgKCCB1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 21:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgKCCB1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 21:01:27 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCFCC0617A6;
        Mon,  2 Nov 2020 18:01:26 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id 13so11220409wmf.0;
        Mon, 02 Nov 2020 18:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QF7fWW6LYmjF3q2ZDZw47fAtapYJiUxs//4vM9wE3p8=;
        b=HudkQ9pyZiiSUk4r4pe3Sufiw6yBkZUJzUWcnB/9jv9VClMUrPuML9ZhkWvMxOQBsb
         9XorXYzdjpg3OE/97k6kPttePIfsqyFu4haSBP2rBET5Cuyk/H8TFnF4eult51u/HUVt
         cE8rW4vqTX8ZKeciJ2RudGKFRhfXyELGpXubaRDJdy+m1QXK2cBTF3dCRXX1+qNLBfuT
         Qw3wrT3Tsb0WNOW2nKLK+Et9Z4qteQQhkcZFYVu5uQynM4bIhPRR4Veq86YPtqCIfXgk
         IiK73lZNI5Ca4i/FCjtvcR2kNYewSGVLl0ADqyIP03gQQKLrH7+E5iJvL6cCUXx4WgFo
         CYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QF7fWW6LYmjF3q2ZDZw47fAtapYJiUxs//4vM9wE3p8=;
        b=m9uSDBw0ZKSCm9TFSwKuoF6ESf1vcPpaxP0Tr4Pj1/iGwo76jDeElMGCy6wuvHoomu
         TggUiRFpXvOrIrEDdNuHpNh3m9njtYk70sn/8vGP77HIem3/lznW1nwVYx67w40EFygL
         iXgP9EPy8xvgareSxdModDWm7RT3VktInPBQJWDkdj/sPcY5p1pRW+AQmjfgoaW1lHJF
         iExeEUDRUzHxC/evtZ5Iy+c7eNWDLKAjhCEOqjj019gLj4hDLQJ1iWgpOICZJ2KL5Wnc
         K9F8Ged0orEdt3iLN4MK1c8Tk0QTw8Gmj+oj4kldc/tTzGJTCjSYQBszGAJhKzylRf9q
         7dRg==
X-Gm-Message-State: AOAM532PFQfHUw4got3Ntgl7uOWqIOPKd7XaMy9xx6O4eWS3eYlfT+0O
        RQn1P0rfR5FVCeFDDLPR9csm+P62nyir0rpP0Zk=
X-Google-Smtp-Source: ABdhPJwWiK4U8R/rj0RCA2Np4AGCEP5D0qYN+yUx6BBuf+jxaJUJ+SDdgDV8X7fMjTPWerQ2ukcdRtunUIHu1/tRx+4=
X-Received: by 2002:a1c:7916:: with SMTP id l22mr867162wme.3.1604368885616;
 Mon, 02 Nov 2020 18:01:25 -0800 (PST)
MIME-Version: 1.0
References: <20201030034654.15775-1-zhang.lyra@gmail.com> <20201030034654.15775-2-zhang.lyra@gmail.com>
 <CADBw62oQj+K_-nyoZyMJSQ6VaqcNHbX9gbyLEzV9+Od1cVmC5A@mail.gmail.com> <20201102235824.GB223412@builder.lan>
In-Reply-To: <20201102235824.GB223412@builder.lan>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Tue, 3 Nov 2020 10:00:49 +0800
Message-ID: <CAAfSe-vFxpQnkV95ySZpkzqhFLN2gh0YHSYuVvQpej0U7F3dow@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwspinlock: sprd: fixed warning of unused variable 'sprd_hwspinlock_of_match'
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Baolin Wang <baolin.wang7@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 3 Nov 2020 at 07:58, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Mon 02 Nov 17:34 CST 2020, Baolin Wang wrote:
>
> > On Friday, October 30, 2020, Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> > > From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > >
> > > The macro function of_match_ptr() is NULL if CONFIG_OF is not set, then
> > > Clang compiler would complain the of_device_id variable is unused.
> > >
> > > But using of_match_ptr() is space saving, for this case, the unused
> > structure
> > > 'sprd_hwspinlock_of_match' would be not built into symbol table if
> > CONFIG_OF
> > > is not set, probably depends on the compiler though.
> > >
> > > So adding __maybe_unsed seems a good approach to fix this warning.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Fixes: d8c8bbbb1aba ("hwspinlock: sprd: Add hardware spinlock driver")
> > > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > > ---
> >
> > I'd like to remove this wrapper, and just depend on the CONFIG_OF. But I
> > have no objection for this patch.  So
> > Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
> >
>
> As noted on the first line of the probe function, this driver isn't
> going to do anything when CONFIG_OF is disabled - and I don't think we
> should worry too much about space savings during COMPILE_TEST.
>
> So I would prefer that we simply drop the of_match_ptr()

Ok, that's what the v1 does.
Bjorn, could you please pick up the 1st patch in v1 [1]?

Thanks,
Chunyan

[1] https://lkml.org/lkml/2020/10/26/87


>
> But I believe that's what you're saying as well Baolin?
>
> Regards,
> Bjorn
>
> >
> > >  drivers/hwspinlock/sprd_hwspinlock.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hwspinlock/sprd_hwspinlock.c
> > b/drivers/hwspinlock/sprd_hwspinlock.c
> > > index 36dc8038bbb4..4c63e2546064 100644
> > > --- a/drivers/hwspinlock/sprd_hwspinlock.c
> > > +++ b/drivers/hwspinlock/sprd_hwspinlock.c
> > > @@ -138,7 +138,7 @@ static int sprd_hwspinlock_probe(struct
> > platform_device *pdev)
> > >                                          SPRD_HWLOCKS_NUM);
> > >  }
> > >
> > > -static const struct of_device_id sprd_hwspinlock_of_match[] = {
> > > +static const __maybe_unused struct of_device_id
> > sprd_hwspinlock_of_match[] = {
> > >         { .compatible = "sprd,hwspinlock-r3p0", },
> > >         { /* sentinel */ }
> > >  };
> > > --
> > > 2.20.1
> > >
> > >
> >
> > --
> > Baolin Wang
