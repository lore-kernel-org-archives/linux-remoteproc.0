Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F05C4361B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 21:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33A3622B4B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 21:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388188AbgLIVSw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Dec 2020 16:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387842AbgLIVSw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Dec 2020 16:18:52 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39DEC061793
        for <linux-remoteproc@vger.kernel.org>; Wed,  9 Dec 2020 13:18:11 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 11so1961083pfu.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Dec 2020 13:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w/DYax7thFnuwm2FQ5QUjbL4cH5hF8rW9xsPTe7EeuI=;
        b=chTQi2gTSyTpjwnqFlxgpp6TGvcWmisae66yaqpOfmqP5BhPneH4UNeu73s7zC76J0
         kQ0PROsVMFM+6Ef6QqC05LrnNjgRrqdx8Wj0eOXcwqj/QxtsBCa00ta8p7OLS5taaPMQ
         R50UNp92SoaeWwYNGcDc2Yan+b5sJ6852NEKD1flLrK0qd5FqOiRJdvdpygtx3I3aKjz
         KUbOfOv5c17m89EvsYkQo0/lOCZfB+7M1+Si4AMgx3EvomEAoB3vTaIq2qOn5uQBXelz
         p5+Kw33Mk1B+OSj1Y2E9IHxMoAh6G5foAfuRFMBCUVcGDIC55gBylZ2Ec1NwOw5LpA5h
         GxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w/DYax7thFnuwm2FQ5QUjbL4cH5hF8rW9xsPTe7EeuI=;
        b=hjMO0CJy8SQYHRgsXU37PUwW3zuQP7k+drLwvvCqfyhzEIfkgwOddzRrW5dqAo5Zsf
         aE+JRQzPWrFKGHzQh4PZdWq2DaxuvJ1XDy/0whmUe4fpRcG9tFqmEV2togIKEcDVH4kQ
         +WAgqUxk5sgzsjIoQcooADUFZyoD8yTC1V7QzEyS5zGJf14qYQCIktiJSjth9w8RtQ0D
         czQb+xpmkZrFcrjYuy4Gz3e420C4X/heqbZh/H1B3/kUh+Sq3MV0AONy1onTO+hQFP6o
         PaEZE3wwCupWTiad/nflb9MU1D9SWqVB4PTZ5I6WKaa/jw50zqc3m5HhUtzy36jnW5aJ
         U+uw==
X-Gm-Message-State: AOAM533B+j0TiPW107Fm6CPJaDsvatohpN2xVTW+4VfrI8AVjOO6YruE
        nuKmuJhY33guwL7DAJ62l/h8mA==
X-Google-Smtp-Source: ABdhPJxEmArGBR2jk+kwM3ndMfrjBTEDFLYLc5UMaLVZvZ+euDzrQXu/i73LgNyKsS0pGTA4zvO6Sw==
X-Received: by 2002:a63:1a13:: with SMTP id a19mr3651086pga.146.1607548691344;
        Wed, 09 Dec 2020 13:18:11 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e4sm3607376pfh.206.2020.12.09.13.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 13:18:10 -0800 (PST)
Date:   Wed, 9 Dec 2020 14:18:08 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/15] remoteproc: Introduce function rproc_detach()
Message-ID: <20201209211808.GA1814981@xps15>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-10-mathieu.poirier@linaro.org>
 <0e705760-b69a-d872-9770-c03dde85ab1c@st.com>
 <20201209005311.GB1601690@xps15>
 <cb959e29-65eb-ae89-0c53-cdbc4c7bc77a@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb959e29-65eb-ae89-0c53-cdbc4c7bc77a@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Dec 09, 2020 at 09:45:32AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 12/9/20 1:53 AM, Mathieu Poirier wrote:
> > On Tue, Dec 08, 2020 at 07:35:18PM +0100, Arnaud POULIQUEN wrote:
> >> Hi Mathieu,
> >>
> >>
> >> On 11/26/20 10:06 PM, Mathieu Poirier wrote:
> >>> Introduce function rproc_detach() to enable the remoteproc
> >>> core to release the resources associated with a remote processor
> >>> without stopping its operation.
> >>>
> >>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >>> ---
> >>>  drivers/remoteproc/remoteproc_core.c | 65 +++++++++++++++++++++++++++-
> >>>  include/linux/remoteproc.h           |  1 +
> >>>  2 files changed, 65 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>> index 928b3f975798..f5adf05762e9 100644
> >>> --- a/drivers/remoteproc/remoteproc_core.c
> >>> +++ b/drivers/remoteproc/remoteproc_core.c
> >>> @@ -1667,7 +1667,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >>>  /*
> >>>   * __rproc_detach(): Does the opposite of rproc_attach()
> >>>   */
> >>> -static int __maybe_unused __rproc_detach(struct rproc *rproc)
> >>> +static int __rproc_detach(struct rproc *rproc)
> >>>  {
> >>>  	struct device *dev = &rproc->dev;
> >>>  	int ret;
> >>> @@ -1910,6 +1910,69 @@ void rproc_shutdown(struct rproc *rproc)
> >>>  }
> >>>  EXPORT_SYMBOL(rproc_shutdown);
> >>>  
> >>> +/**
> >>> + * rproc_detach() - Detach the remote processor from the
> >>> + * remoteproc core
> >>> + *
> >>> + * @rproc: the remote processor
> >>> + *
> >>> + * Detach a remote processor (previously attached to with rproc_actuate()).
> >>> + *
> >>> + * In case @rproc is still being used by an additional user(s), then
> >>> + * this function will just decrement the power refcount and exit,
> >>> + * without disconnecting the device.
> >>> + *
> >>> + * Function rproc_detach() calls __rproc_detach() in order to let a remote
> >>> + * processor know that services provided by the application processor are
> >>> + * no longer available.  From there it should be possible to remove the
> >>> + * platform driver and even power cycle the application processor (if the HW
> >>> + * supports it) without needing to switch off the remote processor.
> >>> + */
> >>> +int rproc_detach(struct rproc *rproc)
> >>> +{
> >>> +	struct device *dev = &rproc->dev;
> >>> +	int ret;
> >>> +
> >>> +	ret = mutex_lock_interruptible(&rproc->lock);
> >>> +	if (ret) {
> >>> +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> >>> +		return ret;
> >>> +	}
> >>> +
> >>> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
> >>> +		ret = -EPERM;
> >>> +		goto out;
> >>> +	}
> >>> +
> >>> +	/* if the remote proc is still needed, bail out */
> >>> +	if (!atomic_dec_and_test(&rproc->power)) {
> >>> +		ret = -EBUSY;
> >>> +		goto out;
> >>> +	}
> >>> +
> >>> +	ret = __rproc_detach(rproc);
> >>> +	if (ret) {
> >>> +		atomic_inc(&rproc->power);
> >>> +		goto out;
> >>> +	}
> >>> +
> >>> +	/* clean up all acquired resources */
> >>> +	rproc_resource_cleanup(rproc);
> >>
> >> I started to test the series, I found 2 problems testing in STM32P1 board.
> >>
> >> 1) the resource_table pointer is unmapped if the firmware has been booted by the
> >> Linux, generating a crash in rproc_free_vring.
> >> I attached a fix at the end of the mail.
> >>
> > 
> > I have reproduced the condition on my side and confirm that your solution is
> > correct.  See below for a minor comment. 
> > 
> >> 2) After the detach, the rproc state is "detached"
> >> but it is no longer possible to re-attach to it correctly.
> >> Neither if the firmware is standalone, nor if it has been booted
> >> by the Linux.
> >>
> > 
> > Did you update your FW image?  If so, I need to run the same one.
> > 
> >> I did not investigate, but the issue is probably linked to the resource
> >> table address which is set to NULL.
> >>
> >> So we either have to fix the problem in order to attach or forbid the transition.
> >>
> >>
> >> Regards,
> >> Arnaud
> >>
> >>> +
> >>> +	rproc_disable_iommu(rproc);
> >>> +
> >>> +	/*
> >>> +	 * Set the remote processor's table pointer to NULL.  Since mapping
> >>> +	 * of the resource table to a virtual address is done in the platform
> >>> +	 * driver, unmapping should also be done there.
> >>> +	 */
> >>> +	rproc->table_ptr = NULL;
> >>> +out:
> >>> +	mutex_unlock(&rproc->lock);
> >>> +	return ret;
> >>> +}
> >>> +EXPORT_SYMBOL(rproc_detach);
> >>> +
> >>>  /**
> >>>   * rproc_get_by_phandle() - find a remote processor by phandle
> >>>   * @phandle: phandle to the rproc
> >>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >>> index da15b77583d3..329c1c071dcf 100644
> >>> --- a/include/linux/remoteproc.h
> >>> +++ b/include/linux/remoteproc.h
> >>> @@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
> >>>  
> >>>  int rproc_boot(struct rproc *rproc);
> >>>  void rproc_shutdown(struct rproc *rproc);
> >>> +int rproc_detach(struct rproc *rproc);
> >>>  int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
> >>>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
> >>>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
> >>>
> >>
> >> From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> >> Date: Tue, 8 Dec 2020 18:54:51 +0100
> >> Subject: [PATCH] remoteproc: core: fix detach for unmapped table_ptr
> >>
> >> If the firmware has been loaded and started by the kernel, the
> >> resource table has probably been mapped by the carveout allocation
> >> (see rproc_elf_find_loaded_rsc_table).
> >> In this case the memory can have been unmapped before the vrings are free.
> >> The result is a crash that occurs in rproc_free_vring while try to use the
> >> unmapped pointer.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 17 ++++++++++++++---
> >>  1 file changed, 14 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c
> >> b/drivers/remoteproc/remoteproc_core.c
> >> index 2b0a52fb3398..3508ffba4a2a 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1964,6 +1964,13 @@ int rproc_detach(struct rproc *rproc)
> >>  		goto out;
> >>  	}
> >>
> >> +	/*
> >> +	 * Prevent case that the installed resource table is no longer
> >> +	 * accessible (e.g. memory unmapped), use the cache if available
> >> +	 */
> >> +	if (rproc->cached_table)
> >> +		rproc->table_ptr = rproc->cached_table;
> > 
> > I don't think there is an explicit need to check ->cached_table.  If the remote
> > processor has been started by the remoteproc core it is valid anyway.  And below
> > kfree() is called invariably. 
> 
> The condition is needed, the  rproc->cached_table is null if the firmware as
> been preloaded and the Linux remote proc just attaches to it.
> The cached is used only when Linux loads the firmware, as the resource table is
> extracted from the elf file to parse resource before the load of the firmware.

I have taken another look at this and you are correct. The if() condition is
needed because ->table_ptr is set only once when the platform driver is
probed.  See further down...

> 
> > 
> > So that problem is fixed.  Let me know about your FW image and we'll pick it up
> > from there.
> 
> I use the following example available on the stm32mp1 image:
> /usr/local/Cube-M4-examples/STM32MP157C-DK2/Applications/OpenAMP/OpenAMP_TTY_echo_wakeup/lib/firmware/
> This exemple use the RPMsg and also blink a LED when while running.
> 
> Don't hesitate if you need me to send it to you by mail.
> 
> Thank,
> Arnaud
> 
> > 
> > Mathieu
> > 
> >> +
> >>  	ret = __rproc_detach(rproc);
> >>  	if (ret) {
> >>  		atomic_inc(&rproc->power);
> >> @@ -1975,10 +1982,14 @@ int rproc_detach(struct rproc *rproc)
> >>
> >>  	rproc_disable_iommu(rproc);
> >>
> >> +	/* Free the chached table memory that can has been allocated*/
> >> +	kfree(rproc->cached_table);
> >> +	rproc->cached_table = NULL;
> >>  	/*
> >> -	 * Set the remote processor's table pointer to NULL.  Since mapping
> >> -	 * of the resource table to a virtual address is done in the platform
> >> -	 * driver, unmapping should also be done there.
> >> +	 * Set the remote processor's table pointer to NULL. If mapping
> >> +	 * of the resource table to a virtual address has been done in the
> >> +	 * platform driver(attachment to an existing firmware),
> >> +	 * unmapping should also be done there.
> >>  	 */
> >>  	rproc->table_ptr = NULL;

With the above in mind we can't to that, otherwise trying to re-attach with
rproc_attach() won't work because ->table_ptr will be NULL.

I wasn't able to test that code path because I didn't have the FW that supported
detaching.  Now that the feature is maturing it needs to be done.  

> >>  out:
> >> -- 
> >> 2.17.1
> >>
> >>
> >>
