Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E910AC47080
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 17:22:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAA5B613AE
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 17:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234009AbhFARYh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Jun 2021 13:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbhFARYg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Jun 2021 13:24:36 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF1CC061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Jun 2021 10:22:53 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id k22-20020a17090aef16b0290163512accedso149361pjz.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Jun 2021 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Wn+gKBGF4EW/y5WIOTECsgw0m1+QurVLeNYFkfOOlsc=;
        b=KaKo3ASizyyNS70aGjfD2CcGO1zJazK2GwwfwvSDL1366zyLuIx9NfJKBHPZcjAhcR
         vX0AbC2oHljZnGGRc/XS5xCmjuDsk609QOjj7IVVjsb+V9QpFznQxRSuC505guk3wOFU
         DmgriTVuhb6AKOHffCMEcxz3gtIvMTmjnZ8k156lEkXSjCHnCLv7KrUyLYYP5G3Q3dUW
         6U5Sou2Lagvt4fEcYIYMQlFZxvcx8uZOEItvN+JUOrgmwd7BCt/XDIJtmmBGL23i0XGr
         A1iqUDqigsFVP8B4rQgIcPWbEAEjavVSdYiMVtQMfZXSCLNkxxd9sZcx1DlmipZ3Q3OO
         P5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wn+gKBGF4EW/y5WIOTECsgw0m1+QurVLeNYFkfOOlsc=;
        b=Rrn5phSposQMOBb8mCMDntygLyB5ZUl3xbmpZvpS1wIqVVWdij4O9jjuvfL4fPb4rz
         XV8Ng9pVxSmq9J+kE220rKF9e02Fgki0/8XyZWY5mI9yvuTC75C1CaheyBbGnxRIaJLC
         8eIiZ4r13ulj22XTbT+kl4jb7g6NSGGRNcFtO7F3F+q5lN8LBAuDCMq1p0sByWVqt4aG
         BPZ0qp6iudVAzJ5nVrUbdgFcUYZtG7MYeEgpAAx1jWbTDfM1/xbEJBMIEO5UnGroC4a/
         ShVGqJYQLbkflBAS6bGzC9dqVLeVD4NBEusHs0ped7AyMkh15c2ffbSKnJy6QgiPlHg3
         NIhw==
X-Gm-Message-State: AOAM532B/EShroqQmNS89JuQEGgnwmvaoAua58rsvyjCCdvtB1lDdJt2
        FF7ie6DI9cLvE2xFIm0JeqGTRg==
X-Google-Smtp-Source: ABdhPJzQnr7G/z0kDsVkdqTKrBm/w6okKdf+GtoK7mDZWhZj9hSJI2bxukIoInbklBcA+b52dMTsJw==
X-Received: by 2002:a17:903:248e:b029:101:fa49:3f96 with SMTP id p14-20020a170903248eb0290101fa493f96mr17923282plw.16.1622568172919;
        Tue, 01 Jun 2021 10:22:52 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y5sm6870301pfb.19.2021.06.01.10.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:22:52 -0700 (PDT)
Date:   Tue, 1 Jun 2021 11:22:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] remoteproc: k3-r5: Refactor mbox request code in
 start
Message-ID: <20210601172250.GD1759269@xps15>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-4-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522000309.26134-4-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, May 21, 2021 at 07:03:06PM -0500, Suman Anna wrote:
> Refactor out the mailbox request and associated ping logic code
> from k3_r5_rproc_start() function into its own separate function
> so that it can be re-used in the soon to be added .attach() ops
> callback.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 66 ++++++++++++++----------
>  1 file changed, 40 insertions(+), 26 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 2975393ebacd..e7e1ca71763e 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -376,6 +376,44 @@ static inline int k3_r5_core_run(struct k3_r5_core *core)
>  				       0, PROC_BOOT_CTRL_FLAG_R5_CORE_HALT);
>  }
>  
> +static int k3_r5_rproc_request_mbox(struct rproc *rproc)
> +{
> +	struct k3_r5_rproc *kproc = rproc->priv;
> +	struct mbox_client *client = &kproc->client;
> +	struct device *dev = kproc->dev;
> +	int ret;
> +
> +	client->dev = dev;
> +	client->tx_done = NULL;
> +	client->rx_callback = k3_r5_rproc_mbox_callback;
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
> +
>  /*
>   * The R5F cores have controls for both a reset and a halt/run. The code
>   * execution from DDR requires the initial boot-strapping code to be run
> @@ -495,38 +533,14 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>  {
>  	struct k3_r5_rproc *kproc = rproc->priv;
>  	struct k3_r5_cluster *cluster = kproc->cluster;
> -	struct mbox_client *client = &kproc->client;
>  	struct device *dev = kproc->dev;
>  	struct k3_r5_core *core;
>  	u32 boot_addr;
>  	int ret;
>  
> -	client->dev = dev;
> -	client->tx_done = NULL;
> -	client->rx_callback = k3_r5_rproc_mbox_callback;
> -	client->tx_block = false;
> -	client->knows_txdone = false;
> -
> -	kproc->mbox = mbox_request_channel(client, 0);
> -	if (IS_ERR(kproc->mbox)) {
> -		ret = -EBUSY;
> -		dev_err(dev, "mbox_request_channel failed: %ld\n",
> -			PTR_ERR(kproc->mbox));
> +	ret = k3_r5_rproc_request_mbox(rproc);
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
>  	/* TODO: add boot_addr sanity checking */
> -- 
> 2.30.1
> 
