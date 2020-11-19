Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27ACC388F9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 23:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D0302145D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 23:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mskyCGFu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgKSX14 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 18:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgKSX1z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 18:27:55 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0551DC0613CF
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 15:27:54 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id w6so6053285pfu.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 15:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rvkvudzSKVmHxUZTJJnpqGLnHIxE+D8yzj4+YIMrSiQ=;
        b=mskyCGFupZTXAglRFz1FVfUPUiE0qjNHnaQWkhS0eQ+eL2cFkJj1z2gN0NMhpcf8Ob
         EWUr/2+kKOI9KInbDa1WzBgDe11Srq1I80DwQvaQ1hA1L+AHMyWTbcw/19C2lLsDkDo9
         1kk1FzaSxoJZrv7OAJWTr0FwIzKkY4TVA7R7vaNXeA1AR8gk+jO/N+hZQvuiYDh0dn/b
         BOfu4IN/70SZt5h60DSsv7CQgMRj8ktfoUB3QdbEQYGAtakFTtbZMwICL4xAYueluMtN
         /t+oSepsAVWOPQdgx1rOPZbFu96pTy7BZhTnHEa1AfHVKuks4Z4h1HJ4Auu1otQL2jKa
         EDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rvkvudzSKVmHxUZTJJnpqGLnHIxE+D8yzj4+YIMrSiQ=;
        b=l3JY2iOd5SPYi9D95UkVWXTRxyizwYl8znMpBEqaK4E8ZXpWlPpQmj2zX5ssWqWRJP
         wxvMpDFpyjRGXfqGthKx7qp0y/Bl5Q5Ox92ODWvNAfkyNQs4pqpQ80Cdu/SdOcN9jj83
         cbN+n5Uqn/f+vmb2WakHNycMD4XGaczpRuy5OlicSSTzpqZQF7k61WIhCRPY6Cl9v/yR
         H868QarRuL2Ib+xIojd1RrR6uDuAM7ykysfwH/H2Syr7AO1iBqqkjGA0nPqY4b90qCsC
         WPdM29uv2bdr1Hltdsl7RByIOiAtap+aeY+/CmTsrDCVbU8D77L/nMm/8TCYnNAevKjU
         aDUg==
X-Gm-Message-State: AOAM530FfYyXfJb/YiJNxPUD42E2rNLt7XNOKGdRIVhlTXxuOtKz6eH6
        0cunJ+3oVK/6ONw+bSwn5LuCxQ==
X-Google-Smtp-Source: ABdhPJxvkDsXPB42LD0QRhMfreF6knckHtOXNL6I2v7OYjNjJQWgkHVyzCFn1MZgyraMXmrsn9Im9g==
X-Received: by 2002:a63:4722:: with SMTP id u34mr15011547pga.262.1605828473459;
        Thu, 19 Nov 2020 15:27:53 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id v196sm1085490pfc.34.2020.11.19.15.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 15:27:52 -0800 (PST)
Date:   Thu, 19 Nov 2020 16:27:51 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 07/14] remoteproc: Introduce function __rproc_detach()
Message-ID: <20201119232751.GB4137289@xps15>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-8-mathieu.poirier@linaro.org>
 <f9d421b6-ffb3-20f2-c0b1-fa4976a3a29e@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9d421b6-ffb3-20f2-c0b1-fa4976a3a29e@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Nov 06, 2020 at 06:43:05PM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> > Introduce function __rproc_detach() to perform the same kind of
> > operation as rproc_stop(), but instead of switching off the
> > remote processor using rproc->ops->stop(), it uses
> > rproc->ops->detach().  That way it is possible for the core
> > to release the resources associated with a remote processor while
> > the latter is kept operating.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 31 ++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index ed1f9ca4248b..62e88ff65009 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1664,6 +1664,37 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >  	return 0;
> >  }
> >  
> > +/*
> > + * __rproc_detach(): Does the opposite of rproc_attach()
> > + */
> > +static int __maybe_unused __rproc_detach(struct rproc *rproc)
> > +{
> > +	struct device *dev = &rproc->dev;
> > +	int ret;
> > +
> > +	/* No need to continue if a detach() operation has not been provided */
> > +	if (!rproc->ops->detach)
> > +		return -EINVAL;
> > +
> > +	/* Stop any subdevices for the remote processor */
> > +	rproc_stop_subdevices(rproc, false);
> 
> How to determine whether a subdevice should be stopped or detached? 
> For instance, in ST, we have a resource manager subdev which maintains clocks and regulators
> for peripherals used by the remote processor.
> In case of detachment we would need to maintain clock and regulators.
> 
> > +
> > +	/* Tell the remote processor the core isn't available anymore */
> > +	ret = rproc->ops->detach(rproc);
> > +	if (ret) {
> > +		dev_err(dev, "can't detach from rproc: %d\n", ret);
> > +		rproc_start_subdevices(rproc);
> > +		return ret;
> > +	}
> > +
> > +	rproc_unprepare_subdevices(rproc);
> 
> Same here, is prepare/unprepare can depend on the operation?
> 
> Seems that adding rproc_attach_subdevices/rproc_detach_subdevices could be not sufficient
> to address prepare/unprepare.
> Alternative could be:
> - extra parameter for the subdev ops to indicate attach/detach action...?
> - intermediate rproc state : ATTACHING, DETACHING
> - other?

These are really good points.  I did not think about that kind of scenario and
the best solution isn't obvious to me either.

> 
> That's said, I don't think that it is blocking for the ST resource manager.
> In this particular case, regulators and clocks can be permanently activated
> as a back-up solution (always-on).
> 
> So, if no other company has a problem with that, we can keep this implementation for now.

As I wrote above the path forward isn't clear to me and as such will opt to
address this in another patchset...  But it has to be fixed. 

> 
> Regards,
> Arnaud
> 
> > +
> > +	rproc->state = RPROC_DETACHED;
> > +
> > +	dev_info(dev, "detached remote processor %s\n", rproc->name);
> > +
> > +	return 0;
> > +}
> >  
> >  /**
> >   * rproc_trigger_recovery() - recover a remoteproc
> > 
