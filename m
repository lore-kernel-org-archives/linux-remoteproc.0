Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D899C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 17:14:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00A7B64FDE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 17:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCKRNz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhCKRNk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 12:13:40 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E7AC061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 09:13:40 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id t18so3778135pjs.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 09:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Al/T2sFWlvT3Vtl3R7CXJDlSotPrwvE7T7S7T8TsWxo=;
        b=vX5cI/xl4BhFDK1i2+FF347SCqdm4hT3gkn1huohMMQ8ojPbiVWf2kwDKNkkERnbF0
         yxLKe38HJb/UYRgAEzLIRG1OUa3AJnk00ObYH8XAEWu9IC9IcLLDaBkJwYR6YAYQqlgi
         hBGwjYYUk4eRhYTY6IgETxzP6CStwS6fkY7bG8YPsmCOysAVg0hT+A5wcH+6iGDZIdoH
         qPON9ACpFALlYYGji1aUhFopwQI8S8p++mABmayygY3pU1hwcSKKBUBTABlo7BBHTOuf
         AzsEXlImcPG1Nl0QEisfya/cxEq3GI/WC1milcDDeSkafl2en2Sf4ErVPl5Bo/yXaS64
         BRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Al/T2sFWlvT3Vtl3R7CXJDlSotPrwvE7T7S7T8TsWxo=;
        b=RyLgYy0uw3Bb9qj72l1YPfgR5kzkrMdaAc9uuztT2/8yKaMi4RRvfJkAQCDYJqkUZk
         TOj0c3N5iRYkAxHTpsvhtqaP5OZmmol2h3dTRpiGx4/2c5LxQHptSIgFiQ+MkjxZ9KWQ
         WujYgAga6meHPLmL2/9lm9cTB5lcvvK+zrVEUaS9LgpsRYrbJMmkCdkqb2CsAt1cCBnx
         odd4MNIEpn6T3gjylT9zlBrWJxBfpEfL+SLfDZE/bg3YBSOiMQEVMeev1x2V1JAj/5RB
         5Vwh1CJHeuKJBzJo6GQr/sbgWqQQ8sDXgZ3nQGBVg6v4tSg4kSjzgThrZ7lCr4rxIaxr
         MF6g==
X-Gm-Message-State: AOAM533fd2CaWZyH5cugk/B8FMyUj+PNyxaQzfULflQLe9z9b+XUAFCw
        QYaKm7j3vm+l47v3bGJp7CMzuQ==
X-Google-Smtp-Source: ABdhPJxXZ2mQrWMXsr2BEClDmGES5sAN9xqNAjKyB3hrk7VnzZoXr+dIKS/+ZlZKzDwWb4gBOKS0sw==
X-Received: by 2002:a17:90a:9b18:: with SMTP id f24mr9511651pjp.96.1615482820187;
        Thu, 11 Mar 2021 09:13:40 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a1sm2838753pff.156.2021.03.11.09.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 09:13:39 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:13:37 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, arnaud.pouliquen@st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 12/17] remoteproc: Properly deal with the resource
 table when stopping
Message-ID: <20210311171337.GA1113417@xps15>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
 <20210310211025.1084636-13-mathieu.poirier@linaro.org>
 <YElb4PITwZtMhpAw@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YElb4PITwZtMhpAw@builder.lan>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Mar 10, 2021 at 05:53:04PM -0600, Bjorn Andersson wrote:
> On Wed 10 Mar 15:10 CST 2021, Mathieu Poirier wrote:
> 
> > When a remote processor that was attached to is stopped, special care
> > must be taken to make sure the shutdown process is similar to what
> > it would be had it been started by the remoteproc core.
> > 
> > This patch takes care of that by making a copy of the resource
> > table currently used by the remote processor.  From that point on
> > the copy is used, as if the remote processor had been started by
> > the remoteproc core.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> > New for V7:
> >   New Patch, used to be part of 11/16 in V6.
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 53 +++++++++++++++++++++++++++-
> >  1 file changed, 52 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index e9ea2558432d..c488b1aa6119 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1634,6 +1634,52 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
> >  	return 0;
> >  }
> >  
> > +static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> > +{
> > +	struct resource_table *table_ptr;
> > +
> > +	/* A resource table was never retrieved, nothing to do here */
> > +	if (!rproc->table_ptr)
> > +		return 0;
> > +
> > +	/*
> > +	 * If a cache table exists the remote processor was started by
> > +	 * the remoteproc core.  That cache table should be used for
> > +	 * the rest of the shutdown process.
> > +	 */
> > +	if (rproc->cached_table)
> > +		goto out;
> > +
> > +	/* Remember where the external entity installed the resource table */
> > +	table_ptr = rproc->table_ptr;
> > +
> 
> Afaict this is just a remnant from the detach case.
> 
> I think the series looks really good now, please let me know and I can
> drop the local "table_ptr" as I apply the patches.

(sigh) No matter how long you stare at a patchset there is always one that gets
away.  I will address Arnaud's comment and fix this in a new revision.

Thanks,
Mathieu 

> 
> Regards,
> Bjorn
> 
> > +	/*
> > +	 * If we made it here the remote processor was started by another
> > +	 * entity and a cache table doesn't exist.  As such make a copy of
> > +	 * the resource table currently used by the remote processor and
> > +	 * use that for the rest of the shutdown process.  The memory
> > +	 * allocated here is free'd in rproc_shutdown().
> > +	 */
> > +	rproc->cached_table = kmemdup(rproc->table_ptr,
> > +				      rproc->table_sz, GFP_KERNEL);
> > +	if (!rproc->cached_table)
> > +		return -ENOMEM;
> > +
> > +	/*
> > +	 * Since the remote processor is being switched off the clean table
> > +	 * won't be needed.  Allocated in rproc_set_rsc_table().
> > +	 */
> > +	kfree(rproc->clean_table);
> > +
> > +out:
> > +	/*
> > +	 * Use a copy of the resource table for the remainder of the
> > +	 * shutdown process.
> > +	 */
> > +	rproc->table_ptr = rproc->cached_table;
> > +	return 0;
> > +}
> > +
> >  /*
> >   * Attach to remote processor - similar to rproc_fw_boot() but without
> >   * the steps that deal with the firmware image.
> > @@ -1759,7 +1805,12 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >  	rproc_stop_subdevices(rproc, crashed);
> >  
> >  	/* the installed resource table is no longer accessible */
> > -	rproc->table_ptr = rproc->cached_table;
> > +	ret = rproc_reset_rsc_table_on_stop(rproc);
> > +	if (ret) {
> > +		dev_err(dev, "can't reset resource table: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> >  
> >  	/* power off the remote processor */
> >  	ret = rproc->ops->stop(rproc);
> > -- 
> > 2.25.1
> > 
