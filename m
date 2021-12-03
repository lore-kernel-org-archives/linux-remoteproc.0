Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8FCC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Dec 2021 02:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350532AbhLCCUq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Dec 2021 21:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236338AbhLCCUq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Dec 2021 21:20:46 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D816C061757
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Dec 2021 18:17:23 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso2152785otf.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Dec 2021 18:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FZvck9JuYvrpR0l3Xs3KJHgn/fFcTHh248jFmt6hypE=;
        b=DKdlLt3Bk0+hq+EEUWr6ZyUmlFADF2Fj/udXAHkGGSAlrylUL4y6la+RrqCGIpAPpl
         DReXEuFAinJXjdY8pLHE5/gUZimFt503is+IMBJ2WzBIOureAlQfsC3tVffSlKTA8sqw
         w+lWgo5IorSaXdRkb69YUzGY6e5iKcQLEL2+CUH8aYC1AWz/e7yb0ccEXMJmc305ocR2
         NVpzeWysjeICC8l3OOlXfGai1T+C9ZC2yYdVIPUMpB7RJUbZ0mhXnV2ykvjX7affa4aC
         bxh4hMDoJkTxQSp4/5+5QPOnpuWjQyWLxAPF2mOfVBwXRYn9ITOr67UTjKLw7+wmie/h
         qhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FZvck9JuYvrpR0l3Xs3KJHgn/fFcTHh248jFmt6hypE=;
        b=32BBRA+vx2NwH17s8bRMHmrPKyDlSQ0sT1TcVJ8ClCbeLYMiWtOKDgEMioKyIZ1Wes
         1U5MmJDKJ9yGSj8h2OJhKzi0gESwiYxEcELwmLVZUuia04hgC9k45Ptq0umi8gV3Qe8c
         f4rBwH2IbOFokPXo3B2bOpGfo3kaJKBot3I/e3k1Y3hfBfOlodnJJrmSJTXXUymlA34z
         UT5XZtwCs6MuLXvoU044B9Rji1JQMPVikKTvR5CkV7cDaq+x4Lgeb2lnNIWo7zZlCPmE
         7u+SqT7FjhdB4Nx1YIQ/EgEmVKPjiyQzx1i0thna1fjW60jKtJBP4aLE1aGJW4pqP3e9
         Jrpg==
X-Gm-Message-State: AOAM5316kDvhLReDp3ZHf9qzbG75zc6cuyS++GVPZ2hU3XF2qZV4m6dz
        pyaQZ+lsCKTBbPipmlO/gfodDdEt3D7JGA==
X-Google-Smtp-Source: ABdhPJwVGM4OMeZ1USNcKGJ6i+DQIqH+fwHfE5/YXlId34vHC1x+qfcEBv9VmlhCoFfBhkKFMHGZiQ==
X-Received: by 2002:a9d:6001:: with SMTP id h1mr14130015otj.257.1638497842314;
        Thu, 02 Dec 2021 18:17:22 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n11sm359412oor.9.2021.12.02.18.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 18:17:21 -0800 (PST)
Date:   Thu, 2 Dec 2021 20:17:16 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v7 01/12] rpmsg: char: Export eptdev create an destroy
 functions
Message-ID: <Yal+LKVqvp2v26BD@builder.lan>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
 <20211108141937.13016-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108141937.13016-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 08 Nov 08:19 CST 2021, Arnaud Pouliquen wrote:

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
> Update vs previous revision:
> - change IS_REACHABLE by IS_ENABLE ( dependency will be fixed in kconfig instead
> - fix licensing
> ---
>  drivers/rpmsg/rpmsg_char.c | 17 +++++++------
>  drivers/rpmsg/rpmsg_char.h | 51 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_char.h
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2bebc9b2d163..44934d7fa3c4 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> + * Copyright (C) 2021, STMicroelectronics
>   * Copyright (c) 2016, Linaro Ltd.
>   * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
>   * Copyright (c) 2012, PetaLogix
> @@ -23,6 +24,7 @@
>  #include <uapi/linux/rpmsg.h>
>  
>  #include "rpmsg_internal.h"
> +#include "rpmsg_char.h"
>  
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>  
> @@ -78,7 +80,7 @@ struct rpmsg_eptdev {
>  	wait_queue_head_t readq;
>  };
>  
> -static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>  {
>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>  
> @@ -97,6 +99,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
>  
>  static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>  			void *priv, u32 addr)
> @@ -280,7 +283,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>  		return -EINVAL;
>  
> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
>  }
>  
>  static const struct file_operations rpmsg_eptdev_fops = {
> @@ -339,10 +342,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
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
> @@ -362,7 +364,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  
>  	device_initialize(dev);
>  	dev->class = rpmsg_class;
> -	dev->parent = &ctrldev->dev;
> +	dev->parent = parent;
>  	dev->groups = rpmsg_eptdev_groups;
>  	dev_set_drvdata(dev, eptdev);
>  
> @@ -405,6 +407,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>  {
> @@ -444,7 +447,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	chinfo.src = eptinfo.src;
>  	chinfo.dst = eptinfo.dst;
>  
> -	return rpmsg_eptdev_create(ctrldev, chinfo);
> +	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
>  };
>  
>  static const struct file_operations rpmsg_ctrldev_fops = {
> @@ -530,7 +533,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
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
> index 000000000000..aa6e08a04577
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_char.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) STMicroelectronics 2021.
> + */
> +
> +#ifndef __RPMSG_CHRDEV_H__
> +#define __RPMSG_CHRDEV_H__
> +
> +#if IS_ENABLED(CONFIG_RPMSG_CHAR)
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
> +#else  /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
> +
> +static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +					     struct rpmsg_channel_info chinfo)
> +{
> +	/* This shouldn't be possible */

But isn't it very much possible that userspace invokes this function
through the ioctl that you move to the separate rpmsg_ctrl driver?

> +	WARN_ON(1);

Which would mean that this will spam the kernel with stack dumps.

Regards,
Bjorn

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
> +#endif /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
> +
> +#endif /*__RPMSG_CHRDEV_H__ */
> -- 
> 2.17.1
> 
