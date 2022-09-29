Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F3EC433FE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 29 Sep 2022 17:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbiI2ROF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 29 Sep 2022 13:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbiI2ROD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Sep 2022 13:14:03 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08DD1D35B9
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Sep 2022 10:14:01 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id e129so1989609pgc.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Sep 2022 10:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=stkscbNwb5shhiyTzvJseWOMB6FxtoHVC1j0h29GLqM=;
        b=U3Eb9h9jJWfQB62GfJQm6EVOF/1ffMh9W7H/hDWDvchFu8Qbqzm4a1/f6FCjqx722H
         4jgXxw9NN/i5N7uRisJNg6AJTNv2gYf2rEoY6e9Pj7Mrr0T5kBLyO3whrZrNvQgvQOFT
         J2HmBG4yhYaComTmExTnpwgns/ZrI23EllDOJTDbeMa3NJRSzIly0nI5JAvnjmq6vi8f
         FB2wsFA+yZSknp3lTGJQcH5yQEtfzy+z/TkL+oEH7murWDmuWjc9s2TG1HH4+h1bKpor
         OxjHzt+s2tUmNTj73Gr9aSS9DC5DbvP7dlK3S9rnvXJgNSkeN6I6vo93bCbknKZa7+Oy
         T/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=stkscbNwb5shhiyTzvJseWOMB6FxtoHVC1j0h29GLqM=;
        b=kWGICniEDW4zQA99vaPrvmz0bFh8ZTYq1UQepd6mR5J0Vw53kIfGpX1Kvagx2FDI4H
         ZRLfyuuc6bflencPmaRKqj5mzLVXAe9aE452FTmJuDqFk3qeKJVW69eMhnyO2pTCZEzo
         CmZNjwZm/nEFScWHsDje98cS+XnnPiGVtlkFVQL6HoSruV+O8hp3teRNo92DO9Jdh9oU
         41wvJVdB0K+Q+zHWMjUIYmSpA+HcdUWCbgTsZXPQidmyM2Sopaf4Kyuji9+7vwKw60YX
         leOX19LguqFjPQRmGCceZ7+UCU9FEUQqICafltNoS5hl98R3vsOeRQHfWWerC2lSUg3K
         LS/g==
X-Gm-Message-State: ACrzQf2FCFp25cAfLwfqfD80sZM0e1To12ScTo81Oj05MhXhQVB7Uq/U
        +PPH4355WDKPICCPJBFPgJ6LXA==
X-Google-Smtp-Source: AMsMyM5YRhfqpBeLvP4CdUO5rSMGvVURixqIl+dfkqoPND6e/kO1a6v0pejZKyLqWSmuOb+cEE/nVg==
X-Received: by 2002:a05:6a00:e8f:b0:536:c98e:8307 with SMTP id bo15-20020a056a000e8f00b00536c98e8307mr4569507pfb.73.1664471641088;
        Thu, 29 Sep 2022 10:14:01 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e5cb00b00178957d17a4sm92407plf.286.2022.09.29.10.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 10:13:59 -0700 (PDT)
Date:   Thu, 29 Sep 2022 11:13:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: Add mutex protection for
 workqueue
Message-ID: <20220929171357.GA3107608@p14s>
References: <1664192893-14487-1-git-send-email-shengjiu.wang@nxp.com>
 <20220928172042.GB2990524@p14s>
 <CAA+D8ANKwsF=4R3cR0ZZy67CqwDZ1m7M8y57PmMUqkM4tPFZkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANKwsF=4R3cR0ZZy67CqwDZ1m7M8y57PmMUqkM4tPFZkw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 29, 2022 at 10:03:21AM +0800, Shengjiu Wang wrote:
> On Thu, Sep 29, 2022 at 1:20 AM Mathieu Poirier <mathieu.poirier@linaro.org>
> wrote:
> 
> > On Mon, Sep 26, 2022 at 07:48:13PM +0800, Shengjiu Wang wrote:
> > > The workqueue may execute late even after remoteproc is stopped or
> > > stopping, some resources (rpmsg device and endpoint) have been
> > > released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> > > access these resources will cause kennel dump.
> > >
> > > Call trace:
> > >  virtqueue_add_split+0x1ac/0x560
> > >  virtqueue_add_inbuf+0x4c/0x60
> > >  rpmsg_recv_done+0x15c/0x294
> > >  vring_interrupt+0x6c/0xa4
> > >  rproc_vq_interrupt+0x30/0x50
> > >  imx_dsp_rproc_vq_work+0x24/0x40 [imx_dsp_rproc]
> > >  process_one_work+0x1d0/0x354
> > >  worker_thread+0x13c/0x470
> > >  kthread+0x154/0x160
> > >  ret_from_fork+0x10/0x20
> > >
> > > Add mutex protection in imx_dsp_rproc_vq_work(), if the state is
> > > not running, then just skip calling rproc_vq_interrupt().
> > >
> > > Also the flush workqueue operation can't be added in rproc stop
> > > for same reason.
> > >
> > > Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver
> > for DSP on i.MX")
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_dsp_rproc.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c
> > b/drivers/remoteproc/imx_dsp_rproc.c
> > > index 899aa8dd12f0..95da1cbefacf 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -347,9 +347,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> > >       struct device *dev = rproc->dev.parent;
> > >       int ret = 0;
> > >
> > > -     /* Make sure work is finished */
> > > -     flush_work(&priv->rproc_work);
> > > -
> >
> > The kernel documentation for this function [1] indicate that once it
> > returns
> > there will no more jobs to process in that queue, _unless_ another job has
> > been
> > queued _after_ the flush has started.  What I suspect is happening here is
> > that
> > a new job is queued between the time flush_work() returns and the remote
> > processor
> > is switched off, something that should not be happening since all the
> > subdevices have been stopped in rproc_stop_subdevices().
> >
> > [1].
> > https://elixir.bootlin.com/linux/v6.0-rc7/source/kernel/workqueue.c#L3092
> 
> 
> The call sequence with echo stop > remoteproc
> 
> rproc_shutdown
> -> rproc_stop
>    ->*rproc_stop_subdevices*
>    ->rproc->ops->stop()
>        ->imx_dsp_rproc_stop
>            ->*flush_work*
>               -> rproc_vq_interrupt

I understand now - thanks for the details.  Please send me another revision with
the above call sequence in the patch changelog.  The one that is currently there
is obscure and doesn't provide a clear picture of what the problem is.

> 
> So the *flush_work* is not safe, because the resource has been released in
> *rproc_stop_subdevices.  *the resource needed by rproc_vq_interrupt
> is not accessible.
> 
> 
> 
> >
> >
> >
> > >       if (rproc->state == RPROC_CRASHED) {
> > >               priv->flags &= ~REMOTE_IS_READY;
> > >               return 0;
> > > @@ -432,9 +429,18 @@ static void imx_dsp_rproc_vq_work(struct
> > work_struct *work)
> > >  {
> > >       struct imx_dsp_rproc *priv = container_of(work, struct
> > imx_dsp_rproc,
> > >                                                 rproc_work);
> > > +     struct rproc *rproc = priv->rproc;
> > > +
> > > +     mutex_lock(&rproc->lock);
> > > +
> > > +     if (rproc->state != RPROC_RUNNING)
> > > +             goto unlock_mutex;
> > >
> > >       rproc_vq_interrupt(priv->rproc, 0);
> > >       rproc_vq_interrupt(priv->rproc, 1);
> >
> > These are not guaranteed to be atomic and sleeping with the mutex held is
> > guaranteed to deadlock the system.
> >
> > spinlock should be a problem with sleep,  but here using the mutex, should
> be ok.
> right?

I was thinking more about this worker thread executing concurrently with
the remoteproc core but we are fine as long as a single mutex is used.

> 
> best regards
> wang shengjiu
> 
> > +
> > > +unlock_mutex:
> > > +     mutex_unlock(&rproc->lock);
> > >  }
> > >
> > >  /**
> > > --
> > > 2.34.1
> > >
> >
