Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B663EDEC6A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 14:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241397AbjIMOqK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241371AbjIMOqK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 10:46:10 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB3791
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 07:46:06 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-68fb7074348so3420819b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694616366; x=1695221166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pY8HEVQs42W2ErDup88fsmr9VxZYBqbZECzml3k0BWI=;
        b=BDVZwUfPu7ZSWOvYFRhPxBQXKBV9fCHze2yZjodO2cTDmA7vP3ESLOp0zbmT+dW30D
         nh+PPyFMjm46Qc84fyUNQgpGBNX1PhHqzBO0ToDxEG8qbPdFdsOcy0XDrHWQ6WxyW/Hj
         J0s2mG6OWRwM8FLEvbElYesFQlFe2q0pYVVb1dGoefJu3vvfBK+DOwPUfx1pWYQhNFxY
         Txpu9OFD/zwIHgswNGjPToDfxk+Un6U/ZKIuhX6FNqY/C6myBqJ2atQCW0Q2ZjhpzafX
         tHxzLZRSo6iZLd/h0bnBQD20QE+iwEbxMuvys0wSA03H+fvZ3ePkRCjrXvSmNnhM7jjm
         2ERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694616366; x=1695221166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY8HEVQs42W2ErDup88fsmr9VxZYBqbZECzml3k0BWI=;
        b=jfEj+GRNpwChEiYHER73wV0G5uVGD4NIIyVGfKPpOTv+EqzFpHwB3Zu5CAuv2lYGXI
         rybhQYKOaCq25PF2KHdI+0KHtOJhwDS+2AHv2LEfAomARxtyP97vdq5C/ovxVdt3MXYc
         +I6FlJ7+p4EqpPvuA+WFkrnFL1bvmebk1wl+zNIBUNM7+qgXWHZbsoMbRekXk2ORaEgy
         I15ZXQaE8V3VxZk7CJoPSwXx0DeCDwEcI/RRZKSQzMwwFmD/uBFH3RlflB8HbEb5Yz7G
         wkilxvzV6GHukGg6SFTamu6phUbZOs1xaUCUy7V3ed0iQRyMmT1STyA8szF2C+Cm8hQQ
         rEoQ==
X-Gm-Message-State: AOJu0Yy60GClPtgjMFC7yQBWKC6wx4P5dmQ0sF2WLCul5FTquAmQGwh7
        qj69ML831vWKcEyGV3hTvoSd6FkLC7JlkgHKXBg=
X-Google-Smtp-Source: AGHT+IG4AdZzswX3q4rYa9ABd+ZVSmXdrjFeJEfNFgY70Qkiq30F6uFqTPoxeltXRwNLQtHPfjz4wg==
X-Received: by 2002:a05:6a00:c8c:b0:68c:70f:ee3f with SMTP id a12-20020a056a000c8c00b0068c070fee3fmr3255027pfv.13.1694616366039;
        Wed, 13 Sep 2023 07:46:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d880:f5d9:a2c5:d083])
        by smtp.gmail.com with ESMTPSA id bg17-20020a056a001f9100b0068be3489b0dsm6678501pfb.172.2023.09.13.07.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:46:05 -0700 (PDT)
Date:   Wed, 13 Sep 2023 08:46:03 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Tim Blechmann <tim.blechmann@gmail.com>,
        linux-remoteproc@vger.kernel.org, Tim Blechmann <tim@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
Message-ID: <ZQHLK46BM7vHlbmw@p14s>
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com>
 <ZPZBVS3R/oZuUmk5@p14s>
 <9f6f19ad-1985-7e37-d89e-16ba239ad6a4@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f6f19ad-1985-7e37-d89e-16ba239ad6a4@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 13, 2023 at 12:10:39PM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 9/4/23 22:43, Mathieu Poirier wrote:
> > On Mon, Sep 04, 2023 at 03:52:56PM +0200, Arnaud POULIQUEN wrote:
> >> Hello Tim,
> >>
> >> On 9/4/23 10:36, Tim Blechmann wrote:
> >>> when we cannot get a tx buffer (`get_a_tx_buf`) `rpmsg_upref_sleepers`
> >>> enables tx-complete interrupt.
> >>> however if the interrupt is executed after `get_a_tx_buf` and before
> >>> `rpmsg_upref_sleepers` we may mis the tx-complete interrupt and sleep
> >>> for the full 15 seconds.
> >>
> >>
> >> Is there any reason why your co-processor is unable to release the TX RPMSG
> >> buffers for 15 seconds? If not, you should first determine the reason why it is
> >> stalled.
> > 
> > Arnaud's concern is valid.  If the remote processor can't consume a buffer
> > within 15 seconds, something is probably wrong.
> > 
> > That said, I believe your assesment of the situation is correct.  *If* the TX
> > callback is disabled and there is no buffer available, there is a window of
> > opportunity between calls to get_a_tx_buf() and rpmsg_upref_sleepers() for an
> > interrupt to arrive in function rpmsg_send_offchannel_raw().  
> > 
> > From here three things need to happen:
> > 
> > 1) You send another version of this patch with a changelong that uses proper
> > english, i.e capital letters when they are needed and no spelling mistake.
> > 
> > 2) Arnaud confirms our suspicions.
> 
> Seems to me that this patch is useless
> - wait_event_interruptible_timeout() function already seems
> to test the condition (so call get_a_tx_buf()) before entering in sleep[1].
> - ftraces show that vq interrupt is not called during the 15-second period.
>   So it is a normal behavior that the vrp->sendq is never waked-up.
> 

Thanks for looking further into this issue.  I will wait for you guys to get to
the root of the problems.

> Tim needs to analyze the reason why no mailbox interrupt occurs.
> 
> [1]https://elixir.bootlin.com/linux/latest/source/include/linux/wait.h#L534
> 
> 
> > 
> > 3) This patch gets applied when rc1 comes out so that it has 6 or 7 weeks to
> > soak.  No error are locks are reported due to this patch during that time. 
> > 
> >>
> >> Regards,
> >> Arnaud
> >>
> >>>
> >>> in this case, so we re-try once before we really start to sleep
> >>>
> >>> Signed-off-by: Tim Blechmann <tim@klingt.org>
> >>> ---
> >>>  drivers/rpmsg/virtio_rpmsg_bus.c | 24 +++++++++++++++---------
> >>>  1 file changed, 15 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> index 905ac7910c98..2a9d42225e60 100644
> >>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> @@ -587,21 +587,27 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >>>  
> >>>  	/* no free buffer ? wait for one (but bail after 15 seconds) */
> >>>  	while (!msg) {
> >>>  		/* enable "tx-complete" interrupts, if not already enabled */
> >>>  		rpmsg_upref_sleepers(vrp);
> >>>  
> >>> -		/*
> >>> -		 * sleep until a free buffer is available or 15 secs elapse.
> >>> -		 * the timeout period is not configurable because there's
> >>> -		 * little point in asking drivers to specify that.
> >>> -		 * if later this happens to be required, it'd be easy to add.
> >>> -		 */
> >>> -		err = wait_event_interruptible_timeout(vrp->sendq,
> >>> -					(msg = get_a_tx_buf(vrp)),
> >>> -					msecs_to_jiffies(15000));
> >>> +		/* make sure to retry to grab tx buffer before we start waiting */
> >>> +		msg = get_a_tx_buf(vrp);
> >>> +		if (msg) {
> >>> +			err = 0;
> >>> +		} else {
> >>> +			/*
> >>> +			 * sleep until a free buffer is available or 15 secs elapse.
> >>> +			 * the timeout period is not configurable because there's
> >>> +			 * little point in asking drivers to specify that.
> >>> +			 * if later this happens to be required, it'd be easy to add.
> >>> +			 */
> >>> +			err = wait_event_interruptible_timeout(vrp->sendq,
> >>> +						(msg = get_a_tx_buf(vrp)),
> >>> +						msecs_to_jiffies(15000));
> >>> +		}
> >>>  
> >>>  		/* disable "tx-complete" interrupts if we're the last sleeper */
> >>>  		rpmsg_downref_sleepers(vrp);
> >>>  
> >>>  		/* timeout ? */
> >>>  		if (!err) {
