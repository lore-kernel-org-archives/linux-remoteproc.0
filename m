Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F25C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Mar 2022 18:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbiCDSj7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Mar 2022 13:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbiCDSj6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Mar 2022 13:39:58 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2975FEC
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Mar 2022 10:39:09 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id z16so8334105pfh.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Mar 2022 10:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BknUbfqpfPqnNnTE+wwFbcKTHVg6JII8p6R6OPkErWY=;
        b=ZCkewWppykr0MiRvRFbknZoyCTjtESq7kkoPzMl6Is5pYS9yZsBRbCLVerWeLLwgb8
         i0vuPZ1TS56CC1gHV7BkRfXmnkzGAGl3TDV4WaCiryLP2O+al2vGyBnpYmWxrzXY1Vo1
         NO1ecgjZ3SbgQidh6hWMWb8U1M3/gXyKTQ5aiyJzv4Vq49LqQO4kElvdd4polzp76+Oj
         3N6S2EFV0C7a9pwyyH0ugdpapME2bQajDVRL/pTKS5ufx9d7gEGyHMvcnxsJr/SfH3tm
         mX6JGyDPp0F/i1x1/knZh0E2h1p2EdN/XG+9PLjJUQKszIDxi/NldgeorOzCC3rZNtYO
         6VXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BknUbfqpfPqnNnTE+wwFbcKTHVg6JII8p6R6OPkErWY=;
        b=vw+81rhE9YQi+DrF3lEd1RC2me1mRP8keX2A7gVJvZMBjfUNfFBgNfwpH14Bq/a7SR
         R3Bw6Gi3kP9lwcX57MhcwGFcN7xN0VBx+dUm0wm10YztiZKQx1b5tIuhSg2rE4KWZulv
         jzJx7dIaiZMI/VnyVAcFL98Pj/4CE/wrsnOrVAXSnto2XG7y0saEyhdGPAngf6rcEofm
         sLkc5chH45fWpuYc+LPclGZSzL8RzZLMiX+jCCpHgT2cyKza7SLi7Pp9e8fenHA0IMEb
         MQSZsbFsNw5YTPXkXtLb3tCCw9VkXhe0MCuJISvLO5m4jXGdn9cy6c9PQGzy2s2gOC8x
         FQyQ==
X-Gm-Message-State: AOAM530gC3e3wR0GcEcZEqUQJyk4OiicpC34w5/h9UHm5wiWF3seFiOx
        PDmNR2XvkcDG4wa2puXXhZ5wKBb4dAiX4w==
X-Google-Smtp-Source: ABdhPJwA3j+lTHK7E6P90nb3FKhZ6vQBDbdWWZuTY3m0lJH1/Lfqf6QPxfOgSxCeb6S1qI9lk5rcaw==
X-Received: by 2002:a63:3487:0:b0:373:4c14:59b1 with SMTP id b129-20020a633487000000b003734c1459b1mr35543410pga.68.1646419149402;
        Fri, 04 Mar 2022 10:39:09 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w16-20020a056a0014d000b004e12fd48047sm6887711pfu.35.2022.03.04.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 10:39:07 -0800 (PST)
Date:   Fri, 4 Mar 2022 11:39:05 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [RFC PATCH v3 2/4] remoteproc: core: Introduce
 rproc_register_rvdev function
Message-ID: <20220304183905.GB1660165@p14s>
References: <20220126162405.1131323-1-arnaud.pouliquen@foss.st.com>
 <20220126162405.1131323-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126162405.1131323-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jan 26, 2022 at 05:24:03PM +0100, Arnaud Pouliquen wrote:
> The rproc structure contains a list of registered rproc_vdev structure.
> To be able to move the management of the rproc_vdev structure in
> remoteproc_virtio.c (i.e rproc_rvdev_add_device and
> rproc_rvdev_remove_device functions), introduce the rproc_register_rvdev
> and rproc_unregister_rvdev functions.
> These functions will be exported by the remoteproc_core.c.

This last sentence is very confusing... I kept an eye out for the EXPORT_SYMBOL()
tag but never found it.  Please remove.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 83ff44a6a4db..7a091f860c82 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -491,6 +491,18 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  	return 0;
>  }
>  
> +static void rproc_register_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> +{
> +	if (rvdev && rproc)
> +		list_add_tail(&rvdev->node, &rproc->rvdevs);
> +}

I would call those rproc_add_rvdev() and rproc_remove_rvdev() to follow in the
footsteps of rproc_add_subdev() and rproc_remove_subdev().

> +
> +static void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev)
> +		list_del(&rvdev->node);
> +}
> +
>  static struct rproc_vdev *
>  rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  {
> @@ -554,7 +566,7 @@ rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  			goto unwind_vring_allocations;
>  	}
>  
> -	list_add_tail(&rvdev->node, &rproc->rvdevs);
> +	rproc_register_rvdev(rproc, rvdev);
>  
>  	rvdev->subdev.start = rproc_vdev_do_start;
>  	rvdev->subdev.stop = rproc_vdev_do_stop;
> @@ -583,7 +595,7 @@ static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
>  	}
>  
>  	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	list_del(&rvdev->node);
> +	rproc_unregister_rvdev(rvdev);
>  	device_unregister(&rvdev->dev);
>  }
>  
> -- 
> 2.25.1
> 
