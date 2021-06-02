Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ABAC4708F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 16:04:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B7C5616E9
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 16:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbhFBQF5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbhFBQF5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Jun 2021 12:05:57 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FD6C061574
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Jun 2021 09:04:14 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 6so2617390pgk.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Jun 2021 09:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XKxsJlne+LArk5awxmh1nwPa7SN5h9s/re93Xtt4ka8=;
        b=FjEfvrJD0PcwRixn9+ipYc2UVI2BVVXxHzEBpdpdib/cTv5yJ75wIJx+OrYoVpxajD
         wj2ZV3OQxeN8Ily3fsGw06aAiUR198DJqYG8plUdI8K6LKjkv1/qHgqmSxSvjh1UWK0k
         k9/x+DtgsGZ9BrtzsjvfIAoDHHEcn550Qs0pUuddetVdM8fXClwxuZzWD9fdbZALjHUr
         xAfvKcoYYg8i1UdPItt4lObs+J5rspbn9XCEXmwH/YynjaMQ1BxeVXzJNirYDqGu6x2y
         wCjDJVYA44ppLpbjwsY5H6PTzRYZCgIzA2aU+0I2PBrftmIxDK/eICpD3WtVJgFYjqu2
         g73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XKxsJlne+LArk5awxmh1nwPa7SN5h9s/re93Xtt4ka8=;
        b=m5HlqzsNLO9ZNAvSdnGzLTcm4o226hYS/KAYAI5g8sOJctE7gl1RjrGzNvy2pgzd5M
         9YV79GYEXIEQJ/+WSrC02nO89i633YwPy4d3eL2IjYetZjJinUZWYVQ8bZ+iReGre9q7
         Z8IH0++KkgF/7VxAz1ZOlVGEx1+FGMU8oHySt4JoeYZOWHl7mgUQ/UmMr7qjddf3EkH3
         e8yRcL977yVCOP28yQ2mH9DDQonNscduXNI0Ojw0NIh3VwUuVaqKDQTUv7tr6PuVd9o7
         1xGYyIomGo8kVZTwMrD2TnDqy4qoTlZKsRaDWo65JburO/I4LYH5Ojn19VfJqiOakU+J
         rEig==
X-Gm-Message-State: AOAM533JiS93xmvlGOK+pA9AJeKtHFGmiZA2PbTC/c+J9qhrzSEo2KyL
        t+MKau0xG9UYNtJIqMcpNUuL4LbwDzGHwQ==
X-Google-Smtp-Source: ABdhPJwMUb2pY+sg5TfsR33k8PDKyPC3ae62iZt5DGmYIGl1OkmztCpjP4ArzfBhi8o7V/STIGWjTA==
X-Received: by 2002:a05:6a00:c86:b029:2e9:3041:162f with SMTP id a6-20020a056a000c86b02902e93041162fmr27619121pfv.78.1622649853558;
        Wed, 02 Jun 2021 09:04:13 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c130sm103715pfc.51.2021.06.02.09.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:04:12 -0700 (PDT)
Date:   Wed, 2 Jun 2021 10:04:10 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] remoteproc: k3-dsp: Refactor mbox request code in
 start
Message-ID: <20210602160410.GA1797307@xps15>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-6-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522000309.26134-6-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, May 21, 2021 at 07:03:08PM -0500, Suman Anna wrote:
> Refactor out the mailbox request and associated ping logic code
> from k3_dsp_rproc_start() function into its own separate function
> so that it can be re-used in the soon to be added .attach() ops
> callback.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 65 ++++++++++++++---------
>  1 file changed, 39 insertions(+), 26 deletions(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index fd4eb67a6681..faf60a274e8d 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -216,6 +216,43 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
>  	return ret;
>  }
>  
> +static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
> +{
> +	struct k3_dsp_rproc *kproc = rproc->priv;
> +	struct mbox_client *client = &kproc->client;
> +	struct device *dev = kproc->dev;
> +	int ret;
> +
> +	client->dev = dev;
> +	client->tx_done = NULL;
> +	client->rx_callback = k3_dsp_rproc_mbox_callback;
> +	client->tx_block = false;
> +	client->knows_txdone = false;
> +
> +	kproc->mbox = mbox_request_channel(client, 0);
> +	if (IS_ERR(kproc->mbox)) {
> +		ret = -EBUSY;
> +		dev_err(dev, "mbox_request_channel failed: %ld\n",
> +			PTR_ERR(kproc->mbox));
> +		return ret;
> +	}
> +
> +	/*
> +	 * Ping the remote processor, this is only for sanity-sake for now;
> +	 * there is no functional effect whatsoever.
> +	 *
> +	 * Note that the reply will _not_ arrive immediately: this message
> +	 * will wait in the mailbox fifo until the remote processor is booted.
> +	 */
> +	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> +	if (ret < 0) {
> +		dev_err(dev, "mbox_send_message failed: %d\n", ret);
> +		mbox_free_channel(kproc->mbox);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
>  /*
>   * The C66x DSP cores have a local reset that affects only the CPU, and a
>   * generic module reset that powers on the device and allows the DSP internal
> @@ -273,37 +310,13 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
>  static int k3_dsp_rproc_start(struct rproc *rproc)
>  {
>  	struct k3_dsp_rproc *kproc = rproc->priv;
> -	struct mbox_client *client = &kproc->client;
>  	struct device *dev = kproc->dev;
>  	u32 boot_addr;
>  	int ret;
>  
> -	client->dev = dev;
> -	client->tx_done = NULL;
> -	client->rx_callback = k3_dsp_rproc_mbox_callback;
> -	client->tx_block = false;
> -	client->knows_txdone = false;
> -
> -	kproc->mbox = mbox_request_channel(client, 0);
> -	if (IS_ERR(kproc->mbox)) {
> -		ret = -EBUSY;
> -		dev_err(dev, "mbox_request_channel failed: %ld\n",
> -			PTR_ERR(kproc->mbox));
> +	ret = k3_dsp_rproc_request_mbox(rproc);
> +	if (ret)
>  		return ret;
> -	}
> -
> -	/*
> -	 * Ping the remote processor, this is only for sanity-sake for now;
> -	 * there is no functional effect whatsoever.
> -	 *
> -	 * Note that the reply will _not_ arrive immediately: this message
> -	 * will wait in the mailbox fifo until the remote processor is booted.
> -	 */
> -	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> -	if (ret < 0) {
> -		dev_err(dev, "mbox_send_message failed: %d\n", ret);
> -		goto put_mbox;
> -	}
>  
>  	boot_addr = rproc->bootaddr;
>  	if (boot_addr & (kproc->data->boot_align_addr - 1)) {
> -- 
> 2.30.1
> 
