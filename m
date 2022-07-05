Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF36DC43334
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jul 2022 15:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiGEP0P (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jul 2022 11:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiGEP0O (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jul 2022 11:26:14 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BCB183A7
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Jul 2022 08:26:13 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id r22so4767705pgr.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Jul 2022 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RQfmpcsha3ArE/QFeVZl2sZJZkzc1FloBr65IG86g+E=;
        b=atnthrEw5hwVwghdYpuhl9GEciSOFtsb2uiMqoaI2NcdG+7stm7xHzu+tEwbUZDrOn
         u9ihOo9wByMur3+CaBV/HU9gf3MWn+HRfHzImOZji7GAsmxHpbp6z3XsTvsbQNs04uUd
         qi7Mapd7u6CpKJBuYpzZA5epaXb+9tJEg3TtflxGhA1LXrkBA59r+tSLY+CyEMbDQu8D
         zhn4M449/JZk3SB+1REN54IMIYo4LXwVG2JWzk4sMPfGyYkLGPdBBNe0HdsTg4686SXA
         XAE33w31i+8NnWnNvJqFQKZMTYVTEQAzD7DLr9f/tqGf79HKZdkUpfQZVrkbKrXjBAFR
         OKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RQfmpcsha3ArE/QFeVZl2sZJZkzc1FloBr65IG86g+E=;
        b=0UaEROeZCO5m4tBw4o1hliMGSLgANN2Xkb+0Xq9uqKRGg+EJaQsE00ZwYIYc9XgDAp
         GsxaXdwc06waMunTZ8oMPaDvcontIRdYQY1G4gPDHW/OaYg04/JjxU00gkq/Sdg1pw+1
         7Vb5l5BZYK068M0bxnclYz1TyRPklR1o9EJiIhcVzhtN8LH6F9c/83Y2e1968yGGAgG7
         LqfhRks3LYHj0KGEe6PghlMkPuh93IMgLO9ZNIRrMxlxmCi6ZcR79EcZpjXHK4WI3KhM
         PydX73Z5SW/xmGOsWGk8AUUHtk4KCcmhlpUI/fYrFl/8s53WOpA5lmcSCILA9m1jl7Vz
         JPIQ==
X-Gm-Message-State: AJIora8r9P18dvA9+rB5uiyR61BGW3kxmh3a/+moE0HUuN+y026wlQ1i
        FySwiPJ7rVeZEcbMEnEUtsEgUA==
X-Google-Smtp-Source: AGRyM1sLgNJQQUYM9sVYRJO0xAMHac3MF3u/i7OfFyuN1PluSk9g6snzjjMN0mcMZ06FwdM3qg0SaQ==
X-Received: by 2002:a63:3142:0:b0:40d:3fd3:53b5 with SMTP id x63-20020a633142000000b0040d3fd353b5mr30531275pgx.416.1657034773089;
        Tue, 05 Jul 2022 08:26:13 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b0016b8746132esm10065693plh.105.2022.07.05.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 08:26:11 -0700 (PDT)
Date:   Tue, 5 Jul 2022 09:26:09 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [PATCH v6 2/4] remoteproc: core: Introduce rproc_add_rvdev
 function
Message-ID: <20220705152609.GA2440144@p14s>
References: <20220603163158.612513-1-arnaud.pouliquen@foss.st.com>
 <20220603163158.612513-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603163158.612513-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 03, 2022 at 06:31:56PM +0200, Arnaud Pouliquen wrote:
> The rproc structure contains a list of registered rproc_vdev structure.
> To be able to move the management of the rproc_vdev structure in
> remoteproc_virtio.c (i.e rproc_rvdev_add_device and
> rproc_rvdev_remove_device functions), introduce the rproc_add_rvdev

Function rproc_rvdev_remove_device() no longer exists and shouldn't be part of
this changelog.

> and rproc_remove_rvdev functions.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> Updates vs previous revision (based on Mathieu Poirier's comments):
> - Fix function name in commit message and add Mathieu's Reviewed-by.
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c438c32f7f0d..86147efc0aad 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -484,6 +484,18 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  	return 0;
>  }
>  
> +static void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> +{
> +	if (rvdev && rproc)
> +		list_add_tail(&rvdev->node, &rproc->rvdevs);
> +}
> +
> +static void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev)
> +		list_del(&rvdev->node);
> +}
> +
>  static struct rproc_vdev *
>  rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  {
> @@ -547,7 +559,7 @@ rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  			goto unwind_vring_allocations;
>  	}
>  
> -	list_add_tail(&rvdev->node, &rproc->rvdevs);
> +	rproc_add_rvdev(rproc, rvdev);
>  
>  	rvdev->subdev.start = rproc_vdev_do_start;
>  	rvdev->subdev.stop = rproc_vdev_do_stop;
> @@ -577,7 +589,7 @@ void rproc_vdev_release(struct kref *ref)
>  	}
>  
>  	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	list_del(&rvdev->node);
> +	rproc_remove_rvdev(rvdev);
>  	device_unregister(&rvdev->dev);
>  }
>  
> -- 
> 2.24.3
> 
