Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646C0C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Nov 2021 16:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A401611EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Nov 2021 16:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhKAQ5x (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Nov 2021 12:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhKAQ5x (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Nov 2021 12:57:53 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4985C061714
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Nov 2021 09:55:19 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id t7-20020a4aadc7000000b002b8733ab498so6479286oon.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Nov 2021 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qP1fwMJNosXJd3rY2TpXHvvGAtJzDNx2SXl6ExsviMQ=;
        b=V26PIPyLm35UREkwxhLpAU+D65ctfhQKrXnJ961B6wix6dROih5QkSCsWjXSjM8pGq
         yJL4Qds1l9N0bdjBpa1TZBQ11d7i5qGLrACTVJmZfWLkdBSf4xjxVdFOiCCI7eM/IcyH
         ledvGpvb37tBnv4Ak0khzYIxuE6brSCAvDpBcezaYMfYiqMoF5xWjBrS1P6FFAWzagqs
         Cnztu2xTcXjJzGPH0rbVlBw4wwPAowAJv17YCWePwHIBHjIijQplYcJwaxF0BdwtQaJ7
         K/x102TIxMOe0khCM3o9Wj0B2+hfoXwBeCvV3VtisxVNb8sLH1VhGQ62+6ciDSe4WUBF
         y2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qP1fwMJNosXJd3rY2TpXHvvGAtJzDNx2SXl6ExsviMQ=;
        b=xA42aKIQATx0uSGYzx/0ibouIYACrLoSFbTmJL5hXP016Zfc7L66jkO08bW/m8cRbh
         KPeJqFHvB1KOOjYp5zoSUD72q/hsRR6NkGMX+5r6hbtadZwPdh3a7GqF4+kM0hnARjyo
         Ne8F8F2ShFgKsuOhzXdeIg28RAFWMFC+2QEHMo/Vp37Ckbgbp315oJ9HUMUclyghH54B
         JRi2FRrzPee0SxNPT3o0CkfqEIAHS+ruRxz+DOw5NRatHFhSyVkWbUoZuApn/0X7Tusg
         ph91hvtDP+CJFfsRlB8vGdAh+Btw+0VLzcC+Kdx+zAEFW4P2jygiyLqzpCjJZ4fcIL2O
         Gy0g==
X-Gm-Message-State: AOAM531Z5SN2SHO636MLH+OT1As6L3UB2q+bGEL9HlTvxRbvJMI9u8ws
        akpLrg3V7VX+mxt+nNHtUhM/lv4OqxH+1i99
X-Google-Smtp-Source: ABdhPJzyatrL8icCuZ1UH6H9Rc0J67z4dYWfR0vBUgdEwdCBZ+DelLuSV4T6yBK3Ph3+NiSGw8db/Q==
X-Received: by 2002:a4a:d785:: with SMTP id c5mr11753757oou.2.1635785719235;
        Mon, 01 Nov 2021 09:55:19 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 91sm4119820otx.12.2021.11.01.09.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:55:17 -0700 (PDT)
Date:   Mon, 1 Nov 2021 11:55:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v6 01/10] rpmsg: char: Export eptdev create an destroy
 functions
Message-ID: <YYAb8P1Exqf4emQ3@builder.lan>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022125426.2579-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:

> To prepare the split of the code related to the control (ctrldev)
> and the endpoint (eptdev) devices in 2 separate files:
> 
> - Rename and export the functions in rpmsg_char.h.
> 
> - Suppress the dependency with the rpmsg_ctrldev struct in the
>   rpmsg_eptdev_create function.
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  update vs previous revision:
>   - add comment to explain the IS_REACHABLE usage
>   - remove Mathieu Poirier reviewed-by as patch updated
> ---
>  drivers/rpmsg/rpmsg_char.c | 18 +++++++-----
>  drivers/rpmsg/rpmsg_char.h | 57 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_char.h
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index b5907b80727c..941c5c54dd72 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> + * Copyright (C) 2021, STMicroelectronics
>   * Copyright (c) 2016, Linaro Ltd.
>   * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
>   * Copyright (c) 2012, PetaLogix
> @@ -22,6 +23,8 @@
>  #include <linux/uaccess.h>
>  #include <uapi/linux/rpmsg.h>
>  
> +#include "rpmsg_char.h"
> +
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>  
>  static dev_t rpmsg_major;
> @@ -76,7 +79,7 @@ struct rpmsg_eptdev {
>  	wait_queue_head_t readq;
>  };
>  
> -static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>  {
>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>  
> @@ -95,6 +98,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
>  
>  static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>  			void *priv, u32 addr)
> @@ -278,7 +282,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>  		return -EINVAL;
>  
> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
>  }
>  
>  static const struct file_operations rpmsg_eptdev_fops = {
> @@ -337,10 +341,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	kfree(eptdev);
>  }
>  
> -static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>  			       struct rpmsg_channel_info chinfo)
>  {
> -	struct rpmsg_device *rpdev = ctrldev->rpdev;
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev;
>  	int ret;
> @@ -360,7 +363,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  
>  	device_initialize(dev);
>  	dev->class = rpmsg_class;
> -	dev->parent = &ctrldev->dev;
> +	dev->parent = parent;
>  	dev->groups = rpmsg_eptdev_groups;
>  	dev_set_drvdata(dev, eptdev);
>  
> @@ -403,6 +406,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>  {
> @@ -442,7 +446,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	chinfo.src = eptinfo.src;
>  	chinfo.dst = eptinfo.dst;
>  
> -	return rpmsg_eptdev_create(ctrldev, chinfo);
> +	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>  };
>  
>  static const struct file_operations rpmsg_ctrldev_fops = {
> @@ -528,7 +532,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>  	int ret;
>  
>  	/* Destroy all endpoints */
> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
>  	if (ret)
>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
>  
> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> new file mode 100644
> index 000000000000..109c2c43005f
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_char.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) STMicroelectronics 2021.
> + */
> +
> +#ifndef __RPMSG_CHRDEV_H__
> +#define __RPMSG_CHRDEV_H__
> +
> +/*
> + * The IS_REACHABLE macro is used here to prevent unresolved symbol error during link,
> + * building with RPMSG_CHAR=m and RPMSG_CTRL=y configuration.
> + * In such case a kernel warning is printed to help develloper to fix the issue.
> + */

I think we concluded that RPMSG_CHAR=n, RPMSG_CTRL=y is a valid
combination. If so I presume you don't want the user to get the kernel
log spammed by the WARN_ON()?

Afaict this should only ever be invoked by rpmsg_ctrl and with
RPMSG_CHAR disabled the related ioctls should just fail nicely.


As such. I think this should be #if IS_ENABLED() and we should put:

	depends on RPMSG_CHAR || RPMSG_CHAR=n

in the RPMSG_CTRL Kconfig.

Regards,
Bjorn

> +
> +#if IS_REACHABLE(CONFIG_RPMSG_CHAR)
> +/**
> + * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
> + * @rpdev:  prepared rpdev to be used for creating endpoints
> + * @parent: parent device
> + * @chinfo: associated endpoint channel information.
> + *
> + * This function create a new rpmsg char endpoint device to instantiate a new
> + * endpoint based on chinfo information.
> + */
> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo);
> +
> +/**
> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
> + * @data: private data associated to the endpoint device
> + *
> + * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
> + * control.
> + */
> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
> +
> +#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
> +
> +static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +					     struct rpmsg_channel_info chinfo)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +	return -EINVAL;
> +}
> +
> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
> +
> +#endif /*__RPMSG_CHRDEV_H__ */
> -- 
> 2.17.1
> 
