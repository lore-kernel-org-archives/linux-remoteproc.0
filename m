Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0DEC4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 15:29:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 730D6613CD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 15:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhHWPaQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Aug 2021 11:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbhHWPaQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Aug 2021 11:30:16 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80788C061575
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 08:29:33 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id t42so13114419pfg.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vEaoUziBq3E6zdwPq0ckEpXVtz+BXh6RGLuJML224RM=;
        b=R1zKGChQimXrdBmVgI9Yg84uCfa/0GDmxaEIaiwyz1EnBS/laU7lveYFQIF/zReUWK
         9xYFzvI9mL2SgpPDe3K8n2UaUoAjLsUmyJyyx7RgjeievBH3qw7jD5dgZ4wx75bnKY0p
         ReTmKrg/Z9DAvdfl7ymFeVlu2Pf4A5M9oGEuJRFo5kAnnkTJ6tnPGH6bHd3T+rbg16a5
         BkCBX4VRt+y15qgq5yIMoguvdYlq1nfYXEaBTgtjU0UVuvIj0a3IRU3/OxwqVevCsy7y
         ClCO/O0E6c2hTSy7hO4U5D049p/+YUlHBvuzX2agZ57rzp9a+SQHas7Wd/PvQJi25LAg
         guSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vEaoUziBq3E6zdwPq0ckEpXVtz+BXh6RGLuJML224RM=;
        b=sM61onQD7aEV7u91sRt+GownxtPz5/4ijncgRTeKVZhdDo0E0Y1X6vsWkrL4VkzrC9
         YWzMNhWaPbwRGAAcFr4MzW162tvEOBTxnIIErlaDtRlLMbwiHcr5wJ+ZvxIS3qiAtNqP
         tmlkHqJpVTn3mQfZ86AxPmkV//16by4iK4qHDD/XbJKsjJRhuH8dOV3LWBKkYybN6FQa
         7mSFJi+iCOB71ws6rnmvLMT/m6RycGgcZyYtM1y6BlA74RCxEhyQJdTbvtaz1/u7v6Ug
         itg4w5ufNXzeI4kePMjLc2gkER1uvfbldbp/P9hMUPD7q6D4tNZmmUNHa9Sdm/aaYQ9l
         585A==
X-Gm-Message-State: AOAM531WXiIUg9n6Ebn+pkMmShuVtibziLwZ7y5BhYOPf2YgbMrzLh5z
        UrB9AoDjJHjPj+lucXmjQYu1cA==
X-Google-Smtp-Source: ABdhPJzQAhNqugUUs6GMowMfc4TjiW/1LoOtbJAtnbpyMIjp7QrKeuxyQDwOXMzT37JWwkO6ncyjsw==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id c6-20020a056a000ac6b0290374a33b0a74mr34979881pfl.51.1629732573011;
        Mon, 23 Aug 2021 08:29:33 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p10sm15697567pfw.28.2021.08.23.08.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 08:29:32 -0700 (PDT)
Date:   Mon, 23 Aug 2021 09:29:30 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, ohad@wizery.com
Subject: Re: [PATCH v3 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
Message-ID: <20210823152930.GA595498@p14s>
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
 <20210717234859.351911-3-martin.blumenstingl@googlemail.com>
 <20210728175823.GA2766167@p14s>
 <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
 <20210805161506.GA3205691@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805161506.GA3205691@p14s>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Aug 05, 2021 at 10:15:06AM -0600, Mathieu Poirier wrote:
> On Wed, Aug 04, 2021 at 11:03:57PM +0200, Martin Blumenstingl wrote:
> > Hi Mathieu,
> > 
> > thanks for taking the time to look into this!
> > 
> > (I will address any of your comments that I am not mentioning in this
> > email anymore. Thanks a lot for the suggestions!)
> > 
> > On Wed, Jul 28, 2021 at 7:58 PM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > [...]
> > > > +     writel(FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> > > > +                            priv->sram_pa >> 14),
> > > Indentation problem
> > The idea here is to align priv->sram_pa with AO_REMAP_REG0... which
> > are both arguments to FIELD_PREP
> 
> Right, this is what I would have expected.  When I applied the patch on my side
> "priv->sram_pa ..." was aligned wiht the 'M' of "AO_REMAP_ ...".  
> 
> > Maybe using something like this will make that easier to read:
> >     tmp = FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> >                                      priv->sram_pa >> 14);
> >     writel(tmp, priv->remap_base + AO_REMAP_REG0);
> 
> I think the main problem is that
> AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU is simply too long.  I
> suggest making is shorter and add a comment to describe exactly what it does.
> 
> > 
> > What do you think: leave it as is or use a separate variable?
> > 
> > [...]
> > > > +     usleep_range(10, 100);
> > >
> > > I've seen this kind of mysterious timeouts in other patchset based vendor trees.
> > > You likely don't know why it is needed so I won't ask.
> > unfortunately this is also the case here
> > 
> > [...]
> > > > +     priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
> > > > +     if (IS_ERR(priv->arc_reset)) {
> > >
> > > Function __reset_control_get() in __devm_reset_control_get() can return NULL so
> > > this should be IS_ERR_OR_NULL().
> > The logic in there is: return optional ? NULL : ERR_PTR(-...);
> 
> Ok, so you meant to do that.  And I just checked reset_control_reset() and it does
> account for a NULL parameter.  I'm good with this one but add a comment to
> make sure future readers don't think you've omitted to properly deal with the
> NULL return value.
> 
> > I am requesting a mandatory reset line here, so reset core will never
> > return NULL
> > See also [0]
> 
> Indeed, I've read that too.  Nonetheless __reset_control_get() can return NULL
> by way of __reset_control_get_from_lookup().
> 

You are correct, in your case checking for IS_ERR() is sufficient.

> > 
> > For this reason I am not planning to change this
> > 
> > [...]
> > > This driver is squeaky clean. With the above:
> > >
> > > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > awesome, thank you!
> > 
> > 
> > Best regards,
> > Martin
> > 
> > 
> > [0] https://elixir.bootlin.com/linux/v5.14-rc4/source/include/linux/reset.h#L227
