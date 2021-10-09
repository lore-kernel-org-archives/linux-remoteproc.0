Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F870C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 00:23:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D84BB60FD7
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 00:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243968AbhJIAZq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 20:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243958AbhJIAZp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 20:25:45 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F0EC061755
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 17:23:49 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so13681793otb.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 17:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JkIOVgb0rFlzTTWYy9nxBqEDUeJR0ZAQd/WMS4wwxAg=;
        b=tgAss8XZylSYp96jFg8QWvj9pCW5nn8W6lfIhXtFcDdGjnT4o75iOG3+ZFeQ0itOVZ
         A7HUnFO77nQkpIyQ6FDNdgQcfwvmoELb9OzY0ejzLQN+/pI6PFJP1L+yaNnL9plpzhkB
         cUGWlTJ4ZG4v118IUpr03AcbDINktfy4IHtmixC4qCsFDCSQXI3XGXWyG78s7+Bb8Im5
         hK4TJ3EijoTqVCwniZ8B6+RsZFZOvP1OU72d9BjQtpGNoz+wpvCeftBis4JEFN/Juz94
         IwaAH959OJr9R5aMjk5LApH2oSebuNeiupx/GZE/bR+fVID4eCgPJaRZQudMjA56yl3Y
         AE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JkIOVgb0rFlzTTWYy9nxBqEDUeJR0ZAQd/WMS4wwxAg=;
        b=0bXaGCW9RevnBjimA/GFn2OCwqoARmsNo8egtjBj/NqRBk8A5h3PBL1Aqtq36pCJtx
         UUfVTneERQxCucU2GeQrzV4xiWd+qXHL/XfuA9V1FVCuxfvcy0dRF2h1QGvlrcDt0nAS
         46CqN9xuQycMQTw2u0tZMG/YcRMzNAeQvaFjongMoAQBebB/+cHbZ7JA0HuHVTq39s4Q
         BoJPNUc58kwphBHOnIk+WOf8IjsKviaayR5QpcUVK0UXj2i5CnJ08gcUNGricW5bGhSm
         QSyb9w6mCEfnn5gHt+gxgkJGuKjfcg5unKyseTQg6qJv8WtK8XFrFiOw9FJvtJ/XWoT7
         zRYQ==
X-Gm-Message-State: AOAM530HJzrdENMS3W0h8IZ5te1h53AlfOp7XAi0BpBvH+CNQ3OBZhD6
        MtXN44K+ExLXmpV2nG3pYVZJvA==
X-Google-Smtp-Source: ABdhPJzScZ5VD0XmUxg3zl8evGFYSN5Cwytom2vRIcVLCXghggc5kzuN6ajWU8F0d5f8RB5Vf11hFg==
X-Received: by 2002:a05:6830:2486:: with SMTP id u6mr10866085ots.353.1633739028379;
        Fri, 08 Oct 2021 17:23:48 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bd24sm255815oib.52.2021.10.08.17.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 17:23:48 -0700 (PDT)
Date:   Fri, 8 Oct 2021 17:25:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3] rpmsg: ctrl: Introduce new
 RPMSG_CREATE/RELEASE_DEV_IOCTL controls
Message-ID: <YWDhdq4iOihzC5FI@ripper>
References: <20210712132303.25058-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712132303.25058-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 12 Jul 06:23 PDT 2021, Arnaud Pouliquen wrote:

> Allow the user space application to create and release an rpmsg device
> by adding RPMSG_CREATE_DEV_IOCTL and RPMSG_RELEASE_DEV_IOCTL ioctrls to
> the /dev/rpmsg_ctrl interface
> 

With
https://lore.kernel.org/linux-remoteproc/CAHk-=wgea9bo-j4+LAvZF7OKPAXKqrGgiBAhXTJ3Jv5JAZgA+A@mail.gmail.com/
and
https://lore.kernel.org/linux-arm-msm/1609958656-15064-1-git-send-email-hemantk@codeaurora.org/
in mind, I would like some concrete examples of when and how this is
going to be used.


Also, as I said previously, this would have been better to put together
with the split out of rpmsg_ctrl, because afaict this is the only reason
for doing that. Or am I simply missing something?

> The RPMSG_CREATE_DEV_IOCTL Ioctl can be used to instantiate a local rpmsg
> device.
> Depending on the back-end implementation, the associated rpmsg driver is
> probed and a NS announcement can be sent to the remote processor.
> 

So, does this imply that in order to spawn a new rpmsg_char from the
host side, I would use RPMSG_CREATE_DEV_IOCTL and to open a channel
announced by the remote I would use RPMSG_CREATE_EPT_IOCTL?

> The RPMSG_RELEASE_DEV_IOCTL allows the user application to release a
> rpmsg device created either by the remote processor or with the
> RPMSG_CREATE_DEV_IOCTL call.

Is this a side effect, bug or a feature?

Regards,
Bjorn

> Depending on the back-end implementation, the associated rpmsg driver is
> removed and a NS destroy rpmsg can be sent to the remote processor.
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> update from V2
> - add Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> - rebased on kernel V.14-rc1 + 
>   series V5 Restructure the rpmsg char to decorrelate the control part [1]
> 
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=514017
> 
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 37 +++++++++++++++++++++++++++++++++----
>  include/uapi/linux/rpmsg.h | 10 ++++++++++
>  2 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index eeb1708548c1..cb19e32d05e1 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -23,6 +23,7 @@
>  #include <uapi/linux/rpmsg.h>
>  
>  #include "rpmsg_char.h"
> +#include "rpmsg_internal.h"
>  
>  static dev_t rpmsg_major;
>  
> @@ -37,11 +38,13 @@ static DEFINE_IDA(rpmsg_minor_ida);
>   * @rpdev:	underlaying rpmsg device
>   * @cdev:	cdev for the ctrl device
>   * @dev:	device for the ctrl device
> + * @ctrl_lock:	serialize the ioctrls.
>   */
>  struct rpmsg_ctrldev {
>  	struct rpmsg_device *rpdev;
>  	struct cdev cdev;
>  	struct device dev;
> +	struct mutex ctrl_lock;
>  };
>  
>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> @@ -70,9 +73,8 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	void __user *argp = (void __user *)arg;
>  	struct rpmsg_endpoint_info eptinfo;
>  	struct rpmsg_channel_info chinfo;
> -
> -	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> -		return -EINVAL;
> +	struct rpmsg_device *rpdev;
> +	int ret = 0;
>  
>  	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>  		return -EFAULT;
> @@ -82,7 +84,33 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  	chinfo.src = eptinfo.src;
>  	chinfo.dst = eptinfo.dst;
>  
> -	return rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
> +	mutex_lock(&ctrldev->ctrl_lock);
> +	switch (cmd) {
> +	case RPMSG_CREATE_EPT_IOCTL:
> +		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
> +		break;
> +
> +	case RPMSG_CREATE_DEV_IOCTL:
> +		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
> +		if (!rpdev) {
> +			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
> +			ret = -ENXIO;
> +		}
> +		break;
> +
> +	case RPMSG_RELEASE_DEV_IOCTL:
> +		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
> +		if (ret)
> +			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
> +				chinfo.name, ret);
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +	}
> +	mutex_unlock(&ctrldev->ctrl_lock);
> +
> +	return ret;
>  };
>  
>  static const struct file_operations rpmsg_ctrldev_fops = {
> @@ -119,6 +147,7 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>  	device_initialize(dev);
>  	dev->parent = &rpdev->dev;
>  
> +	mutex_init(&ctrldev->ctrl_lock);
>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>  	ctrldev->cdev.owner = THIS_MODULE;
>  
> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> index f5ca8740f3fb..1637e68177d9 100644
> --- a/include/uapi/linux/rpmsg.h
> +++ b/include/uapi/linux/rpmsg.h
> @@ -33,4 +33,14 @@ struct rpmsg_endpoint_info {
>   */
>  #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
>  
> +/**
> + * Instantiate a new local rpmsg service device.
> + */
> +#define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
> +
> +/**
> + * Release a local rpmsg device.
> + */
> +#define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
> +
>  #endif
> -- 
> 2.17.1
> 
