Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B8FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Nov 2021 17:37:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11B3760E9C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Nov 2021 17:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbhKARj6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Nov 2021 13:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbhKARj6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Nov 2021 13:39:58 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B896C061764
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Nov 2021 10:37:24 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id t17-20020a056830083100b00553ced10177so26150611ots.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Nov 2021 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G6TcqpHFdZZYSxe2t4YewV0bxg9nDBi/X+VnzoNiljk=;
        b=iEr27HKRHJrarwIO9n1LC6MIkFyDYM3qab0PilgmMleud4k76Jdg5s/365sHRMPZ/D
         e19c2oqdGLNAGEqGcy7D6LcbUAVUsUH1lYOVd3DJ6PYvICXht4D1ApZCcgQU7Y3ma7n2
         oMDEct1WQXGNrZCmE86+3JMZLZ4oMAOFk/PbvGWCw4UURvj0JToDDZsplnHM2jAwxxUr
         QTDliYlDK4VbY1npus73FgW4MxijgbG8fRwMaEgtq1vYrzH+ECVIs/5LgqdgcOxbna3N
         JJkQrSLgsTWSGeAaLZUJrHvYQe4e0iWL9UailvKihOCn2bTR04f6uh9CcBMOGHlfXJ5V
         RRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G6TcqpHFdZZYSxe2t4YewV0bxg9nDBi/X+VnzoNiljk=;
        b=e4fBFo0MZH4vw803w1iP53Qs9ViMawbElNq+hTvsVGhwrgXtPJAy1atVQu7OwS6D51
         L5S2cZ/Mr6kEnfnLzrhGlMOB9/dpu98pYh+UMzwRnGzg4Zt83KL+HcbCl+3psTRMk6Wr
         zeMF4hizM4gMxFD3mETjUjX3hxQ1oT3aTc2sAtGkeNheQ5pcXSvrDHocHzBluWZR1AHa
         M91SkQTvIIIUm+IgY2u2W6ZFDiay0pHtooO7Lu/KrwcP+MY1uXTWRxxbR5lGTgAOW2Ki
         TREvxvLSpYhKLxE+0vchVSNzEBP/3QxpDRsXfoL1NThHcx3pQmzY759/wQGANPXSuVX7
         Vf8A==
X-Gm-Message-State: AOAM530MXGZYNmiAU50U+zqFTkUL9cDJ5m9QM3tIZXtW4V5vmqgVzdLt
        Ojtu3eCFjR+47Cln42aD3sJuSQ==
X-Google-Smtp-Source: ABdhPJw9L2dzbBwVxfG/mj16FU1rikZcWY/vLQoxgaaNK7FBf6Xg0Nh0F4ZldiiKvS6zn+0IIw4r9w==
X-Received: by 2002:a05:6830:144d:: with SMTP id w13mr11475596otp.163.1635788243767;
        Mon, 01 Nov 2021 10:37:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bb33sm1139550oob.2.2021.11.01.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 10:37:23 -0700 (PDT)
Date:   Mon, 1 Nov 2021 12:37:18 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v6 06/10] rpmsg: Introduce rpmsg_create_default_ept
 function
Message-ID: <YYAlzvXns4Ejxa6S@builder.lan>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-7-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022125426.2579-7-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:

> By providing a callback in the rpmsg_driver structure, the rpmsg devices
> can be probed with a default endpoint created.
> 
> In this case, it is not possible to associated to this endpoint private data
> that could allow the driver to retrieve the context.
> 
> This helper function allows rpmsg drivers to create a default endpoint
> on runtime with an associated private context.
> 
> For example, a driver might create a context structure on the probe and
> want to provide that context as private data for the default rpmsg
> callback.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Julien Massot <julien.massot@iot.bzh>
> ---
>  drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmsg.h      | 13 ++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 53162038254d..92557c49d460 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -132,6 +132,57 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
>  }
>  EXPORT_SYMBOL(rpmsg_destroy_ept);
>  
> +/**
> + * rpmsg_create_default_ept() - create a default rpmsg_endpoint for a rpmsg device
> + * @rpdev: rpmsg channel device
> + * @cb: rx callback handler
> + * @priv: private data for the driver's use
> + * @chinfo: channel_info with the local rpmsg address to bind with @cb
> + *
> + * On register_rpmsg_driver if no callback is provided in the rpmsg_driver structure,
> + * no endpoint is created when the device is probed by the rpmsg bus.
> + *
> + * This function returns a pointer to the default endpoint if already created or creates
> + * an endpoint and assign it as the default endpoint of the rpmsg device.

But if the driver didn't specify a callback, when would this ever
happen?

> + *
> + * Drivers should provide their @rpdev channel (so the new endpoint would belong
> + * to the same remote processor their channel belongs to), an rx callback
> + * function, an optional private data (which is provided back when the
> + * rx callback is invoked), and an address they want to bind with the
> + * callback. If @addr is RPMSG_ADDR_ANY, then rpmsg_create_ept will
> + * dynamically assign them an available rpmsg address (drivers should have
> + * a very good reason why not to always use RPMSG_ADDR_ANY here).
> + *
> + * Returns a pointer to the endpoint on success, or NULL on error.

Correct kerneldoc is "Return: ..."

> + */
> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
> +						rpmsg_rx_cb_t cb, void *priv,
> +						struct rpmsg_channel_info chinfo)
> +{
> +	struct rpmsg_endpoint *ept;
> +
> +	if (WARN_ON(!rpdev))
> +		return NULL;
> +
> +	/* It does not make sense to create a default endpoint without a callback. */
> +	if (!cb)
> +		return NULL;
> +
> +	if (rpdev->ept)
> +		return rpdev->ept;

How does the caller know if they should call rpmsg_destroy_ept() on the
returned ept or not?

> +
> +	ept = rpdev->ops->create_ept(rpdev, cb, priv, chinfo);
> +	if (!ept)
> +		return NULL;
> +
> +	/* Assign the new endpoint as default endpoint */
> +	rpdev->ept = ept;
> +	rpdev->src = ept->addr;
> +
> +	return ept;
> +}
> +EXPORT_SYMBOL(rpmsg_create_default_ept);
> +
>  /**
>   * rpmsg_send() - send a message across to the remote processor
>   * @ept: the rpmsg endpoint
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 6fe51549d931..b071ac17ff78 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -172,6 +172,9 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *);
>  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
>  					rpmsg_rx_cb_t cb, void *priv,
>  					struct rpmsg_channel_info chinfo);
> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,

Is there ever a case where someone outside drivers/rpmsg/ should call
this function?

Regards,
Bjorn

> +						rpmsg_rx_cb_t cb, void *priv,
> +						struct rpmsg_channel_info chinfo);
>  
>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> @@ -236,6 +239,16 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>  	return NULL;
>  }
>  
> +static inline struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
> +							      rpmsg_rx_cb_t cb, void *priv,
> +							      struct rpmsg_channel_info chinfo)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return NULL;
> +}
> +
>  static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
>  {
>  	/* This shouldn't be possible */
> -- 
> 2.17.1
> 
