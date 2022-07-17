Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E640C43334
	for <linux-remoteproc@archiver.kernel.org>; Sun, 17 Jul 2022 04:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbiGQEH1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 17 Jul 2022 00:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232491AbiGQEH0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 17 Jul 2022 00:07:26 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B344F1EC43
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Jul 2022 21:07:25 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-10bf634bc50so15817347fac.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Jul 2022 21:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7maQPp/4L1DRl1i7L7WTXN1f8HRR3AHs0CFk6kAGA8Q=;
        b=i1XgxSFl0g91RDOuxsh9q01eMgRrA8bv2u7c2UnsQMI5vi4DxPAtRaiEeOUbyTP44p
         tSdWldY8Uz84HdD1Oran6Ckr6GSVx+bnQh79xSSKOzhgYknyul7NwCOWUbksJ5dQKI9O
         cNoWTV0OxpVNeOvL8FL1Wx41LfoVW9ALmGPvuipft/j31vt+xs1OExAYLdk/iMLLo8fl
         GuzU/1mn0+U+G+CdjWXLSaMbajEQEVj2pNkkPkjA3JNuqk2YN64WcyLplcjYzUb8if2d
         llyoNn4PzA98R2PuE2+9G18mWebPGfYMZ4IFms2JMfRfYs0nnGp2D1ClbI5WCdIr7afp
         X/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7maQPp/4L1DRl1i7L7WTXN1f8HRR3AHs0CFk6kAGA8Q=;
        b=poPuUg0eohdaYegAraBOxkZTG4xI/GfSJyDsUD9PKYU5amJCapn7pOijFfmXbbltAl
         gISzm5mUEyF0Er+OryxvkLj+UEgCrfhLVz1lbEp0PiHGysxbLQzdu+g+L1+z5KapZerf
         6ldooa5ckvfyhAcyEwALvr+Gd2MoSP3+pJrtxTKbhN/EW8UKLOSe9WWtab/lUUX0TUHV
         aTnprRoVZCRMS/3QXmP8POGnzsyrwX6fmcke1NrluZclHrboY19waQT5wDqPgu+PemrS
         Cik3TzX3apoWEqQDI4jmriBnn3qbdy59si28xfxvDw1tMVaKK60hmUq+jjD+XBCCXkCu
         C8lw==
X-Gm-Message-State: AJIora+A17IqwkYNYb9miMc8HI4CXwr7ZGS6COW1jNdc4KbqV35iJfLd
        dGC1gQ0XlQf6UNr1oTvwP18u2a9dhR1mpg==
X-Google-Smtp-Source: AGRyM1soOTh116D1hmoH+Xdok8zxWlIALX53UC2OQFWne2aFFcUGrDFbpWfpf6vA0yauAhA8V7maUQ==
X-Received: by 2002:a05:6870:2490:b0:101:d94b:c9fd with SMTP id s16-20020a056870249000b00101d94bc9fdmr10910528oaq.73.1658030845116;
        Sat, 16 Jul 2022 21:07:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w21-20020a9d6755000000b0061c9c7813d4sm547368otm.24.2022.07.16.21.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 21:07:23 -0700 (PDT)
Date:   Sat, 16 Jul 2022 23:07:21 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     mathieu.poirier@linaro.org, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] remoteproc: core: check state in rproc_boot
Message-ID: <YtOK+XU+dtqfnsox@builder.lan>
References: <20220519064111.3244079-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519064111.3244079-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 19 May 01:41 CDT 2022, Peng Fan (OSS) wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> If remote processor has already been in RUNNING or ATTACHED
> state, report it. Not just increment the power counter and return
> success.
> 
> Without this patch, if m7 is in RUNNING state, and start it again,
> nothing output to console.
> If wanna to stop the m7, we need write twice 'stop'.
> 
> This patch is to improve that the 2nd start would show some useful
> info.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> Not sure to keep power counter or not.
> 

I did discuss this with Mathieu, whom argued in favor of keeping the
refcount mechanism.

I can see that there could be a scenario where multiple user-space
components keep the remotproc running while they are, and if there is
any such user this ABI change would be a breakage.

That said, it's more than once that I accidentally have bumped the
refcount and then assumed that a single stop would tear down the
remoteproc...

>  drivers/remoteproc/remoteproc_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 02a04ab34a23..f37e0758c096 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2005,6 +2005,12 @@ int rproc_boot(struct rproc *rproc)
>  		goto unlock_mutex;
>  	}
>  
> +	if (rproc->state == RPROC_RUNNING || rproc->state == RPROC_ATTACHED) {

If we were to do this would it make sense to boot it out of anything but
RPROC_OFFLINE?

Regards,
Bjorn

> +		ret = -EINVAL;
> +		dev_err(dev, "%s already booted\n", rproc->name);
> +		goto unlock_mutex;
> +	}
> +
>  	/* skip the boot or attach process if rproc is already powered up */
>  	if (atomic_inc_return(&rproc->power) > 1) {
>  		ret = 0;
> -- 
> 2.25.1
> 
