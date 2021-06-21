Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B66C4743C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 22:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A7C360E08
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 22:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhFUWoz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Jun 2021 18:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbhFUWoy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jun 2021 18:44:54 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0DAC061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Jun 2021 15:42:38 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id o21so9364092pll.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Jun 2021 15:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JCTSVkIytk/Hp0iEchwMobckKs7yA/n0NMw1lar0mLg=;
        b=heKd2ClbKCDXRwF6fkwDkcbMHXcQwPByNrGsZHf/mglW82+G95Qrwyq4r4Cka9FXsV
         mnvwlivYWR8kVKPhO+ZEAmnjtUGzXUkU+h9ZeqGyFviJCYhufhjWDHmELeFYxihn3eNk
         5I4bZvf3TkcyzPJh6ULTc39PaYMgtSOtSPneodBxPNI1CzdaC5WxWGsSG+5xfZAGNsOF
         z4OWXGBBdcV4xgIs/tnNP1UYKljQwTPqn9DFg3181EqFU3W+I4HuMcREzxOy8HThTRbl
         c81JnLUqTlujjre6zKxFS5b//u4mvRzwMGax3pc0C0fWSnjJTttrIIUu3L1HvWw8Dhdd
         8tTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JCTSVkIytk/Hp0iEchwMobckKs7yA/n0NMw1lar0mLg=;
        b=rk9xu9oneQUYhzj2WleqZBO3y6gpWpndkPbsIdbxT/gDH2QsomW+eQsUfBt/dD5P77
         zhSphKcpZc0wuxxyBqWGZKUGb0i0u+30ol6gJpqq34gWvuTs0iDIGtv6fQimmISReLyh
         RZ9acXhjSsdIFQHdzAczKihc2F6C55LTAg7Cd6p3CR8heCb9gWpKQn2qn6LrDpfcWd0V
         +m36TiduAz2gH7ovp0qM0MtlO3rxvoBWG0v+WdkCIIgi8BDdvJqqiKI6Z6IstG7qGaDw
         pek/Yyvy4rAOLqyCGSpw1fiIqvbSSlHGnmqOzpKO+pQ0xFBq0oZh+pFmSFarINMgsA6w
         A5gw==
X-Gm-Message-State: AOAM533TDB23A3unFoxivDEimUIOyKPJHkL7KIumimyQCk/sX7Kz71ta
        jkzDR7Of+/1+loy+VjFqE+C4qg==
X-Google-Smtp-Source: ABdhPJw380SDPCqztfQNuWLssT48FIFqA/Fzbx9ACZhnNr8oIqJQVAOfOEWjzQ5EYcebKaB890LLAw==
X-Received: by 2002:a17:90a:1b25:: with SMTP id q34mr499846pjq.163.1624315358306;
        Mon, 21 Jun 2021 15:42:38 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c5sm4584329pfv.47.2021.06.21.15.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 15:42:37 -0700 (PDT)
Date:   Mon, 21 Jun 2021 16:42:35 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH 1/4] rpmsg: Introduce rpmsg_create_default_ept function
Message-ID: <20210621224235.GB980846@p14s>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
 <20210607173032.30133-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607173032.30133-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 07, 2021 at 07:30:29PM +0200, Arnaud Pouliquen wrote:
> The rpmsg devices can be probed without default endpoint. This function
> provides the capability for rpmsg drivers to create a default endpoint
> on runtime.
> 
> For example, a driver might want the rpmsg core dispatcher to drop its
> messages until it is ready to process them. In this case, the driver will
> create the default endpoint when the conditions are met to process the
> messages.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmsg.h      | 14 +++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e5daee4f9373..07b680bda61f 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -115,6 +115,57 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
>  }
>  EXPORT_SYMBOL(rpmsg_create_ept);
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
> + * a endpoint and assign it as the default endpoint of the rpmsg device.
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
> +	/* It does not make sense to create a default  endpoint without a callback. */
> +	if (!cb)
> +		return NULL;
> +
> +	if (rpdev->ept)
> +		return rpdev->ept;
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
>   * rpmsg_destroy_ept() - destroy an existing rpmsg endpoint
>   * @ept: endpoing to destroy
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index d97dcd049f18..ab034061722c 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -172,6 +172,9 @@ void rpmsg_destroy_ept(struct rpmsg_endpoint *);
>  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *,
>  					rpmsg_rx_cb_t cb, void *priv,
>  					struct rpmsg_channel_info chinfo);
> +struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
> +						rpmsg_rx_cb_t cb, void *priv,
> +						struct rpmsg_channel_info chinfo);
>  
>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len);
>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
> @@ -234,6 +237,17 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>  	return ERR_PTR(-ENXIO);
>  }
>  
> +static inline struct rpmsg_endpoint *rpmsg_create_default_ept(struct rpmsg_device *rpdev,
> +							      rpmsg_rx_cb_t cb,
> +							      void *priv,

Please move this to the previous line to match the definition in the other arm
of the #if.

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
