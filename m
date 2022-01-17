Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696BAC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jan 2022 23:04:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238413AbiAQXEF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Jan 2022 18:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237756AbiAQXED (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jan 2022 18:04:03 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FDFC061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 15:04:03 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id s127so25817328oig.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 15:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F0QppAE3dgrO3ATeoBVK+jA9wQIIxsU1AloQj3TMNp8=;
        b=Uby76qXesTFxE/+DH5qAsUshOdsEdI2bykwDeFrfltv3ZmvtZtPWtnV2c4h+x7wfxW
         qCJbMNuR2SA9Adi4FcRyxAcYHf+R+truNFoZjNFKdrSkSUvws6lN+vZM7bG2S/IzFZJI
         9hGT8WvwcSn7uAUO+PLiOaS4/mNcJw0Db4OVtbsjOD48q8f/8HwXQMAYVuhJuQquTRsA
         oVzvyVlYYCLuO/g37ge/Nry8owS+nFgfOER8fdPGUrGYy8CjY+itDcIXiP8jNaTAeD7o
         KXgXMFYc0hiiKQ6EMzQkM75w/qkUWqViB6teaJylpAw5TU0tcgDSLpDl1ZCEXSCYN9nW
         i0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F0QppAE3dgrO3ATeoBVK+jA9wQIIxsU1AloQj3TMNp8=;
        b=PcT4zjVSSpHlQu8+yai7ZgMdAb8tXJSD5Mq4HWRJvq0Elm1eIDjHFSN2RaY+PhfWRQ
         RHP5szCYnod8k+HKN2Vjqrzx4JtDCM0hE2c4z8rsADT/VilUHLwSS4wC2eLgtybwx6M6
         sqK60Bc/3XwUcCJjctCFiULgpfYTAgwUujYVskR6sNIP6LnjcGHEw4fKs/+3zXrYohus
         gqVIKm8ajiiVu5xHpVsgfZCheM868zmWPDhdYWpCZEhySHPHBkE6DEoP5jL+NIxcG7vV
         HZcxqdqc7AgbVgUo99Ub6um9se+kIf9jFe8SJl5r3XUjsoh05urrkbMtFpQl5ZDzrVJL
         9R6w==
X-Gm-Message-State: AOAM533cdx/cLEAUDjZ4cd2HSDyBOUf3csi/PM9r0axzLBf/FcsFwBe1
        EaGeorhR3BCMjimLTt4uRpZG1WOJ6cPxxw==
X-Google-Smtp-Source: ABdhPJxCaDj7BjPF0fezJDfx1f2OYftgE4/mn+paMKJrEWGTwkSNf0Ue8jHo5S1hMCHKH4eVtEGXpw==
X-Received: by 2002:a05:6808:169f:: with SMTP id bb31mr25041369oib.87.1642460642878;
        Mon, 17 Jan 2022 15:04:02 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l39sm6514722otv.63.2022.01.17.15.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 15:04:02 -0800 (PST)
Date:   Mon, 17 Jan 2022 17:03:57 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v8 11/13] rpmsg: char: Introduce the "rpmsg-raw" channel
Message-ID: <YeX13cUAerjCM5Li@builder.lan>
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
 <20211207080843.21222-12-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207080843.21222-12-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 07 Dec 02:08 CST 2021, Arnaud Pouliquen wrote:

> Allows to probe the endpoint device on a remote name service announcement,
> by registering a rpmsg_driverfor the "rpmsg-raw" channel.
> 
> With this patch the /dev/rpmsgX interface can be instantiated by the remote
> firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 64 ++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_ctrl.c |  7 +++--
>  2 files changed, 69 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index cf97839f5833..92b44630e03a 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -435,6 +435,58 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info chinfo;
> +	struct rpmsg_eptdev *eptdev;
> +	struct device *dev = &rpdev->dev;
> +
> +	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
> +	chinfo.src = rpdev->src;
> +	chinfo.dst = rpdev->dst;
> +
> +	eptdev = rpmsg_chrdev_eptdev_alloc(rpdev, dev);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	/*
> +	 * Create the default endpoint associated to the rpmsg device and provide rpmsg_eptdev
> +	 * structure as callback private data.

If the only this the probe function does is to create a new endpoint
with the same properties as the rpdev, why can't you just specify a
callback on the rpmsg_chrdev_driver?

As this isn't the typical way you create a default endpoint I think the
reasoning behind this warrants a proper explanation in the commit
message.

> +	 * Do not allow the creation and release of an endpoint on /dev/rpmsgX open and close,
> +	 * reuse the default endpoint instead

This sentence doesn't tell me anything about this code snippet and
doesn't indicate that it relates to the snippet added elsewhere in this
file by the previous patch.

> +	 */
> +	eptdev->default_ept = rpmsg_create_default_ept(rpdev, rpmsg_ept_cb, eptdev, chinfo);
> +	if (!eptdev->default_ept) {
> +		dev_err(&rpdev->dev, "failed to create %s\n", chinfo.name);
> +		put_device(dev);
> +		kfree(eptdev);
> +		return -EINVAL;
> +	}
> +
> +	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
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
> +	{ .name	= "rpmsg-raw" },
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
> @@ -445,12 +497,24 @@ static int rpmsg_chrdev_init(void)
>  		return ret;
>  	}
>  
> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> +		goto free_region;
> +	}
> +
>  	return 0;
> +
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
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
>  module_exit(rpmsg_chrdev_exit);
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 59d2bd264fdb..298e75dc7774 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -10,6 +10,9 @@
>   * Based on rpmsg performance statistics driver by Michal Simek, which in turn
>   * was based on TI & Google OMX rpmsg driver.
>   */
> +
> +#define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt

These changes seems unrelated to above.

Regards,
Bjorn

> +
>  #include <linux/cdev.h>
>  #include <linux/device.h>
>  #include <linux/fs.h>
> @@ -193,13 +196,13 @@ static int rpmsg_ctrldev_init(void)
>  
>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
>  	if (ret < 0) {
> -		pr_err("rpmsg: failed to allocate char dev region\n");
> +		pr_err("failed to allocate char dev region\n");
>  		return ret;
>  	}
>  
>  	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
>  	if (ret < 0) {
> -		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
> +		pr_err("failed to register rpmsg driver\n");
>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  	}
>  
> -- 
> 2.17.1
> 
