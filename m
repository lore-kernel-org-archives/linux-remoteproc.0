Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6BAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Mar 2022 15:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238775AbiC2PhN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Mar 2022 11:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238802AbiC2PhL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:37:11 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7486E108557
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 08:35:28 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id t4so12074328pgc.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iAGa1gugvjllqo3+GHikr9E7uXOFQF5PCOF88zFuUV0=;
        b=GTI2B4AhvOr7T9dH+nSmyCoZRZnh0RU+ySAC/BWBg2Jy37F4Vvfu0kakHeGweMb6Z/
         RoTmd4xn8zfgzfTDV+snJ2kfLG0wLLvxJRBaNRXY1A1SfPxqX08Crhba2xb0DhUVzMU1
         phpiAmFyWgSaS+RxTZzGETBOel/LrsYw2PnsphX4U3aoiTl0IkwepRL2Joykbq8BcOab
         5/GFKFytf21DkCOSJghOoYqU2MP7/FdQ5BPdH2ZwbMT5SWcUOka0CniM/l+9UVTEAH3Q
         FrdKQjgZva/BQwA1ObxuyJX106gZgiseASgo0yqONLDsb1q9iDD76enni3JOEZMddlXJ
         kEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iAGa1gugvjllqo3+GHikr9E7uXOFQF5PCOF88zFuUV0=;
        b=1LGPWcakMvuavNa/B902tS1JAfuPdTWkqrhfOodBXLQsUBT1vrJvCHC1kjaObBJqu7
         woNUPxCQDT/21V5MJvRLnNPuQBZQXTmXoWLSoRKyBWDAtwyl28Va2BqGQ7Wrm3RTJ80E
         JVmxZV0a+v13RE0hW7c7JldD4/OfNYD/y1YJHUcozlxl52zWlugT6Bws/xK5yvKY9RT6
         rlaMfhVE7/cuPJHtKLh0RtNuY+meKaVZI3fNv+/6cYuKECGH/G9dZ506xSIq2aKJcxUk
         sGwMLX0yYAjw9O7/ZibzCs7xVr7V2deAmLX4jlDhxYoQiKEsW9p1oYg/lRmajDpo4M81
         +c5A==
X-Gm-Message-State: AOAM530tkbjaS9/h48JT0FpfzEQVbkEjGH6lM6muavgrvnnoVI9Z1XRQ
        sFthrn8TmO3DwyeBLNQAfN9R
X-Google-Smtp-Source: ABdhPJydcPkiHT8xn4ayi9CARe6wvJfg4ybtfFUd9WkJ5OlEBrxaej7MsFCYFKpq/+wyAq9mHA899Q==
X-Received: by 2002:a05:6a00:1d03:b0:4fa:7710:7b1b with SMTP id a3-20020a056a001d0300b004fa77107b1bmr28337538pfx.29.1648568127337;
        Tue, 29 Mar 2022 08:35:27 -0700 (PDT)
Received: from thinkpad ([117.217.181.81])
        by smtp.gmail.com with ESMTPSA id x7-20020a056a00188700b004fae6f0d3e5sm21472120pfh.175.2022.03.29.08.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 08:35:26 -0700 (PDT)
Date:   Tue, 29 Mar 2022 21:05:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Don't bother checking the return value of
 debugfs_create*
Message-ID: <20220329153522.GB58120@thinkpad>
References: <20220324181224.21542-1-manivannan.sadhasivam@linaro.org>
 <20220328155123.GA3722211@p14s>
 <20220329143146.GA2137@thinkpad>
 <CANLsYkwZY=JwUyfTRkUS2Kq8VEjjgETRW9E3ryrznEvcWntfpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkwZY=JwUyfTRkUS2Kq8VEjjgETRW9E3ryrznEvcWntfpA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 29, 2022 at 08:59:48AM -0600, Mathieu Poirier wrote:
> On Tue, 29 Mar 2022 at 08:31, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > Hi Mathieu,
> >
> > On Mon, Mar 28, 2022 at 09:51:23AM -0600, Mathieu Poirier wrote:
> > > Hi Mani,
> > >
> > > On Thu, Mar 24, 2022 at 11:42:24PM +0530, Manivannan Sadhasivam wrote:
> > > > DebugFS APIs are designed to return only the error pointers and not NULL
> > > > in the case of failure. So these return pointers are safe to be passed on
> > > > to the successive debugfs_create* APIs.
> > > >
> > > > Therefore, let's just get rid of the checks.
> > > >
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_debugfs.c | 17 ++---------------
> > > >  1 file changed, 2 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> > > > index b5a1e3b697d9..2e2c4a31c154 100644
> > > > --- a/drivers/remoteproc/remoteproc_debugfs.c
> > > > +++ b/drivers/remoteproc/remoteproc_debugfs.c
> > > > @@ -386,16 +386,8 @@ void rproc_remove_trace_file(struct dentry *tfile)
> > > >  struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
> > > >                                    struct rproc_debug_trace *trace)
> > > >  {
> > > > -   struct dentry *tfile;
> > > > -
> > > > -   tfile = debugfs_create_file(name, 0400, rproc->dbg_dir, trace,
> > > > +   return debugfs_create_file(name, 0400, rproc->dbg_dir, trace,
> > > >                                 &trace_rproc_ops);
> > > > -   if (!tfile) {
> > > > -           dev_err(&rproc->dev, "failed to create debugfs trace entry\n");
> > > > -           return NULL;
> > > > -   }
> > > > -
> > > > -   return tfile;
> > >
> > > Please see this thread [1] for an earlier conversation on this topic.
> > >
> > > [1]. https://lore.kernel.org/lkml/20220105131022.25247-1-linmq006@gmail.com/T/
> > >
> >
> > Thanks for the pointer! I believe the conclusion was to return 0 here
> > and ignore the return from debugfs_create_file(). If that's the case, it looks
> > fine to me and I'll send a follow-up patch.
> 
> Correct.
> 
> >
> > > >  }
> > > >
> > > >  void rproc_delete_debug_dir(struct rproc *rproc)
> > > > @@ -411,8 +403,6 @@ void rproc_create_debug_dir(struct rproc *rproc)
> > > >             return;
> > > >
> > > >     rproc->dbg_dir = debugfs_create_dir(dev_name(dev), rproc_dbg);
> > > > -   if (!rproc->dbg_dir)
> > > > -           return;
> > > >
> > > >     debugfs_create_file("name", 0400, rproc->dbg_dir,
> > > >                         rproc, &rproc_name_ops);
> > > > @@ -430,11 +420,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
> > > >
> > > >  void __init rproc_init_debugfs(void)
> > > >  {
> > > > -   if (debugfs_initialized()) {
> > > > +   if (debugfs_initialized())
> > > >             rproc_dbg = debugfs_create_dir(KBUILD_MODNAME, NULL);
> > > > -           if (!rproc_dbg)
> > > > -                   pr_err("can't create debugfs dir\n");
> > > > -   }
> > >
> > > The above two are fine since debugfs_create_file() and debugfs_create_dir() can
> > > deal with @parent being an error code.
> > >
> >
> > debugfs_create_* APIs would never return NULL, so these checks are wrong.
> > Moreover, Greg recommends not to check the return value for any of these
> > functions.
> >
> 
> When writing "the above two are fine", I meant that I am in agreement
> with your changes.  Reading my comment again I can see how it could be
> interpreted as "I don't think your changes are necessary", which isn't
> the case.
> 

Sorry for the misinterpretation. Will send v2.

Thanks,
Mani

> > I've found the mail thread where Greg explained the reasoning behind it:
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1907800.html
> >
> 
> I'll bookmark this one as it is bound to come back again.
> 
> > Thanks,
> > Mani
> >
> > > Thanks,
> > > Mathieu
> > >
> > > >  }
> > > >
> > > >  void __exit rproc_exit_debugfs(void)
> > > > --
> > > > 2.25.1
> > > >
