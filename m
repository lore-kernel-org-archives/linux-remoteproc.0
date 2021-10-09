Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58895C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 03:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32EFB60F90
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 03:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhJIDiA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 23:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhJIDh7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 23:37:59 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C3EC061755
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 20:36:03 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id g15-20020a9d128f000000b0054e3d55dd81so8829809otg.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 20:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4bSpNJPwT1vNF1+AfYe0YCy792p+0Ep8kGezfzAgQtY=;
        b=DHngEJe1oZcDoy9FWK6YfExDfhAM35H4sK9yztoZ9RAL2HE94VKG2iO5zTejlkOqVF
         HgJtOG63wpgRxOxpMkqwHuNdwJ06u8HMsoRrItl3svlMaa9jssnUCdgOOxNc8yPlboFo
         7gxrlt8APJeBIIkLcovevN/nmkJBW5i1f8gnxGSiZWpA6+kMDcv1PIxwkH1OAtGeWqL8
         hgB2xC6FY6aTKzUNS5Zu89jFvGHmzNeMhm+NH7zwfjvI6Ig5R/JE+51d0s3D5woEAdgt
         +6q1Al51Gsjif1dcNGyXd3wZ5vd6A7mPFNd6iIMALu+ztlZDiQs8hd8PlrO5EknG+h4s
         DbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4bSpNJPwT1vNF1+AfYe0YCy792p+0Ep8kGezfzAgQtY=;
        b=Z+A7cL6C922owBAr0jid+u1BpvXcOx3i0GI/s1lGF6aK9/uYKAyynFxk3RplLkGJMz
         Rz5b5PdR8Iz1RPrV+uU3XN6JGtOqO9QDC9VH+P18E3sJ5dJUC+wSaQxV6vsCCYe9Retc
         KribJLHVb00fwMkInrffbgCCGZjbf1l791uoHS2bsheSlpBqReiEgxksS8p7/unVGuNK
         cQkitMDTmymJQMCqNIN2XNAhBcV/arY87ifppiqNv6rEMBHeSIXrJPdt1V6rlVSkNUCT
         H2K29azCSo00vbvd6SGFHn8zFA6BykGJMVYWAA2kfVPNjuV3xxM+Aafl7s8p/T5Lrbtt
         XOyg==
X-Gm-Message-State: AOAM530xEnO64cruLLti3XKF1ehnQATEdHqNP5ysWPhR48SpzhBq7zYq
        ITlzz7ftj7DLzkWnQihCOL4sBQ==
X-Google-Smtp-Source: ABdhPJyaa9dlRviM/cAUSatTSRIaJzgJe5GD1iSAJtY5jd32p+Rh+j0pYpc0Yc+BgfmZscIvNaUurg==
X-Received: by 2002:a05:6830:1d8b:: with SMTP id y11mr11561729oti.291.1633750562871;
        Fri, 08 Oct 2021 20:36:02 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id j12sm283806ota.47.2021.10.08.20.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 20:36:02 -0700 (PDT)
Date:   Fri, 8 Oct 2021 22:36:00 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [RFC PATCH 4/7] remoteproc: create the REMOTEPROC_VIRTIO config
Message-ID: <YWEOIHrp4Z8+MHaE@builder.lan>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 01 Oct 05:12 CDT 2021, Arnaud Pouliquen wrote:

> Create the config to associate to the remoteproc virtio.
> 
> Notice that the REMOTEPROC_VIRTIO config can not set to m. the reason
> is that it defines API that is used by the built-in remote proc core.
> Functions such are rproc_add_virtio_dev can be called during the
> Linux boot phase.
> 

Please don't introduce new Kconfig options for everything. Consider that
the expectation should be that everyone runs the default defconfig on
their boards - and if someone actually needs this level of control, they
are welcome to present patches with numbers showing the benefit of the
savings.

Thanks,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/Kconfig               | 11 +++++++++-
>  drivers/remoteproc/Makefile              |  2 +-
>  drivers/remoteproc/remoteproc_internal.h | 28 ++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 9a6eedc3994a..f271552c0d84 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -6,7 +6,7 @@ config REMOTEPROC
>  	depends on HAS_DMA
>  	select CRC32
>  	select FW_LOADER
> -	select VIRTIO
> +	select REMOTEPROC_VIRTIO
>  	select WANT_DEV_COREDUMP
>  	help
>  	  Support for remote processors (such as DSP coprocessors). These
> @@ -14,6 +14,15 @@ config REMOTEPROC
>  
>  if REMOTEPROC
>  
> +config REMOTEPROC_VIRTIO
> +	bool "Remoteproc virtio device "
> +	select VIRTIO
> +	help
> +	  Say y here to have a virtio device support for the remoteproc
> +	  communication.
> +
> +	  It's safe to say N if you don't use the virtio for the IPC.
> +
>  config REMOTEPROC_CDEV
>  	bool "Remoteproc character device interface"
>  	help
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index bb26c9e4ef9c..73d2384a76aa 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -8,8 +8,8 @@ remoteproc-y				:= remoteproc_core.o
>  remoteproc-y				+= remoteproc_coredump.o
>  remoteproc-y				+= remoteproc_debugfs.o
>  remoteproc-y				+= remoteproc_sysfs.o
> -remoteproc-y				+= remoteproc_virtio.o
>  remoteproc-y				+= remoteproc_elf_loader.o
> +obj-$(CONFIG_REMOTEPROC_VIRTIO)		+= remoteproc_virtio.o
>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 152fe2e8668a..4ce012c353c0 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -30,10 +30,38 @@ int rproc_of_parse_firmware(struct device *dev, int index,
>  			    const char **fw_name);
>  
>  /* from remoteproc_virtio.c */
> +#if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
> +
>  int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
>  void rproc_vdev_release(struct kref *ref);
>  
> +#else
> +
> +int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return -ENXIO;
> +}
> +
> +static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return IRQ_NONE;
> +}
> +
> +static inline void rproc_vdev_release(struct kref *ref)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +}
> +
> +#endif
> +
>  /* from remoteproc_debugfs.c */
>  void rproc_remove_trace_file(struct dentry *tfile);
>  struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
> -- 
> 2.17.1
> 
