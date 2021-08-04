Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612E8C4338F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Aug 2021 21:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38ED860F35
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Aug 2021 21:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240021AbhHDVEX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Aug 2021 17:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240082AbhHDVEX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 17:04:23 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203FDC0613D5;
        Wed,  4 Aug 2021 14:04:10 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f42so6734003lfv.7;
        Wed, 04 Aug 2021 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bRgs0NPKh4Mw3gD6S/OL3j4+WTypBMMGrOvKDK40lo0=;
        b=DbK0lw1BL42tvqX/clZcnrxev3xx9WcpJBvlbzNzaBPpeLoZ/66un1phJ20lQtU7mp
         3ovVprD8QmuPl5Ah3Z08GKO+RIJoHWc44HDT5iF3n812zdjNKCpywqzK1dYgOkeetMnZ
         aYlQSuwI2I3MXm8L+NuqZ7fYD8mQXyN83hsk0+4XMNtDPw7JelN0ENd9taOeknSMXtKY
         TfYQuFxzYrTd4+2qVKRQHmdRGOhCWliGByO9S8IUrk/OaQMnLJtZci9HA8rTyLfHDyPM
         nU6gl32lzkb5v0PXtk42himNI538Ad4HYhgm7Rw/UNe7a9986mYTW+jAGt52HCdCnTBV
         qupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bRgs0NPKh4Mw3gD6S/OL3j4+WTypBMMGrOvKDK40lo0=;
        b=LvUuXI5oYrf3jZ4jSRLZ5DMR1QIFfDpv8qVEK4y0gWsUt/37Q0/YLpkLJL8k/UUmfq
         ZZJL9rYo358gUjYAZkmVPqAMcgB6bAQ0LLEXb2+en9se6eV3IcIwYlAPRVQc8ygykts7
         1DGOq5aAvrbdX5BIRRDv/WrCnCw9+SV4QN5Z7ziztnsxaYGkOSp4HkgbUvgCGbPYzzGK
         DEffYe2xOG5KsmwwsvTpWXuxbMCOrbSmxBCckIJKIAZEKffK1s0JsuJHiMb6AMYDbvfX
         szAqEiMTNIww0txNfd23xl++bqFMTqDPD7Ie73CIvHM6wpaitNjNcotH430qxz+gwvJ6
         MDwg==
X-Gm-Message-State: AOAM532proK+WBvru59n32UoLpxnMHs314/PLxvsre6gXgIR1QNHvWXo
        rrsPV4npR+su8cueaWYTZLvCrxesAOmZinLWw/s=
X-Google-Smtp-Source: ABdhPJxCGu1zBOUwbc3sME3niD4I85/4MNH4QCPLuk+2DyDyECbtIPi3zXHPCvRxAGKTz1kM4LV2nrn+dLtUad1+fOc=
X-Received: by 2002:a19:c202:: with SMTP id l2mr812180lfc.276.1628111048404;
 Wed, 04 Aug 2021 14:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
 <20210717234859.351911-3-martin.blumenstingl@googlemail.com> <20210728175823.GA2766167@p14s>
In-Reply-To: <20210728175823.GA2766167@p14s>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 4 Aug 2021 23:03:57 +0200
Message-ID: <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
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

thanks for taking the time to look into this!

(I will address any of your comments that I am not mentioning in this
email anymore. Thanks a lot for the suggestions!)

On Wed, Jul 28, 2021 at 7:58 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
[...]
> > +     writel(FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> > +                            priv->sram_pa >> 14),
> Indentation problem
The idea here is to align priv->sram_pa with AO_REMAP_REG0... which
are both arguments to FIELD_PREP
Maybe using something like this will make that easier to read:
    tmp = FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
                                     priv->sram_pa >> 14);
    writel(tmp, priv->remap_base + AO_REMAP_REG0);

What do you think: leave it as is or use a separate variable?

[...]
> > +     usleep_range(10, 100);
>
> I've seen this kind of mysterious timeouts in other patchset based vendor trees.
> You likely don't know why it is needed so I won't ask.
unfortunately this is also the case here

[...]
> > +     priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
> > +     if (IS_ERR(priv->arc_reset)) {
>
> Function __reset_control_get() in __devm_reset_control_get() can return NULL so
> this should be IS_ERR_OR_NULL().
The logic in there is: return optional ? NULL : ERR_PTR(-...);
I am requesting a mandatory reset line here, so reset core will never
return NULL
See also [0]

For this reason I am not planning to change this

[...]
> This driver is squeaky clean. With the above:
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
awesome, thank you!


Best regards,
Martin


[0] https://elixir.bootlin.com/linux/v5.14-rc4/source/include/linux/reset.h#L227
