Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854E8C11F65
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Jun 2021 20:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64DD2610E6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Jun 2021 20:38:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbhF3Ukz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Jun 2021 16:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234208AbhF3Uky (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Jun 2021 16:40:54 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F140C061756
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Jun 2021 13:38:25 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cx9-20020a17090afd89b0290170a3e085edso2255107pjb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Jun 2021 13:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=29U3jHG7Pp1+7u6Mh/ME/IzDFz5tOMaeoDOJAA5iyCc=;
        b=LATc6+sHrVVjNkZ/A2Q4iru8qz4SPu0DPaZ030h0AfrsZqQR7E2wruOhIi2/igoRmB
         VXUVgpAx9PqQLsTyGd0l2CJFMX8Wg7DQPOSv2eu9hN+0koZUW0EtnLYMUiVPH8yJwQvf
         kDUUB0NbFWHYyyozUlpGS4pkc2qUCxbUr5t1kjAsjyMPDHXy9iOnqCjQO/1xu0fWvnve
         CEmh7WZgu+FV8Lu/L7MN3DZrmrGKWe+80/2XYRHoDEPyZgb/faX3Z3qX3blBQ0XpTkUl
         EgOxN7sQ0E5DODJ/ZR5lmyASuI+Hk889QyJ5J2RJg8Jc9FRvx9qKOlcnHlGMghFfqS3G
         IcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=29U3jHG7Pp1+7u6Mh/ME/IzDFz5tOMaeoDOJAA5iyCc=;
        b=p1XHh5NbESI1es3ix0ftneB+UP2TCki3aJVOkVKS3lRjGZLnYu2EpkgJxjnLRy/2es
         YlCzX+Nj7TEh/CbU8pLiJB0on4rFhOUmuJVtOjW9aIOIQENMgf5C8Z9lEKv2+99bKBtk
         baePTRUIRHvEyFBAEgdknBj3gioKMNtxZLt2kigapuN057Glc5+6BQu4D+4vO/HX/KV7
         GKCNVTk409OimKPu1NCzmhk6W3nuySSXLDKP+rGckz02j9z/dXv4g71Iacqfnol3pEVy
         qPD2kjelp0zYhj50blGWBuBDVaLHao0akJc6z5zGsqWvpoLv+e3bNhqEOIixl3psDOMb
         +YEg==
X-Gm-Message-State: AOAM533b4P3YJnYEh/rMeuq437OeVUxBP8giv6asrY8M8UjdpWF+c6FC
        o7qHUiA7A2PjHevClbyqBx6R0g==
X-Google-Smtp-Source: ABdhPJySADZzfAvXzFglO2HxoY3PDjww1phzUZfKG8HhCFxivUc3Eir5TyRK7xqh6yHUpZBE6wuM/Q==
X-Received: by 2002:a17:902:a981:b029:116:a139:6054 with SMTP id bh1-20020a170902a981b0290116a1396054mr33649783plb.60.1625085504194;
        Wed, 30 Jun 2021 13:38:24 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p10sm22283464pfn.147.2021.06.30.13.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 13:38:23 -0700 (PDT)
Date:   Wed, 30 Jun 2021 14:38:21 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v2 1/4] rpmsg: Introduce rpmsg_create_default_ept function
Message-ID: <20210630203821.GA1290178@p14s>
References: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
 <20210623150504.14450-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623150504.14450-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 23, 2021 at 05:05:01PM +0200, Arnaud Pouliquen wrote:
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
> ---
> 
> update from V1:
> - Minor: alignement of the function parameter to have homogenous function declaration.
> ---
> 
>  drivers/rpmsg/rpmsg_core.c | 51 ++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmsg.h      | 13 ++++++++++
>  2 files changed, 64 insertions(+)
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

s/"a endpoint"/"an endpoint"

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

s/"default  endppoint"/"default endpoint"

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

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
> index d97dcd049f18..11f473834e86 100644
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
> @@ -234,6 +237,16 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>  	return ERR_PTR(-ENXIO);
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
