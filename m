Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C46DC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Nov 2021 17:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4152860273
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Nov 2021 17:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhKARRX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Nov 2021 13:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhKARRX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Nov 2021 13:17:23 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8AAC061764
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Nov 2021 10:14:49 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id o4so25840418oia.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Nov 2021 10:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TAQqw3KjdM4L0YpQtUnwgo97V5E+/VwuteYqlXaknWA=;
        b=Lka1HvsUaKOYF6Bvf7hwnE9Kv3V83IbfyA8r5O7+34g3lLxVwuhdEuG4VEObsH+5fD
         xUSuQ21SDBahArvc+vuvR96BUML/E8pjCzW3vnNFR/oo3MGxYoDbrVK7vTumhcATBC8X
         kgkeIN7XnYFLM5q2cj9DqrftSEgVt2UZja/VDQzCfJDSbUaR+YSW4+4s/WjIMThr8NH3
         /tyZ3AwTYg6+Zp2voiFUiaRTQgw6As+clfCeytEsXUFjPnMN9ctyliCaliRZUN3FB2us
         q2+ZsvplMEZvGEGe386FZQYNKD6MSQQ/l7Fn5qu+vbXclnBG/5+RbcgJxonx215qUFEd
         c0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TAQqw3KjdM4L0YpQtUnwgo97V5E+/VwuteYqlXaknWA=;
        b=kfn75QE8TaQvg+ocLWcoTvZZiifjFTNobcGyDLUvGYQMkga2UYE4oivoqlo9/94E/t
         Ic4lsKWwb5KlhSFVh8AC3EdvINvppQqwMGmuluyoV3grDj6HV8C+Uzzp7tVQSemQCC0l
         Q1EWqVLEhqvlM8VS0mJSMSZ69/GffTKpf0DC0OJK4LnQ6yhId5BktBKQmSgjy68yxx+q
         ndCw9XbsasK9VLRHUWJTMuueA6oyxfq8mVYNCKpWrXAe76XIrxgL9ABMZPEFFUcXCQmO
         nCuDoR4OnH5owlTrnpdy1Uvox9+UhA4QoRN0jKA5jYBXjhEv/tQ3tqwlFFAocT2KvTMH
         2zvQ==
X-Gm-Message-State: AOAM5339AoW6NeRpnlWm05RVXAPYwjx8836YEL32oySU3DA4Ka2aEXYw
        A9QhviiQuCx77EJQg8cHrOAk5g==
X-Google-Smtp-Source: ABdhPJz6QQFMXhR9zJ4GABG0Qu6iyAK2xcv2AQMoASAhiR6mwR16lRfY6/NHWX/riQrqo+D6PpjksQ==
X-Received: by 2002:aca:3b89:: with SMTP id i131mr219401oia.102.1635786889248;
        Mon, 01 Nov 2021 10:14:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bd5sm1783921oib.2.2021.11.01.10.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 10:14:48 -0700 (PDT)
Date:   Mon, 1 Nov 2021 12:14:44 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v6 04/10] rpmsg: Update rpmsg_chrdev_register_device
 function
Message-ID: <YYAghC2xVYoPyrpK@builder.lan>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022125426.2579-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:

> The rpmsg_chrdev driver has been replaced by the rpmsg_ctrl driver
> for the /dev/rpmsg_ctrlX devices management. The reference for the
> driver override is now the rpmsg_ctrl.
> 
> Update the rpmsg_chrdev_register_device function to reflect the update,
> and rename the function to use the rpmsg_ctrldev prefix.
> 
> The platform drivers are updated accordingly.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  drivers/rpmsg/qcom_smd.c          | 2 +-
>  drivers/rpmsg/rpmsg_ctrl.c        | 2 +-
>  drivers/rpmsg/rpmsg_internal.h    | 8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 3f377a795b33..e6eb7fd126c9 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1715,7 +1715,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
>  	rpdev->dev.parent = glink->dev;
>  	rpdev->dev.release = qcom_glink_device_release;
>  
> -	return rpmsg_chrdev_register_device(rpdev);
> +	return rpmsg_ctrldev_register_device(rpdev);
>  }
>  
>  struct qcom_glink *qcom_glink_native_probe(struct device *dev,
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 8da1b5cb31b3..d223e438d17c 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1113,7 +1113,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
>  	qsdev->rpdev.dev.parent = &edge->dev;
>  	qsdev->rpdev.dev.release = qcom_smd_release_device;
>  
> -	return rpmsg_chrdev_register_device(&qsdev->rpdev);
> +	return rpmsg_ctrldev_register_device(&qsdev->rpdev);
>  }
>  
>  /*
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 1d3c12e5cdcf..4734ce9d927b 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -180,7 +180,7 @@ static struct rpmsg_driver rpmsg_ctrldev_driver = {
>  	.probe = rpmsg_ctrldev_probe,
>  	.remove = rpmsg_ctrldev_remove,
>  	.drv = {
> -		.name = "rpmsg_chrdev",
> +		.name = "rpmsg_ctrl",
>  	},
>  };
>  
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..d6056f09bcd8 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -82,16 +82,16 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo);
>  /**
> - * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> + * rpmsg_ctrldev_register_device() - register a char device for control based on rpdev
>   * @rpdev:	prepared rpdev to be used for creating endpoints
>   *
>   * This function wraps rpmsg_register_device() preparing the rpdev for use as
>   * basis for the rpmsg chrdev.
>   */
> -static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
> +static inline int rpmsg_ctrldev_register_device(struct rpmsg_device *rpdev)
>  {
> -	strcpy(rpdev->id.name, "rpmsg_chrdev");
> -	rpdev->driver_override = "rpmsg_chrdev";
> +	strcpy(rpdev->id.name, "rpmsg_ctrl");
> +	rpdev->driver_override = "rpmsg_ctrl";
>  
>  	return rpmsg_register_device(rpdev);
>  }
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 5da622eb1c8f..2acec7f37474 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -839,7 +839,7 @@ static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev
>  	rpdev_ctrl->dev.release = virtio_rpmsg_release_device;
>  	rpdev_ctrl->little_endian = virtio_is_little_endian(vrp->vdev);
>  
> -	err = rpmsg_chrdev_register_device(rpdev_ctrl);
> +	err = rpmsg_ctrldev_register_device(rpdev_ctrl);
>  	if (err) {
>  		kfree(vch);
>  		return ERR_PTR(err);
> -- 
> 2.17.1
> 
