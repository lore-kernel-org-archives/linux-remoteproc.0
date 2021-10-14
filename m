Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E20CC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 17:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 708096105A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 17:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbhJNRvE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Oct 2021 13:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbhJNRvD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Oct 2021 13:51:03 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E50C061570
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Oct 2021 10:48:58 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id o133so6094523pfg.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Oct 2021 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OT60huJcLUzU4uMTP0Y4zXm9R8zcbb51JLuxqfMRZ94=;
        b=wLDDuoJmX85HQzNdokG+Ttetn04Um6PGIAdCcgnT1SUrnTJbr9y7xmCqiEt5pzQD21
         /oGZrw2O11WaGmL9Su9ZammcH9guMQB2/Ha6UTySsxZ5b+/7TW6kft8hZ2EYLz3mBuEn
         7YZLHItUk7NEl5XvoRG9vEoln7N+JH+GNBOk8+JUBB067D+JWPELkbIRfV+8Id8L6Lkr
         aJpk9Q3gd4IQ/nVxW3zQb0j0M546bBU+/4Fkk+CXe1UkcavcfOABwBzY5yqbOcXTyPbh
         HJyT8o4QcoGPYzcm/9dSZZWJsFzOT9VaQiWqB5KdPMW5xmrVIEIKc5OSsx9ZTQlN99Uf
         SxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OT60huJcLUzU4uMTP0Y4zXm9R8zcbb51JLuxqfMRZ94=;
        b=PwZkTXOp/EpzYcNQu+Wh16CU0q4wbEinnC9CE6iinygRV9+jf1MTwuP9vCTzKg3C13
         U6DdnAjar7Cn4vK04HY5NltUJna4M7icxk8n3Fm2ZXPM+MR/w1aTkCcZ4CcWY7prUkHM
         QwtSPLQRLwhXoBQX1xUXmOD2inPp/VA5ixHR1htdGSpOCd7bDsMCKM3OXbf/q+g3QV3K
         wekcyhZq0e+A2qfDvGgos0vlAMJIzM434fUGH3V7huJ4zT6NQpSq3VTMqHoksv2TWifh
         jC5oXrqQ9hOXJmQdlAw6Jbji1I8lGR5rkn7sIu7bmScGuYhEDxnHB7JOaEih7ngzJXSj
         IErg==
X-Gm-Message-State: AOAM533HUR3hVVzvVD2DW2akPVFOnUOZ+cOYdR2xBufjYcvtiqqVBGCo
        ylAjjVDt/AYEQGlWslAsV3RzKA==
X-Google-Smtp-Source: ABdhPJxmvaatFc+QnqNBQePvZ4CbvHeNQ65c0Ulj65LLhxEKTQGYa8hLZAe0hs+8d7h5nHtD9QEZfw==
X-Received: by 2002:aa7:9f8f:0:b0:44c:cf63:ec7c with SMTP id z15-20020aa79f8f000000b0044ccf63ec7cmr6741449pfr.77.1634233738398;
        Thu, 14 Oct 2021 10:48:58 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id lp9sm3424575pjb.35.2021.10.14.10.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 10:48:57 -0700 (PDT)
Date:   Thu, 14 Oct 2021 11:48:54 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [RFC PATCH 1/7] remoteproc: core: Introduce virtio device
 add/remove functions
Message-ID: <20211014174854.GC2847733@p14s>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

I have started reviewing this set.  Comments herein are related to code logic
only.  I will comment on the overall approach at a later time.

On Fri, Oct 01, 2021 at 12:12:28PM +0200, Arnaud Pouliquen wrote:
> In preparation of the migration of the management of rvdev in
> rproc_virtio, this patch spins off new functions to manage the

Are you referring to file remoteproc_virtio.c?  If so please clearly state that
it is the case by using the real name.  Otherwise it is very confusing.

> remoteproc virtio device.
> 
> The rproc_rvdev_add_device and rproc_rvdev_remove_device will be
> moved to remoteproc_virtio.

Here too I have to guess that you mean remoteproc_virtio.c.  Moreover two
different nomenclatures are used in 3 lines.

> 
> In addition the rproc_register_rvdev and rproc_unregister_rvdev is created
> as it will be exported (used in rproc_rvdev_add_device
> and rproc_rvdev_remove_device functions).
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 102 ++++++++++++++++++---------
>  1 file changed, 67 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 502b6604b757..7c783ca291a7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -484,6 +484,69 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  	return 0;
>  }
>  
> +static void rproc_register_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev && rvdev->rproc)
> +		list_add_tail(&rvdev->node, &rvdev->rproc->rvdevs);
> +}
> +
> +static void rproc_unregister_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev)
> +		list_del(&rvdev->node);
> +}

This file is a simple refactoring of the current code.  Additions such as this
one should be done in a separate patch.

> +
> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +	char name[16];
> +	int ret;
> +
> +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> +	rvdev->dev.parent = &rproc->dev;
> +	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +	if (ret)
> +		return ret;

Memory is allocated for @rvdev in rproc_handle_vdev() using kzalloc().  If
we return prematurely that memory will be leaked.  Note that this problem is
present in the current code base.  I suggest sending a separate patch to fix it
while this work is ongoing.

> +
> +	rvdev->dev.release = rproc_rvdev_release;
> +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> +	dev_set_drvdata(&rvdev->dev, rvdev);
> +
> +	ret = device_register(&rvdev->dev);
> +	if (ret) {
> +		put_device(&rvdev->dev);
> +		return ret;
> +	}
> +	/* Make device dma capable by inheriting from parent's capabilities */
> +	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> +
> +	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> +					   dma_get_mask(rproc->dev.parent));
> +	if (ret) {
> +		dev_warn(&rvdev->dev,
> +			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> +			 dma_get_mask(rproc->dev.parent), ret);
> +	}
> +
> +	rproc_register_rvdev(rvdev);
> +
> +	rvdev->subdev.start = rproc_vdev_do_start;
> +	rvdev->subdev.stop = rproc_vdev_do_stop;
> +
> +	rproc_add_subdev(rproc, &rvdev->subdev);

Please see comment above.

> +
> +	return 0;
> +}
> +
> +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
> +{
> +	struct rproc *rproc = rvdev->rproc;
> +
> +	rproc_remove_subdev(rproc, &rvdev->subdev);
> +	rproc_unregister_rvdev(rvdev);
> +	device_unregister(&rvdev->dev);
> +}
> +
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -519,7 +582,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
>  	int i, ret;
> -	char name[16];
>  
>  	/* make sure resource isn't truncated */
>  	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> @@ -551,33 +613,13 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  
>  	rvdev->id = rsc->id;
>  	rvdev->rproc = rproc;
> -	rvdev->index = rproc->nb_vdev++;
> +	rvdev->index = rproc->nb_vdev;

This one may make sense in a later patch but for now it doesn't.

Depending on the time I have more comments to come later, tomorrow or on Monday.

Thanks,
Mathieu

>  
> -	/* Initialise vdev subdevice */
> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> -	rvdev->dev.parent = &rproc->dev;
> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +	ret = rproc_rvdev_add_device(rvdev);
>  	if (ret)
>  		return ret;
> -	rvdev->dev.release = rproc_rvdev_release;
> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> -	dev_set_drvdata(&rvdev->dev, rvdev);
>  
> -	ret = device_register(&rvdev->dev);
> -	if (ret) {
> -		put_device(&rvdev->dev);
> -		return ret;
> -	}
> -	/* Make device dma capable by inheriting from parent's capabilities */
> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
> -
> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
> -					   dma_get_mask(rproc->dev.parent));
> -	if (ret) {
> -		dev_warn(dev,
> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> -			 dma_get_mask(rproc->dev.parent), ret);
> -	}
> +	rproc->nb_vdev++;
>  
>  	/* parse the vrings */
>  	for (i = 0; i < rsc->num_of_vrings; i++) {
> @@ -596,13 +638,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  			goto unwind_vring_allocations;
>  	}
>  
> -	list_add_tail(&rvdev->node, &rproc->rvdevs);
> -
> -	rvdev->subdev.start = rproc_vdev_do_start;
> -	rvdev->subdev.stop = rproc_vdev_do_stop;
> -
> -	rproc_add_subdev(rproc, &rvdev->subdev);
> -
>  	return 0;
>  
>  unwind_vring_allocations:
> @@ -617,7 +652,6 @@ void rproc_vdev_release(struct kref *ref)
>  {
>  	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
>  	struct rproc_vring *rvring;
> -	struct rproc *rproc = rvdev->rproc;
>  	int id;
>  
>  	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> @@ -625,9 +659,7 @@ void rproc_vdev_release(struct kref *ref)
>  		rproc_free_vring(rvring);
>  	}
>  
> -	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	list_del(&rvdev->node);
> -	device_unregister(&rvdev->dev);
> +	rproc_rvdev_remove_device(rvdev);
>  }
>  
>  /**
> -- 
> 2.17.1
> 
