Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84EFC11F65
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Jun 2021 20:53:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98153613EC
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Jun 2021 20:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbhF3Uzj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Jun 2021 16:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233710AbhF3Uzj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Jun 2021 16:55:39 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55B9C061756
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Jun 2021 13:53:08 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id d12so3580832pgd.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Jun 2021 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d9T9e25p90hnahZI/XHUP5v2qF1RQYbtkY6xr1j/vfE=;
        b=zeqSy28EbrNu1G8GySqxk5v25xKd0lZehGsfXmsfCSZkeqGRBOeAwdwdFH/v5F9ka+
         uxNi6AI8FWoy+mL6rOdfHZPTDQbu0w/mjaXJdEaVBqSz53yjkxQxOAIFXKpgqdpQKZwf
         qBgIpKlBC/jgcKDYo5iV5JVYZUrm0A3WuxyeKoANspl7G9eJ6ew+ppPpTGC3TeQIrRfm
         PlRh0QM0iTm3uLnoAma1MAt+IH35RgpV/MzFkyLrlXSqK9KmkKm9lJaYrBrSnu2jVhAr
         XFQIugfQiyhYD1Om+5txUXAUnaDPJ31dt1W9d7HPuoJnQ3cDuTstSr9iFLYbu0P29k99
         4E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d9T9e25p90hnahZI/XHUP5v2qF1RQYbtkY6xr1j/vfE=;
        b=DbdO4QygbMPK2XoEDluTrY7X9dtQvpsMzu6W6472ci8jvK95ipfn3pIlMhOHr9nol9
         aALWObBZxxkHKrc9w0YBKSd9aAfk4s07MM+O0ZkQbpw0nz1VBgUJ2KeIGN2lJQSQOKFR
         YFYbqhnJEGAaF7Klq5sRU9KqhqXMhlR8maekqO3ODbIW8Xmei/oAkWygORug3CvHRj/l
         /f22wnrtWXe5/DX3PkYIbyCIVMFvIH3OMs3xahSW07HAHZsi3HmxC/3KmzHLy/bNLYLE
         CN1EwUWlHLfvH+ZpNeOtfE4t1KJldiNPpMdlirixKc7BiwCsvHpcwLovywq4bn2jgp40
         C3+A==
X-Gm-Message-State: AOAM530jvYH38+jFv0ahVCm4iuljbfHKutt7951QunyG/UfqVukQQicr
        CZqZoX0DFFSw3ZiXpjlbaUuJGQ==
X-Google-Smtp-Source: ABdhPJwxr2oAcQi1U2XicvjZgSQSqQpv+Lv0sdEhNFZ2xUFT+hgMKCDGVd9bXEp2SehOINQmtbUaMw==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id i22-20020aa78b560000b02902b977bed305mr37754864pfd.61.1625086388389;
        Wed, 30 Jun 2021 13:53:08 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c72sm4106741pfb.145.2021.06.30.13.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 13:53:07 -0700 (PDT)
Date:   Wed, 30 Jun 2021 14:53:05 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v2 4/4] rpmsg: char: Introduce the "rpmsg-raw" channel
Message-ID: <20210630205305.GD1290178@p14s>
References: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
 <20210623150504.14450-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623150504.14450-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 23, 2021 at 05:05:04PM +0200, Arnaud Pouliquen wrote:
> Allows to probe the endpoint device on a remote name service announcement,
> by registering a rpmsg_driverfor the "rpmsg-raw" channel.
> 
> With this patch the /dev/rpmsgX interface can be instantiated by the remote
> firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> update vs V1:
> - management of the default endpoint creation in the driver probe.
> 
> ---
>  drivers/rpmsg/rpmsg_char.c | 75 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 2 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index a75dce1e29d8..3748de00c97b 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -25,6 +25,8 @@
>  
>  #include "rpmsg_char.h"
>  
> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> +
>  static dev_t rpmsg_major;
>  static struct class *rpmsg_class;
>  
> @@ -421,6 +423,61 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info chinfo;
> +	struct rpmsg_eptdev *eptdev;
> +	struct rpmsg_endpoint *ept;
> +
> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> +	chinfo.src = rpdev->src;
> +	chinfo.dst = rpdev->dst;
> +
> +	eptdev =  __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	/*
> +	 * Create the default endpoint associated to the rpmsg device and provide rpmsg_eptdev
> +	 * structure as callback private data.
> +	 */
> +	ept = rpmsg_create_default_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> +	if (!ept) {
> +		dev_err(&rpdev->dev, "failed to create %s\n", eptdev->chinfo.name);
> +		put_device(&eptdev->dev);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Do not allow the creation and release of an endpoint on /dev/rpmsgX open and close,
> +	 * reuse the default endpoint instead
> +	 */
> +	eptdev->static_ept = true;
> +
> +	return 0;
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
> +	.drv.name = "rpmsg_chrdev",
> +};
> +
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
> @@ -434,16 +491,30 @@ static int rpmsg_chrdev_init(void)
>  	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>  	if (IS_ERR(rpmsg_class)) {
>  		pr_err("failed to create rpmsg class\n");
> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
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
