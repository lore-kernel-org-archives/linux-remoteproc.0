Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B74C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 17:59:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB57561248
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 17:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbhJVSBV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Oct 2021 14:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbhJVSBV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Oct 2021 14:01:21 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E60C061764
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Oct 2021 10:59:02 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 75so4023771pga.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Oct 2021 10:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1nDeFqUsvdr45xYBBhOarNLLfojMepdfV0/mCVhVbb0=;
        b=WMZD2G+BtQJ4swZmvJf05IVsSn+NEsPVuB+h01UixO7xDUEaiKd3Ys9yNjUK++B6zq
         Is+AUX+MLgbH0dYEQPYCRMtSEwmXoUY1Pi+YCs5kO90JyxF56p34npR/WHD9pDCOmsPQ
         bqOBU1ihg5Elry1BA2GtEPB3IZY8wBgnyeu39AISEo/tGC6qOq5V0KyPkpu8PN+BMb6y
         TTH6W3775XJGnfSOrHVlXuLFw+3JhbT9dj95vkcKBPNux57j38tqtWjJn0dplVIKKKhV
         h1+9WAtaKy1DJ41cxXr3Tl+B0YKrEjoiIozvl3mlGdpHQCtD70Oapvor5bF05D802Tup
         fkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1nDeFqUsvdr45xYBBhOarNLLfojMepdfV0/mCVhVbb0=;
        b=vOhUwf+CSDTBWbFGSlBn8UokhmA4O3rcS+iX7Nao/jIIfx79Dw+qU7+Mtm4REToX00
         A2OkaLemgdflthPv+bbRL8q+Q3RFqWulJGyLz9AV1oS83LlEZjLL7M0lzjPwSQuTacVG
         7R0bNkUkl1vI7eeztNdmg1LMph3eM+YMSTvU6gh8k2LJ155xjv4PjFUBCvxbnNAvVglG
         CF1kT89SvI2cAmOcif2lVoTSpGtohyo98HMhKz2RwYB707de2pxI5g+vt9c+AB/Ralsr
         fGxDL2WXEQm17zveAGslbLF4EKFh9S8qBKiRcA9QTDKfHyqWhUXgsZnDAz7rmvDXKCG/
         x9+A==
X-Gm-Message-State: AOAM533SPm3shnX7RSp9/2EyeAbi2Hd5R3BMObFdc4C2hDwDY9sxg9M8
        y1wnDQpeXzro/bbvOBtg6Eur5w==
X-Google-Smtp-Source: ABdhPJw72Fmm/kS3VHDLkcNXxpmFVQYnmJFQhbmrrivfykR4cI1KO3ChooWG+GKJf7A6AVXripL8iw==
X-Received: by 2002:a05:6a00:c81:b029:30e:21bf:4c15 with SMTP id a1-20020a056a000c81b029030e21bf4c15mr1274191pfv.70.1634925542182;
        Fri, 22 Oct 2021 10:59:02 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id gm14sm13637730pjb.40.2021.10.22.10.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 10:59:00 -0700 (PDT)
Date:   Fri, 22 Oct 2021 11:58:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [RFC PATCH 7/7] remoteproc: Instantiate the new remoteproc
 virtio platform device
Message-ID: <20211022175857.GD3659113@p14s>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-8-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Oct 01, 2021 at 12:12:34PM +0200, Arnaud Pouliquen wrote:
> Migrate from the rvdev device to the rvdev platform device.
> From this patch, when a vdev resource is found in the resource table
> the remoteproc core register a platform device.
> 
> All reference to the rvdev->dev has been updated to rvdev-pdev->dev
> 
> The use of kref counter is replaced by get/put_device on the remoteproc
> virtio device.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 49 +++++++------
>  drivers/remoteproc/remoteproc_internal.h | 16 ----
>  drivers/remoteproc/remoteproc_virtio.c   | 93 ++++++------------------
>  include/linux/remoteproc.h               |  4 -
>  4 files changed, 50 insertions(+), 112 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 67ccd088db8f..d9256db8b130 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -467,6 +467,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  {
>  	struct fw_rsc_vdev *rsc = ptr;
>  	struct device *dev = &rproc->dev;
> +	struct rproc_vdev_data vdev_data;
> +	struct platform_device *pdev;
>  	struct rproc_vdev *rvdev;
>  	int i, ret;
>  
> @@ -486,28 +488,34 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
>  		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
>  
> -	/* we currently support only two vrings per rvdev */
> -	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
> -		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
> -		return -EINVAL;
> -	}
> +	/* platform data of the new rvdev platform */
> +	vdev_data.rsc_offset = offset;
> +	vdev_data.id  = rsc->id;
> +	vdev_data.index  = rproc->nb_vdev;
>  
> -	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
> -	if (!rvdev)
> -		return -ENOMEM;
> -
> -	kref_init(&rvdev->refcount);
> -
> -	rvdev->id = rsc->id;
> -	rvdev->rproc = rproc;
> -	rvdev->index = rproc->nb_vdev;
> +	pdev = rproc_virtio_register_device(rproc, &vdev_data);
> +	if (PTR_ERR_OR_ZERO(pdev)) {
> +		dev_err(rproc->dev.parent,
> +			"failed to create rproc-virtio device\n");
> +		return PTR_ERR_OR_ZERO(pdev);
> +	}
>  
> -	ret = rproc_rvdev_add_device(rvdev);
> -	if (ret)
> -		return ret;
> +	/* If we made it to this point the remote proc virtio platform at been probed */
> +	rvdev = platform_get_drvdata(pdev);
> +	if (WARN_ON(!rvdev)) {
> +		ret = -EINVAL;
> +		goto free_rvdev;
> +	}
>  
>  	rproc->nb_vdev++;
>  
> +	/* we currently support only two vrings per rvdev */
> +	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
> +		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
> +		ret = -EINVAL;
> +		goto free_rvdev;
> +	}
> +
>  	/* parse the vrings */
>  	for (i = 0; i < rsc->num_of_vrings; i++) {
>  		ret = rproc_parse_vring(rvdev, rsc, i);
> @@ -515,9 +523,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  			goto free_rvdev;
>  	}
>  
> -	/* remember the resource offset*/
> -	rvdev->rsc_offset = offset;
> -
>  	/* allocate the vring resources */
>  	for (i = 0; i < rsc->num_of_vrings; i++) {
>  		ret = rproc_alloc_vring(rvdev, i);
> @@ -531,7 +536,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	for (i--; i >= 0; i--)
>  		rproc_free_vring(&rvdev->vring[i]);
>  free_rvdev:
> -	device_unregister(&rvdev->dev);
> +	rproc_virtio_unregister_device(rvdev);
>  	return ret;
>  }

I have made it up to here but running out of time for this patchset.  I will review
the rest in another revision.  I haven't found a justification for
rproc_register_rvdev() and rproc_unregister_rvdev().  Am I missing something or
they can simply be removed and the list manipulations done in the code as it
currently is?

Thanks,
Mathieu

>  
> @@ -1270,7 +1275,7 @@ void rproc_resource_cleanup(struct rproc *rproc)
>  
>  	/* clean up remote vdev entries */
>  	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
> -		kref_put(&rvdev->refcount, rproc_vdev_release);
> +		rproc_virtio_unregister_device(rvdev);
>  
>  	rproc_coredump_cleanup(rproc);
>  }
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 0bb1b14e5136..2f68e7380c77 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -38,12 +38,10 @@ int rproc_of_parse_firmware(struct device *dev, int index,
>  /* from remoteproc_virtio.c */
>  #if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
>  
> -int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
>  struct platform_device *
>  rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_data);
>  void rproc_virtio_unregister_device(struct rproc_vdev *rvdev);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> -void rproc_vdev_release(struct kref *ref);
>  
>  #else
>  
> @@ -59,14 +57,6 @@ static inline void rproc_virtio_unregister_device(struct rproc_vdev *rvdev)
>  	WARN_ON(1);
>  }
>  
> -int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> -{
> -	/* This shouldn't be possible */
> -	WARN_ON(1);
> -
> -	return -ENXIO;
> -}
> -
>  static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
>  {
>  	/* This shouldn't be possible */
> @@ -75,12 +65,6 @@ static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
>  	return IRQ_NONE;
>  }
>  
> -static inline void rproc_vdev_release(struct kref *ref)
> -{
> -	/* This shouldn't be possible */
> -	WARN_ON(1);
> -}
> -
>  #endif
>  
>  /* from remoteproc_debugfs.c */
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 7188fb8ce40f..34781a2136e6 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -29,7 +29,11 @@
>  
>  static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
>  {
> -	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
> +	struct platform_device *pdev;
> +
> +	pdev = container_of(vdev->dev.parent, struct platform_device, dev);
> +
> +	return platform_get_drvdata(pdev);
>  }
>  
>  static  struct rproc *vdev_to_rproc(struct virtio_device *vdev)
> @@ -343,13 +347,10 @@ static void rproc_virtio_dev_release(struct device *dev)
>  {
>  	struct virtio_device *vdev = dev_to_virtio(dev);
>  	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> -	struct rproc *rproc = vdev_to_rproc(vdev);
>  
>  	kfree(vdev);
>  
> -	kref_put(&rvdev->refcount, rproc_vdev_release);
> -
> -	put_device(&rproc->dev);
> +	put_device(&rvdev->pdev->dev);
>  }
>  
>  /**
> @@ -365,7 +366,7 @@ static void rproc_virtio_dev_release(struct device *dev)
>  static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  {
>  	struct rproc *rproc = rvdev->rproc;
> -	struct device *dev = &rvdev->dev;
> +	struct device *dev = &rvdev->pdev->dev;
>  	struct virtio_device *vdev;
>  	struct rproc_mem_entry *mem;
>  	int ret;
> @@ -436,17 +437,15 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  	vdev->dev.release = rproc_virtio_dev_release;
>  
>  	/*
> -	 * We're indirectly making a non-temporary copy of the rproc pointer
> +	 * We're indirectly making a non-temporary copy of the rvdev pointer
>  	 * here, because drivers probed with this vdev will indirectly
>  	 * access the wrapping rproc.
>  	 *
> -	 * Therefore we must increment the rproc refcount here, and decrement
> +	 * Therefore we must increment the rvdev refcount here, and decrement
>  	 * it _only_ when the vdev is released.
>  	 */
> -	get_device(&rproc->dev);
> +	get_device(dev);
>  
> -	/* Reference the vdev and vring allocations */
> -	kref_get(&rvdev->refcount);
>  
>  	ret = register_virtio_device(vdev);
>  	if (ret) {
> @@ -488,57 +487,33 @@ static int rproc_vdev_do_start(struct rproc_subdev *subdev)
>  static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
>  {
>  	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
> +	struct device *dev = &rvdev->pdev->dev;
>  	int ret;
>  
> -	ret = device_for_each_child(&rvdev->dev, NULL, rproc_remove_virtio_dev);
> +	ret = device_for_each_child(dev, NULL, rproc_remove_virtio_dev);
>  	if (ret)
> -		dev_warn(&rvdev->dev, "can't remove vdev child device: %d\n", ret);
> -}
> -
> -/**
> - * rproc_rvdev_release() - release the existence of a rvdev
> - *
> - * @dev: the subdevice's dev
> - */
> -static void rproc_rvdev_release(struct device *dev)
> -{
> -	struct rproc_vdev *rvdev = container_of(dev, struct rproc_vdev, dev);
> -
> -	of_reserved_mem_device_release(dev);
> -
> -	kfree(rvdev);
> +		dev_warn(dev, "can't remove vdev child device: %d\n", ret);
>  }
>  
> -int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>  {
>  	struct rproc *rproc = rvdev->rproc;
> -	char name[16];
> +	struct device *dev = &rvdev->pdev->dev;
>  	int ret;
>  
> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> -	rvdev->dev.parent = &rproc->dev;
> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +	ret = copy_dma_range_map(dev, rproc->dev.parent);
>  	if (ret)
>  		return ret;
>  
> -	rvdev->dev.release = rproc_rvdev_release;
> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> -	dev_set_drvdata(&rvdev->dev, rvdev);
>  
> -	ret = device_register(&rvdev->dev);
> -	if (ret) {
> -		put_device(&rvdev->dev);
> -		return ret;
> -	}
>  	/* Make device dma capable by inheriting from parent's capabilities */
> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> +	set_dma_ops(dev, get_dma_ops(rproc->dev.parent));
>  
> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> -					   dma_get_mask(rproc->dev.parent));
> +	ret = dma_coerce_mask_and_coherent(dev, dma_get_mask(rproc->dev.parent));
>  	if (ret) {
> -		dev_warn(&rvdev->dev,
> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> +		dev_warn(dev, "Failed to set DMA mask %llx. Trying to continue... %x\n",
>  			 dma_get_mask(rproc->dev.parent), ret);
> +		return ret;
>  	}
>  
>  	rproc_register_rvdev(rvdev);
> @@ -548,30 +523,9 @@ int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>  
>  	rproc_add_subdev(rproc, &rvdev->subdev);
>  
> -	return 0;
> -}
> -
> -static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> -{
> -	struct rproc *rproc = rvdev->rproc;
> -
> -	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	rproc_unregister_rvdev(rvdev);
> -	device_unregister(&rvdev->dev);
> -}
> -
> -void rproc_vdev_release(struct kref *ref)
> -{
> -	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
> -	struct rproc_vring *rvring;
> -	int id;
> +	dev_dbg(dev, "virtio dev %d added\n",  rvdev->index);
>  
> -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> -		rvring = &rvdev->vring[id];
> -		rproc_free_vring(rvring);
> -	}
> -
> -	rproc_rvdev_remove_device(rvdev);
> +	return 0;
>  }
>  
>  /**
> @@ -590,8 +544,7 @@ rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_d
>  	pdev = platform_device_register_data(dev, "rproc-virtio", vdev_data->index, vdev_data,
>  					     sizeof(*vdev_data));
>  	if (PTR_ERR_OR_ZERO(pdev)) {
> -		dev_err(rproc->dev.parent,
> -			"failed to create rproc-virtio device\n");
> +		dev_err(rproc->dev.parent, "failed to create rproc-virtio device\n");
>  	}
>  
>  	return  pdev;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 542a3d4664f2..7951a3e2b62a 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -614,10 +614,8 @@ struct rproc_vring {
>  
>  /**
>   * struct rproc_vdev - remoteproc state for a supported virtio device
> - * @refcount: reference counter for the vdev and vring allocations
>   * @subdev: handle for registering the vdev as a rproc subdevice
>   * @pdev: remoteproc virtio platform device
> - * @dev: device struct used for reference count semantics
>   * @id: virtio device id (as in virtio_ids.h)
>   * @node: list node
>   * @rproc: the rproc handle
> @@ -626,11 +624,9 @@ struct rproc_vring {
>   * @index: vdev position versus other vdev declared in resource table
>   */
>  struct rproc_vdev {
> -	struct kref refcount;
>  
>  	struct rproc_subdev subdev;
>  	struct platform_device *pdev;
> -	struct device dev;
>  
>  	unsigned int id;
>  	struct list_head node;
> -- 
> 2.17.1
> 
