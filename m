Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC98BC433ED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 18:05:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D89161406
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 18:05:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241921AbhDUSFd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Apr 2021 14:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243448AbhDUSFd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Apr 2021 14:05:33 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BB1C06138A
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Apr 2021 11:04:58 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id m11so29624820pfc.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Apr 2021 11:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=unA1gguLFEUSz8sKjvwY0p2cBX/+TuUGVxJMx86vb8k=;
        b=te0PAYUR/ZuxM8p/+cXil+D2vfbEOpYZRrGf6ojLdHY6HWF90v5bDRxAsx1z1HvZt5
         lsWAgARaqdHx7D8wUCFPtzq8AF7mjW3er1v89F+aCVod6R+7tv/tBMbsRaDL/qdKLa+5
         0T54/bF8jlT5B0F4bZykdZNCta/0CA/2cuRSr/6Q2nnjiwg5s8U5re5lOmTEoZJuJ6RE
         QpUhJbxY2XMrwxzqUYTEcGWmTOTTa10YnWfiyzs9C8AS1f/wl5QeXxREJxYT0dzZzhw+
         GexmuIZhK87wa8QB5bvwlK92qZTmkhnGl9H5b8EdcYEN+Rl5RIxXqPqNiX3BefW9N00f
         VQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=unA1gguLFEUSz8sKjvwY0p2cBX/+TuUGVxJMx86vb8k=;
        b=NwZqDngqm3mpkcGnBOzUhTrbYzv/zomak6Q9hEP+4pnss2z31VKplnQXGc4LfR5XXm
         vvz2UM7FGGwuQ2Y/GUa/fFtGongcW7sUQBFr83Wl6GgXQJPWphWVNdoayx2E+Z1qHFa/
         mOS29GToBP/0gY9Pqs/0CwAvmUpDfY3V+h/F8x8ZeLwfMPPIVrJomKqjQgQC/W/QYRng
         9aX7ztXkExMjfjIWvW5a7Miyeo2sxPb4VFaF8schzHzMNBVXcxb4VJAnsS/7IHUuiwD7
         3UbasUsym7dcrkxIDZbZB9bCquJwy5UHpioCV8nXa/p+GpG5oJTD9oAmulPl7WTG1MIQ
         Egtg==
X-Gm-Message-State: AOAM533qc7mKIKxX6ijQUJ9HVFWi3iIL2T00Padnjl19VBYxY/JM0g0L
        +GlEyerbh582vlv13OaTdWGYOkbKGM5eVg==
X-Google-Smtp-Source: ABdhPJwh7lF42dAi4OxxUY6723sA5mAkiRgJgBIgA1M5M5W5u2uvykLLm9pHsx6Z95/61R4BXVTuTw==
X-Received: by 2002:a17:90a:a781:: with SMTP id f1mr12963287pjq.57.1619028297901;
        Wed, 21 Apr 2021 11:04:57 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c8sm18586pfp.160.2021.04.21.11.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 11:04:57 -0700 (PDT)
Date:   Wed, 21 Apr 2021 12:04:55 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/7] rpmsg: Move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
Message-ID: <20210421180455.GE1223348@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413134458.17912-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Apr 13, 2021 at 03:44:53PM +0200, Arnaud Pouliquen wrote:
> Create the rpmsg_ctrl.c module and move the code related to the
> rpmsg_ctrldev device in this new module.
> 
> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> kconfig file.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> update from v1:
> - keep "rpmsg_chrdev" driver name in rpmsg_ctrl, driver will be renamed
>   in next path that renames the rpmsg_chrdev_create_eptdev.
> - rename the chardev regions
> - move RPMSG_DEV_MAX to rpmsg_char.h
> ---
>  drivers/rpmsg/Kconfig      |   9 ++
>  drivers/rpmsg/Makefile     |   1 +
>  drivers/rpmsg/rpmsg_char.c | 181 +----------------------------
>  drivers/rpmsg/rpmsg_char.h |   2 +
>  drivers/rpmsg/rpmsg_ctrl.c | 231 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 245 insertions(+), 179 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0b4407abdf13..d822ec9ec692 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -10,11 +10,20 @@ config RPMSG_CHAR
>  	tristate "RPMSG device interface"
>  	depends on RPMSG
>  	depends on NET
> +	select RPMSG_CTRL
>  	help
>  	  Say Y here to export rpmsg endpoints as device files, usually found
>  	  in /dev. They make it possible for user-space programs to send and
>  	  receive rpmsg packets.
>  
> +config RPMSG_CTRL
> +	tristate "RPMSG control interface"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the /dev/rpmsg_ctrlX API. This API
> +	  allows user-space programs to create endpoints with specific service name,
> +	  source and destination addresses.
> +
>  config RPMSG_NS
>  	tristate "RPMSG name service announcement"
>  	depends on RPMSG
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index 8d452656f0ee..58e3b382e316 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
> +obj-$(CONFIG_RPMSG_CTRL)	+= rpmsg_ctrl.o
>  obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index b9df8dc4365f..21ef9d9eccd7 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -26,33 +26,14 @@
>  #include "rpmsg_char.h"
>  #include "rpmsg_internal.h"
>  
> -#define RPMSG_DEV_MAX	(MINORMASK + 1)
> -
>  static dev_t rpmsg_major;
> -static struct class *rpmsg_class;
>  
> -static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_ept_ida);
>  static DEFINE_IDA(rpmsg_minor_ida);
>  
>  #define dev_to_eptdev(dev) container_of(dev, struct rpmsg_eptdev, dev)
>  #define cdev_to_eptdev(i_cdev) container_of(i_cdev, struct rpmsg_eptdev, cdev)
>  
> -#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
> -#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
> -
> -/**
> - * struct rpmsg_ctrldev - control device for instantiating endpoint devices
> - * @rpdev:	underlaying rpmsg device
> - * @cdev:	cdev for the ctrl device
> - * @dev:	device for the ctrl device
> - */
> -struct rpmsg_ctrldev {
> -	struct rpmsg_device *rpdev;
> -	struct cdev cdev;
> -	struct device dev;
> -};
> -
>  /**
>   * struct rpmsg_eptdev - endpoint device context
>   * @dev:	endpoint device
> @@ -409,169 +390,13 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
> -static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> -{
> -	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> -
> -	get_device(&ctrldev->dev);
> -	filp->private_data = ctrldev;
> -
> -	return 0;
> -}
> -
> -static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
> -{
> -	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> -
> -	put_device(&ctrldev->dev);
> -
> -	return 0;
> -}
> -
> -static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> -				unsigned long arg)
> -{
> -	struct rpmsg_ctrldev *ctrldev = fp->private_data;
> -	void __user *argp = (void __user *)arg;
> -	struct rpmsg_endpoint_info eptinfo;
> -	struct rpmsg_channel_info chinfo;
> -
> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> -		return -EINVAL;
> -
> -	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> -		return -EFAULT;
> -
> -	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> -	chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
> -	chinfo.src = eptinfo.src;
> -	chinfo.dst = eptinfo.dst;
> -
> -	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo, rpmsg_class);
> -};
> -
> -static const struct file_operations rpmsg_ctrldev_fops = {
> -	.owner = THIS_MODULE,
> -	.open = rpmsg_ctrldev_open,
> -	.release = rpmsg_ctrldev_release,
> -	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
> -	.compat_ioctl = compat_ptr_ioctl,
> -};
> -
> -static void rpmsg_ctrldev_release_device(struct device *dev)
> -{
> -	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
> -
> -	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> -	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -	cdev_del(&ctrldev->cdev);
> -	kfree(ctrldev);
> -}
> -
> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> -{
> -	struct rpmsg_ctrldev *ctrldev;
> -	struct device *dev;
> -	int ret;
> -
> -	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
> -	if (!ctrldev)
> -		return -ENOMEM;
> -
> -	ctrldev->rpdev = rpdev;
> -
> -	dev = &ctrldev->dev;
> -	device_initialize(dev);
> -	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;
> -
> -	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> -	ctrldev->cdev.owner = THIS_MODULE;
> -
> -	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_ctrldev;
> -	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> -
> -	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_minor_ida;
> -	dev->id = ret;
> -	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
> -
> -	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
> -	if (ret)
> -		goto free_ctrl_ida;
> -
> -	/* We can now rely on the release function for cleanup */
> -	dev->release = rpmsg_ctrldev_release_device;
> -
> -	ret = device_add(dev);
> -	if (ret) {
> -		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
> -		put_device(dev);
> -	}
> -
> -	dev_set_drvdata(&rpdev->dev, ctrldev);
> -
> -	return ret;
> -
> -free_ctrl_ida:
> -	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> -free_minor_ida:
> -	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -free_ctrldev:
> -	put_device(dev);
> -	kfree(ctrldev);
> -
> -	return ret;
> -}
> -
> -static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> -{
> -	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
> -	int ret;
> -
> -	/* Destroy all endpoints */
> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
> -	if (ret)
> -		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
> -
> -	device_del(&ctrldev->dev);
> -	put_device(&ctrldev->dev);
> -}
> -
> -static struct rpmsg_driver rpmsg_chrdev_driver = {
> -	.probe = rpmsg_chrdev_probe,
> -	.remove = rpmsg_chrdev_remove,
> -	.drv = {
> -		.name = "rpmsg_chrdev",
> -	},
> -};
> -
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
>  
> -	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
> -	if (ret < 0) {
> +	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
> +	if (ret < 0)
>  		pr_err("rpmsg: failed to allocate char dev region\n");
> -		return ret;
> -	}
> -
> -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> -	if (IS_ERR(rpmsg_class)) {
> -		pr_err("failed to create rpmsg class\n");
> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> -		return PTR_ERR(rpmsg_class);
> -	}
> -
> -	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> -	if (ret < 0) {
> -		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> -		class_destroy(rpmsg_class);
> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> -	}
>  
>  	return ret;
>  }
> @@ -579,8 +404,6 @@ postcore_initcall(rpmsg_chrdev_init);
>  
>  static void rpmsg_chrdev_exit(void)
>  {
> -	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> -	class_destroy(rpmsg_class);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
>  module_exit(rpmsg_chrdev_exit);
> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> index 379d2ae2bee8..f20a215073c3 100644
> --- a/drivers/rpmsg/rpmsg_char.h
> +++ b/drivers/rpmsg/rpmsg_char.h
> @@ -6,6 +6,8 @@
>  #ifndef __RPMSG_CHRDEV_H__
>  #define __RPMSG_CHRDEV_H__
>  
> +#define RPMSG_DEV_MAX	(MINORMASK + 1)
> +
>  #if IS_REACHABLE(CONFIG_RPMSG_CHAR)
>  /**
>   * rpmsg_chrdev_create_eptdev() - register char device based on an endpoint
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> new file mode 100644
> index 000000000000..a5bb9ed97f32
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021, STMicroelectronics
> + * Copyright (c) 2016, Linaro Ltd.
> + * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
> + * Copyright (c) 2012, PetaLogix
> + * Copyright (c) 2011, Texas Instruments, Inc.
> + * Copyright (c) 2011, Google, Inc.
> + *
> + * Based on rpmsg performance statistics driver by Michal Simek, which in turn
> + * was based on TI & Google OMX rpmsg driver.
> + */
> +#include <linux/cdev.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/rpmsg.h>
> +#include <linux/slab.h>
> +#include <uapi/linux/rpmsg.h>
> +
> +#include "rpmsg_char.h"
> +#include "rpmsg_internal.h"
> +
> +static dev_t rpmsg_major;
> +struct class *rpmsg_class;
> +
> +static DEFINE_IDA(rpmsg_ctrl_ida);
> +static DEFINE_IDA(rpmsg_minor_ida);
> +
> +#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
> +#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
> +
> +/**
> + * struct rpmsg_ctrldev - control device for instantiating endpoint devices
> + * @rpdev:	underlaying rpmsg device
> + * @cdev:	cdev for the ctrl device
> + * @dev:	device for the ctrl device
> + */
> +struct rpmsg_ctrldev {
> +	struct rpmsg_device *rpdev;
> +	struct cdev cdev;
> +	struct device dev;
> +};
> +
> +static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> +
> +	get_device(&ctrldev->dev);
> +	filp->private_data = ctrldev;
> +
> +	return 0;
> +}
> +
> +static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
> +
> +	put_device(&ctrldev->dev);
> +
> +	return 0;
> +}
> +
> +static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> +				unsigned long arg)
> +{
> +	struct rpmsg_ctrldev *ctrldev = fp->private_data;
> +	void __user *argp = (void __user *)arg;
> +	struct rpmsg_endpoint_info eptinfo;
> +	struct rpmsg_channel_info chinfo;
> +
> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> +		return -EINVAL;
> +
> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> +		return -EFAULT;
> +
> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> +	chinfo.src = eptinfo.src;
> +	chinfo.dst = eptinfo.dst;
> +
> +	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo, rpmsg_class);
> +};
> +
> +static const struct file_operations rpmsg_ctrldev_fops = {
> +	.owner = THIS_MODULE,
> +	.open = rpmsg_ctrldev_open,
> +	.release = rpmsg_ctrldev_release,
> +	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
> +};
> +
> +static void rpmsg_ctrldev_release_device(struct device *dev)
> +{
> +	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
> +
> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> +	cdev_del(&ctrldev->cdev);
> +	kfree(ctrldev);
> +}
> +
> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_ctrldev *ctrldev;
> +	struct device *dev;
> +	int ret;
> +
> +	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
> +	if (!ctrldev)
> +		return -ENOMEM;
> +
> +	ctrldev->rpdev = rpdev;
> +
> +	dev = &ctrldev->dev;
> +	device_initialize(dev);
> +	dev->parent = &rpdev->dev;
> +	dev->class = rpmsg_class;
> +
> +	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> +	ctrldev->cdev.owner = THIS_MODULE;
> +
> +	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
> +	if (ret < 0)
> +		goto free_ctrldev;
> +	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +
> +	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
> +	if (ret < 0)
> +		goto free_minor_ida;
> +	dev->id = ret;
> +	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
> +
> +	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
> +	if (ret)
> +		goto free_ctrl_ida;
> +
> +	/* We can now rely on the release function for cleanup */
> +	dev->release = rpmsg_ctrldev_release_device;
> +
> +	ret = device_add(dev);
> +	if (ret) {
> +		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
> +		put_device(dev);
> +	}
> +
> +	dev_set_drvdata(&rpdev->dev, ctrldev);
> +
> +	return ret;
> +
> +free_ctrl_ida:
> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> +free_minor_ida:
> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> +free_ctrldev:
> +	put_device(dev);
> +	kfree(ctrldev);
> +
> +	return ret;
> +}
> +
> +static void rpmsg_ctrldev_remove(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
> +	int ret;
> +
> +	/* Destroy all endpoints */
> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
> +	if (ret)
> +		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
> +
> +	device_del(&ctrldev->dev);
> +	put_device(&ctrldev->dev);
> +}
> +
> +static struct rpmsg_driver rpmsg_ctrldev_driver = {
> +	.probe = rpmsg_ctrldev_probe,
> +	.remove = rpmsg_ctrldev_remove,
> +	.drv = {
> +		.name = "rpmsg_chrdev",
> +	},
> +};
> +
> +static int rpmsg_ctrldev_init(void)
> +{
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to allocate char dev region\n");
> +		return ret;
> +	}
> +
> +	rpmsg_class = class_create(THIS_MODULE, "rpmsg");

This class thing really bothers me.  Keeping this here means that rpmsg_eptdevs
created from user space will be associated to this rpmsg_class but those created
from the name service won't.  As such I propose to move this to rpmsg_char and
simply not associate the control device to the class.

Otherwise we'd have to introduce some mechanic only to deal with the creation of
the class and I don't think it is worth.  We can revise that approach if someone
complains we broke their user space. 


> +	if (IS_ERR(rpmsg_class)) {
> +		pr_err("failed to create rpmsg class\n");
> +		ret = PTR_ERR(rpmsg_class);
> +		goto free_region;
> +	}
> +
> +	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
> +		goto free_class;
> +	}
> +
> +	return 0;
> +
> +free_class:
> +	class_destroy(rpmsg_class);
> +free_region:
> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +
> +	return ret;
> +}
> +postcore_initcall(rpmsg_ctrldev_init);
> +
> +static void rpmsg_ctrldev_exit(void)
> +{
> +	unregister_rpmsg_driver(&rpmsg_ctrldev_driver);
> +	class_destroy(rpmsg_class);
> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +}
> +module_exit(rpmsg_ctrldev_exit);
> +
> +MODULE_DESCRIPTION("rpmsg control interface");
> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
