Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F28EC4743C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 18:45:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 370BF61185
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 18:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhFWSre (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Jun 2021 14:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhFWSre (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jun 2021 14:47:34 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E70C061574
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Jun 2021 11:45:16 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w127so4384051oig.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Jun 2021 11:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=25Xb4P9ONl4NzuOE9BknQdHYzn3+WMCAH5CmkrDBv8c=;
        b=nspS8/ZDtdjWSrZvTFB2KZLPbZsxOpGn627p0IOIQNtGCxXkG50wmJ3EULXwPEIzFc
         mFdNRIrWbhiKHovPgDEdXLAr4/LKlZrtEj0mG+mWTH7HAZVsGxzgLo/SvuiWx1YN5uQH
         aPp5GXJr56C6TvZxA1xLowlM7TFEbWyxx8CLOW+CXNluKaOmP2FRhXJEMj0X8KLOh1Ui
         MsKz/Vetz0ClkYt29qCLhtoLf99QlgzJhLcn8Vmi9c49a11Y/dwJfh8HxOyp05b+a5vW
         hGNXGX8JGfINtmrC+9Icqbz8f9OfASh8MHhBaRFS32+sFwgYXyE2LfNCQGdyyl2yzRAI
         spQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=25Xb4P9ONl4NzuOE9BknQdHYzn3+WMCAH5CmkrDBv8c=;
        b=ah4qgFyaxDojcJwsL1YLUbgk7AFlqtqvA0LlwK2nJ8t7tG7UuoH52bxFTk5HM6Ki1Q
         IEwPJRqXE52R3hPa2RLwS/NeYFlivBXuBZ4vJPxvy3CzX0hRONjZLxJvbhhWiBCGi0li
         esZ2q2MD990OllExk1fLtk4J4cRjkT867ajtVfOQbY92x9mHDjqNJ8whUsmT92Jw/++J
         z/BxPOSzkve9DqxnrCe5tcRw/MLj8cwAop/J3duX7PPAMQ9ryJxvyWvjmoPY5x76AeEC
         OEQNDj0+0dQs1XCQu54GG2jal1RZzBMYCtyH9bCTiY7rwh3RHo6I1d+roCsv3ohLoxEz
         LZJw==
X-Gm-Message-State: AOAM532v+jNtHOVp1abr1Zym8Vidvb2gCukt4ohed/aelRh6hAykzgYH
        XI36LSpdGPZt1AegPZlsGLayQ02FCYHZCg==
X-Google-Smtp-Source: ABdhPJyhsb7VidpHXFDZm+c5HXvnzfTp415YuNkk7mYhD1hIhA/pa0B4lCsqz8c7gS021qvRHGI3+w==
X-Received: by 2002:aca:3285:: with SMTP id y127mr973809oiy.115.1624473915614;
        Wed, 23 Jun 2021 11:45:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v42sm147961ott.70.2021.06.23.11.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 11:45:14 -0700 (PDT)
Date:   Wed, 23 Jun 2021 13:45:13 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] remoteproc: stm32: fix mbox_send_message call
Message-ID: <YNOBOeEkvG8WXM9o@builder.lan>
References: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
 <YLBi/JZ0u8394tI8@builder.lan>
 <b563f831-3876-1d5d-7268-ce1260363906@foss.st.com>
 <e112e4a3-d5c1-caff-8ef9-cbd5b21ea3a1@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e112e4a3-d5c1-caff-8ef9-cbd5b21ea3a1@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 22 Jun 02:56 CDT 2021, Arnaud POULIQUEN wrote:

> Hello Bjorn
> 
> On 5/28/21 10:03 AM, Arnaud POULIQUEN wrote:
> > Hello Bjorn,
> > 
> > On 5/28/21 5:26 AM, Bjorn Andersson wrote:
> >> On Tue 20 Apr 04:19 CDT 2021, Arnaud Pouliquen wrote:
> >>
> >>> mbox_send_message is called by passing a local dummy message or
> >>> a function parameter. As the message is queued, it is dereferenced.
> >>> This works because the message field is not used by the stm32 ipcc
> >>> driver, but it is not clean.
> >>>
> >>> Fix by passing a constant string in all cases.
> >>>
> >>> The associated comments are removed because rproc should not have to
> >>> deal with the behavior of the mailbox frame.
> >>>
> >>
> >> Didn't we conclude that the mailbox driver doesn't actually dereference
> >> the pointer being passed?
> > 
> > Right it can store the reference to queue the sent.
> > 
> >>
> >> If so I would prefer that you just pass NULL, so that if you in the
> >> future need to pass some actual data it will be easy to distinguish the
> >> old and new case.
> > 
> > I can not use NULL pointer in stm32_rproc_attach and stm32_rproc_detach case.
> > The reason is that the tx_done callback is not called if the message is NULL.
> > (https://elixir.bootlin.com/linux/latest/source/drivers/mailbox/mailbox.c#L106)
> > 
> > I could use NULL pointer in stm32_rproc_kick, but I would prefer to use the same way
> > of calling mbox_send_message for all use cases and not take into account the
> > mailbox internal behavior.
> 
> Do you still have any concern about this patch?
> 

I think my concern is now directed at the mailbox api. I think the
change is reasonable given that. Thanks for the explanation. I'm picking
up the patch.

Regards,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Thanks,
> > Arnaud
> > 
> > 
> >>
> >> Regards,
> >> Bjorn
> >>
> >>> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>> ---
> >>>  drivers/remoteproc/stm32_rproc.c | 14 +++++---------
> >>>  1 file changed, 5 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> >>> index 7353f9e7e7af..0e8203a432ab 100644
> >>> --- a/drivers/remoteproc/stm32_rproc.c
> >>> +++ b/drivers/remoteproc/stm32_rproc.c
> >>> @@ -474,14 +474,12 @@ static int stm32_rproc_attach(struct rproc *rproc)
> >>>  static int stm32_rproc_detach(struct rproc *rproc)
> >>>  {
> >>>  	struct stm32_rproc *ddata = rproc->priv;
> >>> -	int err, dummy_data, idx;
> >>> +	int err, idx;
> >>>  
> >>>  	/* Inform the remote processor of the detach */
> >>>  	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
> >>>  	if (idx >= 0 && ddata->mb[idx].chan) {
> >>> -		/* A dummy data is sent to allow to block on transmit */
> >>> -		err = mbox_send_message(ddata->mb[idx].chan,
> >>> -					&dummy_data);
> >>> +		err = mbox_send_message(ddata->mb[idx].chan, "stop");
> >>>  		if (err < 0)
> >>>  			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
> >>>  	}
> >>> @@ -493,15 +491,13 @@ static int stm32_rproc_detach(struct rproc *rproc)
> >>>  static int stm32_rproc_stop(struct rproc *rproc)
> >>>  {
> >>>  	struct stm32_rproc *ddata = rproc->priv;
> >>> -	int err, dummy_data, idx;
> >>> +	int err, idx;
> >>>  
> >>>  	/* request shutdown of the remote processor */
> >>>  	if (rproc->state != RPROC_OFFLINE) {
> >>>  		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
> >>>  		if (idx >= 0 && ddata->mb[idx].chan) {
> >>> -			/* a dummy data is sent to allow to block on transmit */
> >>> -			err = mbox_send_message(ddata->mb[idx].chan,
> >>> -						&dummy_data);
> >>> +			err = mbox_send_message(ddata->mb[idx].chan, "detach");
> >>>  			if (err < 0)
> >>>  				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
> >>>  		}
> >>> @@ -556,7 +552,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
> >>>  			continue;
> >>>  		if (!ddata->mb[i].chan)
> >>>  			return;
> >>> -		err = mbox_send_message(ddata->mb[i].chan, (void *)(long)vqid);
> >>> +		err = mbox_send_message(ddata->mb[i].chan, "kick");
> >>>  		if (err < 0)
> >>>  			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
> >>>  				__func__, ddata->mb[i].name, err);
> >>> -- 
> >>> 2.17.1
> >>>
