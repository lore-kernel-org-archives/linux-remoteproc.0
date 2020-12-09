Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2ADC4361B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 21:35:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBD7B23B51
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 21:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388193AbgLIVe5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Dec 2020 16:34:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388048AbgLIVe5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Dec 2020 16:34:57 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F494C061793
        for <linux-remoteproc@vger.kernel.org>; Wed,  9 Dec 2020 13:34:17 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id v3so1639634plz.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Dec 2020 13:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/CP4s6SojSgYG10MkCPVL6HnkSBBBlayu1v2Y56FpY0=;
        b=Nvilxii2ih8HpVvwYvc725FHmv7+nzj/P5QoRc7regGsPHJGY6XiwBaLLzPwpsG7xJ
         vpNxXrIf3hxbPoXtpxOi6c3Pzak7AX0vsELLFHDGjdTH4voAumEDfQ3vyDYUBMrlNpj2
         Ot4EKJT292mVQ/r/YHBNFVlngeEmHl8uLFsKgk8uz/rh7ubf8JGxlfFvkb+Pu7pLCPDP
         6XQeCOMKG4xZZEsg3ZU2aInj4He4v9Iky6+ofHfpJLkQYKQjuHfO3AegKTiqcnIb4cjY
         8DPtz2hcUJ1QwIPVCztIl19IImFLbyC2k+nyvKfgaGhcoh4p3KL5BD6DIUMMY952IH7P
         Vs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/CP4s6SojSgYG10MkCPVL6HnkSBBBlayu1v2Y56FpY0=;
        b=e29r+rf9OIOQoDCWDbjawy16Bez91UQv7Rido1jo9OwvXdR71m96IiYzydXZNo69+d
         Kdm0WcjflU3BMCxH7ovNW8kwk0+nMJqzbrj/neYWmfSZvDevSEgf5qSYulP6lNLRTPaN
         1ILfJy62BeSnD96PeT89AMmbimZ7XdisgXyUb88WcdhVNTjtwgABd0zbmls4/3/4HSwt
         cX4QdCznurcGECdA0YPFZPfLDi9Y1KwPZPCErRzUnCreao4hfs1HDRk2y/50myaC+9jA
         gFvjD6U+1G1pzAnF1ocEB4tCdd4fYAmte/QZC88WmMNswHxB3MG/ZzXpX/oEd6r4VqJi
         TQ7w==
X-Gm-Message-State: AOAM533AN70+C2WoWSxUmTatI06Xdau+o6kbydL9XAo/ijlIGqykQQ0V
        syVjA90YYM9Sv6WIlOLlWFUd8A==
X-Google-Smtp-Source: ABdhPJyGx811k4FRsxwZkIRLkksTiPKB/X7yArWMjw3PV5M2e9Xf/AM8UB0gUVNeYFqtiWA1xs4knA==
X-Received: by 2002:a17:902:c395:b029:da:9aca:c972 with SMTP id g21-20020a170902c395b02900da9acac972mr4032095plg.32.1607549656808;
        Wed, 09 Dec 2020 13:34:16 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p6sm3160715pjt.13.2020.12.09.13.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 13:34:16 -0800 (PST)
Date:   Wed, 9 Dec 2020 14:34:14 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 15/15] remoteproc: Refactor rproc delete and cdev
 release path
Message-ID: <20201209213414.GB1814981@xps15>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-16-mathieu.poirier@linaro.org>
 <00422e08-3acc-1e5e-3d1d-f9c332256a1f@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00422e08-3acc-1e5e-3d1d-f9c332256a1f@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Dec 09, 2020 at 11:13:07AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 11/26/20 10:06 PM, Mathieu Poirier wrote:
> > Refactor function rproc_del() and rproc_cdev_release() to take
> > into account the policy specified in the device tree.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_cdev.c | 13 +++++++++++-
> >  drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++--
> >  include/linux/remoteproc.h           |  4 ++++
> >  3 files changed, 44 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> > index f7645f289563..3dfe555dfc07 100644
> > --- a/drivers/remoteproc/remoteproc_cdev.c
> > +++ b/drivers/remoteproc/remoteproc_cdev.c
> > @@ -88,7 +88,18 @@ static int rproc_cdev_release(struct inode *inode, struct file *filp)
> >  {
> >  	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
> >  
> > -	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
> > +	if (!rproc->cdev_put_on_release)
> > +		return 0;
> > +
> > +	/*
> > +	 * The application has crashed or is releasing its file handle.  Detach
> > +	 * or shutdown the remote processor based on the policy specified in the
> > +	 * DT.  No need to check rproc->state right away, it will be done
> > +	 * in either rproc_detach() or rproc_shutdown().
> > +	 */
> > +	if (rproc->autonomous_on_core_shutdown)
> > +		rproc_detach(rproc);
> > +	else
> >  		rproc_shutdown(rproc);
> 
> A reason to not propagate the return of functions?

A valid observation...  I'll fix it.

> 
> >  
> >  	return 0;
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 3d7d245edc4e..1a170103bf27 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2294,6 +2294,22 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> >  	return 0;
> >  }
> >  
> > +static void rproc_set_automation_flags(struct rproc *rproc)
> > +{
> > +	struct device *dev = rproc->dev.parent;
> > +	struct device_node *np = dev->of_node;
> > +	bool core_shutdown;
> > +
> > +	/*
> > +	 * When function rproc_cdev_release() or rproc_del() are called and
> > +	 * the remote processor has been attached to, it will be detached from
> > +	 * (rather than turned off) if "autonomous-on-core-shutdown is specified
> > +	 * in the DT.
> > +	 */
> > +	core_shutdown = of_property_read_bool(np, "autonomous-on-core-shutdown");
> > +	rproc->autonomous_on_core_shutdown = core_shutdown;
> > +}
> > +
> >  /**
> >   * rproc_alloc() - allocate a remote processor handle
> >   * @dev: the underlying device
> > @@ -2352,6 +2368,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >  	if (rproc_alloc_ops(rproc, ops))
> >  		goto put_device;
> >  
> > +	rproc_set_automation_flags(rproc);
> > +
> >  	/* Assign a unique device index and name */
> >  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
> >  	if (rproc->index < 0) {
> > @@ -2435,8 +2453,16 @@ int rproc_del(struct rproc *rproc)
> >  	if (!rproc)
> >  		return -EINVAL;
> >  
> > -	/* TODO: make sure this works with rproc->power > 1 */
> > -	rproc_shutdown(rproc);
> > +	/*
> > +	 * TODO: make sure this works with rproc->power > 1
> > +	 *
> > +	 * No need to check rproc->state right away, it will be done in either
> > +	 * rproc_detach() or rproc_shutdown().
> > +	 */
> > +	if (rproc->autonomous_on_core_shutdown)
> > +		rproc_detach(rproc);
> > +	else
> > +		rproc_shutdown(rproc);
> 
> same here
> 
> >  
> >  	mutex_lock(&rproc->lock);
> >  	rproc->state = RPROC_DELETED;
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 02312096d59f..5702f630d810 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -516,6 +516,9 @@ struct rproc_dump_segment {
> >   * @nb_vdev: number of vdev currently handled by rproc
> >   * @char_dev: character device of the rproc
> >   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> > + * @autonomous_on_core_shutdown: true if the remote processor should be detached
> > + *				 from (rather than turned off) when the remoteproc
> > + *				 core goes away.
> >   */
> >  struct rproc {
> >  	struct list_head node;
> > @@ -554,6 +557,7 @@ struct rproc {
> >  	u16 elf_machine;
> >  	struct cdev cdev;
> >  	bool cdev_put_on_release;
> > +	bool autonomous_on_core_shutdown;
> >  };
> >  
> >  /**
> > 
