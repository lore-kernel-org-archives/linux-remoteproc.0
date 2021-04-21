Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38886C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 17:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08B0F6141C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 17:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245046AbhDURxA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Apr 2021 13:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239610AbhDURw5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Apr 2021 13:52:57 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510E8C06138A
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Apr 2021 10:52:22 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id w10so30626785pgh.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Apr 2021 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F8lkA4hkBRm1o8o4SU5huyASULJsB2lMHciTFbdF6O8=;
        b=tVkZqcb2OYMo8TeiyjHt8lztpGjkZX2YQeO9k4ZeUn1GWmlDJu5npEeHkEPQw/vp6C
         75ycT2rlLpAK7qKTetKZFoJHpTRRpkBXypDH+xAO+g845/C2w6qrCDt5g6OcSF2y7zun
         giXaBmacdJy5TOVwYzwgaEG7c69OaeWK94u/wN8cMTwQy2p0xxTFwDAj5eqBrou40OrN
         PjfQFfzptlq/5obzEJkNcytVbf+//JXbuS7rWjAcsH/qY3rvqObmbvKJoQr52cg8M96T
         qk9YZB1zU/c0tW7fKhvzBPb49wOLvGkokCY31v+WF5k4eE7UEXFQkjocmO9nzoZZnVO9
         qHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F8lkA4hkBRm1o8o4SU5huyASULJsB2lMHciTFbdF6O8=;
        b=elZGqtB9zADTJo+4e11iwwLq140kZQOAmZ8iayORJMwyqvuKmlNSlObomDoilLuqAs
         uqH69qMl9/+ji7V/A2I0T/zuvgHrHm8RgcKzuBae0vEOYprmYniGS8f1ef+gNRkHdxs+
         34yqNCgJRWGX+YFKESRbRIRnecJJLu2RUMI+JspNJ/i6jtZ/2S+iVXVxa1mNufLPKSVY
         BCIW/6389TzXzb0kr0UgURlhcT+60KfhHtIHQ7wPgeqdGEfifEIvJoZ9+yQYwV7J+Wv3
         pVmjN5JyWL9ALVf22CiBCt3A9gRpjNmCsAE/4zGrc2ezAn/Oi0uX2z37rFVTzpOv9398
         1X1Q==
X-Gm-Message-State: AOAM531gAgcRSdg24NBGiwgVcLrMMFnPc1k9+MzDzi1c9l/M7QXqDpJE
        xiGehzkDqWHyOE/7Aw42v7IhbwBe3e9QlA==
X-Google-Smtp-Source: ABdhPJzlR3wrMYoeAZsc7+3hEhJetPjUmotybMDO/BGXrmO4iRHfR4V2cmwzt/LZva0YZJI14+sdTg==
X-Received: by 2002:aa7:90d3:0:b029:241:21a1:6ffb with SMTP id k19-20020aa790d30000b029024121a16ffbmr30199230pfk.43.1619027541773;
        Wed, 21 Apr 2021 10:52:21 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b1sm74102pgf.84.2021.04.21.10.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:52:21 -0700 (PDT)
Date:   Wed, 21 Apr 2021 11:52:19 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/7] rpmsg: char: Export eptdev create an destroy
 functions
Message-ID: <20210421175219.GD1223348@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413134458.17912-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Apr 13, 2021 at 03:44:52PM +0200, Arnaud Pouliquen wrote:
> To prepare the split of the code related to the control (ctrldev)
> and the endpoint (eptdev) devices in 2 separate files:
> 
> - Rename and export the functions in rpmsg_char.h.
> 
> - Suppress the dependency with the rpmsg_ctrldev struct in the
>   rpmsg_chrdev_create_eptdev function.
> 
> - The rpmsg class is provided as parameter in rpmsg_chrdev_create_eptdev,
>   because the class is associated to the control part.
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 19 +++++++++------
>  drivers/rpmsg/rpmsg_char.h | 50 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_char.h
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2bebc9b2d163..b9df8dc4365f 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> + * Copyright (C) 2021, STMicroelectronics
>   * Copyright (c) 2016, Linaro Ltd.
>   * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
>   * Copyright (c) 2012, PetaLogix
> @@ -22,6 +23,7 @@
>  #include <linux/uaccess.h>
>  #include <uapi/linux/rpmsg.h>
>  
> +#include "rpmsg_char.h"
>  #include "rpmsg_internal.h"
>  
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
> @@ -78,7 +80,7 @@ struct rpmsg_eptdev {
>  	wait_queue_head_t readq;
>  };
>  
> -static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> +int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data)

Shouldn't this be rpmsg_chrdev_eptdev_destroy()?  I've been wondering about the
flipping of destroy and eptdev...  The same for rpmsg_chrdev_create_eptdev().

With that:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  {
>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>  
> @@ -97,6 +99,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(rpmsg_chrdev_destroy_eptdev);
>  
>  static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>  			void *priv, u32 addr)
> @@ -280,7 +283,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>  		return -EINVAL;
>  
> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +	return rpmsg_chrdev_destroy_eptdev(&eptdev->dev, NULL);
>  }
>  
>  static const struct file_operations rpmsg_eptdev_fops = {
> @@ -339,10 +342,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	kfree(eptdev);
>  }
>  
> -static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> -			       struct rpmsg_channel_info chinfo)
> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
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
> +EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>  {
> @@ -444,7 +447,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	chinfo.src = eptinfo.src;
>  	chinfo.dst = eptinfo.dst;
>  
> -	return rpmsg_eptdev_create(ctrldev, chinfo);
> +	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo, rpmsg_class);
>  };
>  
>  static const struct file_operations rpmsg_ctrldev_fops = {
> @@ -530,7 +533,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>  	int ret;
>  
>  	/* Destroy all endpoints */
> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
>  	if (ret)
>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
>  
> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> new file mode 100644
> index 000000000000..379d2ae2bee8
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_char.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) STMicroelectronics 2021.
> + */
> +
> +#ifndef __RPMSG_CHRDEV_H__
> +#define __RPMSG_CHRDEV_H__
> +
> +#if IS_REACHABLE(CONFIG_RPMSG_CHAR)
> +/**
> + * rpmsg_chrdev_create_eptdev() - register char device based on an endpoint
> + * @rpdev:  prepared rpdev to be used for creating endpoints
> + * @parent: parent device
> + * @chinfo: assiated endpoint channel information.
> + *
> + * This function create a new rpmsg char endpoint device to instantiate a new
> + * endpoint based on chinfo information.
> + */
> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class);
> +
> +/**
> + * rpmsg_chrdev_destroy_eptdev() - destroy created char device endpoint.
> + * @data: private data associated to the endpoint device
> + *
> + * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
> + * control.
> + */
> +int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data);
> +
> +#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
> +
> +static inline int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +					     struct rpmsg_channel_info chinfo,
> +					     struct class *rpmsg_class)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data)
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
