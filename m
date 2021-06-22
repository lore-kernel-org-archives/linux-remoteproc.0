Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46417C48BDF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 22:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20D4A61107
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 22:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFVWxZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Jun 2021 18:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbhFVWxV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Jun 2021 18:53:21 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34807C061756
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Jun 2021 15:51:04 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id a2so46124pgi.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Jun 2021 15:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0J7l5RWPumjl0py8WuJVl5Fl4Zn56IIpT1hLlsX/MME=;
        b=MrlMAx+UDVOGyRsbPfY6cdr0/UVSVSRzHL7xzTGnaaEOKSnqcxaerKPTYfRnVTK9Ku
         aNNSm+eyJPuomGdq6exKfMtkm2k5TcahITPQ14+6KbC+5P27IbE2KBwQgrZyjx5Ad3ag
         ybPtCK0NYyUEv1QRj3A7SemeievLaX0TxSb2hioep1TpFO0tXnajLsKrk5w0kP9FUpv0
         u/MiI0TIiVjHBUh9kIUe8czTfaLLpWwqNC/6ekP3KMvvkMJpZ9ZeCHIVcKpeMGDUmsQr
         V/EqllWyhw4NNy1Z8X8c+2gIw0Qo7sUYWemFP2mTDcO+7D3R4mpMBnP0kjn1p6QkZaVa
         hnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0J7l5RWPumjl0py8WuJVl5Fl4Zn56IIpT1hLlsX/MME=;
        b=Opr1K7wwFHGwUgmVFulGYToZM1HusPMmtIME0Opqn+g6svq0tAsHLO5D0vJOmnYfho
         TaIPQ9uVLeXMpgwommF0qOAwder5HUGbNml9nHgVbZBrsmIKMCeLZVYJY4VEZfSIXRK7
         p+/4ap41pa1sc+BY76Ul25CVkL5E66y24IvoxRVnE6sFoZM8Koz2GdmgLNoEJBF/eHTv
         Jp0wfU7sjpq385oYlWj7hqngDp2J7YqFIsloIruF2NptylamucKvXHn/WPkYd+RmjceC
         gprvOiaBWjmZS41tuenk0gro1owfMtLGt/5JlIXmF5lAVh2FNoWor9NX7PIqe/jDi5HW
         pajA==
X-Gm-Message-State: AOAM531csg++FuwsHvcUP11lY4e8Vv17bxx52p4M3Y1tyVXGLhn/pFA0
        uhjYlNTwOJVqWhbfYN83FckAwg==
X-Google-Smtp-Source: ABdhPJySHcjFRYp+PKGE1YvHvgZvo+yAO/J1fSLAMq0d1LoASCmVgiRWP5VVCPfrmrHlSvpTrQcPxw==
X-Received: by 2002:a62:34c7:0:b029:28e:addf:f17a with SMTP id b190-20020a6234c70000b029028eaddff17amr5915189pfa.62.1624402263469;
        Tue, 22 Jun 2021 15:51:03 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id o189sm13294313pga.78.2021.06.22.15.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 15:51:02 -0700 (PDT)
Date:   Tue, 22 Jun 2021 16:51:00 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] remoteproc: k3-dsp: Add support for IPC-only mode
 for all K3 DSPs
Message-ID: <20210622225100.GA1011140@p14s>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-7-s-anna@ti.com>
 <20210602160715.GB1797307@xps15>
 <5ef182f0-cb68-2872-dde2-0ef7b152c92b@ti.com>
 <20210607163344.GA292026@p14s>
 <6c2c4fdb-e4c5-05aa-10aa-0dd57cb26921@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c2c4fdb-e4c5-05aa-10aa-0dd57cb26921@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day Suman,

On Wed, Jun 16, 2021 at 10:00:42AM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 6/7/21 11:33 AM, Mathieu Poirier wrote:
> > On Thu, Jun 03, 2021 at 09:57:06AM -0500, Suman Anna wrote:
> >> Hi Mathieu,
> >>
> >> On 6/2/21 11:07 AM, Mathieu Poirier wrote:
> >>> On Fri, May 21, 2021 at 07:03:09PM -0500, Suman Anna wrote:
> >>>> Add support to the K3 DSP remoteproc driver to configure all the C66x
> >>>> and C71x cores on J721E SoCs to be either in IPC-only mode or the
> >>>> traditional remoteproc mode. The IPC-only mode expects that the remote
> >>>> processors are already booted by the bootloader, and only perform the
> >>>> minimum steps required to initialize and deinitialize the virtio IPC
> >>>> transports. The remoteproc mode allows the kernel remoteproc driver to
> >>>> do the regular load and boot and other device management operations for
> >>>> a DSP.
> >>>>
> >>>> The IPC-only mode for a DSP is detected and configured at driver probe
> >>>> time by querying the System Firmware for the DSP power and reset state
> >>>> and/or status and making sure that the DSP is indeed started by the
> >>>> bootloaders, otherwise the device is configured for remoteproc mode.
> >>>>
> >>>> Support for IPC-only mode is achieved through .attach(), .detach() and
> >>>> .get_loaded_rsc_table() callback ops and various other flags in both
> >>>> remoteproc core and the K3 DSP remoteproc driver. The resource table
> >>>> follows a design-by-contract approach and is expected to be at the base
> >>>> of the DDR firmware region reserved for each remoteproc, it is mostly
> >>>> expected to contain only the virtio device and trace resource entries.
> >>>>
> >>>> NOTE:
> >>>> The driver cannot configure a DSP core for remoteproc mode by any
> >>>> means without rebooting the kernel if that R5F core has been started
> >>>> by a bootloader.
> >>>>
> >>>> Signed-off-by: Suman Anna <s-anna@ti.com>
> >>>> ---
> >>>>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 151 ++++++++++++++++++++--
> >>>>  1 file changed, 138 insertions(+), 13 deletions(-)
> >>>>
> >>>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> >>>> index faf60a274e8d..b154a52f1fa6 100644
> >>>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> >>>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> >>>> @@ -76,6 +76,7 @@ struct k3_dsp_dev_data {
> >>>>   * @ti_sci_id: TI-SCI device identifier
> >>>>   * @mbox: mailbox channel handle
> >>>>   * @client: mailbox client to request the mailbox channel
> >>>> + * @ipc_only: flag to indicate IPC-only mode
> >>>>   */
> >>>>  struct k3_dsp_rproc {
> >>>>  	struct device *dev;
> >>>> @@ -91,6 +92,7 @@ struct k3_dsp_rproc {
> >>>>  	u32 ti_sci_id;
> >>>>  	struct mbox_chan *mbox;
> >>>>  	struct mbox_client client;
> >>>> +	bool ipc_only;
> >>>>  };
> >>>>  
> >>>>  /**
> >>>> @@ -268,6 +270,10 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
> >>>>  	struct device *dev = kproc->dev;
> >>>>  	int ret;
> >>>>  
> >>>> +	/* IPC-only mode does not require the core to be released from reset */
> >>>> +	if (kproc->ipc_only)
> >>>> +		return 0;
> >>>> +
> >>>>  	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
> >>>>  						    kproc->ti_sci_id);
> >>>>  	if (ret)
> >>>> @@ -292,6 +298,10 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
> >>>>  	struct device *dev = kproc->dev;
> >>>>  	int ret;
> >>>>  
> >>>> +	/* do not put back the cores into reset in IPC-only mode */
> >>>> +	if (kproc->ipc_only)
> >>>> +		return 0;
> >>>> +
> >>>>  	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> >>>>  						    kproc->ti_sci_id);
> >>>>  	if (ret)
> >>>> @@ -314,6 +324,12 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
> >>>>  	u32 boot_addr;
> >>>>  	int ret;
> >>>>  
> >>>> +	if (kproc->ipc_only) {
> >>>> +		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
> >>>> +			__func__);
> >>>> +		return -EINVAL;
> >>>> +	}
> >>>> +
> >>>>  	ret = k3_dsp_rproc_request_mbox(rproc);
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>> @@ -351,6 +367,13 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
> >>>>  static int k3_dsp_rproc_stop(struct rproc *rproc)
> >>>>  {
> >>>>  	struct k3_dsp_rproc *kproc = rproc->priv;
> >>>> +	struct device *dev = kproc->dev;
> >>>> +
> >>>> +	if (kproc->ipc_only) {
> >>>> +		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
> >>>> +			__func__);
> >>>> +		return -EINVAL;
> >>>> +	}
> >>>>  
> >>>>  	mbox_free_channel(kproc->mbox);
> >>>>  
> >>>> @@ -359,6 +382,85 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> +/*
> >>>> + * Attach to a running DSP remote processor (IPC-only mode)
> >>>> + *
> >>>> + * This rproc attach callback only needs to request the mailbox, the remote
> >>>> + * processor is already booted, so there is no need to issue any TI-SCI
> >>>> + * commands to boot the DSP core.
> >>>> + */
> >>>> +static int k3_dsp_rproc_attach(struct rproc *rproc)
> >>>> +{
> >>>> +	struct k3_dsp_rproc *kproc = rproc->priv;
> >>>> +	struct device *dev = kproc->dev;
> >>>> +	int ret;
> >>>> +
> >>>> +	if (!kproc->ipc_only || rproc->state != RPROC_DETACHED) {
> >>>> +		dev_err(dev, "DSP is expected to be in IPC-only mode and RPROC_DETACHED state\n");
> >>>> +		return -EINVAL;
> >>>> +	}
> >>>> +
> >>>> +	ret = k3_dsp_rproc_request_mbox(rproc);
> >>>> +	if (ret)
> >>>> +		return ret;
> >>>> +
> >>>> +	dev_err(dev, "DSP initialized in IPC-only mode\n");
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +/*
> >>>> + * Detach from a running DSP remote processor (IPC-only mode)
> >>>> + *
> >>>> + * This rproc detach callback performs the opposite operation to attach callback
> >>>> + * and only needs to release the mailbox, the DSP core is not stopped and will
> >>>> + * be left to continue to run its booted firmware.
> >>>> + */
> >>>> +static int k3_dsp_rproc_detach(struct rproc *rproc)
> >>>> +{
> >>>> +	struct k3_dsp_rproc *kproc = rproc->priv;
> >>>> +	struct device *dev = kproc->dev;
> >>>> +
> >>>> +	if (!kproc->ipc_only || rproc->state != RPROC_ATTACHED) {
> >>>> +		dev_err(dev, "DSP is expected to be in IPC-only mode and RPROC_ATTACHED state\n");
> >>>> +		return -EINVAL;
> >>>> +	}
> >>>> +
> >>>> +	mbox_free_channel(kproc->mbox);
> >>>> +	dev_err(dev, "DSP deinitialized in IPC-only mode\n");
> >>>> +	return 0;
> >>>> +}
> >>>
> >>> Same comment as patch 4/6 regarding k3_dsp_rproc::ipc_only and setting the right
> >>> rproc_ops based on the scenario.
> >>
> >> OK, I will make the switch since both you and Bjorn prefer it this way. And we
> >> can revisit later when we want to scale it to support proper shutdown as well.
> >> FWIW, I have given my reasons for doing it the current way in a previous
> >> response to Bjorn for similar comments.
> >>
> >> Note that I won't be able to define a separate ops structure but rather
> >> overwrite the ops upon detection of IPC-only mode, since I won't be able to
> >> detect the mode until I parse the dt and query our central system processor. The
> >> dt parsing is all done post rproc_alloc, and I need to supply a rproc_ops first.
> > 
> > As far as I can tell for both R5 and DSP, rproc_alloc() could be done after the
> > system processor is probed.  What am I missing?
> 
> The detection requires parsing the various ti,sci properties, and all the R5F OF
> properties are parsed and directly stored in the driver-specific remoteproc
> private structure that is allocated as part of rproc_alloc(). Moving the
> rproc_alloc() for later just for the sake of supplying different ops just makes
> the whole probe function cumbersome. We already do dynamic plugging of ops
> between C66x and C71x DSPs in the ti_k3_dsp_remoteproc driver, so simplest would
> be to follow the same approach here.
>

The real reason has nothing to do with parsing of the DT but where and how the
rproc->priv is used.  And that part I agree with you - it would take a serious
refactoring exercise to change all this and it is not worth it.  So yes, please
proceed the same way you did for the prepare/unprepare functions of C66x and
C71x.  For the latter it would be nice to fixup all the rproc_ops in one place.

> >>
> >> Btw, any comments on patch 1 which is just a cleanup patch.
> > 
> > That patch perplexed me.  If ops->detach() is not implemented and the detach
> > process is allowed to carry on, how does the remote processor know the
> > remoteproc core is no longer available? 
> 
> See my response to Bjorn's comments on Patch 1. I am merely adding the wrapper
> similar to rproc_attach_device(). If the point is that we are using the wrong
> default return value, then I can fix that up and we ought to fix the same in
> rproc_attach_device() as well.

At this time __rproc_detach() will prevent the wrapper code from being executed,
and that is why I did not introduce a rproc_detach_device() to balance
rproc_attach_device().  An automated tool will recognised the condition and a
patch will be in my Inbox with a week.

For the i.MX folks not being able to detach from a remote process is a valid
use case. 

And if rproc->ops->detach() does exist then we'll check the pointer twice.

Thanks,
Mathieu

> 
> regards
> Suman
> 
> 
> > 
> >>
> >> regards
> >> Suman
> >>
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>> +
> >>>> +/*
> >>>> + * This function implements the .get_loaded_rsc_table() callback and is used
> >>>> + * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
> >>>> + * firmwares follow a design-by-contract approach and are expected to have the
> >>>> + * resource table at the base of the DDR region reserved for firmware usage.
> >>>> + * This provides flexibility for the remote processor to be booted by different
> >>>> + * bootloaders that may or may not have the ability to publish the resource table
> >>>> + * address and size through a DT property.
> >>>> + */
> >>>> +static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
> >>>> +							  size_t *rsc_table_sz)
> >>>> +{
> >>>> +	struct k3_dsp_rproc *kproc = rproc->priv;
> >>>> +	struct device *dev = kproc->dev;
> >>>> +
> >>>> +	if (!kproc->rmem[0].cpu_addr) {
> >>>> +		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
> >>>> +		return ERR_PTR(-ENOMEM);
> >>>> +	}
> >>>> +
> >>>> +	/*
> >>>> +	 * NOTE: The resource table size is currently hard-coded to a maximum
> >>>> +	 * of 256 bytes. The most common resource table usage for K3 firmwares
> >>>> +	 * is to only have the vdev resource entry and an optional trace entry.
> >>>> +	 * The exact size could be computed based on resource table address, but
> >>>> +	 * the hard-coded value suffices to support the IPC-only mode.
> >>>> +	 */
> >>>> +	*rsc_table_sz = 256;
> >>>> +	return (struct resource_table *)kproc->rmem[0].cpu_addr;
> >>>> +}
> >>>> +
> >>>>  /*
> >>>>   * Custom function to translate a DSP device address (internal RAMs only) to a
> >>>>   * kernel virtual address.  The DSPs can access their RAMs at either an internal
> >>>> @@ -421,8 +523,11 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
> >>>>  static const struct rproc_ops k3_dsp_rproc_ops = {
> >>>>  	.start		= k3_dsp_rproc_start,
> >>>>  	.stop		= k3_dsp_rproc_stop,
> >>>> +	.attach		= k3_dsp_rproc_attach,
> >>>> +	.detach		= k3_dsp_rproc_detach,
> >>>>  	.kick		= k3_dsp_rproc_kick,
> >>>>  	.da_to_va	= k3_dsp_rproc_da_to_va,
> >>>> +	.get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table,
> >>>>  };
> >>>>  
> >>>>  static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
> >>>> @@ -605,6 +710,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
> >>>>  	struct k3_dsp_rproc *kproc;
> >>>>  	struct rproc *rproc;
> >>>>  	const char *fw_name;
> >>>> +	bool r_state = false;
> >>>> +	bool p_state = false;
> >>>>  	int ret = 0;
> >>>>  	int ret1;
> >>>>  
> >>>> @@ -683,19 +790,37 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
> >>>>  		goto release_tsp;
> >>>>  	}
> >>>>  
> >>>> -	/*
> >>>> -	 * ensure the DSP local reset is asserted to ensure the DSP doesn't
> >>>> -	 * execute bogus code in .prepare() when the module reset is released.
> >>>> -	 */
> >>>> -	if (data->uses_lreset) {
> >>>> -		ret = reset_control_status(kproc->reset);
> >>>> -		if (ret < 0) {
> >>>> -			dev_err(dev, "failed to get reset status, status = %d\n",
> >>>> -				ret);
> >>>> -			goto release_mem;
> >>>> -		} else if (ret == 0) {
> >>>> -			dev_warn(dev, "local reset is deasserted for device\n");
> >>>> -			k3_dsp_rproc_reset(kproc);
> >>>> +	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
> >>>> +					       &r_state, &p_state);
> >>>> +	if (ret) {
> >>>> +		dev_err(dev, "failed to get initial state, mode cannot be determined, ret = %d\n",
> >>>> +			ret);
> >>>> +		goto release_mem;
> >>>> +	}
> >>>> +
> >>>> +	/* configure J721E devices for either remoteproc or IPC-only mode */
> >>>> +	if (p_state) {
> >>>> +		dev_err(dev, "configured DSP for IPC-only mode\n");
> >>>> +		rproc->state = RPROC_DETACHED;
> >>>> +		rproc->detach_on_shutdown = true;
> >>>> +		kproc->ipc_only = true;
> >>>> +	} else {
> >>>> +		dev_err(dev, "configured DSP for remoteproc mode\n");
> >>>> +		/*
> >>>> +		 * ensure the DSP local reset is asserted to ensure the DSP
> >>>> +		 * doesn't execute bogus code in .prepare() when the module
> >>>> +		 * reset is released.
> >>>> +		 */
> >>>> +		if (data->uses_lreset) {
> >>>> +			ret = reset_control_status(kproc->reset);
> >>>> +			if (ret < 0) {
> >>>> +				dev_err(dev, "failed to get reset status, status = %d\n",
> >>>> +					ret);
> >>>> +				goto release_mem;
> >>>> +			} else if (ret == 0) {
> >>>> +				dev_warn(dev, "local reset is deasserted for device\n");
> >>>> +				k3_dsp_rproc_reset(kproc);
> >>>> +			}
> >>>>  		}
> >>>>  	}
> >>>>  
> >>>> -- 
> >>>> 2.30.1
> >>>>
> >>
> 
