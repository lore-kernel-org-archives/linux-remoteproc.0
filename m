Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C33CC4338F
	for <linux-remoteproc@archiver.kernel.org>; Sun,  8 Aug 2021 20:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AC7C6056B
	for <linux-remoteproc@archiver.kernel.org>; Sun,  8 Aug 2021 20:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbhHHUh1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 8 Aug 2021 16:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbhHHUh1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 8 Aug 2021 16:37:27 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96414C061760;
        Sun,  8 Aug 2021 13:37:07 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id hs10so25371535ejc.0;
        Sun, 08 Aug 2021 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XsY1naXGPpmVYSXrwp+yqNB1LAnbf0RuN1r5nzhLAKc=;
        b=YpoIJarzT8405VxE8WC4sxtHg96SjtT5fNSHqFIQzaLuckx/pMl6h6p1S0I7ff24IA
         aBHvrn1OEKjvBfZanjTydEWhvbgIm4NrkFvvcEITpHJN2iAbCEbgmyeuSLW/lxUtqsK1
         HLpWOeg+qpCe3q+IX0SvIlbkcG5jad8OW0NX1dle4KmlL7ID5U1NQjVp5bN1PiXy11YP
         wnbQnnfPSRC/vWxBLU7DcvlcIKD+ckvT0uPRHnxorXsWBc3tB1tmJMKwLv78V6CbmYP5
         E0pX0bF5pUfLslrqs/8GeIpU9yFLPcdz5JKvoVWmIt/jdcwiofp4w2B4/pq9L406Pi5C
         dkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XsY1naXGPpmVYSXrwp+yqNB1LAnbf0RuN1r5nzhLAKc=;
        b=Va0WAkcPt6waOuwFt6CgA5oGw6wE7LngFvWgShDsh+XDu5YjoU2L4iGNmUbBwMlHdh
         M6hV9qOo7/r2xwnIRyuUErbsGgz65hHYDjlSML6VjYfFGJ/9TJ795ldIsL+wH9PjY7Qk
         aC2V21uAzdPCW3iZJemAXZf7BTYmm6mkTNUD79YjhSvyWnKFYAFzZrVHw/95YrPxRcDW
         3mRn6ufvNqheAMdnKRdebZYYHusmiZTRXrJfhJsaziMqp2/lySnai/lFvqRr32XimznJ
         +zwBuJnXdxDxlWQn8SnhtxIFxHZWhjVlZbD38vDXfLiUFnqUXVTigEV75T+PadG/zbFZ
         WmgA==
X-Gm-Message-State: AOAM532ZB2Z0+7C4+FrZPHBnF053xNJYpJBapillp5Bpwrl24M3dVN8M
        9nwdvXV6YWVFQmxrSp7e3S+w/fVggt4CdoDXi4I=
X-Google-Smtp-Source: ABdhPJyPS9gMgKESOwyiS54NnGzpCieUBziLcUFhhc9CCfq11oy5PHyTJqO5wmW0KuUFc3nQOb342DcKuvScoSJXQN8=
X-Received: by 2002:a17:906:b0c5:: with SMTP id bk5mr19137983ejb.428.1628455026119;
 Sun, 08 Aug 2021 13:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
 <20210717234859.351911-3-martin.blumenstingl@googlemail.com>
 <20210728175823.GA2766167@p14s> <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
 <20210805161506.GA3205691@p14s>
In-Reply-To: <20210805161506.GA3205691@p14s>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sun, 8 Aug 2021 22:36:55 +0200
Message-ID: <CAFBinCCkOgkzuxZPby-rJeH7ei-G_khiStkX9Zs3w1u1RAd7_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, ohad@wizery.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On Thu, Aug 5, 2021 at 6:15 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
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
AO_CPU_CNTL_AHB_SRAM_BITS_31_20 is used below and when looking at it
now I think the alignment is also strange.
For the next version I'll go with the tmp variable as I think it
improves readability, even with the long(er) macro names.

[...]
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
I could not find where __reset_control_get_from_lookup returns NULL in
case optional is false (which it is in this case because
devm_reset_control_get_exclusive requests a "mandatory" reset line).
Can you please point me to the problematic line(s) as I'd like to send
a patch (which fixes this) to the reset subsystem maintainers

$ git grep -A1 devm_reset_control_get_exclusive | grep IS_ERR_OR_NULL
drivers/remoteproc/ti_k3_r5_remoteproc.c-       if
(IS_ERR_OR_NULL(core->reset)) {
$

I suspect that this can be simplified then as well.


Best regards,
Martin


[0] https://elixir.bootlin.com/linux/v5.14-rc4/source/include/linux/reset.h#L227
[1] https://elixir.bootlin.com/linux/v5.14-rc4/source/drivers/reset/core.c#L932
