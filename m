Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4821CC4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 18:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CAA160F4B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 18:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhHBS0N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Aug 2021 14:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhHBS0K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Aug 2021 14:26:10 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D59C06175F
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Aug 2021 11:26:01 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d1so20666841pll.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Aug 2021 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IR6Wp+R+D+LuGvF6Rof8K3gtoYBRPMIrN0uKpygVhPc=;
        b=A/9pkwBD6bmkRLkHm2o+iIMhlJfuaXOZAgBNTTib+N5a1H+wmkdCDZYzBoLGBYBbBw
         EWMwc57vszicpKlocComOnmVInVeOgyfWH8jXT2HOe0wvnEbBUNf2S3TYocXqsp2bs8z
         d9m8P2GHbRwR4QAGVRgdsxQe1dI4POYwxqeg8XGqXypbkVJml+FAjhPSRlZa4B8769zI
         OvcLUQvmSkph5+SZfNOawXnBgajNPgjKf462SjN73JTWQJvzIsXeQaWJY9tK2OEPuBiR
         jT74IiJUwnJ9ss+7f+YpVpplqDpXDzcUQKtmRCt5yQJrmct8YTks70/CZZitCeK+vZdT
         XqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IR6Wp+R+D+LuGvF6Rof8K3gtoYBRPMIrN0uKpygVhPc=;
        b=kwANWmMFnUfuxeX6iwOHfY8XVkdrGBFc2Gf6Km6AVzfUhE0mk5ZrRSyO87Y27wq+vq
         NEg72mjs9XWiOo08Ib/oeQoJmyu1bvZ2e/CCOXgjqVOcUxCYKGk+3Q0uIsMtDGF0dYAD
         jOvjA/ZM4LG4ubIjFNuXPyGaei8ZBSOxrzwT4sGb80JfznNO22KY8Nb0WTDr9k3ZPkVf
         lEuDDD5+uVHBLVil5nJIHgwkRIAHzYYHHjNQlKkOoLh+2kI2pBfjaBhyR8/6BVAtuDct
         DUfOVG4CTCyBQeJCVhY4yG2EyA+AfcYw5KhQlqu6RZ4bSSF/Pzm/Mo45syFE9+WTvrXL
         w5cQ==
X-Gm-Message-State: AOAM530yZoaISZ6EvxVM8BXJJHA95VOpOJr4ClfSc63sJ0lcElPO9xXI
        e7W/myDciEttbzF8ySQg5k1AGQ==
X-Google-Smtp-Source: ABdhPJzuruVUPoLUCHnRoozn4/nrlNg0pHBilF4PMD34Tc8rMX9Yw5UxphSxZvIYFJvwRNS9XSWRAA==
X-Received: by 2002:a05:6a00:189e:b029:32b:9f66:dcbb with SMTP id x30-20020a056a00189eb029032b9f66dcbbmr18281407pfh.72.1627928760718;
        Mon, 02 Aug 2021 11:26:00 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 131sm12219693pfv.129.2021.08.02.11.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 11:25:59 -0700 (PDT)
Date:   Mon, 2 Aug 2021 12:25:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] remoteproc: k3-r5: Add support for IPC-only mode
 for all R5Fs
Message-ID: <20210802182557.GA3051951@p14s>
References: <20210723220248.6554-1-s-anna@ti.com>
 <20210723220248.6554-4-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723220248.6554-4-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 23, 2021 at 05:02:46PM -0500, Suman Anna wrote:
> Add support to the K3 R5F remoteproc driver to configure all the R5F
> cores to be either in IPC-only mode or the traditional remoteproc mode.
> The IPC-only mode expects that the remote processors are already booted
> by the bootloader, and only performs the minimum steps required to
> initialize and deinitialize the virtio IPC transports. The remoteproc
> mode allows the kernel remoteproc driver to do the regular load and
> boot and other device management operations for a R5F core.
> 
> The IPC-only mode for a R5F core is detected and configured at driver
> probe time by querying the System Firmware for the R5F power and reset
> state and/or status and making sure that the R5F core is indeed started
> by the bootloaders, otherwise the device is configured for remoteproc
> mode.
> 
> Support for IPC-only mode is achieved through .attach(), .detach() and
> .get_loaded_rsc_table() callback ops and zeroing out the regular rproc
> ops .prepare(), .unprepare(), .start() and .stop(). The resource table
> follows a design-by-contract approach and is expected to be at the base
> of the DDR firmware region reserved for each remoteproc, it is mostly
> expected to contain only the virtio device and trace resource entries.
> 
> NOTE:
> The driver cannot configure a R5F core for remoteproc mode by any
> means without rebooting the kernel if that R5F core has been started
> by a bootloader. This is the current desired behavior and can be
> enhanced in the future if the feature is needed.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: Addressed various review comments from v1
>  - Reworked the logic to not use remoteproc detach_on_shutdown and
>    local ipc-only state flags
>  - Plugged in the required IPC-only ops dynamically with the regular
>    remoteproc-mode ops zeroed out
>  - Dropped all the unneeded error checks in start, stop, prepare, 
>    unprepare, attach and detach callbacks
>  - Callback function descriptions updated to reflect the mode they
>    apply to
>  - Switched to dev_info for the mode information traces from dev_err
>  - Revised the last 2 paras of the patch description
> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210522000309.26134-5-s-anna@ti.com/
> 
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 199 ++++++++++++++++++++++-
>  1 file changed, 196 insertions(+), 3 deletions(-)
> 

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 03f930758b2d..12658368aed6 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -428,6 +428,7 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
>   * private to each core. Only Core0 needs to be unhalted for running the
>   * cluster in this mode. The function uses the same reset logic as LockStep
>   * mode for this (though the behavior is agnostic of the reset release order).
> + * This callback is invoked only in remoteproc mode.
>   */
>  static int k3_r5_rproc_prepare(struct rproc *rproc)
>  {
> @@ -493,7 +494,8 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>   * both cores. The access is made possible only with releasing the resets for
>   * both cores, but with only Core0 unhalted. This function re-uses the same
>   * reset assert logic as LockStep mode for this mode (though the behavior is
> - * agnostic of the reset assert order).
> + * agnostic of the reset assert order). This callback is invoked only in
> + * remoteproc mode.
>   */
>  static int k3_r5_rproc_unprepare(struct rproc *rproc)
>  {
> @@ -527,7 +529,8 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
>   *
>   * The Single-CPU mode on applicable SoCs (eg: AM64x) only uses Core0 to execute
>   * code, so only Core0 needs to be unhalted. The function uses the same logic
> - * flow as Split-mode for this.
> + * flow as Split-mode for this. This callback is invoked only in remoteproc
> + * mode.
>   */
>  static int k3_r5_rproc_start(struct rproc *rproc)
>  {
> @@ -598,7 +601,8 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   * be done here, but is preferred to be done in the .unprepare() ops - this
>   * maintains the symmetric behavior between the .start(), .stop(), .prepare()
>   * and .unprepare() ops, and also balances them well between sysfs 'state'
> - * flow and device bind/unbind or module removal.
> + * flow and device bind/unbind or module removal. This callback is invoked
> + * only in remoteproc mode.
>   */
>  static int k3_r5_rproc_stop(struct rproc *rproc)
>  {
> @@ -635,6 +639,78 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> +/*
> + * Attach to a running R5F remote processor (IPC-only mode)
> + *
> + * The R5F attach callback only needs to request the mailbox, the remote
> + * processor is already booted, so there is no need to issue any TI-SCI
> + * commands to boot the R5F cores in IPC-only mode. This callback is invoked
> + * only in IPC-only mode.
> + */
> +static int k3_r5_rproc_attach(struct rproc *rproc)
> +{
> +	struct k3_r5_rproc *kproc = rproc->priv;
> +	struct device *dev = kproc->dev;
> +	int ret;
> +
> +	ret = k3_r5_rproc_request_mbox(rproc);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "R5F core initialized in IPC-only mode\n");
> +	return 0;
> +}
> +
> +/*
> + * Detach from a running R5F remote processor (IPC-only mode)
> + *
> + * The R5F detach callback performs the opposite operation to attach callback
> + * and only needs to release the mailbox, the R5F cores are not stopped and
> + * will be left in booted state in IPC-only mode. This callback is invoked
> + * only in IPC-only mode.
> + */
> +static int k3_r5_rproc_detach(struct rproc *rproc)
> +{
> +	struct k3_r5_rproc *kproc = rproc->priv;
> +	struct device *dev = kproc->dev;
> +
> +	mbox_free_channel(kproc->mbox);
> +	dev_info(dev, "R5F core deinitialized in IPC-only mode\n");
> +	return 0;
> +}
> +
> +/*
> + * This function implements the .get_loaded_rsc_table() callback and is used
> + * to provide the resource table for the booted R5F in IPC-only mode. The K3 R5F
> + * firmwares follow a design-by-contract approach and are expected to have the
> + * resource table at the base of the DDR region reserved for firmware usage.
> + * This provides flexibility for the remote processor to be booted by different
> + * bootloaders that may or may not have the ability to publish the resource table
> + * address and size through a DT property. This callback is invoked only in
> + * IPC-only mode.
> + */
> +static struct resource_table *k3_r5_get_loaded_rsc_table(struct rproc *rproc,
> +							 size_t *rsc_table_sz)
> +{
> +	struct k3_r5_rproc *kproc = rproc->priv;
> +	struct device *dev = kproc->dev;
> +
> +	if (!kproc->rmem[0].cpu_addr) {
> +		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/*
> +	 * NOTE: The resource table size is currently hard-coded to a maximum
> +	 * of 256 bytes. The most common resource table usage for K3 firmwares
> +	 * is to only have the vdev resource entry and an optional trace entry.
> +	 * The exact size could be computed based on resource table address, but
> +	 * the hard-coded value suffices to support the IPC-only mode.
> +	 */
> +	*rsc_table_sz = 256;
> +	return (struct resource_table *)kproc->rmem[0].cpu_addr;
> +}
> +
>  /*
>   * Internal Memory translation helper
>   *
> @@ -1014,6 +1090,116 @@ static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
>  	}
>  }
>  
> +/*
> + * This function checks and configures a R5F core for IPC-only or remoteproc
> + * mode. The driver is configured to be in IPC-only mode for a R5F core when
> + * the core has been loaded and started by a bootloader. The IPC-only mode is
> + * detected by querying the System Firmware for reset, power on and halt status
> + * and ensuring that the core is running. Any incomplete steps at bootloader
> + * are validated and errored out.
> + *
> + * In IPC-only mode, the driver state flags for ATCM, BTCM and LOCZRAMA settings
> + * and cluster mode parsed originally from kernel DT are updated to reflect the
> + * actual values configured by bootloader. The driver internal device memory
> + * addresses for TCMs are also updated.
> + */
> +static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
> +{
> +	struct k3_r5_cluster *cluster = kproc->cluster;
> +	struct k3_r5_core *core = kproc->core;
> +	struct device *cdev = core->dev;
> +	bool r_state = false, c_state = false;
> +	u32 ctrl = 0, cfg = 0, stat = 0, halted = 0;
> +	u64 boot_vec = 0;
> +	u32 atcm_enable, btcm_enable, loczrama;
> +	struct k3_r5_core *core0;
> +	enum cluster_mode mode;
> +	int ret;
> +
> +	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
> +
> +	ret = core->ti_sci->ops.dev_ops.is_on(core->ti_sci, core->ti_sci_id,
> +					      &r_state, &c_state);
> +	if (ret) {
> +		dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
> +			ret);
> +		return ret;
> +	}
> +	if (r_state != c_state) {
> +		dev_warn(cdev, "R5F core may have been powered on by a different host, programmed state (%d) != actual state (%d)\n",
> +			 r_state, c_state);
> +	}
> +
> +	ret = reset_control_status(core->reset);
> +	if (ret < 0) {
> +		dev_err(cdev, "failed to get initial local reset status, ret = %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl,
> +				     &stat);
> +	if (ret < 0) {
> +		dev_err(cdev, "failed to get initial processor status, ret = %d\n",
> +			ret);
> +		return ret;
> +	}
> +	atcm_enable = cfg & PROC_BOOT_CFG_FLAG_R5_ATCM_EN ?  1 : 0;
> +	btcm_enable = cfg & PROC_BOOT_CFG_FLAG_R5_BTCM_EN ?  1 : 0;
> +	loczrama = cfg & PROC_BOOT_CFG_FLAG_R5_TCM_RSTBASE ?  1 : 0;
> +	if (cluster->soc_data->single_cpu_mode) {
> +		mode = cfg & PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE ?
> +				CLUSTER_MODE_SINGLECPU : CLUSTER_MODE_SPLIT;
> +	} else {
> +		mode = cfg & PROC_BOOT_CFG_FLAG_R5_LOCKSTEP ?
> +				CLUSTER_MODE_LOCKSTEP : CLUSTER_MODE_SPLIT;
> +	}
> +	halted = ctrl & PROC_BOOT_CTRL_FLAG_R5_CORE_HALT;
> +
> +	/*
> +	 * IPC-only mode detection requires both local and module resets to
> +	 * be deasserted and R5F core to be unhalted. Local reset status is
> +	 * irrelevant if module reset is asserted (POR value has local reset
> +	 * deasserted), and is deemed as remoteproc mode
> +	 */
> +	if (c_state && !ret && !halted) {
> +		dev_info(cdev, "configured R5F for IPC-only mode\n");
> +		kproc->rproc->state = RPROC_DETACHED;
> +		ret = 1;
> +		/* override rproc ops with only required IPC-only mode ops */
> +		kproc->rproc->ops->prepare = NULL;
> +		kproc->rproc->ops->unprepare = NULL;
> +		kproc->rproc->ops->start = NULL;
> +		kproc->rproc->ops->stop = NULL;
> +		kproc->rproc->ops->attach = k3_r5_rproc_attach;
> +		kproc->rproc->ops->detach = k3_r5_rproc_detach;
> +		kproc->rproc->ops->get_loaded_rsc_table =
> +						k3_r5_get_loaded_rsc_table;
> +	} else if (!c_state) {
> +		dev_info(cdev, "configured R5F for remoteproc mode\n");
> +		ret = 0;
> +	} else {
> +		dev_err(cdev, "mismatched mode: local_reset = %s, module_reset = %s, core_state = %s\n",
> +			!ret ? "deasserted" : "asserted",
> +			c_state ? "deasserted" : "asserted",
> +			halted ? "halted" : "unhalted");
> +		ret = -EINVAL;
> +	}
> +
> +	/* fixup TCMs, cluster & core flags to actual values in IPC-only mode */
> +	if (ret > 0) {
> +		if (core == core0)
> +			cluster->mode = mode;
> +		core->atcm_enable = atcm_enable;
> +		core->btcm_enable = btcm_enable;
> +		core->loczrama = loczrama;
> +		core->mem[0].dev_addr = loczrama ? 0 : K3_R5_TCM_DEV_ADDR;
> +		core->mem[1].dev_addr = loczrama ? K3_R5_TCM_DEV_ADDR : 0;
> +	}
> +
> +	return ret;
> +}
> +
>  static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  {
>  	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
> @@ -1054,6 +1240,12 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  		kproc->rproc = rproc;
>  		core->rproc = rproc;
>  
> +		ret = k3_r5_rproc_configure_mode(kproc);
> +		if (ret < 0)
> +			goto err_config;
> +		if (ret)
> +			goto init_rmem;
> +
>  		ret = k3_r5_rproc_configure(kproc);
>  		if (ret) {
>  			dev_err(dev, "initial configure failed, ret = %d\n",
> @@ -1061,6 +1253,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  			goto err_config;
>  		}
>  
> +init_rmem:
>  		k3_r5_adjust_tcm_sizes(kproc);
>  
>  		ret = k3_r5_reserved_mem_init(kproc);
> -- 
> 2.32.0
> 
