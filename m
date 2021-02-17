Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB010C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 21:24:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 821B864E7A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 21:24:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbhBQVXn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 16:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbhBQVXf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 16:23:35 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEDBC061756
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Feb 2021 13:22:54 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id my11so2061631pjb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Feb 2021 13:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lz+gd9XLG0rhSSAchXuyyUA0mNTMvFE42OMhF4DhPbE=;
        b=KyPBJ/D53KbI8/rVY3vfzseq91VqmpyG98E96l1KleiNrKjv8gjydCgSJAsixn5PVy
         iC3QO8zPP7Z6ijeTqgyWp1WodvtCNom1OXu7aBMThhloLbcfTBWrgUUE7newf0ARKqrD
         w7cV1wlrirFzClIYZxHNVa3RAR4Xg1fUQlaqp0x2ESkhtdWUOKsUp8v+yW2uhK3kd1rs
         1poLhqpd7TjpxrQkZHoxpRThp7iBJqSfPACUXeoI+K5l1GS7CsQhPrnhVmBfTOL+EK/j
         Msk0DSfNGvLA6ty0FXUUVIYXH59dcVuoAM8vhaZHjgM2ZT8utjhYgUDlwu0GdQxyGmlF
         xNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lz+gd9XLG0rhSSAchXuyyUA0mNTMvFE42OMhF4DhPbE=;
        b=tu66HoFdPj5dCLxoBl1nRLpNd0RXgiUM4TEBhgzjjD+7jrYolvjEs2oLQWGAQzRl6k
         C+zM7Evy0s4YrmeWOYKPDsQclmr0tpwFmsTfcc3PxUF+Rn0WslfrgKA/J/jbP2neplAV
         avvFSMcWjMp8z+et+NB/BJA5Q8i6DIee46wcsnsJjjjY/7AoFWg6XWvJKyqHXLvBNOrB
         7d03tWKHoc2P9w2iKXZmAbIzlyjNH25vri0bOUQ7ulhM6Xv8EccJPazqi69hxrJZjZFl
         gPlogGlK6kWFFex3wGh4gQV+5Z5z6i17JU6b18EWdYKPQR6umoR+Phyfn/RVb/p0MUjV
         hhvQ==
X-Gm-Message-State: AOAM5338mCKAbM+Iu+Bf9PxfyXVshiFxUCNsUDcubEmX9Ca3ITjHd4pm
        xIFGD2fGUml10icUUybUANQhgg==
X-Google-Smtp-Source: ABdhPJxF6/L5bQjUFhTNg5HWYRKopFPRmpNg0DDkZVoV7x5SnkBc0oDRP2eV6PB5sjHyMSsQCo11cw==
X-Received: by 2002:a17:902:900c:b029:e3:2313:20d5 with SMTP id a12-20020a170902900cb02900e3231320d5mr962555plp.62.1613596974417;
        Wed, 17 Feb 2021 13:22:54 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e6sm3142725pfd.5.2021.02.17.13.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 13:22:53 -0800 (PST)
Date:   Wed, 17 Feb 2021 14:22:51 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, robh+dt@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 07/19] remoteproc: Add new get_loaded_rsc_table() to
 rproc_ops
Message-ID: <20210217212251.GA2800385@xps15>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
 <20210211234627.2669674-8-mathieu.poirier@linaro.org>
 <406fe414-f454-c91d-8bbd-ce323a9612e7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <406fe414-f454-c91d-8bbd-ce323a9612e7@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Feb 15, 2021 at 02:10:10PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 2/12/21 12:46 AM, Mathieu Poirier wrote:
> > Add a new get_loaded_rsc_table() operation in order to support
> > scenarios where the remoteproc core has booted a remote processor
> > and detaches from it.  When re-attaching to the remote processor,
> > the core needs to know where the resource table has been placed
> > in memory.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> > New for V5:
> > - Added function rproc_set_loaded_rsc_table() to keep rproc_attach() clean.
> > - Setting ->cached_table, ->table_ptr and ->table_sz in the remoteproc core
> >   rather than the platform drivers.
> > ---
> >  drivers/remoteproc/remoteproc_core.c     | 35 ++++++++++++++++++++++++
> >  drivers/remoteproc/remoteproc_internal.h | 10 +++++++
> >  include/linux/remoteproc.h               |  6 +++-
> >  3 files changed, 50 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index e6606d10a4c8..741bc20de437 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1537,6 +1537,35 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> >  	return ret;
> >  }
> >  
> > +static int rproc_set_loaded_rsc_table(struct rproc *rproc)
> > +{
> > +	struct resource_table *table_ptr;
> > +	struct device *dev = &rproc->dev;
> > +	size_t table_sz;
> > +	int ret;
> > +
> > +	table_ptr = rproc_get_loaded_rsc_table(rproc, &table_sz);
> > +	if (IS_ERR_OR_NULL(table_ptr)) {
> > +		if (!table_ptr)
> > +			ret = -EINVAL;
> 
> I did few tests on this showing that this approach does not cover all use cases.
> 
> The first one is a firmware without resource table. In this case table_ptr
> should be null, or we have to consider the -ENOENT error as a non error usecase.
>

Right, I'll provision for those cases.
 
> The second one, more tricky, is a firmware started by the remoteproc framework.
> In this case the resource table address is retrieved from the ELF file by the
> core part.

Correct.

> So if we detach and reattach rproc_get_loaded_rsc_table cannot return the
> address. Look to me that we should have also an alocation of the clean_table in
> rproc_start and then to keep the memory allocated until a shutdown.

I assumed the address of the resource table found in the ELF image was the same
as the one known by the platform driver.  In hindsight I realise the platform
driver may not know that address.

> 
> That said regarding the complexity to re-attach, I wonder if it would not be
> better to focus first on a simple detach, and address the reattachment in a
> separate series, to move forward in stages.

I agree that OFFLINE -> RUNNING -> DETACHED -> ATTACHED is introducing some
complexity related to the management of the resource table that where not
expected.  We could concentrate on a simple detach and see where that takes us.
It would also mean to get rid of the "autonomous-on-core-shutdown" DT binding. 

Thanks,
Mathieu

> 
> Regards,
> Arnaud
> 
> > +		else
> > +			ret = PTR_ERR(table_ptr);
> > +
> > +		dev_err(dev, "can't load resource table: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * The resource table is already loaded in device memory, no need
> > +	 * to work with a cached table.
> > +	 */
> > +	rproc->cached_table = NULL;
> > +	rproc->table_ptr = table_ptr;
> > +	rproc->table_sz = table_sz;
> > +
> > +	return 0;
> > +}
> > +
> >  /*
> >   * Attach to remote processor - similar to rproc_fw_boot() but without
> >   * the steps that deal with the firmware image.
> > @@ -1556,6 +1585,12 @@ static int rproc_attach(struct rproc *rproc)
> >  		return ret;
> >  	}
> >  
> > +	ret = rproc_set_loaded_rsc_table(rproc);
> > +	if (ret) {
> > +		dev_err(dev, "can't load resource table: %d\n", ret);
> > +		goto disable_iommu;
> > +	}
> > +
> >  	/* reset max_notifyid */
> >  	rproc->max_notifyid = -1;
> >  
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index c34002888d2c..4f73aac7e60d 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -177,6 +177,16 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
> >  	return NULL;
> >  }
> >  
> > +static inline
> > +struct resource_table *rproc_get_loaded_rsc_table(struct rproc *rproc,
> > +						  size_t *size)
> > +{
> > +	if (rproc->ops->get_loaded_rsc_table)
> > +		return rproc->ops->get_loaded_rsc_table(rproc, size);
> > +
> > +	return NULL;
> > +}
> > +
> >  static inline
> >  bool rproc_u64_fit_in_size_t(u64 val)
> >  {
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 6b0a0ed30a03..51538a7d120d 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -368,7 +368,9 @@ enum rsc_handling_status {
> >   * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
> >   * negative value on error
> >   * @load_rsc_table:	load resource table from firmware image
> > - * @find_loaded_rsc_table: find the loaded resouce table
> > + * @find_loaded_rsc_table: find the loaded resource table from firmware image
> > + * @get_loaded_rsc_table: get resource table installed in memory
> > + *			  by external entity
> >   * @load:		load firmware to memory, where the remote processor
> >   *			expects to find it
> >   * @sanity_check:	sanity check the fw image
> > @@ -390,6 +392,8 @@ struct rproc_ops {
> >  			  int offset, int avail);
> >  	struct resource_table *(*find_loaded_rsc_table)(
> >  				struct rproc *rproc, const struct firmware *fw);
> > +	struct resource_table *(*get_loaded_rsc_table)(
> > +				struct rproc *rproc, size_t *size);
> >  	int (*load)(struct rproc *rproc, const struct firmware *fw);
> >  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> >  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> > 
