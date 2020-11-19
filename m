Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA366C63777
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 23:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DC1622227
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 23:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IY6n+kx9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbgKSXkr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 18:40:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbgKSXkq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 18:40:46 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448BFC0613CF
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 15:40:45 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id v12so6036235pfm.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 15:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qJVDSWLakOvCZ6195cEoUTZo4JQcD/tW/9xMRMKLfuo=;
        b=IY6n+kx9FFMbz5+gEQIWXNGFBOME6Y76WMI743Hzn/mptPX62hSANJxAD94FWwoL6B
         XFzr9Lc9PnhruTLs+Ixd3xaz7hGowa/8vSBGnFDNWNpZKJEBu/4TsD5XcHCXwgO6qk+q
         PUygSjbmvY+7q8olG2fkGR/ckBRs1nhw6sItbfC+2VOL3h2EPa6DTc5zxybLHwF8BcLa
         /HYLpK0JomDHaNWNmPU4br3LzbQYrLYf4IT/K9kuQf+58P5BDgzWTLa0bYdzs1ClrrN8
         81YijPyVfFyOJf6bcPLfDhJSOKJdPGPUpOj41s7jL6hMKkUdzyNUF23b9n7SHVN46GnM
         ShgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qJVDSWLakOvCZ6195cEoUTZo4JQcD/tW/9xMRMKLfuo=;
        b=CuuMNG6p+WFWMfqT+fPLCnRRNXeJrWkckVyQQPRGPbsZ5aXWw3KiEY5F4xXZmD11Mh
         MOrOH4HZ0k08S80wovD40XlPVUEsdVm1pl2hXLAPz897FjRgZcS9wOvdx+vd1fjjci4t
         eFnG8Lfgd10Eb7w4BuNQRK9L07CV/K1AMNiUmSjzsoi6Ef0YXHD9MKRz3Jx/VLSfL3sU
         9XuhBACvjCM8sN1+YrhZwPEcSo1czk3XGO+5ONF4QR27njXXmLEu0tXTEP8c2Gu/VHgW
         f4gBIoaLk4niu473KqxSYOefmaxfVlpqFn2vvgsneMOcVroc0qUTjM2TWIIfKJKDM7I3
         eCSQ==
X-Gm-Message-State: AOAM5312FhkVXM7CD8tucjZtDV1/Yah/XFYTAqfHPeKedLBI+rcB2q8Q
        GehVVA2pApAk19etKM2PLL5DqQ==
X-Google-Smtp-Source: ABdhPJziunJq94PLPwy8ufWPx7lsqQlyM6CTmULWzi98Mg/krpnrRsEtqDfW54fI7RqZzYwhylkGjw==
X-Received: by 2002:a17:90a:1f86:: with SMTP id x6mr1858668pja.92.1605829244767;
        Thu, 19 Nov 2020 15:40:44 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z2sm864305pgg.6.2020.11.19.15.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 15:40:43 -0800 (PST)
Date:   Thu, 19 Nov 2020 16:40:42 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 08/14] remoteproc: Introduce function rproc_detach()
Message-ID: <20201119234042.GC4137289@xps15>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-9-mathieu.poirier@linaro.org>
 <807cebaa-2d64-401a-d673-8f40b919924e@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <807cebaa-2d64-401a-d673-8f40b919924e@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 09, 2020 at 10:05:35AM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 10/30/20 8:57 PM, Mathieu Poirier wrote:
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
> > index 62e88ff65009..6b33a83960d2 100644
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
> > +
> > +	rproc_disable_iommu(rproc);
> 
> I'm not an IOMMU expert,so maybe this remark is not relevant...
> As IOMMU manage the access of the remote device to its memory,
> could this lead to a remote device crash?

Right - that is the kind of thing that tormented me when I wrote this set.  On
some system it might cause a crash but on others it is needed.  As such I
decided to include it in the detach() process and let people implement the
functionality should they need to.  We can remove it but it is guaranteed that
someone will post a patch to add it again.

Based on the scenario it may have to be something like rproc_detach_iommu().
Since we have no clue on what the requirements will be I decided to simply keep
the current call.  Let me know if you really disagree with my approach.

> 
> Regards,
> Arnaud
> 
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
> > index 3faff9bb4fb8..6713faab6959 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
> >  
> >  int rproc_boot(struct rproc *rproc);
> >  void rproc_shutdown(struct rproc *rproc);
> > +int rproc_detach(struct rproc *rproc);
> >  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
> >  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
> >  int rproc_coredump_add_custom_segment(struct rproc *rproc,
> > 
