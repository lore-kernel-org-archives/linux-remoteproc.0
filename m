Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764F4C4708C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 04:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 521D7613E3
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 04:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhE1Ehp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 00:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbhE1Ehp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 00:37:45 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCEDC061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 21:36:10 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so2373218otk.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 21:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oO0Aknxz9u4e0kiIsDD+kH6mpiBoFt6uSgG3WOZetc4=;
        b=wH2vPsuPWzXihvscH3830cVHcmYHrQd3tFW1NtOR2nycU0azENoIGxkUB4gIDUi1OI
         m/f6IN+nbxR1dQtpA9a2QfynXwSzZXQ1mR5vxKD8ALWbOcRbjuKEYvto6kEPjMgE9BhC
         0VpCGKRfRL6XAj5TEh8AQxBEnNYlHuZt1VKAVEdORftnx/9n63yNZ2uOorD/MG5Rm6Bm
         4hwR93izgoIweZZEanoPJHXlOcJ2ds+0rRly+Bnbb5UCigouBF0LaMKXqpT+4PMwXqDS
         QqZrOCkuGYn1uvOkK6ocw46QUMHAlS9wbbFT3Q5qDemUxcSFYuRKQFZimQUe7dtHmWjN
         zlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oO0Aknxz9u4e0kiIsDD+kH6mpiBoFt6uSgG3WOZetc4=;
        b=tzPkN90J2OYcjFJ+w72+QNNsL1iq+ddsnBSnkezO4jIYMeeuu2BNQMEExOuFvie6DS
         dngLgRWy3Ydtazt4EajZD7o4ruuINvmS05tJhpHBMsccsp+JVjhOlenXncYlHljVEo6A
         ForAvC3LVw5DYHcO4aIlpfQG7/EzdZfAe7pxOwpS0SUCAf5v/3+s3N52LxLl6/GwPoeE
         Yz35w+v18Ko9t6pyroNKc8Wc9jS/5ady/yp3QE3bbw/p/PVUVeaAcOWy/kj/ZT0gPRE4
         4u/lS+TRGBAqeoXGlLqFgxsJlQZQ/y5t5zdFIfxyy1OTIFTw09BQMPj8DGkGO2pfTnN0
         cVvQ==
X-Gm-Message-State: AOAM533fV3jvi350m/WgGWH9E8mXYiDalKN6vsTDA1wkUyCMiTYLNFuF
        lPg74mIKUaWjdmQQXL9TxMZaBJsEuDMvcA==
X-Google-Smtp-Source: ABdhPJw7A7ZOKWoSuarKsBuDafrodOiB+sybWURILhyNB0ADHkhcy+Dw4IxkERFAOzVg1FA/CpEFrw==
X-Received: by 2002:a05:6830:3115:: with SMTP id b21mr5266488ots.291.1622176569502;
        Thu, 27 May 2021 21:36:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x9sm876748ooo.27.2021.05.27.21.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 21:36:09 -0700 (PDT)
Date:   Thu, 27 May 2021 23:36:07 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] remoteproc: k3-dsp: Add support for IPC-only mode
 for all K3 DSPs
Message-ID: <YLBzN2UBGbTELETv@builder.lan>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-7-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522000309.26134-7-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 21 May 19:03 CDT 2021, Suman Anna wrote:

> Add support to the K3 DSP remoteproc driver to configure all the C66x
> and C71x cores on J721E SoCs to be either in IPC-only mode or the
> traditional remoteproc mode. The IPC-only mode expects that the remote
> processors are already booted by the bootloader, and only perform the
> minimum steps required to initialize and deinitialize the virtio IPC
> transports. The remoteproc mode allows the kernel remoteproc driver to
> do the regular load and boot and other device management operations for
> a DSP.
> 
> The IPC-only mode for a DSP is detected and configured at driver probe
> time by querying the System Firmware for the DSP power and reset state
> and/or status and making sure that the DSP is indeed started by the
> bootloaders, otherwise the device is configured for remoteproc mode.
> 
> Support for IPC-only mode is achieved through .attach(), .detach() and
> .get_loaded_rsc_table() callback ops and various other flags in both
> remoteproc core and the K3 DSP remoteproc driver. The resource table
> follows a design-by-contract approach and is expected to be at the base
> of the DDR firmware region reserved for each remoteproc, it is mostly
> expected to contain only the virtio device and trace resource entries.
> 
> NOTE:
> The driver cannot configure a DSP core for remoteproc mode by any
> means without rebooting the kernel if that R5F core has been started
> by a bootloader.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 151 ++++++++++++++++++++--
>  1 file changed, 138 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index faf60a274e8d..b154a52f1fa6 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -76,6 +76,7 @@ struct k3_dsp_dev_data {
>   * @ti_sci_id: TI-SCI device identifier
>   * @mbox: mailbox channel handle
>   * @client: mailbox client to request the mailbox channel
> + * @ipc_only: flag to indicate IPC-only mode
>   */
>  struct k3_dsp_rproc {
>  	struct device *dev;
> @@ -91,6 +92,7 @@ struct k3_dsp_rproc {
>  	u32 ti_sci_id;
>  	struct mbox_chan *mbox;
>  	struct mbox_client client;
> +	bool ipc_only;
>  };
>  
>  /**
> @@ -268,6 +270,10 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
>  	struct device *dev = kproc->dev;
>  	int ret;
>  
> +	/* IPC-only mode does not require the core to be released from reset */
> +	if (kproc->ipc_only)

Rather than saying "prepare shouldn't do anything", how about not
actually providing prepare/unprepare ops when ipc_only?

> +		return 0;
> +
>  	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
>  						    kproc->ti_sci_id);
>  	if (ret)
> @@ -292,6 +298,10 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
>  	struct device *dev = kproc->dev;
>  	int ret;
>  
> +	/* do not put back the cores into reset in IPC-only mode */
> +	if (kproc->ipc_only)
> +		return 0;
> +
>  	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
>  						    kproc->ti_sci_id);
>  	if (ret)
> @@ -314,6 +324,12 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
>  	u32 boot_addr;
>  	int ret;
>  
> +	if (kproc->ipc_only) {

It doesn't seem to make sense to start a remoteproc in ipc_only mode, so
how about not registering the start ops?

> +		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
> +			__func__);
> +		return -EINVAL;
> +	}
> +
>  	ret = k3_dsp_rproc_request_mbox(rproc);
>  	if (ret)
>  		return ret;
> @@ -351,6 +367,13 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
>  static int k3_dsp_rproc_stop(struct rproc *rproc)
>  {
>  	struct k3_dsp_rproc *kproc = rproc->priv;
> +	struct device *dev = kproc->dev;
> +
> +	if (kproc->ipc_only) {
> +		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
> +			__func__);
> +		return -EINVAL;
> +	}
>  
>  	mbox_free_channel(kproc->mbox);
>  
> @@ -359,6 +382,85 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
>  	return 0;
>  }
>  
> +/*
> + * Attach to a running DSP remote processor (IPC-only mode)
> + *
> + * This rproc attach callback only needs to request the mailbox, the remote
> + * processor is already booted, so there is no need to issue any TI-SCI
> + * commands to boot the DSP core.
> + */
> +static int k3_dsp_rproc_attach(struct rproc *rproc)
> +{
> +	struct k3_dsp_rproc *kproc = rproc->priv;
> +	struct device *dev = kproc->dev;
> +	int ret;
> +
> +	if (!kproc->ipc_only || rproc->state != RPROC_DETACHED) {

As attach only makes sense when ipc_only, how about not specifying the
attach ops when !ipc_only?

> +		dev_err(dev, "DSP is expected to be in IPC-only mode and RPROC_DETACHED state\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = k3_dsp_rproc_request_mbox(rproc);
> +	if (ret)
> +		return ret;
> +
> +	dev_err(dev, "DSP initialized in IPC-only mode\n");
> +	return 0;
> +}
> +
> +/*
> + * Detach from a running DSP remote processor (IPC-only mode)
> + *
> + * This rproc detach callback performs the opposite operation to attach callback
> + * and only needs to release the mailbox, the DSP core is not stopped and will
> + * be left to continue to run its booted firmware.
> + */
> +static int k3_dsp_rproc_detach(struct rproc *rproc)
> +{
> +	struct k3_dsp_rproc *kproc = rproc->priv;
> +	struct device *dev = kproc->dev;
> +
> +	if (!kproc->ipc_only || rproc->state != RPROC_ATTACHED) {

Ditto.

> +		dev_err(dev, "DSP is expected to be in IPC-only mode and RPROC_ATTACHED state\n");
> +		return -EINVAL;
> +	}
> +
> +	mbox_free_channel(kproc->mbox);
> +	dev_err(dev, "DSP deinitialized in IPC-only mode\n");
> +	return 0;
> +}
> +
> +/*
> + * This function implements the .get_loaded_rsc_table() callback and is used
> + * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
> + * firmwares follow a design-by-contract approach and are expected to have the
> + * resource table at the base of the DDR region reserved for firmware usage.
> + * This provides flexibility for the remote processor to be booted by different
> + * bootloaders that may or may not have the ability to publish the resource table
> + * address and size through a DT property.
> + */
> +static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
> +							  size_t *rsc_table_sz)
> +{
> +	struct k3_dsp_rproc *kproc = rproc->priv;
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

Why can't you use kproc->rmem[0].size here?

> +	return (struct resource_table *)kproc->rmem[0].cpu_addr;
> +}
> +
>  /*
>   * Custom function to translate a DSP device address (internal RAMs only) to a
>   * kernel virtual address.  The DSPs can access their RAMs at either an internal
> @@ -421,8 +523,11 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
>  static const struct rproc_ops k3_dsp_rproc_ops = {

So in essence, I suggest that you create a separate k3_dsp_ipc_only_ops.

>  	.start		= k3_dsp_rproc_start,
>  	.stop		= k3_dsp_rproc_stop,
> +	.attach		= k3_dsp_rproc_attach,
> +	.detach		= k3_dsp_rproc_detach,
>  	.kick		= k3_dsp_rproc_kick,
>  	.da_to_va	= k3_dsp_rproc_da_to_va,
> +	.get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table,
>  };
>  
>  static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
> @@ -605,6 +710,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  	struct k3_dsp_rproc *kproc;
>  	struct rproc *rproc;
>  	const char *fw_name;
> +	bool r_state = false;
> +	bool p_state = false;
>  	int ret = 0;
>  	int ret1;
>  
> @@ -683,19 +790,37 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  		goto release_tsp;
>  	}
>  
> -	/*
> -	 * ensure the DSP local reset is asserted to ensure the DSP doesn't
> -	 * execute bogus code in .prepare() when the module reset is released.
> -	 */
> -	if (data->uses_lreset) {
> -		ret = reset_control_status(kproc->reset);
> -		if (ret < 0) {
> -			dev_err(dev, "failed to get reset status, status = %d\n",
> -				ret);
> -			goto release_mem;
> -		} else if (ret == 0) {
> -			dev_warn(dev, "local reset is deasserted for device\n");
> -			k3_dsp_rproc_reset(kproc);
> +	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> +					       &r_state, &p_state);

You can pass NULL instead of &r_state, as you don't use it anyways.

> +	if (ret) {
> +		dev_err(dev, "failed to get initial state, mode cannot be determined, ret = %d\n",
> +			ret);
> +		goto release_mem;
> +	}
> +
> +	/* configure J721E devices for either remoteproc or IPC-only mode */
> +	if (p_state) {
> +		dev_err(dev, "configured DSP for IPC-only mode\n");

This sounds like a good thing, so perhaps dev_info() rather than err?

> +		rproc->state = RPROC_DETACHED;
> +		rproc->detach_on_shutdown = true;
> +		kproc->ipc_only = true;
> +	} else {
> +		dev_err(dev, "configured DSP for remoteproc mode\n");

Ditto

Regards,
Bjorn
> +		/*
> +		 * ensure the DSP local reset is asserted to ensure the DSP
> +		 * doesn't execute bogus code in .prepare() when the module
> +		 * reset is released.
> +		 */
> +		if (data->uses_lreset) {
> +			ret = reset_control_status(kproc->reset);
> +			if (ret < 0) {
> +				dev_err(dev, "failed to get reset status, status = %d\n",
> +					ret);
> +				goto release_mem;
> +			} else if (ret == 0) {
> +				dev_warn(dev, "local reset is deasserted for device\n");
> +				k3_dsp_rproc_reset(kproc);
> +			}
>  		}
>  	}
>  
> -- 
> 2.30.1
> 
