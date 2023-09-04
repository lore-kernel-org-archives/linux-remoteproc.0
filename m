Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8623FC83F2C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Sep 2023 20:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbjIDUnI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Sep 2023 16:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjIDUnI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 16:43:08 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0823E12A
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Sep 2023 13:43:05 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1211538a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Sep 2023 13:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693860184; x=1694464984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bd+uBaZXUqOZ3cQQ+bhudqpQEOZ7PZ5vTiPcZoP4wt8=;
        b=n2eFdcl/FssKXB7Ge7aCAsS+xzLuo0JOc6OvYdPvOzLzezmcbeJ9ERW8ZGfM5OVOXS
         ZzwBAf2x1zQjXcM984nGn2uQOph5dwBLwhHy74M6+R7sjKe8F3+Gr+cQfJYwgUFsBfza
         Wf3OMoW2ClxIPmfkASLJ2tbnSTjWBmjH0VV/bF6yAjnI/fYPV4rG5FQZ1yPt6mureUjs
         y5FX4zycYM1OO51tLU4YaRh+T/atXr9y9A3IOGJOCtsGU03k5u4tuJdOKwqgDNSRSYjd
         9n7pWVD6Y4SlV1x4opHOJaNxgib7iECUa0makr5RtuSD6aC/SlDL5Y6noVzTr3476NpB
         a+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693860184; x=1694464984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd+uBaZXUqOZ3cQQ+bhudqpQEOZ7PZ5vTiPcZoP4wt8=;
        b=VCIGo58q4fZ2vXubPTTrw6Sp8pjeWVXO26yf3o2dxnRS5ydOpcAbsPPPjvT7vIXtEw
         XnvheK34Q9Qd6+kyCwD8qu6Vz0kRm4pEA5cBRJJVbSSS+qttBD1ORVn9Ejd6c1K13czQ
         75wdRRWtIYCBBGplRwwt6nkNywA4OwOdW4JhKNLq0BZSX/LyJ4IGTrNexgq0KwNFAQVJ
         JksPDZD4ay74qZgRUeY1tzB1BtZvOsKdgZXN/BaGTEFZf9wIJocYLZzcRa9aG1xPdxSO
         dh9hnx1qx5EU98gesUfP8oeoY4fENS6i0tbE4Q7nXsW1qCmtgKbWfeazOgJKlpAHb/SM
         FWOw==
X-Gm-Message-State: AOJu0Yw47K/H03B0mj5Z2LoMMW7K+LyM3J20RZKANIuqSOAsgWmq3TNR
        qytZn3qhyMzxYLpCwjcINgZSaA==
X-Google-Smtp-Source: AGHT+IE0h8ydHL32ctuXhUGMeaCKA+rbJlIBglH5iU9BhStQ9af+1+ITfRtEoubDSxetIA6dTsDKrQ==
X-Received: by 2002:a17:90a:c283:b0:26d:1d0:4f8c with SMTP id f3-20020a17090ac28300b0026d01d04f8cmr10675698pjt.9.1693860184419;
        Mon, 04 Sep 2023 13:43:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4d17:cefe:4740:3fd1])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a1a4500b0026b4ca7f62csm8406688pjl.39.2023.09.04.13.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 13:43:04 -0700 (PDT)
Date:   Mon, 4 Sep 2023 14:43:01 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Tim Blechmann <tim.blechmann@gmail.com>,
        linux-remoteproc@vger.kernel.org, Tim Blechmann <tim@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
Message-ID: <ZPZBVS3R/oZuUmk5@p14s>
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 04, 2023 at 03:52:56PM +0200, Arnaud POULIQUEN wrote:
> Hello Tim,
> 
> On 9/4/23 10:36, Tim Blechmann wrote:
> > when we cannot get a tx buffer (`get_a_tx_buf`) `rpmsg_upref_sleepers`
> > enables tx-complete interrupt.
> > however if the interrupt is executed after `get_a_tx_buf` and before
> > `rpmsg_upref_sleepers` we may mis the tx-complete interrupt and sleep
> > for the full 15 seconds.
> 
> 
> Is there any reason why your co-processor is unable to release the TX RPMSG
> buffers for 15 seconds? If not, you should first determine the reason why it is
> stalled.

Arnaud's concern is valid.  If the remote processor can't consume a buffer
within 15 seconds, something is probably wrong.

That said, I believe your assesment of the situation is correct.  *If* the TX
callback is disabled and there is no buffer available, there is a window of
opportunity between calls to get_a_tx_buf() and rpmsg_upref_sleepers() for an
interrupt to arrive in function rpmsg_send_offchannel_raw().  

From here three things need to happen:

1) You send another version of this patch with a changelong that uses proper
english, i.e capital letters when they are needed and no spelling mistake.

2) Arnaud confirms our suspicions.

3) This patch gets applied when rc1 comes out so that it has 6 or 7 weeks to
soak.  No error are locks are reported due to this patch during that time. 

> 
> Regards,
> Arnaud
> 
> > 
> > in this case, so we re-try once before we really start to sleep
> > 
> > Signed-off-by: Tim Blechmann <tim@klingt.org>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 24 +++++++++++++++---------
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 905ac7910c98..2a9d42225e60 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -587,21 +587,27 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >  
> >  	/* no free buffer ? wait for one (but bail after 15 seconds) */
> >  	while (!msg) {
> >  		/* enable "tx-complete" interrupts, if not already enabled */
> >  		rpmsg_upref_sleepers(vrp);
> >  
> > -		/*
> > -		 * sleep until a free buffer is available or 15 secs elapse.
> > -		 * the timeout period is not configurable because there's
> > -		 * little point in asking drivers to specify that.
> > -		 * if later this happens to be required, it'd be easy to add.
> > -		 */
> > -		err = wait_event_interruptible_timeout(vrp->sendq,
> > -					(msg = get_a_tx_buf(vrp)),
> > -					msecs_to_jiffies(15000));
> > +		/* make sure to retry to grab tx buffer before we start waiting */
> > +		msg = get_a_tx_buf(vrp);
> > +		if (msg) {
> > +			err = 0;
> > +		} else {
> > +			/*
> > +			 * sleep until a free buffer is available or 15 secs elapse.
> > +			 * the timeout period is not configurable because there's
> > +			 * little point in asking drivers to specify that.
> > +			 * if later this happens to be required, it'd be easy to add.
> > +			 */
> > +			err = wait_event_interruptible_timeout(vrp->sendq,
> > +						(msg = get_a_tx_buf(vrp)),
> > +						msecs_to_jiffies(15000));
> > +		}
> >  
> >  		/* disable "tx-complete" interrupts if we're the last sleeper */
> >  		rpmsg_downref_sleepers(vrp);
> >  
> >  		/* timeout ? */
> >  		if (!err) {
