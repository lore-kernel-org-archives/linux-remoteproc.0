Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3E5C4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A195861159
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhHEQPY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 12:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhHEQPX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 12:15:23 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8F2C061765
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Aug 2021 09:15:09 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so16028612pjr.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Aug 2021 09:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rEg1BTCMGoRn0sjT3rWRNvHqW2LLrM0T5szYW+iprlY=;
        b=JeySS7sbmS28Oav7betiVjBrAJfEXz59ZQYfOpmK1BIP4wTxeWcTPwIoEpmFlC09DF
         rbWKjGUpowb+0LbpjNn5vITPzDzxcWs0S/r9mrYuq96fFbuQu3KzHqoI4u9De7IL7Jvs
         nSXt1j0MdcvtfEvJ2l/mKCUUMgFZ2rEN9MeZQX+ADKPIj6qRP4sJlewmGiF7TEk8RQ/a
         retiI4410BAKlfZSLIR3R5vhs/IlPxB6QTl7vYhseT+ggiXZVkgwOyg3d2ZiTJxFsqso
         EglMHVeuXVWvstLFr8v5Mn7Y6gZEvE9BMv4IqnTVfWITZmwiYum5VyWqhDTC02DvqtCF
         Reew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rEg1BTCMGoRn0sjT3rWRNvHqW2LLrM0T5szYW+iprlY=;
        b=YEgHUpPvDSNZuhAaPiq33DN7XAWPn5gUlGt7+R4YpHqR30Ns6YJSSmBuEpjei+jdBR
         cJACR6yft7I+yVfcAs2zHvGATDp8Jf1qRYrrhRpfnJXWXR/dRdbEUvMcc+aqOKe47Pjy
         mRDvRRhbYEhntsA8Ajr77IrAKcBddMfz/uCygmZBcvfXWqF0acdXgwDxkqfMSHCAHRKR
         iYwGk/idqgFzTf0+OP4mjaABGxBLqjOvvrbFqoJn9Tx2rDxmpdbHWAdR5W/dmefopJ5r
         e+PMGV5Y1vv6fNvlVjaToREl2zznQi+Vdn4JZPKXaoswvIfTtZ04fRpbsMIxLft82ieu
         6y8Q==
X-Gm-Message-State: AOAM531IVV6olqHzoWkJmA8PdE06Noz8+ax64XmEyrhga2KdNENln9IQ
        V3HhYrBKrHGxP3JmLWYNw2Xi5A==
X-Google-Smtp-Source: ABdhPJyKLIfgIfNToEP9h1rMAx3XgFEHEXDEu9ACbcrjUhWRC7r4z1IJzJr2ZOY+2Xn5CCrJoNVmVA==
X-Received: by 2002:a65:6099:: with SMTP id t25mr48063pgu.85.1628180109269;
        Thu, 05 Aug 2021 09:15:09 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id q17sm8753280pgd.39.2021.08.05.09.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 09:15:08 -0700 (PDT)
Date:   Thu, 5 Aug 2021 10:15:06 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, ohad@wizery.com
Subject: Re: [PATCH v3 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
Message-ID: <20210805161506.GA3205691@p14s>
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
 <20210717234859.351911-3-martin.blumenstingl@googlemail.com>
 <20210728175823.GA2766167@p14s>
 <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Aug 04, 2021 at 11:03:57PM +0200, Martin Blumenstingl wrote:
> Hi Mathieu,
> 
> thanks for taking the time to look into this!
> 
> (I will address any of your comments that I am not mentioning in this
> email anymore. Thanks a lot for the suggestions!)
> 
> On Wed, Jul 28, 2021 at 7:58 PM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> [...]
> > > +     writel(FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> > > +                            priv->sram_pa >> 14),
> > Indentation problem
> The idea here is to align priv->sram_pa with AO_REMAP_REG0... which
> are both arguments to FIELD_PREP

Right, this is what I would have expected.  When I applied the patch on my side
"priv->sram_pa ..." was aligned wiht the 'M' of "AO_REMAP_ ...".  

> Maybe using something like this will make that easier to read:
>     tmp = FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
>                                      priv->sram_pa >> 14);
>     writel(tmp, priv->remap_base + AO_REMAP_REG0);

I think the main problem is that
AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU is simply too long.  I
suggest making is shorter and add a comment to describe exactly what it does.

> 
> What do you think: leave it as is or use a separate variable?
> 
> [...]
> > > +     usleep_range(10, 100);
> >
> > I've seen this kind of mysterious timeouts in other patchset based vendor trees.
> > You likely don't know why it is needed so I won't ask.
> unfortunately this is also the case here
> 
> [...]
> > > +     priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
> > > +     if (IS_ERR(priv->arc_reset)) {
> >
> > Function __reset_control_get() in __devm_reset_control_get() can return NULL so
> > this should be IS_ERR_OR_NULL().
> The logic in there is: return optional ? NULL : ERR_PTR(-...);

Ok, so you meant to do that.  And I just checked reset_control_reset() and it does
account for a NULL parameter.  I'm good with this one but add a comment to
make sure future readers don't think you've omitted to properly deal with the
NULL return value.

> I am requesting a mandatory reset line here, so reset core will never
> return NULL
> See also [0]

Indeed, I've read that too.  Nonetheless __reset_control_get() can return NULL
by way of __reset_control_get_from_lookup().

> 
> For this reason I am not planning to change this
> 
> [...]
> > This driver is squeaky clean. With the above:
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> awesome, thank you!
> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://elixir.bootlin.com/linux/v5.14-rc4/source/include/linux/reset.h#L227
