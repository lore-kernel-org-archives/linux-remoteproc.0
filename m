Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD385C43381
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Feb 2021 22:43:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FB6164F68
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Feb 2021 22:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235530AbhBBWne (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Feb 2021 17:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbhBBWnR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Feb 2021 17:43:17 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6942FC06174A
        for <linux-remoteproc@vger.kernel.org>; Tue,  2 Feb 2021 14:42:32 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id o7so15919034pgl.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Feb 2021 14:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vm+8K78/vDISuVFEQprDbnRBNIJoznUwb75pujPY7SE=;
        b=fwusQ5MgE08tPrIz9IXoaRwx79BMgS2fy5tjm/VODYmSbcG1ZgjQgvB4oI+6T/UJnd
         CL6qpNWk+cK1dpKRZ2AROGiggZTw/gE5xd1mUuqa1eVRBA4fpAlR6aPpKttMvSGmEv2P
         uVeCP0D7YlcQ5z0SPsVlmuGIKGvsSNuQURufJp/VdC2L/nZdoG5OosSGamqmYpzbByv3
         2gQKTZOkmlY+ggwkAK8NgP1ABlFJr0YQBydFRZM3wsTJkvr69L6nU4V0uStTM150kch8
         qSTnPfOCm9z3uSlSSsfldUypkicWjPeZM4ivZ9uE1MrdIN96bABNIsE09/ynImNtxtYW
         a9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vm+8K78/vDISuVFEQprDbnRBNIJoznUwb75pujPY7SE=;
        b=fPP+sxUI/vj+Z0y0vKd4pcBUxhUNsy3wVM5bVHBiq8q4NM+hUZMrTkEHjirhX0c4ZY
         C3YC2+dE8PwYWKD9vUKZH8L9QPoMAkSWjHhf1XHguoPAU34puzt9cpVqCPGyBzA0nwct
         BBkd8B40p3bTk/89QqD+k32VYbjodVXFIfUJdmXzeKFFaPQsx/yAuE8EK4iSlFLEN0Mc
         fGx70rEI5tVGgRf8YDTeujZ8pXgcFP2tfXTahETxGaJkmJE43Qkx5P0UP0KhjTqh/rOU
         ncPmdAVept2Dc05tp2ClcDvBgYflC6excc2f4q5Vk26zwiktI/yEsDJelRht3KCyJzFU
         Y1lQ==
X-Gm-Message-State: AOAM533xcjE5etsIaoaiNpI/Q3rCaVoo+Bt/spw/iJI7WkPpu1JNWI/B
        R9lZs01oHIqhnhlHPlQI2fDOmw==
X-Google-Smtp-Source: ABdhPJwU4CQdbaCmrPnR1+S9jzQCYG+PW9zZykgA9jrS3TwvdmqOQYb35rNn/UX+U7oys6m6t8oRVQ==
X-Received: by 2002:a63:c207:: with SMTP id b7mr338232pgd.184.1612305751722;
        Tue, 02 Feb 2021 14:42:31 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id q141sm48250pfc.24.2021.02.02.14.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 14:42:31 -0800 (PST)
Date:   Tue, 2 Feb 2021 15:42:29 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 00/17] remoteproc: Add support for detaching a rproc
Message-ID: <20210202224229.GA1541378@xps15>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
 <64b559dc-9e89-c351-ddee-f9cebd155ed7@st.com>
 <20210202004956.GD1319650@xps15>
 <200a464a-f6dd-480c-d7cd-d8165828fabc@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200a464a-f6dd-480c-d7cd-d8165828fabc@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Feb 02, 2021 at 09:54:13AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 2/2/21 1:49 AM, Mathieu Poirier wrote:
> > On Wed, Jan 27, 2021 at 10:21:24AM +0100, Arnaud POULIQUEN wrote:
> >> Hi Mathieu
> >>
> >> On 12/18/20 6:32 PM, Mathieu Poirier wrote:
> >>> Following the work done here [1], this set provides support for the
> >>> remoteproc core to release resources associated with a remote processor
> >>> without having to switch it off. That way a platform driver can be removed
> >>> or the application processor power cycled while the remote processor is
> >>> still operating.
> >>>
> >>> Of special interest in this series are patches 5 and 6 where getting the
> >>> address of the resource table installed by an eternal entity if moved to
> >>> the core.  This is to support scenarios where a remote process has been
> >>> booted by the core but is being detached.  To re-attach the remote
> >>> processor, the address of the resource table needs to be known at a later
> >>> time than the platform driver's probe() function.
> >>>
> >>> Applies cleanly on v5.10
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>> [1]. https://lkml.org/lkml/2020/7/14/1600
> >>>
> >>> ----
> >>> New for v4:
> >>> - Made binding description OS agnostic (Rob)
> >>> - Added functionality to set the external resource table in the core
> >>> - Fixed a crash when detaching (Arnaud)
> >>> - Fixed error code propagation in rproc_cdev_relase() and rproc_del() (Arnaud)
> >>> - Added RB tags
> >>
> >>
> >> I tested you series, attach and  detach is working well.
> >>
> >> Then I faced issue when tried to re-attach after a detach.
> >>
> > 
> > Right, in this case don't expect the re-attach to work properly because function
> > stm32_rproc_detach() does not exist.  As such the M4 doesn't put itself back
> > in "wait-for-attach" mode as it does when booted by the boot loader.  If I
> > remember correctly we talked about that during an earlier conversation and we
> > agreed FW support would be needed to properly test the re-attach.
> 
> Yes you are right the remote firmware needs to be inform about the detach, and
> this is the purpose of the detach ops.
> But also some actions are missing on local side as some resources have also to
> be reinitialized as described in my previous mail.
> For instance the resource table is handled by the remoteproc framework. The
> remote firmware should only have a read access to this table.
> 
> >  
> >> But I don't know if this feature has to be supported in this step.
> >>
> >> The 2 issues I found are:
> >>
> >> 1) memory carveouts are released on detach so need to be reinitialized.
> >> The use of prepare/unprepare for the attach and detach would solve the issue but
> >> probably need to add parameter to differentiate a start/stop from a attach/detach.

I am in agreement with you assesment and the patch you have proposed to fix it.
Right now carveouts are properly handled between start and stop operations
because their parsing and allocation is done as part for ops:parse_fw(), which
is called for each iteration.  Moving the parsing and allocation to
rproc_prepare_device() ends up doing the same thing.

I am not sure we absolutely need an extra parameter to differentiate between
start/stop and attach/detach.  Typically the rproc_prepare_device() is used to
do some kind of setup like providing power to a memory bank.  I suppose that if
a memory bank is already powered by the boot loader, asking to power it up again
won't do anything.

As such I suggest we keep the parameters as they are now.  We can revisit if a
use case comes up at a later time. 

> >>
> >> 2) The vrings in the loaded resource table (so no cached) has to be properly
> >> reinitialized. In rproc_free_vring  the vring da is set to 0 that is then
> >> considered as a fixed address.
> >>
> >> Here is a fix which works on the stm32 platform
> >>
> >> @@ -425,7 +425,7 @@ void rproc_free_vring(struct rproc_vring *rvring)
> >>  	 */
> >>  	if (rproc->table_ptr) {
> >>  		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
> >> -		rsc->vring[idx].da = 0;
> >> +		rsc->vring[idx].da = FW_RSC_ADDR_ANY;
> >>  		rsc->vring[idx].notifyid = -1;
> >>  	}
> >>  }

I see why this could be needed.  I initially assumed the remote processor would
install a new resource table in memory upon receiving notification the core is
going away.  But upon reflection the remote processor may not even have access
to the image it is running.

Let me think about this further - I want to make sure we don't introduce a
regression for current implementations.

> > 
> > In light of the above let me know if these two issues are still relevant.  If
> > so I'll investigate further.
> 
> To highlight the issue just test attach/detach/attch  with a firmware that
> implements a RPMsg communication. On the second attach the virtio framework is
> not properly restarted.
> 
> Then please find at the end of the mail 3 patches for test I added on top of
> your series,that allow me to reattach. Of course the RPMsg channels are not
> re-created as i don't implement the remote FW part, but the Linux virtio and
> RPmsg frameworks are restarted.
> 
> - [PATCH 1/3] remoteproc: stm32: add capability to detach from the remoteproc
>   => Add a dummy function in stm32_rproc for test.
> - [PATCH 2/3] remoteproc: Add prepare/unprepare for attach detach
>   => Add prepare/unprepare on attach/detach + implement attach in stm32mp1 to
>      reinitialize the memory region that as been cleaned on detach.
> - [PATCH 3/3] remoteproc: virtio: set to vring address to FW_RSC_ADDR_ANY on free
>   => Reinitialize the vring addresses on detach. For this one a better
>      implementation would be to use a cached resource table to fully
>      reinitialize it on re-attach.
> 
> Thanks,
> Arnaud
> 
> > 
> > Thanks,
> > Mathieu
> > 
> >>
> >> Here, perhaps a better alternative would be to make a cached copy on attach
> >> before updating it. On the next attach, the cached copy would be copied as it is
> >> done in rproc_start.
> >>
> >> Thanks,
> >> Arnaud
> >>
> >>
> >>>
> >>> Mathieu Poirier (17):
> >>>   dt-bindings: remoteproc: Add bindind to support autonomous processors
> >>>   remoteproc: Re-check state in rproc_shutdown()
> >>>   remoteproc: Remove useless check in rproc_del()
> >>>   remoteproc: Rename function rproc_actuate()
> >>>   remoteproc: Add new get_loaded_rsc_table() remoteproc operation
> >>>   remoteproc: stm32: Move resource table setup to rproc_ops
> >>>   remoteproc: Add new RPROC_ATTACHED state
> >>>   remoteproc: Properly represent the attached state
> >>>   remoteproc: Properly deal with a kernel panic when attached
> >>>   remoteproc: Add new detach() remoteproc operation
> >>>   remoteproc: Introduce function __rproc_detach()
> >>>   remoteproc: Introduce function rproc_detach()
> >>>   remoteproc: Add return value to function rproc_shutdown()
> >>>   remoteproc: Properly deal with a stop request when attached
> >>>   remoteproc: Properly deal with a start request when attached
> >>>   remoteproc: Properly deal with detach request
> >>>   remoteproc: Refactor rproc delete and cdev release path
> >>>
> >>>  .../bindings/remoteproc/remoteproc-core.yaml  |  27 +++
> >>>  drivers/remoteproc/remoteproc_cdev.c          |  32 ++-
> >>>  drivers/remoteproc/remoteproc_core.c          | 211 +++++++++++++++---
> >>>  drivers/remoteproc/remoteproc_internal.h      |   8 +
> >>>  drivers/remoteproc/remoteproc_sysfs.c         |  20 +-
> >>>  drivers/remoteproc/stm32_rproc.c              | 147 ++++++------
> >>>  include/linux/remoteproc.h                    |  24 +-
> >>>  7 files changed, 344 insertions(+), 125 deletions(-)
> >>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
> >>>
> 
> Subject: [PATCH 1/3] remoteproc: stm32: add capability to detach from the
>  remoteproc
> 
> Add a dummy function to allow to detach. No specific action is needed
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 2c949725b91e..b325d28f627c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -590,6 +590,12 @@ static int stm32_rproc_attach(struct rproc *rproc)
>  	return reset_control_assert(ddata->hold_boot);
>  }
> 
> +static int stm32_rproc_detach(struct rproc *rproc)
> +{
> +	/* Nothing to do but ops mandatory to support the detach feature */
> +	return 0;
> +}
> +
>  static int stm32_rproc_stop(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
> @@ -712,6 +718,7 @@ static struct rproc_ops st_rproc_ops = {
>  	.start		= stm32_rproc_start,
>  	.stop		= stm32_rproc_stop,
>  	.attach		= stm32_rproc_attach,
> +	.detach		= stm32_rproc_detach,
>  	.kick		= stm32_rproc_kick,
>  	.load		= rproc_elf_load_segments,
>  	.parse_fw	= stm32_rproc_parse_fw,
> -- 
> 2.17.1
> 
> 
> ------------------------------------------------------------------------
> 
> 
> Subject: [PATCH 2/3] remoteproc: Add prepare/unprepare for attach detach
> 
> Some actions such as memory resources reallocation are needed when try
> to reattach. Use the prepare ops for these actions.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 14 ++++++++++++++
>  drivers/remoteproc/stm32_rproc.c     | 14 +++++++-------
>  2 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index f1f51ad1a1d6..f177561b8863 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1557,6 +1557,13 @@ static int rproc_attach(struct rproc *rproc)
>  		return ret;
>  	}
> 
> +	/* Prepare rproc for firmware loading if needed */
> +	ret = rproc_prepare_device(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't prepare rproc %s: %d\n", rproc->name, ret);
> +		goto disable_iommu;
> +	}
> +
>  	ret = rproc_get_loaded_rsc_table(rproc);
>  	if (ret) {
>  		dev_err(dev, "can't load resource table: %d\n", ret);
> @@ -1990,6 +1997,13 @@ int rproc_detach(struct rproc *rproc)
>  	/* clean up all acquired resources */
>  	rproc_resource_cleanup(rproc);
> 
> +	/* Release HW resources if needed */
> +	ret = rproc_unprepare_device(rproc);
> +	if (ret) {
> +		atomic_inc(&rproc->power);
> +		goto out;
> +	}
> +
>  	rproc_disable_iommu(rproc);
> 
>  	/*
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index b325d28f627c..bf50d79b1f09 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -413,9 +413,6 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const
> struct firmware *fw)
>  	struct stm32_rproc *ddata = rproc->priv;
>  	int ret;
> 
> -	ret  = stm32_rproc_parse_memory_regions(rproc);
> -	if (ret)
> -		return ret;
> 
>  	if (ddata->trproc)
>  		ret = rproc_tee_get_rsc_table(ddata->trproc);
> @@ -580,6 +577,12 @@ static int stm32_rproc_start(struct rproc *rproc)
> 
>  	return reset_control_assert(ddata->hold_boot);
>  }
> +static int stm32_rproc_prepare(struct rproc *rproc)
> +{
> +	dev_err(&rproc->dev, "%s: %d\n", __func__, __LINE__);
> +
> +	return stm32_rproc_parse_memory_regions(rproc);
> +}
> 
>  static int stm32_rproc_attach(struct rproc *rproc)
>  {
> @@ -717,6 +720,7 @@ static int stm32_rproc_get_loaded_rsc_table(struct rproc *rproc)
>  static struct rproc_ops st_rproc_ops = {
>  	.start		= stm32_rproc_start,
>  	.stop		= stm32_rproc_stop,
> +	.prepare	= stm32_rproc_prepare,
>  	.attach		= stm32_rproc_attach,
>  	.detach		= stm32_rproc_detach,
>  	.kick		= stm32_rproc_kick,
> @@ -921,10 +925,6 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> 
>  	if (state == M4_STATE_CRUN) {
>  		rproc->state = RPROC_DETACHED;
> -
> -		ret = stm32_rproc_parse_memory_regions(rproc);
> -		if (ret)
> -			goto free_resources;
>  	}
> 
>  	rproc->has_iommu = false;
> -- 
> 2.17.1
> 
> 
> ------------------------------------------------------------------------
> 
> Subject: [PATCH 3/3] remoteproc: virtio: set to vring address to
>  FW_RSC_ADDR_ANY on free
> 
> The resource table vring structure is cleaned on free. But value is set
> to 0. This value is considered as a valid address. Set the value
> to  FW_RSC_ADDR_ANY instead.
> This is needed to allow to reattach to an autonomous firmware.
> An alternative would be to save the resource table before updating it.
> On free the value would be reset to initial value.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index f177561b8863..5b5de4db3981 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -425,7 +425,7 @@ void rproc_free_vring(struct rproc_vring *rvring)
>  	 */
>  	if (rproc->table_ptr) {
>  		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
> -		rsc->vring[idx].da = 0;
> +		rsc->vring[idx].da = FW_RSC_ADDR_ANY;
>  		rsc->vring[idx].notifyid = -1;
>  	}
>  }
> -- 
> 2.17.1
> 
> 
> 
> 
> 
> 
