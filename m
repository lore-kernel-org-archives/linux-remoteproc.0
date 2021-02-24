Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692AFC433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 20:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B9DE60202
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 20:40:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBXUkQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Feb 2021 15:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235376AbhBXUkL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Feb 2021 15:40:11 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A090C061788
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Feb 2021 12:39:31 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id t11so2273188pgu.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Feb 2021 12:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cemHHENd0/W4pcJ7NkWlV5vMTOebmullr83gb9p/HIg=;
        b=AdkyvZcHAd06i809t0aTYg/2YTPea/QPG5wZZD+CyV2Nk+fuiEVETxgSfdvPgpPsx0
         vGnWeMclYPpeEoT5l2J+fGKWL/stRcLmW38aN8xvtbu6LUCIG+LGd/IIC8kq6pWE/n43
         H7KY0W+0mC49FqsdwPK7qMPE7WsMb/jWaXfbLkI2E+bAPbfEHhvMDkmAYhL922S6eXxE
         PL/pV/Wxdc917ErAT2v+p1ilxldHx54SWyBIXrNt7Lpw44R9+7TiIN8kcU8vCsCh+Izf
         XbNqozS4R3BRoGwyuR+b26xPJX1kEzWD9bhKQFTR4BGHs0mRDGdyTyBpuXr8Pd7gk7fA
         eDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cemHHENd0/W4pcJ7NkWlV5vMTOebmullr83gb9p/HIg=;
        b=TozaiGjl4HoGKdoBZW5h29qj/KPsF/8sKK71C7KcmsC95BVc6uBBDxQLZCDtJW622c
         EIIF0D+fys217OT1cwOk2O3fWsasoRP84u+dYcVSzHR/H3w+OYUJwwzN+s/9u/7Ht1Yh
         brJe3OyUfkaEuLoIUtKZnKdYgcXpLxsOquWfDGntLQyHHBfBrZFuH15BB/Fg+V9VNNtD
         mkCmQg2+ndUKVeaOMwWHZ2qUx5Zd+kROOFQhQexh0RqP8iAc5Vhxg4nmyRS6tO3UFxkS
         cjF8o/cjCizcNwiRhkYWkIyYiyFVDRz28x3CxlzIeY8YbSNkclPTEgctPFBpLl/C0G8V
         u6Fw==
X-Gm-Message-State: AOAM533vb3Rf9sN2d/9wxS917hF0qqnJjXwDe4jhY2djm69GbK/mnDMX
        uCb1ea3B70wHKP18Tyu1TACLlQ==
X-Google-Smtp-Source: ABdhPJwZ3hZxeXbyPHXR9bmsXWzCCjCHdUb4ypsklN6T3m0eTRCadywh3yOIbj64M78brBKMMnigYA==
X-Received: by 2002:a63:1b48:: with SMTP id b8mr17387599pgm.334.1614199170547;
        Wed, 24 Feb 2021 12:39:30 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id s13sm3611671pjm.1.2021.02.24.12.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 12:39:30 -0800 (PST)
Date:   Wed, 24 Feb 2021 13:39:27 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Jindong Yue <jindong.yue@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        samitolvanen@google.com, peng.fan@nxp.com
Subject: Re: [PATCH RESEND] remoteproc: core: Remove casting to
 rproc_handle_resource_t
Message-ID: <20210224203927.GB3512860@xps15>
References: <20210224055825.7417-1-jindong.yue@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224055825.7417-1-jindong.yue@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Feb 24, 2021 at 01:58:25PM +0800, Jindong Yue wrote:
> There are four different callback functions that are used for the
> rproc_handle_resource_t callback that all have different second
> parameter types.
> 
> rproc_handle_vdev -> struct fw_rsc_vdev
> rproc_handle_trace -> struct fw_rsc_trace
> rproc_handle_devmem -> struct fw_rsc_devmem
> rproc_handle_carveout -> struct fw_rsc_carveout
> 
> These callbacks are cast to rproc_handle_resource_t so that there is no
> error about incompatible pointer types. Unfortunately, this is a Clang's
> Control-Flow Integrity checking violation, which verifies that the
> callback function's types match the prototypes exactly before jumping.
> 
> [    7.275750] Kernel panic - not syncing: CFI failure (target: rproc_handle_vdev+0x0/0x4)
> [    7.283763] CPU: 2 PID: 1 Comm: init Tainted: G         C O      5.4.70-03301-g527af2c96672 #17
> [    7.292463] Hardware name: NXP i.MX8MPlus EVK board (DT)
> [    7.297779] Call trace:
> [    7.300232]  dump_backtrace.cfi_jt+0x0/0x4
> [    7.304337]  show_stack+0x18/0x24
> [    7.307660]  dump_stack+0xb8/0x114
> [    7.311069]  panic+0x164/0x3d4
> [    7.314130]  __ubsan_handle_cfi_check_fail_abort+0x0/0x14
> [    7.319533]  perf_proc_update_handler+0x0/0xcc
> [    7.323983]  __cfi_check+0x63278/0x6a290
> [    7.327913]  rproc_boot+0x3f8/0x738
> [    7.331404]  rproc_add+0x68/0x110
> [    7.334738]  imx_rproc_probe+0x5e4/0x708 [imx_rproc]
> [    7.339711]  platform_drv_probe+0xac/0xf0
> [    7.343726]  really_probe+0x260/0x65c
> [    7.347393]  driver_probe_device+0x64/0x100
> [    7.351580]  device_driver_attach+0x6c/0xac
> [    7.355766]  __driver_attach+0xdc/0x184
> [    7.359609]  bus_for_each_dev+0x98/0x104
> [    7.363537]  driver_attach+0x24/0x30
> [    7.367117]  bus_add_driver+0x100/0x1e0
> [    7.370958]  driver_register+0x78/0x114
> [    7.374800]  __platform_driver_register+0x44/0x50
> [    7.379514]  init_module+0x20/0xfe8 [imx_rproc]
> [    7.384049]  do_one_initcall+0x190/0x348
> [    7.387979]  do_init_module+0x5c/0x210
> [    7.391731]  load_module+0x2fbc/0x3590
> [    7.395485]  __arm64_sys_finit_module+0xb8/0xec
> [    7.400025]  el0_svc_common+0xb4/0x19c
> [    7.403777]  el0_svc_handler+0x74/0x98
> [    7.407531]  el0_svc+0x8/0xc
> [    7.410419] SMP: stopping secondary CPUs
> [    7.414648] Kernel Offset: disabled
> [    7.418142] CPU features: 0x00010002,2000200c
> [    7.422501] Memory Limit: none
> 
> To fix this, change the second parameter of all functions to void * and
> use a local variable with the correct type so that everything works
> properly. With this, we can remove casting to rproc_handle_resource_t
> for these functions.
> 
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 29 +++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index ab150765d124..553e42a4d2a0 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -482,7 +482,7 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> - * @rsc: the vring resource descriptor
> + * @ptr: the vring resource descriptor
>   * @offset: offset of the resource entry
>   * @avail: size of available data (for sanity checking the image)
>   *
> @@ -507,9 +507,10 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>   *
>   * Returns 0 on success, or an appropriate error code otherwise
>   */
> -static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
> +static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  			     int offset, int avail)
>  {
> +	struct fw_rsc_vdev *rsc = ptr;
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
>  	int i, ret;
> @@ -627,7 +628,7 @@ void rproc_vdev_release(struct kref *ref)
>  /**
>   * rproc_handle_trace() - handle a shared trace buffer resource
>   * @rproc: the remote processor
> - * @rsc: the trace resource descriptor
> + * @ptr: the trace resource descriptor
>   * @offset: offset of the resource entry
>   * @avail: size of available data (for sanity checking the image)
>   *
> @@ -641,9 +642,10 @@ void rproc_vdev_release(struct kref *ref)
>   *
>   * Returns 0 on success, or an appropriate error code otherwise
>   */
> -static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
> +static int rproc_handle_trace(struct rproc *rproc, void *ptr,
>  			      int offset, int avail)
>  {
> +	struct fw_rsc_trace *rsc = ptr;
>  	struct rproc_debug_trace *trace;
>  	struct device *dev = &rproc->dev;
>  	char name[15];
> @@ -693,7 +695,7 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
>  /**
>   * rproc_handle_devmem() - handle devmem resource entry
>   * @rproc: remote processor handle
> - * @rsc: the devmem resource entry
> + * @ptr: the devmem resource entry
>   * @offset: offset of the resource entry
>   * @avail: size of available data (for sanity checking the image)
>   *
> @@ -716,9 +718,10 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
>   * and not allow firmwares to request access to physical addresses that
>   * are outside those ranges.
>   */
> -static int rproc_handle_devmem(struct rproc *rproc, struct fw_rsc_devmem *rsc,
> +static int rproc_handle_devmem(struct rproc *rproc, void *ptr,
>  			       int offset, int avail)
>  {
> +	struct fw_rsc_devmem *rsc = ptr;
>  	struct rproc_mem_entry *mapping;
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -896,7 +899,7 @@ static int rproc_release_carveout(struct rproc *rproc,
>  /**
>   * rproc_handle_carveout() - handle phys contig memory allocation requests
>   * @rproc: rproc handle
> - * @rsc: the resource entry
> + * @ptr: the resource entry
>   * @offset: offset of the resource entry
>   * @avail: size of available data (for image validation)
>   *
> @@ -913,9 +916,9 @@ static int rproc_release_carveout(struct rproc *rproc,
>   * pressure is important; it may have a substantial impact on performance.
>   */
>  static int rproc_handle_carveout(struct rproc *rproc,
> -				 struct fw_rsc_carveout *rsc,
> -				 int offset, int avail)
> +				 void *ptr, int offset, int avail)
>  {
> +	struct fw_rsc_carveout *rsc = ptr;
>  	struct rproc_mem_entry *carveout;
>  	struct device *dev = &rproc->dev;
>  
> @@ -1097,10 +1100,10 @@ EXPORT_SYMBOL(rproc_of_parse_firmware);
>   * enum fw_resource_type.
>   */
>  static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
> -	[RSC_CARVEOUT] = (rproc_handle_resource_t)rproc_handle_carveout,
> -	[RSC_DEVMEM] = (rproc_handle_resource_t)rproc_handle_devmem,
> -	[RSC_TRACE] = (rproc_handle_resource_t)rproc_handle_trace,
> -	[RSC_VDEV] = (rproc_handle_resource_t)rproc_handle_vdev,
> +	[RSC_CARVEOUT] = rproc_handle_carveout,
> +	[RSC_DEVMEM] = rproc_handle_devmem,
> +	[RSC_TRACE] = rproc_handle_trace,
> +	[RSC_VDEV] = rproc_handle_vdev,
>  };
>  
>  /* handle firmware resource entries before booting the remote processor */
> -- 
> 2.17.1
> 
