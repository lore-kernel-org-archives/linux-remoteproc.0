Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD3FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 12 Mar 2022 15:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiCLPPm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 12 Mar 2022 10:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbiCLPPl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 12 Mar 2022 10:15:41 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B343814076D
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 07:14:35 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id x26-20020a4a621a000000b00320d7d4af22so14256321ooc.4
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 07:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XrmEyB7IDUavpAU+hVZaSS1ylPmd23y2TFivsTEMO/o=;
        b=OdcNcGV7f/4VAkvYKCV0YOgvD23rPEHXivCSFnPEZUExJx+LKeL8VMUUyH2fe/jb0v
         4VNYkpfWUtIg2deFEBDhsmIGpTnAeXAUVca8RztnWcel55ceWfdzqw2DYQ3F+BWRsK5Y
         i9Gzfk2E0h8bHYBKTaYaBLLSPJZaRWwW5lgiVq7IrJYq3W/7yXV1Ejh/HlNhqtgWOXpw
         QkXT1F7TerFqUjcZWCE5FD4qxY4Bj5Vu+s2BFjJ3VGS7PIYsxRGtUx33hZSJwMsjmcaL
         6Qi/nyDGi+06sQRncOaeYYGVyC7Gt0Mf9DyYefkKAp0ead2+aLEdnGlyH/Sk/SukLMxE
         x4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XrmEyB7IDUavpAU+hVZaSS1ylPmd23y2TFivsTEMO/o=;
        b=3yxSnBsk0Ld/lnoooXDhu/IsTgVRumUz13cVVfwmFekRkhyQkJxUaQnK0s0/bfLI+L
         0o07BjQGYvFd6lCIHjlIxkdY96omERvJaOOfXnAlyeAR2fFMfBHvncCZ/uZ6A7aZnd4m
         f7I/Cd/S0rc10SwiMlMxEh1nVDwwO7EVg/4sl5aOfQjhQDpUBDqZg+65Klqa2dBKLsfH
         XtK/IlUkpYu9AhQAH+lKoL4YiwOlW7z51ARkMfoD40ZGJoV7VobdLrGxsFg8sKzY7Qls
         7ayENZn5rpP2ym2MCvqxhjcBO4g9JOF7cVfVvc2rjI3nKp8eHvJNT2AfpDffOqLRqoB0
         eXBA==
X-Gm-Message-State: AOAM531ZBfur7mjc2DpvB5Qy79rBhGF8Obu983GP02gqshtcjcZtPrXe
        G76zXdbZdYAdwzKwP/YqGij0ew==
X-Google-Smtp-Source: ABdhPJyTBtZ8U6HvvHazgGCDsDSxAeMpMjp39lKf2zRqFn7X4CXbOgvahpED7QwvxNyamuW4PXXv4w==
X-Received: by 2002:a05:6870:6394:b0:da:b3f:2b27 with SMTP id t20-20020a056870639400b000da0b3f2b27mr14186500oap.198.1647098075076;
        Sat, 12 Mar 2022 07:14:35 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id l31-20020a0568302b1f00b005b272c60230sm4105250otv.40.2022.03.12.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 07:14:34 -0800 (PST)
Date:   Sat, 12 Mar 2022 09:14:32 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tim Blechmann <tim.blechmann@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, Tim Blechmann <tim@klingt.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH 1/1] rpmsg: char - treat `ENOMEM` as `EAGAIN`
Message-ID: <Yiy42BBHJO11GGhG@builder.lan>
References: <20220214093020.1765833-1-tim@klingt.org>
 <20220214093020.1765833-2-tim@klingt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214093020.1765833-2-tim@klingt.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 14 Feb 03:30 CST 2022, Tim Blechmann wrote:

> `rpmsg_trysend` returns `-ENOMEM` when no rpmsg buffer can be allocated.

Please use the form rpmsg_trysend() - without ``. You can omit that
around -ENOMEM as well.

> this causes `::write` to fail with this error as opposed to `-EAGAIN`.

Please drop the :: here as well.

> this is what user space applications (and libraries like boost.asio)
> would expect when using normal character devices.
> 
> Signed-off-by: Tim Blechmann <tim@klingt.org>

I attempted to fix up the above details, but unfortunately your
Signed-off-by doesn't match your From:, so I can't apply the patch
anyways.

Can you please resubmit this with appropriate author/s-o-b?

> CC: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 5663cf799c95..5b9e708d595a 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -239,14 +239,17 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
>  
>  	if (!eptdev->ept) {
>  		ret = -EPIPE;
>  		goto unlock_eptdev;
>  	}
>  
> -	if (filp->f_flags & O_NONBLOCK)
> +	if (filp->f_flags & O_NONBLOCK) {
>  		ret = rpmsg_trysendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
> +		if (ret == -ENOMEM)
> +			ret = -EAGAIN;
> +	}
>  	else
>  		ret = rpmsg_sendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);

./script/checkpatch.pl --strict tells me that you should have {} around
the else block as well..

Thanks,
Bjorn

>  
>  unlock_eptdev:
>  	mutex_unlock(&eptdev->ept_lock);
>  
> -- 
> 2.35.1
> 
