Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5839C433ED
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 16:15:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5A4E611AD
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 16:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhEDQP6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 12:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbhEDQP6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 12:15:58 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660B3C06174A
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 09:15:02 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id i190so8084996pfc.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 May 2021 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fzqlNtdsBiBaV00EBDfKVyKk5AQAycDnav35PwKqWQ0=;
        b=D2IFQQaetYGhTlhtgYsrBpNy8AToFBTXn0Gu4DMlO8jGiDLYp7MFoZkzLYYHGnJgd7
         Qf4CTsMEAqskVg6SBDu5oORhrj8S2g2cXmuLusfAuQtdoyJqKpXJ0HrOMyhP0AZYmdac
         M5v7vFPzePGp9Ona1e0nU8oycCySo2taxrJZ0EUmWqpSwu5LYXYBykeXCgawdmI5x+Xu
         gFQPcvq0Ia5frivFVfhAsAK8DSY5a8ySOEgbUn903V2dJlDXN67YxSZGi+cXVtVbytDh
         rwfFEE9xUHvNtrtN6ial9ZjztakMB1ZGt81T/AirJEjW2S1jFEfIFDRyvAYutHw4TjW1
         7w4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fzqlNtdsBiBaV00EBDfKVyKk5AQAycDnav35PwKqWQ0=;
        b=hX4JxjHuTf/8+3/7USO5tot9ciUhZxSBjeGWGnbqknvK7hm3PFqEctiZ/Kokz3ajD3
         1cEiPAr77nAJ05nlel6uEm00Ibb0M5t1AkAT0A0SW/8AzlVSO4D3YIqZOP9F9FyAEluy
         hamoqQ8uILDuDVfPhlmjYEUKY20fY9LjbEbLJDdAHziKwcgNiAey/j9gOVWC0di5PogZ
         kDKvwhyMbhWg8BWYIHzVd9elEpYpsiYptByx4Nr37nsYNrNaGe1H/qg/nfsDW8XlP1co
         w8aFhf/pbhmw0iQZTeEh8IeFRCt3J4KQgLq2jbjWUUnLvyL88LMtsZFHPFzDBPm0FL69
         w+Gg==
X-Gm-Message-State: AOAM532Tyfnaik437rSIHIn5zfyjEY36eHHCWyLIVM8CKflFDvK5W05K
        /2Vl6uAMI8pfw6nwMujJ+ckf/YGcdoCA3w==
X-Google-Smtp-Source: ABdhPJzCk9y60famhhKa+5OcfdcaNqL3o85Okqtd0ZbjfAs/He9D8jwde3CanKiE0X0WJz5Ebsg2xQ==
X-Received: by 2002:a17:90a:d582:: with SMTP id v2mr30182424pju.88.1620144901956;
        Tue, 04 May 2021 09:15:01 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 204sm2607767pfw.158.2021.05.04.09.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 09:15:01 -0700 (PDT)
Date:   Tue, 4 May 2021 10:14:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 3/6] rpmsg: Update rpmsg_chrdev_register_device
 function
Message-ID: <20210504161459.GC1734971@xps15>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429135507.8264-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 29, 2021 at 03:55:04PM +0200, Arnaud Pouliquen wrote:
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
> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  drivers/rpmsg/qcom_smd.c          | 2 +-
>  drivers/rpmsg/rpmsg_ctrl.c        | 2 +-
>  drivers/rpmsg/rpmsg_internal.h    | 8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 05533c71b10e..7d7e809800ec 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1642,7 +1642,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
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
> index 6b4d705b2dfd..6749e26b68fc 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -173,7 +173,7 @@ static struct rpmsg_driver rpmsg_ctrldev_driver = {
>  	.probe = rpmsg_ctrldev_probe,
>  	.remove = rpmsg_ctrldev_remove,
>  	.drv = {
> -		.name = "rpmsg_chrdev",
> +		.name = "rpmsg_ctrl",
>  	},
>  };
>  
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..8c500a8f29aa 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -82,16 +82,16 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo);
>  /**
> - * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> + * rpmsg_ctrl_register_device() - register a char device for control based on rpdev

rpmsg_ctrldev_register_device()

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
> index 8e49a3bacfc7..e42234a3e2ab 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -840,7 +840,7 @@ static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev
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
