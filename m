Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BF0C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 17:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B528611BF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 17:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbhJSRvd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Oct 2021 13:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233916AbhJSRvd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Oct 2021 13:51:33 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2D6C06161C
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Oct 2021 10:49:20 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d5so620233pfu.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Oct 2021 10:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=89Q/XwlG7K9QjhGfCn1Wc1KjC2i0sRysqqYs+AmNUQE=;
        b=QqBZQ2oY0XncA0F2vWMKSAd1b02KZ1fZMpyo5zMWdEAftnVkOaBQWB/5RLU4FI1opi
         jkOZJlMz6WLfWBCeygXdJXIHT+cBGooxdY326qmmymUk5GdXZciETGT0RLsFAVmitW50
         zxKEax9RktgHj28gpfInseMAVbJSpXae0a+sm1DtL6e6DeScdyyoSh7UEI1b8/ayZ9EZ
         356fDv1e+rib82YPUwHA/Ucil+4Cv1gwWyhi4f3FoU7KMjzvagupwxUBCfrzpWuLKYMz
         /pMSPg3WhEKuEd8nmj+EQlFiiUPts8rBe4p3Yrk1yMiCiHN5tzWbRze+CplP2OC8noBL
         J2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=89Q/XwlG7K9QjhGfCn1Wc1KjC2i0sRysqqYs+AmNUQE=;
        b=i7/AvuAzs7h2VmJ17oz03Qu8dCA04+suPUWVvz/KDco3Tvs8c8tUHj4TlxjtFWF7r2
         j2Yw5gefGBuR5DTyHbddYxqGjOZYMBE0wTEfSrxA4Pjvn4wJymbN1xg22GXngBCQW17o
         veQwOFVx01P0UjuXwUwgpLracO60hZMbyJZtx7JKcyxmQeUB5AW59cNY1Wimldlim+pn
         aRdSNtpuTMSxydyF8GIzSHHpuADas/7ehssqtMrjiFhVniD1Jg/8FsImuiM+SIsMRJaV
         pNlPH/pRpAdAPaYuuRwSs0YhVhmWbf9pUwEpVxvI0IE5x3bljdxElDyILrWvanKltCSe
         Opmg==
X-Gm-Message-State: AOAM530/EdHLAM7CGwxYhIPEC5ubHfvksPLh4Cfeq1xKn4xCVnnVrzbh
        2cy3fYJC75Re+qNNY5i6Os7Yfw==
X-Google-Smtp-Source: ABdhPJyEWdYwNsiXCAAz9qvhhihWmXzPVhX2Nk3xsl0xaBfcdISq0U7NdW2leRUWeoK1YEYbfPzPmg==
X-Received: by 2002:a05:6a00:234f:b0:3eb:3ffd:6da2 with SMTP id j15-20020a056a00234f00b003eb3ffd6da2mr1252022pfj.15.1634665759796;
        Tue, 19 Oct 2021 10:49:19 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id s22sm16722906pfe.76.2021.10.19.10.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 10:49:18 -0700 (PDT)
Date:   Tue, 19 Oct 2021 11:49:16 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [RFC PATCH 4/7] remoteproc: create the REMOTEPROC_VIRTIO config
Message-ID: <20211019174916.GB3340362@p14s>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Oct 01, 2021 at 12:12:31PM +0200, Arnaud Pouliquen wrote:
> Create the config to associate to the remoteproc virtio.
> 
> Notice that the REMOTEPROC_VIRTIO config can not set to m. the reason
> is that it defines API that is used by the built-in remote proc core.
> Functions such are rproc_add_virtio_dev can be called during the
> Linux boot phase.
> 
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

This one is weird but there is no need to comment further after reading your
conversation with Bjorn.

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
