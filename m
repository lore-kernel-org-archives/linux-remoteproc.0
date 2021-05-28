Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDF6C47087
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 04:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75DD9613DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 04:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhE1EUB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 00:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhE1ETy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 00:19:54 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66213C06174A
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 21:18:00 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id c3so3024872oic.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 21:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0XNV7usCBQG7IKqGs/iEc1hnq8nlSXpsmXeWkLciLkE=;
        b=ZoRswZ4gYO5MnCJ88IP2JhKPZ8fO6WhxSgBjAiVca0fNYJBj/jzjMzYUuOTdvK9mw3
         Tl+mX6YUr1/AD95KYCUrjy2sUK2ppsKhZoH9pzZCsSpI60D2qqwFQEmJuaIhc1Nv2/qv
         79qbnIwRA/rA1/07BAkzA4gOaEHPH2XM0DOTqTbetbUzj3FcQ0EfshIMBsQ5U9KAdjcI
         dLx/+bydYXUUVmjhZ1WsACuWXwqc/uDATP6l8e8j/8Ke9ze0L/CIb8c5RDOKratFcsXV
         NyoCWtQq9RDzWcxERbD/2kgj0AHRFNbB3yJEoHoadOzvLrm4QD52k8fix1V3u9j/DPIE
         qoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0XNV7usCBQG7IKqGs/iEc1hnq8nlSXpsmXeWkLciLkE=;
        b=oRGentcGn6bJwQOex4lrCYZXpk10H14aToRlstqiz9NJhPiXGz3fvXwUZiUWfKJdX5
         Ml5l50116aZkYDXkgDNAShVpYwFUa8hC7TXQQ0Tsbj58zFi0cMRKJpGzzYV1qg76efdP
         pZtuqdWWmU5gfEwgFvdMgbC+4HESDkbEj/fxP6vVC+cI+WKE9aea+Eb4MBQp3pn6TMVP
         2eTMIEf70o6GsVjwuuH94MHvZVcutnaJeHe6I/OvwbY5eQUHq5dMkJgPeJdUeH3b4lbZ
         3YEXqtMr7YNQdy3twE+OArXm3QicjEG88RPnldKUEw0tyOcWCdLpZMCbNtWW0aDiXhTY
         KDZg==
X-Gm-Message-State: AOAM5321cUWuKn2eQ6nJc0BifR9OAPTUOOteDoFIxko5RuSmfO0Rvu0r
        GNoZQoSNwKmIAVh/lyZqkiSR4pifDGf+tw==
X-Google-Smtp-Source: ABdhPJxlhovwd28C6GM3k2GPbbSWUgsfHo25XhDhYVqc6DmhQitfLBWlCfFpxRWzcFWfCurnpVr5tg==
X-Received: by 2002:a05:6808:7c1:: with SMTP id f1mr4620540oij.142.1622175479598;
        Thu, 27 May 2021 21:17:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v18sm870619oos.23.2021.05.27.21.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 21:17:59 -0700 (PDT)
Date:   Thu, 27 May 2021 23:17:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] remoteproc: Introduce rproc_detach_device() wrapper
Message-ID: <YLBu9Wr1vNiwsfWT@builder.lan>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522000309.26134-2-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 21 May 19:03 CDT 2021, Suman Anna wrote:

> The .attach() rproc ops is invoked through the helper
> rproc_attach_device(), but the .detach() ops is invoked
> directly at present. Introduce a similar wrapper function
> rproc_detach_device() for .detach() ops so that the code
> is symmetric.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 2 +-
>  drivers/remoteproc/remoteproc_internal.h | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 6348aaa42bbb..6019f46001c8 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1869,7 +1869,7 @@ static int __rproc_detach(struct rproc *rproc)
>  	}
>  
>  	/* Tell the remote processor the core isn't available anymore */
> -	ret = rproc->ops->detach(rproc);
> +	ret = rproc_detach_device(rproc);
>  	if (ret) {
>  		dev_err(dev, "can't detach from rproc: %d\n", ret);
>  		return ret;
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index a328e634b1de..931d50b6a0d1 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -121,6 +121,14 @@ static inline int rproc_attach_device(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static inline int rproc_detach_device(struct rproc *rproc)
> +{
> +	if (rproc->ops->detach)
> +		return rproc->ops->detach(rproc);
> +
> +	return 0;

I was going to complain that this will silently succeed to detach a
remoteproc when the driver doesn't implement detach, but then I realized
that in the current code path we just failed if it wasn't set.

So this only becomes a problem if we're out of sync between the wish to
detach and the implementation of detach, in the later patch.


But based on this, why do we allow rproc_attach_device() to succeed even
though a driver doesn't implement attach? Could we achieve the symmetry
by going the other way?

Regards,
Bjorn

> +}
> +
>  static inline
>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  {
> -- 
> 2.30.1
> 
