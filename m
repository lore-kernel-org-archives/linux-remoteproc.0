Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6B3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 00:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D32860FD8
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 00:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243882AbhJIAGv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 20:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243797AbhJIAGv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 20:06:51 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79307C061570
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 17:04:55 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id u69so3378573oie.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 17:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9N6N5ZTR9CIN4xom+ZlVChwK9wG/IG6oiW3V0bEVeE0=;
        b=pnxjmjuB6yVd7ZXZnO/+xjCpCQiPZPzLM+yHPuwW4K98MFNX8Zlp9l5ZhU6MNa35Xq
         DpTBfPXSsPYedCt2+dphpLoLh76LXhwMOaQ4j+vLc2LVfSe/5YxWWcjjkoeAXVhg/W69
         3Vm3tJanr3Dr5cwiAYiJptcQbl/RNloGTul82Wm4CB/vu+BjsZHEBeNk7r4lUhf1oMUi
         GKw7U2V6A2vpfgvlTGkExT1cEfiyb0/mp95ErxQFH6d9FKCvz1iEYKhs/N8p4YhLS/4s
         s8JIzGE2wWjlSSnhBSeTqQp/TCLCg0k911f3jlbl4HjaH805QWDVZTXJXHKOUB2ya4k2
         5WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9N6N5ZTR9CIN4xom+ZlVChwK9wG/IG6oiW3V0bEVeE0=;
        b=VQOCIrN3H18Gr8oJqNKW3/OsAfd2huSvZhmhC62YK9GSX80S5ICFYhxS/T/4nAg2Gj
         ab/ikcP3v1cXBq6LJd21v7VZttfzJVEq82f97DwNK0ve/Rv+wnJJiKSTO3aJ03N2ojYQ
         vQ5GtR0wzVUM7ahGoFJeD4Zl9XcaNC2e5OmMQuOqibPhSfUIYuXhVTpSfF5LznlA+tsR
         JD/kL738IZAjtp7ry/Pj6QjssA/feVVJErGYRHDpfxpVwM8k8vdypJUpFWTxCuGlHa2g
         dm4VSaNPaYmyf9yoTwAvyxNEu/Ew7nr068jlEY+zPRg55a9n+/XSgMDPrN7mD3PKccW+
         nHhw==
X-Gm-Message-State: AOAM531jRCgtzYWS9qFpAcMrfvkrpy+lauDT9pTOJ0GT8QFJmhANkjIt
        yvSHlF0pGeoV/LAWrQ4K5oU2DA==
X-Google-Smtp-Source: ABdhPJxnYVoBlj5hRyP6LkDot6B3z6O7w8iCB/+04vuWpx5srscRpG1TfqpTbY3LQw+aE/sAB1Fb8A==
X-Received: by 2002:a54:4f0e:: with SMTP id e14mr10134624oiy.73.1633737894759;
        Fri, 08 Oct 2021 17:04:54 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id c17sm237599oiw.10.2021.10.08.17.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 17:04:54 -0700 (PDT)
Date:   Fri, 8 Oct 2021 17:06:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v4 4/4] rpmsg: char: Introduce the "rpmsg-raw" channel
Message-ID: <YWDdCFot7G0IuQNg@ripper>
References: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
 <20210712131900.24752-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712131900.24752-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 12 Jul 06:19 PDT 2021, Arnaud Pouliquen wrote:

> Allows to probe the endpoint device on a remote name service announcement,
> by registering a rpmsg_driverfor the "rpmsg-raw" channel.
> 
> With this patch the /dev/rpmsgX interface can be instantiated by the remote
> firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Julien Massot <julien.massot@iot.bzh>
> ---
>  drivers/rpmsg/rpmsg_char.c | 75 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index bd728d90ba4c..1b7b610e113d 100644
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

The length should relate to the size of the destination buffer.
This looks like an excellent job for strscpy_pad()

> +	chinfo.src = rpdev->src;
> +	chinfo.dst = rpdev->dst;
> +
> +	eptdev =  __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo);

Note that this creates a new endpoint device as a child of the rpdev,
while new endpoints created by RPMSG_CREATE_EPT_IOCTL are parented by
the rpmsg_ctrl device.

So it is possible to create two /dev/rpmsgN nodes for the same endpoint,
I believe with the outcome that this one will be open but
__rpmsg_create_ept() in virtio_rpmsg_bus should return NULL if the user
tries to open the other one.

> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	/*
> +	 * Create the default endpoint associated to the rpmsg device and provide rpmsg_eptdev
> +	 * structure as callback private data.
> +	 */
> +	ept = rpmsg_create_default_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);

Why don't you just set rpdev->priv to eptdev and make rpmsg_ept_cb the
callback of your rpmsg_driver?

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

What happens when __rpmsg_chrdev_eptdev_create() delivers a uevent and
user space quickly calls open() on the newly created /dev/rpmsgN, before
the next line?

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

I would expect that this list would grow, but you hard coded
RPMSG_CHAR_DEVNAME in probe, so that won't work.

Regards,
Bjorn

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
