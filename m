Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36D9C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 17:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EFF76109D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 17:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhJVRpV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Oct 2021 13:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbhJVRpT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Oct 2021 13:45:19 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A552C061766
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Oct 2021 10:43:02 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id 187so4276561pfc.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Oct 2021 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9n/cqrzRbqe+8NgRURNa9xyWoP4yHX8hd+RzSNaaxRM=;
        b=nzYbGo7KXNJ+pz9cuiwU9Et1Mhjpd9qmzBAJPhTz/EY2AyAu+nrL6LRL0mn9i0Y7cY
         4WjRzRGmQpIa2RhU8uw/NgsAMyXnlHjd0PLI0TXEN0dDUtkzb8qvOgYoq1vH3uUHgcoe
         W8oqq8wQ+5Q4ffoKQcKSBv28/YiHcgpzde+/zGV0QVJ55g1wJ9wrO3YsuIF5XRXhaH13
         yc01/smZgcUa9KfuDd4ZdhzDWkUt9NHgvGIXROrIZ3satkK04u+s3gsdUTEeM+W/rG68
         xneGbKP8fJ5W5Jn0suJ0dAvUx/PGbTzpi/HSM0GAGlodBQXTO4e8XGjYmoFqjsfijV8V
         uqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9n/cqrzRbqe+8NgRURNa9xyWoP4yHX8hd+RzSNaaxRM=;
        b=z7vwYIGuvTaR5siHDM33/uUW8a8HUFcwuBzdZIprgu+Ge8wftMqiZzJQ22eEWLdUC2
         vFhZaKBr4BrqnD+T8bH3UWWK3ev0IZ//ggER4AbCOse0rItB4Mc5jKREAksO58hOU1LV
         a/gEk4o10pGPb5+ZYMPJXiyEbhPnuVO373S3+gPIJKDeO46FRtBGPshY5v4GF+k1bLH7
         Jhy7LJSPzRgdiwj7S3uRfhTcXtcBm6QiNzL4JhnRxnuoq3Pdy/VbQ92qea09eMIOOUVV
         1cPYOy0UB6i9CJYb2JtaYBziriZJvaFg9IeB9Estjt8CkL60xi78TEQspSTZvLnRqaIJ
         aWdg==
X-Gm-Message-State: AOAM532XtrKpm9d9va6SbAT+QblAc0Nae8nSR4Whb5+Cf55olUofObFl
        pEmFy29idAbi7d1R7lYSttweew==
X-Google-Smtp-Source: ABdhPJx0pd6dzLUNZono6TwvzeMgOEHqx8YHF0LofvRdAtYUOGdpReFSxR3L85OmL6WGUlVTO/eG3g==
X-Received: by 2002:a63:561a:: with SMTP id k26mr894072pgb.144.1634924581389;
        Fri, 22 Oct 2021 10:43:01 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b18sm12047386pfl.24.2021.10.22.10.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 10:43:00 -0700 (PDT)
Date:   Fri, 22 Oct 2021 11:42:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [RFC PATCH 5/7] remoteproc: virtio: Create platform device for
 the remoteproc_virtio
Message-ID: <20211022174258.GC3659113@p14s>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-6-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Oct 01, 2021 at 12:12:32PM +0200, Arnaud Pouliquen wrote:
> Define a platform device for the remoteproc virtio to prepare the
> management of the remoteproc virtio as a platform device.
> 
> The platform device allows to pass rproc_vdev_data platform data to
> specify properties that are stored in the rproc_vdev structure.
> 
> Such approach will allow to preserve legacy remoteproc virtio device
> creation but also to probe the device using device tree mechanism.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_internal.h |  6 +++
>  drivers/remoteproc/remoteproc_virtio.c   | 65 ++++++++++++++++++++++++
>  include/linux/remoteproc.h               |  2 +
>  3 files changed, 73 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 4ce012c353c0..1b963a8912ed 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -24,6 +24,12 @@ struct rproc_debug_trace {
>  	struct rproc_mem_entry trace_mem;
>  };
>  
> +struct rproc_vdev_data {

s/rproc_vdev_data/rproc_vdev_pdata

> +	u32 rsc_offset;
> +	unsigned int id;
> +	unsigned int index;
> +};
> +
>  /* from remoteproc_core.c */
>  void rproc_release(struct kref *kref);
>  int rproc_of_parse_firmware(struct device *dev, int index,
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index c9eecd2f9fb2..9b2ab79e4c4c 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2011 Texas Instruments, Inc.
>   * Copyright (C) 2011 Google, Inc.
> + * Copyright (C) 2021 STMicroelectronics
>   *
>   * Ohad Ben-Cohen <ohad@wizery.com>
>   * Brian Swetland <swetland@google.com>
> @@ -13,6 +14,7 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/export.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/remoteproc.h>
>  #include <linux/virtio.h>
> @@ -571,3 +573,66 @@ void rproc_vdev_release(struct kref *ref)
>  
>  	rproc_rvdev_remove_device(rvdev);
>  }
> +
> +static int rproc_virtio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rproc_vdev_data *vdev_data = dev->platform_data;
> +	struct rproc_vdev *rvdev;
> +	struct rproc *rproc;
> +
> +	if (!vdev_data)
> +		return -EINVAL;
> +
> +	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
> +	if (!rvdev)
> +		return -ENOMEM;
> +
> +	rproc = container_of(dev->parent, struct rproc, dev);
> +
> +	rvdev->rsc_offset = vdev_data->rsc_offset;
> +	rvdev->id = vdev_data->id;
> +	rvdev->index = vdev_data->index;
> +
> +	rvdev->pdev = pdev;
> +	rvdev->rproc = rproc;
> +
> +	platform_set_drvdata(pdev, rvdev);
> +
> +	return rproc_rvdev_add_device(rvdev);
> +}
> +
> +static int rproc_virtio_remove(struct platform_device *pdev)
> +{
> +	struct rproc_vdev *rvdev = dev_get_drvdata(&pdev->dev);
> +	struct rproc *rproc = rvdev->rproc;
> +	struct rproc_vring *rvring;
> +	int id;
> +
> +	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> +		rvring = &rvdev->vring[id];
> +		rproc_free_vring(rvring);
> +	}
> +
> +	rproc_remove_subdev(rproc, &rvdev->subdev);
> +	rproc_unregister_rvdev(rvdev);
> +	dev_dbg(&pdev->dev, "virtio dev %d removed\n",  rvdev->index);
> +
> +	return 0;
> +}
> +
> +/* Platform driver */
> +static const struct of_device_id rproc_virtio_match[] = {
> +	{ .compatible = "rproc-virtio", },
> +	{},
> +};
> +
> +static struct platform_driver rproc_virtio_driver = {
> +	.probe		= rproc_virtio_probe,
> +	.remove		= rproc_virtio_remove,
> +	.driver		= {
> +		.name	= "rproc-virtio",
> +		.of_match_table	= rproc_virtio_match,
> +	},
> +};
> +builtin_platform_driver(rproc_virtio_driver);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e0600e1e5c17..542a3d4664f2 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -616,6 +616,7 @@ struct rproc_vring {
>   * struct rproc_vdev - remoteproc state for a supported virtio device
>   * @refcount: reference counter for the vdev and vring allocations
>   * @subdev: handle for registering the vdev as a rproc subdevice
> + * @pdev: remoteproc virtio platform device
>   * @dev: device struct used for reference count semantics
>   * @id: virtio device id (as in virtio_ids.h)
>   * @node: list node
> @@ -628,6 +629,7 @@ struct rproc_vdev {
>  	struct kref refcount;
>  
>  	struct rproc_subdev subdev;
> +	struct platform_device *pdev;
>  	struct device dev;
>  
>  	unsigned int id;
> -- 
> 2.17.1
> 
