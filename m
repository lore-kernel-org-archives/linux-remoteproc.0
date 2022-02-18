Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B39C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Feb 2022 18:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbiBRSBd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Feb 2022 13:01:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234557AbiBRSBd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Feb 2022 13:01:33 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB853524D
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Feb 2022 10:01:16 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id w20so7741954plq.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Feb 2022 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mYa/Ng+qxZsnILfjVR2nbtXNKAWIjZlbnZSGa5MiPd4=;
        b=ndBjwBE+GGl0MW4CnH/U147wgIPsvkGTaQsLqVl3hpG0VdKEatFGB8JRSBHsgUbg1X
         Ljkf9oYEkXopX70XO3QkRaiYqau3s87IfPtT6pTO6L7Q/aj7fw0uh0T+VMXbrNphalh7
         AF7eozoEleavm8u2vEQLkh0Q+US3gJx7BKMkoa9AQ3gGQoEqbammRv7THGP8viXbSsWP
         79CXBjjNJIvxcRTm2wi5gLxfStrvVEXtc2jMPnV8MZrN74cRh8rxWtR+HKwrIiVHsd37
         UpckS5J9XxmOxYHJe6zn+C1/xUPLr2lEAKOwRsVAPiVC6BtDsu+yQDsaK5oWV35djSzY
         6zBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mYa/Ng+qxZsnILfjVR2nbtXNKAWIjZlbnZSGa5MiPd4=;
        b=DuL6hgq6shf+BGyXI9u9BaUsDBuVmICvBUxI3RVa000KW3N3H/v030MaxmBsF0OrKm
         GN4S4FzTSXEMoJQE3UzIXp0SWQDDkIJXyT+GGXEQ9ZqUaY7crQPCzNa9cpnv2zF1/+vP
         KL+tK2JbgzBpIMBBrfXC+mMGvyg+w+x2/WDdg3pTf2Wt15Xdx5HiZLyDp4MjHrbMe+yB
         B/vBQCeFn72zt204FF8e8/gtC1X86XMBdjrQZMZspz49qLS43JwEqPkgVRyRJczyXWgX
         H7+TJwYlnYOmUVt8+u+Ejrya2pqY/27JMBJ0CNzaRWJVtRUzqNqa1MO1DTn6YANrou5j
         D/JA==
X-Gm-Message-State: AOAM530E563ztIWL+qkqoRYp/idVM17O8IocG4u4ntwl1fKFrlUt4vjZ
        upHOl+63qfdMUrmmhKmuPrkn+w==
X-Google-Smtp-Source: ABdhPJwxNL2qp5uVuAl20iyQqNEJlD2O13uPwdNpOREkSCOi9pQv/gyMNJhyp0jyK447LPmdbBC0nA==
X-Received: by 2002:a17:902:7c84:b0:14d:66b5:8233 with SMTP id y4-20020a1709027c8400b0014d66b58233mr8348857pll.3.1645207275508;
        Fri, 18 Feb 2022 10:01:15 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b1sm11292534pgb.66.2022.02.18.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 10:01:13 -0800 (PST)
Date:   Fri, 18 Feb 2022 11:01:11 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
        pihsun@chromium.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Message-ID: <20220218180111.GA574087@p14s>
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
 <20220217190349.GA477215@p14s>
 <ad306275-cd38-e6ad-55cc-0f7c4bdfcecf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad306275-cd38-e6ad-55cc-0f7c4bdfcecf@collabora.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Feb 18, 2022 at 10:16:51AM +0100, AngeloGioacchino Del Regno wrote:
> Il 17/02/22 20:03, Mathieu Poirier ha scritto:
> > Hi Angelo,
> > 
> > On Fri, Jan 14, 2022 at 03:47:37PM +0100, AngeloGioacchino Del Regno wrote:
> > > During execution of the worker that's used to register rpmsg devices
> > > we are safely locking the channels mutex but, when creating a new
> > > endpoint for such devices, we are registering a IPI on the SCP, which
> > > then makes the SCP to trigger an interrupt, lock its own mutex and in
> > > turn register more subdevices.
> > > This creates a circular locking dependency situation, as the mtk_rpmsg
> > > channels_lock will then depend on the SCP IPI lock.
> > > 
> > > [   18.014514]  Possible unsafe locking scenario:
> > > [   18.014515]        CPU0                    CPU1
> > > [   18.014517]        ----                    ----
> > > [   18.045467]   lock(&mtk_subdev->channels_lock);
> > > [   18.045474]                                lock(&scp->ipi_desc[i].lock);
> > 
> > I spent well over an hour tracing through the meanders of the code to end up in
> > scp_ipi_register() which, I think, leads to the above.  But from there I don't
> > see how an IPI can come in and that tells me my assumption is wrong.
> > 
> > Can you give more details on the events that lead to the above?  I'm not saying
> > there is no problem, I just need to understand it.
> > 
> 
> Hi Mathieu,
> 
> I understand that following this flow without the assistance of the actual
> hardware may be a little confusing, so, no worries.
> 
> drivers/remoteproc/mtk_scp.c - this driver manages the SCP (obviously, a
> remote processor)
> drivers/remoteproc/mtk_scp_ipi.c - public functions for kernel SCP IPC
> 
> Flow:
> - MediaTek SCP gets probed
> - RPMSG starts, we start probing "something", like google,cros-ec-rpmsg
> - mtk_rpmsg: creates endpoint; IPI handler is registered here.
> 
>          ( more flow )
> 
> - mtk_rpmsg: mtk_rpmsg_ns_cb() -> mtk_rpmsg_create_device(), channel is
>              added to the channels list, worker gets scheduled

To me the above is out of order.  The name space endpoint is registered as part
of the remote processor start sequence.  From there an IPI with ns_ipi_id comes in
and then cros_ec_rpmsg_probe() is called.  The above seems to imply the
opposite.

>
> 
> Now for the part that produces the real issue:
> 
> label_a:
> 
> *** RPMSG MUTEX LOCK ***

By this I take you mean the subdev->channels_lock mutex.

> - mtk_rpmsg: ## Go through multiple channels ##, call mtk_rpmsg_register_device()
> 
> - Registered device tries to communicate through RPMSG
> - .send() or .trysend() (depending on the device) is called: send_ipi()
>     *** SCP MUTEX LOCK ***

And this one is either scp->send_lock or scp->ipi_desc[i].lock.

>    - mtk_scp_ipi: Data written, ACK? ok -> return 0
>     *** SCP MUTEX UNLOCK ***
> 
> - mtk_scp_ipi: **** INTERRUPT!!! **** New RPMSG NS available? -> create channel
>           goto label_a;
> 
> *** RPMSG MUTEX UNLOCK ***
> 
> 
> Pardon me for keeping some things in this flow implicit, but that was done to
> simplify it as much as possible as to try to make you understand the situation.

I certainly appreciate the effort but the above does not provide me with a clear
path that causes the lock to happen.  As I said in my last reply I don't doubt
there is a lock contention but the provided information doesn't allow to
understand how it happens. 

All I am looking for is one scenario with all mutexes and functions calls
involved.

Thanks,
Mathieu

> 
> Cheers,
> Angelo
> 
> > Thanks,
> > Mathieu
> > 
> > > [   18.228399]                                lock(&mtk_subdev->channels_lock);
> > > [   18.228405]   lock(&scp->ipi_desc[i].lock);
> > > [   18.264405]
> > > 
> > > To solve this, simply unlock the channels_lock mutex before calling
> > > mtk_rpmsg_register_device() and relock it right after, as safety is
> > > still ensured by the locking mechanism that happens right after
> > > through SCP.
> > > Notably, mtk_rpmsg_register_device() does not even require locking.
> > > 
> > > Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/rpmsg/mtk_rpmsg.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> > > index 5b4404b8be4c..d1213c33da20 100644
> > > --- a/drivers/rpmsg/mtk_rpmsg.c
> > > +++ b/drivers/rpmsg/mtk_rpmsg.c
> > > @@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
> > >   		if (info->registered)
> > >   			continue;
> > > +		mutex_unlock(&subdev->channels_lock);
> > >   		ret = mtk_rpmsg_register_device(subdev, &info->info);
> > > +		mutex_lock(&subdev->channels_lock);
> > >   		if (ret) {
> > >   			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
> > >   			continue;
> > > -- 
> > > 2.33.1
> > > 
> 
> 
> 
