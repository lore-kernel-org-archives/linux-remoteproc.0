Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE183C47089
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:26:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA6BA610CE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236068AbhE1D2a (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 May 2021 23:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236077AbhE1D23 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 May 2021 23:28:29 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C36FC061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:26:55 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id i8-20020a4aa1080000b0290201edd785e7so619940ool.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0HYf019K48D/mZa9Ja8MZiRvjhcE/p6r/Rzw+0fAH1Q=;
        b=GVCREBsOQ4o6K8NcnK5Pn767Q+hYZllknZgla56DkQ9AqmhzIfQM9qbWDdpIXvg22U
         lxVIifjsW/J5f2/aCFokEYLo0UrF5JgLW4Hcz+YLBK/Pi18Ee8/kKameDE2YNj+UB3NU
         4U63p9plG9om1Zf+v8P0D7fPmeL3f+fBBGj2yVsg0EkJzTkreBIiprgEImJE0VHI5t+W
         23yEtHvOjeNZ0/l/SKc2oYRwfQgyfx9eCSB9VZtRO90IFpbSZVC3iFuIoK3JeidNyKVH
         BjuwgiJmgPV0WtkYhnGtgXAOGS8Sf+pz2p0qZ3yb8Kv9aoOwR9tqBCWIttjBQKPNy0C8
         jZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0HYf019K48D/mZa9Ja8MZiRvjhcE/p6r/Rzw+0fAH1Q=;
        b=phO+T2M0HAfzMcP96kQSPrpX/Qed69H88cScObsM/Lha3Mpe2R1aeKGYbYXEx/B7YX
         kJcSnTTSK4U9w+SGg7pv3+NOM+VfS7KkhEk1yXr2wFhgyWWgEltfJyTwF8h5hSrnKqoZ
         Sq0r2hGXmzDHQ8PVbaEKCooFAwT1q+1SIXLJ3MXrOdJOGxcXFfab4zFG0GSnQdnxR5+g
         46Kzm4Cd1XNxXJDfmEJ8vSVnkVjlyEScHC92oB93LVMBh11tkwKZREHVOiSaPGN4Re3O
         Z8xVaWKR7SUgFf1ssUnSooAYujsM3AeAeceEgzvNwPHOUnvUS5ZLAGWvKpUbwu/Ies1Q
         VpWw==
X-Gm-Message-State: AOAM533CoKZo9JWEN8d8vQtPn1m7ewtNEF0HeHzYvn4xUaZqv+KEWp3c
        uP+pmVaQ/WCubsdkK5MkktYpaQ==
X-Google-Smtp-Source: ABdhPJzqLW8dwF9K7NcPJC+8aIVz9h46MznLNDQmiFkSkPnpckPqEgHuAn2s3bheumm48LahOF9Eqg==
X-Received: by 2002:a4a:d30e:: with SMTP id g14mr5212330oos.32.1622172414871;
        Thu, 27 May 2021 20:26:54 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p1sm950576otk.58.2021.05.27.20.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 20:26:54 -0700 (PDT)
Date:   Thu, 27 May 2021 22:26:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] remoteproc: stm32: fix mbox_send_message call
Message-ID: <YLBi/JZ0u8394tI8@builder.lan>
References: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 20 Apr 04:19 CDT 2021, Arnaud Pouliquen wrote:

> mbox_send_message is called by passing a local dummy message or
> a function parameter. As the message is queued, it is dereferenced.
> This works because the message field is not used by the stm32 ipcc
> driver, but it is not clean.
> 
> Fix by passing a constant string in all cases.
> 
> The associated comments are removed because rproc should not have to
> deal with the behavior of the mailbox frame.
> 

Didn't we conclude that the mailbox driver doesn't actually dereference
the pointer being passed?

If so I would prefer that you just pass NULL, so that if you in the
future need to pass some actual data it will be easy to distinguish the
old and new case.

Regards,
Bjorn

> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7353f9e7e7af..0e8203a432ab 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -474,14 +474,12 @@ static int stm32_rproc_attach(struct rproc *rproc)
>  static int stm32_rproc_detach(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
> -	int err, dummy_data, idx;
> +	int err, idx;
>  
>  	/* Inform the remote processor of the detach */
>  	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
>  	if (idx >= 0 && ddata->mb[idx].chan) {
> -		/* A dummy data is sent to allow to block on transmit */
> -		err = mbox_send_message(ddata->mb[idx].chan,
> -					&dummy_data);
> +		err = mbox_send_message(ddata->mb[idx].chan, "stop");
>  		if (err < 0)
>  			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
>  	}
> @@ -493,15 +491,13 @@ static int stm32_rproc_detach(struct rproc *rproc)
>  static int stm32_rproc_stop(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
> -	int err, dummy_data, idx;
> +	int err, idx;
>  
>  	/* request shutdown of the remote processor */
>  	if (rproc->state != RPROC_OFFLINE) {
>  		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
>  		if (idx >= 0 && ddata->mb[idx].chan) {
> -			/* a dummy data is sent to allow to block on transmit */
> -			err = mbox_send_message(ddata->mb[idx].chan,
> -						&dummy_data);
> +			err = mbox_send_message(ddata->mb[idx].chan, "detach");
>  			if (err < 0)
>  				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
>  		}
> @@ -556,7 +552,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
>  			continue;
>  		if (!ddata->mb[i].chan)
>  			return;
> -		err = mbox_send_message(ddata->mb[i].chan, (void *)(long)vqid);
> +		err = mbox_send_message(ddata->mb[i].chan, "kick");
>  		if (err < 0)
>  			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
>  				__func__, ddata->mb[i].name, err);
> -- 
> 2.17.1
> 
