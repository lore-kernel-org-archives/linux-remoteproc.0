Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FD3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 17:39:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21ACD60FD9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 17:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbhJSRld (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Oct 2021 13:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbhJSRlc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Oct 2021 13:41:32 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E2BC061746
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Oct 2021 10:39:19 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id b14so4400827plg.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Oct 2021 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aIh9saArreNJuwW89Ey0XiYCdKVw/+DI3nSpmQ+KnZk=;
        b=ac840SZ2tQBDysEKUu7JIgqu1DXb/RmqyWhcj5aO2bQsaec36NNyRrw7pYE264Aa5l
         ATGTgHvDix/PMVU1JKvrbhcYkr/KC0TuyK0mc0cZsv0vE8aS45RLJ7LeCGNTf2ZL5jHF
         CtNvMW1dAFALRT2gpeSywg6F+zzVhW27ths3n7cj1blOPf0uhWRHx8WQ46UcNTEYeJG5
         o93i0WIbyL1I799Q/TWI7/IdN8iBKZVJboon555BYJ70EVm9zaDXiwwzQ+4ypc7/9cBd
         MExoZJwoUrefvgA+q+ufCjpadLgSVqkmusnSlVWXff5wAxkYRN/G09drV2SwbBce4Mpf
         xvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aIh9saArreNJuwW89Ey0XiYCdKVw/+DI3nSpmQ+KnZk=;
        b=WerxWStX59O+GFOeLG66lFcvQ6wloS/lqnufTUEWIMD6Zgi7xS868v+qlyRhj+O2UW
         GfKPvO4Q0MWOTz3VOoor6oZr/5xwzHjjn4emmOiQAEV62WnIxrDMk+DROUuAkn5o7YUG
         oysIrMnROwoiggFHAx+I5Wm2CVbGZPxWDCusFRQGttQTbsAZ01ZtGbL/KWjUPB2Qz8QR
         5u6BRiUisbQmxhV2CNb3kVa7HN1vh1vWfVOGpm34YdmSgyXgZISMWKmjyWa1NlL53+bc
         AsL/XS5VDxzXDtLHeoA5N6nsWoX0AdUO7MuN4PicolXhVARHtG7rE2I7ZNK1MyFg15zY
         Aj4A==
X-Gm-Message-State: AOAM533ITIY4k7NFLxCo1Rq8rp4XlptzeD2Lhobemi9sM196JHuGmLZE
        /XKz1nPRFnqiLEqpi4ABWauevQ==
X-Google-Smtp-Source: ABdhPJx6cYHvmTePVyoaUN9kahG9ENPoRxK6HbCGmsj8n9eioURUv101fiZoSUAt0tGA3cwa32k8cA==
X-Received: by 2002:a17:90a:414c:: with SMTP id m12mr1388141pjg.187.1634665159309;
        Tue, 19 Oct 2021 10:39:19 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d23sm3386554pjx.4.2021.10.19.10.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 10:39:17 -0700 (PDT)
Date:   Tue, 19 Oct 2021 11:39:15 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [RFC PATCH 3/7] remoteproc: Remove vdev_to_rvdev and
 vdev_to_rproc from remoteproc API
Message-ID: <20211019173915.GA3340362@p14s>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning,

On Fri, Oct 01, 2021 at 12:12:30PM +0200, Arnaud Pouliquen wrote:
> These both functions are only used by the remoteproc_virtio.

s/"These both functions"/"Both of these functions"

> There is no reason to expose them in the API.
> Move the functions in remoteproc_virtio.c
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 12 ++++++++++++
>  include/linux/remoteproc.h             | 12 ------------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 5e5a78b3243f..c9eecd2f9fb2 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -25,6 +25,18 @@
>  
>  #include "remoteproc_internal.h"
>  
> +static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
> +{
> +	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
> +}
> +
> +static  struct rproc *vdev_to_rproc(struct virtio_device *vdev)
> +{
> +	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> +
> +	return rvdev->rproc;
> +}
> +
>  static int copy_dma_range_map(struct device *to, struct device *from)
>  {
>  	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 83c09ac36b13..e0600e1e5c17 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -684,18 +684,6 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  				      void *priv);
>  int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine);
>  
> -static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
> -{
> -	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
> -}
> -
> -static inline struct rproc *vdev_to_rproc(struct virtio_device *vdev)
> -{
> -	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> -
> -	return rvdev->rproc;
> -}
> -
>  void rproc_add_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
>  
>  void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
> -- 
> 2.17.1
> 
