Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A421C4167B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  8 Dec 2020 20:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C697F23AC8
	for <linux-remoteproc@archiver.kernel.org>; Tue,  8 Dec 2020 20:28:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgLHU1l (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 8 Dec 2020 15:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729553AbgLHUZo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 8 Dec 2020 15:25:44 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C3AC06179C
        for <linux-remoteproc@vger.kernel.org>; Tue,  8 Dec 2020 12:25:03 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id q3so13242070pgr.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Dec 2020 12:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5dRT8uVlJwjIaHGkFNwsvEp2IYayT9YK4fkX5+XH1So=;
        b=VMOukCZmENMM8B9bRDfq9MiBErortJqoBFgQ3+s/mRR1bKSYJJT0eTpMc1AJYZ9cKE
         Pil9jDg2oU3SmxTy4KeE7OC7LEWwsS5Qv6cRQBVxBggYcT7A4LMgBX4QcRz/6vs1/WRf
         sJjlUk/iuVbk6s70oLrKPewQrYBcdLQJSObuMyEKgsS0GkyiBZTN28qUD98lnPq1avGV
         kKdAHDTRGnmE3EpvFT6SxCE4tiPVpUoMNATdI+PfcfdBuxItsvpi+ylJpHXOSTQrxQ6G
         aNHY2QYaHmG0wt/4rRYginYT2Hh5zy6mjtAsGWl1QMkvraN4g64dQNuVDjlntzbRSQxE
         H93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5dRT8uVlJwjIaHGkFNwsvEp2IYayT9YK4fkX5+XH1So=;
        b=rKOEM2t65Bf0dG0yJbDdDVE86VBtHOgHG2fV0ZfXJn+GB1yaE7iEvpUAIY9C6A+0jf
         ewNGJs8/P20L7B06lS2CyBqPZ3c14yYK8omct9EwoborheDBkchIUnbiZ74b3BoZDasI
         WknN/ErK1xeARJZ6bhl568fajbkGyOr/wNv/N5MyMlW821/u90jBItZ/quEn7O9qemW7
         HqCA+pHVszyAvF4+kF6LDjHEuQkhonBGAOcOcHZ5OjLpOmrXH0DaqxDjmJnahasO6Agp
         ud5SZpy+3+O99OD1KR7fsgS4fJ9+ILgshosagJGtSsVx9qWKkG8Znj4EP9Kwfv+GSPXq
         /xbw==
X-Gm-Message-State: AOAM533dS3s4g2vUJuVFyKKWGO6bvS8V+lVJVKTsZKUTz8b6c48rO3iY
        lJq96LJZZAIRoFNRsDDEut+2+A==
X-Google-Smtp-Source: ABdhPJz2n2OIUCzO99uSjxuKeCmXgf3cmmJrqW2FVAj5z2b1z3WzLhUwBv5PxeBy019F9m0VnHvaDA==
X-Received: by 2002:a63:c60a:: with SMTP id w10mr24027846pgg.211.1607459103338;
        Tue, 08 Dec 2020 12:25:03 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y15sm4296190pju.13.2020.12.08.12.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 12:25:02 -0800 (PST)
Date:   Tue, 8 Dec 2020 13:25:00 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/15] remoteproc: Introduce function rproc_detach()
Message-ID: <20201208202500.GA1601690@xps15>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-10-mathieu.poirier@linaro.org>
 <0e705760-b69a-d872-9770-c03dde85ab1c@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e705760-b69a-d872-9770-c03dde85ab1c@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 08, 2020 at 07:35:18PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> 
> On 11/26/20 10:06 PM, Mathieu Poirier wrote:
> > Introduce function rproc_detach() to enable the remoteproc
> > core to release the resources associated with a remote processor
> > without stopping its operation.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 65 +++++++++++++++++++++++++++-
> >  include/linux/remoteproc.h           |  1 +
> >  2 files changed, 65 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 928b3f975798..f5adf05762e9 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1667,7 +1667,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >  /*
> >   * __rproc_detach(): Does the opposite of rproc_attach()
> >   */
> > -static int __maybe_unused __rproc_detach(struct rproc *rproc)
> > +static int __rproc_detach(struct rproc *rproc)
> >  {
> >  	struct device *dev = &rproc->dev;
> >  	int ret;
> > @@ -1910,6 +1910,69 @@ void rproc_shutdown(struct rproc *rproc)
> >  }
> >  EXPORT_SYMBOL(rproc_shutdown);
> >  
> > +/**
> > + * rproc_detach() - Detach the remote processor from the
> > + * remoteproc core
> > + *
> > + * @rproc: the remote processor
> > + *
> > + * Detach a remote processor (previously attached to with rproc_actuate()).
> > + *
> > + * In case @rproc is still being used by an additional user(s), then
> > + * this function will just decrement the power refcount and exit,
> > + * without disconnecting the device.
> > + *
> > + * Function rproc_detach() calls __rproc_detach() in order to let a remote
> > + * processor know that services provided by the application processor are
> > + * no longer available.  From there it should be possible to remove the
> > + * platform driver and even power cycle the application processor (if the HW
> > + * supports it) without needing to switch off the remote processor.
> > + */
> > +int rproc_detach(struct rproc *rproc)
> > +{
> > +	struct device *dev = &rproc->dev;
> > +	int ret;
> > +
> > +	ret = mutex_lock_interruptible(&rproc->lock);
> > +	if (ret) {
> > +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> > +		return ret;
> > +	}
> > +
> > +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
> > +		ret = -EPERM;
> > +		goto out;
> > +	}
> > +
> > +	/* if the remote proc is still needed, bail out */
> > +	if (!atomic_dec_and_test(&rproc->power)) {
> > +		ret = -EBUSY;
> > +		goto out;
> > +	}
> > +
> > +	ret = __rproc_detach(rproc);
> > +	if (ret) {
> > +		atomic_inc(&rproc->power);
> > +		goto out;
> > +	}
> > +
> > +	/* clean up all acquired resources */
> > +	rproc_resource_cleanup(rproc);
> 
> I started to test the series, I found 2 problems testing in STM32P1 board.
> 
> 1) the resource_table pointer is unmapped if the firmware has been booted by the
> Linux, generating a crash in rproc_free_vring.
> I attached a fix at the end of the mail.
> 
> 2) After the detach, the rproc state is "detached"
> but it is no longer possible to re-attach to it correctly.
> Neither if the firmware is standalone, nor if it has been booted
> by the Linux.

Thanks for the report - I thought both problems had been fixed...

> 
> I did not investigate, but the issue is probably linked to the resource
> table address which is set to NULL.
> 
> So we either have to fix the problem in order to attach or forbid the transition.
> 

Perfect timing on your side as I was contemplating sending another revision.
Let me look at things and I will get back to you.

> 
> Regards,
> Arnaud
> 
> > +
> > +	rproc_disable_iommu(rproc);
> > +
> > +	/*
> > +	 * Set the remote processor's table pointer to NULL.  Since mapping
> > +	 * of the resource table to a virtual address is done in the platform
> > +	 * driver, unmapping should also be done there.
> > +	 */
> > +	rproc->table_ptr = NULL;
> > +out:
> > +	mutex_unlock(&rproc->lock);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(rproc_detach);
> > +
> >  /**
> >   * rproc_get_by_phandle() - find a remote processor by phandle
> >   * @phandle: phandle to the rproc
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index da15b77583d3..329c1c071dcf 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
> >  
> >  int rproc_boot(struct rproc *rproc);
> >  void rproc_shutdown(struct rproc *rproc);
> > +int rproc_detach(struct rproc *rproc);
> >  int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
> >  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
> >  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
> > 
> 
> From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> Date: Tue, 8 Dec 2020 18:54:51 +0100
> Subject: [PATCH] remoteproc: core: fix detach for unmapped table_ptr
> 
> If the firmware has been loaded and started by the kernel, the
> resource table has probably been mapped by the carveout allocation
> (see rproc_elf_find_loaded_rsc_table).
> In this case the memory can have been unmapped before the vrings are free.
> The result is a crash that occurs in rproc_free_vring while try to use the
> unmapped pointer.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 2b0a52fb3398..3508ffba4a2a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1964,6 +1964,13 @@ int rproc_detach(struct rproc *rproc)
>  		goto out;
>  	}
> 
> +	/*
> +	 * Prevent case that the installed resource table is no longer
> +	 * accessible (e.g. memory unmapped), use the cache if available
> +	 */
> +	if (rproc->cached_table)
> +		rproc->table_ptr = rproc->cached_table;
> +
>  	ret = __rproc_detach(rproc);
>  	if (ret) {
>  		atomic_inc(&rproc->power);
> @@ -1975,10 +1982,14 @@ int rproc_detach(struct rproc *rproc)
> 
>  	rproc_disable_iommu(rproc);
> 
> +	/* Free the chached table memory that can has been allocated*/
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
>  	/*
> -	 * Set the remote processor's table pointer to NULL.  Since mapping
> -	 * of the resource table to a virtual address is done in the platform
> -	 * driver, unmapping should also be done there.
> +	 * Set the remote processor's table pointer to NULL. If mapping
> +	 * of the resource table to a virtual address has been done in the
> +	 * platform driver(attachment to an existing firmware),
> +	 * unmapping should also be done there.
>  	 */
>  	rproc->table_ptr = NULL;
>  out:
> -- 
> 2.17.1
> 
> 
> 
