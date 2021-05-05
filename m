Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9997C43600
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 May 2021 17:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3548C6121F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 May 2021 17:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236352AbhEER3A (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 5 May 2021 13:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235895AbhEERH1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 May 2021 13:07:27 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015D9C03461F
        for <linux-remoteproc@vger.kernel.org>; Wed,  5 May 2021 09:42:03 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id c21so2195115pgg.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 May 2021 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DoaVFzcWT65RDKIsoX6i4zeOSXhY9rWNOtYUEZapV9M=;
        b=mbZtkkRloDaT6rF9tDRW/WZymf+9jLo9twlvhFYxhRfFiYZWjAvMyvN+viRiqjgKqt
         UyNF1Iyh1k99tg8rgQ6BV9Ounqvoxr+rsdEzMRXR1g485Q9YLIoIHHPIXsXrBKG2ZiUD
         nB4R4irRIQryWE92wgzcDCfKhD347u2q3t4um5tDOwylV4/JpVT4quKNpXWYBJD+R1XZ
         5mj3Q2S4ucykX2zQpNuWEZmj6Uy9OWc010d33E+j2WUygzeT0YPt7CZAScPpA/igYKG1
         LCTLsArcXQyVbFFbWENRBoQWIb3qt8GrYR870JQZMymqQ4A/rADuCXEcgXn+I5XPqGD/
         vzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DoaVFzcWT65RDKIsoX6i4zeOSXhY9rWNOtYUEZapV9M=;
        b=F/UruFxiNFcuAHhizQ/SXQxaQR4ndgvwusJ0t9y/DcxcKgtS0eoCRe2HUucJiRxvcp
         O/1zeDR3IxJGlFzoivMX32IblVkdfNuK/Xxv8n6oFldwUxBK2u0+NRRc1HSy44t5LzO4
         +rJDfudACgCU4FnhbwYzr+2+AeqXsI2ga5Wmtc5ZYApUJNE1UVEomn5DXhBFsbHUJTuu
         pHyyw/WaP/2LqJncJZYXH588woqPJGWawf8jYNEuW6OD+PR6G4UgYnhmdMbVQaZw7hNU
         pgHMTCPltD3hNH1O9y1ui6SAOF2O6vrP/54O1mWSSJUfuC03NKTjlBsULRbf+0U3/662
         RAdw==
X-Gm-Message-State: AOAM531v3f6Cdl35gWmkXl19hwi3znpR4ZHwb4v07V7+M07bl/yOefFQ
        Yr+EjOc1aHA5kiW7cscN7jsuNQ==
X-Google-Smtp-Source: ABdhPJy8aXfyfO/v6bt55dmHC/uDTmkRDUhRcGL0u1NDJI/QiWxFP8baqLitM5Yc9kh12gLU5ynfdg==
X-Received: by 2002:a63:5322:: with SMTP id h34mr29849146pgb.182.1620232922466;
        Wed, 05 May 2021 09:42:02 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a18sm7502227pgg.51.2021.05.05.09.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 09:42:01 -0700 (PDT)
Date:   Wed, 5 May 2021 10:41:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg driver for the
 rpmsg char device
Message-ID: <20210505164159.GB1766375@xps15>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

On Thu, Apr 29, 2021 at 03:55:06PM +0200, Arnaud Pouliquen wrote:
> A rpmsg char device allows to probe the endpoint device on a remote name
> service announcement.
> 
> With this patch the /dev/rpmsgX interface is created either by a user
> application or by the remote firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> update from V1:
> 
>  - add missing unregister_rpmsg_driver call on module exit.
> ---
>  drivers/rpmsg/rpmsg_char.c | 53 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 5c6a7da6e4d7..9166454c1310 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -18,6 +18,8 @@
>  
>  #include "rpmsg_char.h"
>  
> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> +
>  static dev_t rpmsg_major;
>  static struct class *rpmsg_class;
>  
> @@ -413,6 +415,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info chinfo;
> +
> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> +	chinfo.src = rpdev->src;
> +	chinfo.dst = rpdev->dst;
> +
> +	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
> +}
> +
> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> +{
> +	int ret;
> +
> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
> +	if (ret)
> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
> +}
> +
> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
> +	{ .name	= RPMSG_CHAR_DEVNAME },
> +	{ },
> +};
> +
> +static struct rpmsg_driver rpmsg_chrdev_driver = {
> +	.probe = rpmsg_chrdev_probe,
> +	.remove = rpmsg_chrdev_remove,
> +	.id_table = rpmsg_chrdev_id_table,
> +	.drv = {
> +		.name = "rpmsg_chrdev",
> +	},
> +};

The sole purpose of doing this is to create instances of rpmsg_chrdevs from the
name service - but is it really needed?  Up to now and aside from GLINK and SMD,
there asn't been other users of it so I'm wondering if it is worth going through
all this trouble.

As such I suggest we don't go out of our way to expose rpmsg_chrdevs to the name
service.  That way patches 4, 5 and 6 of this set can be dropped.

Thanks,
Mathieu

> +
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
> @@ -427,15 +463,30 @@ static int rpmsg_chrdev_init(void)
>  	if (IS_ERR(rpmsg_class)) {
>  		pr_err("failed to create rpmsg class\n");
>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> -		return PTR_ERR(rpmsg_class);
> +		ret = PTR_ERR(rpmsg_class);
> +		goto free_region;
> +	}
> +
> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> +		goto free_class;
>  	}
>  
>  	return 0;
> +
> +free_class:
> +	class_destroy(rpmsg_class);
> +free_region:
> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +
> +	return ret;
>  }
>  postcore_initcall(rpmsg_chrdev_init);
>  
>  static void rpmsg_chrdev_exit(void)
>  {
> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>  	class_destroy(rpmsg_class);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
> -- 
> 2.17.1
> 
