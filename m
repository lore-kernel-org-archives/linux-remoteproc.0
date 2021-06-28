Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D56C2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 16:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA68D61C65
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 16:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbhF1QTR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Jun 2021 12:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhF1QTQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Jun 2021 12:19:16 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F77C061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jun 2021 09:16:50 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so19331058otl.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jun 2021 09:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sS3AX7gjw8RzAmQQDxkf4nTKNQiXmQsIziEYwVLXXqE=;
        b=Crom6oqZjvmuQ7HTaOKYr32eQUnC7kJJFa1OaRR9nkFkMV75RlDZZiMu8ASZsZdh5m
         LkmEy47LSUq9GavP19ZREQyvyHIb97qXa2i1enG90hWxB/VdZrMJJaXhDasTX6PrGx75
         O23nDYNFsALK4H/zzkolf3zHUHHSoFkxofhGt8cdj0FTt91R4IZ7Y3BZAQy0YpMWgFsm
         aLxoXBUwc0LGOk0f2uEKuLdpZQg+Im/Blo3YmWfunsA7/GJTQn2SaOgYFA+ObtZ1KNOJ
         rsF93vOJGguV5ZirT5cn5AQ7sCMO5untNYCe4nLHwduwGPALV9+nP27vUFnKBVWek82F
         MXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sS3AX7gjw8RzAmQQDxkf4nTKNQiXmQsIziEYwVLXXqE=;
        b=dKp/CFij89CtjDh3hthnwGWTEe27XJeLZLitbsOXhBWCOrb6faGptRPZxBkd0NR9Gl
         96E8qC0AiIlCvYzSNE6TtVkZE4C++zQjFQs4YZ81+fCClqT2zlkWzrreXHbnEJ4q4c/Y
         2W3D2OLGOL97WY2GEis78Rx3FxB0mI8NLXWABSr5AqCl2I9YHtIUzxP/M0lAZ3mamtLG
         BOTeWGC9cFsSLZuNPBb5sk4/+kfyUc7vsxBUVLiuZv6HMPLamGXVRNbKVZg5+uIWA5yg
         oWw+AWVNFaZbSEzxx53eICUws7FtCL08vt+zAf1jlwXE/ivkW+LYCkQaJN6WAWgcovG+
         WDgw==
X-Gm-Message-State: AOAM532mxIpwW0suIR9y1Gve4TU2aLbFOlOTEWb3WVmDEG/PWFFCoqeP
        daqxScVi6+yLY2rq4ZgHiisuqg==
X-Google-Smtp-Source: ABdhPJwZz+jLXv5MDMWYEBw2K8nW1xownzeKeRVGw7taqDhESdaLxCJsIE1l4K6aIdQkx2sKI3yW3A==
X-Received: by 2002:a9d:5e17:: with SMTP id d23mr307765oti.330.1624897009316;
        Mon, 28 Jun 2021 09:16:49 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p10sm3682896otf.45.2021.06.28.09.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 09:16:48 -0700 (PDT)
Date:   Mon, 28 Jun 2021 11:16:46 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] remoteproc: elf_loader: fix loading segment when
 is_iomem true
Message-ID: <YNn17nA7CTaQLTrU@yoga>
References: <20210628070657.7669-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628070657.7669-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 28 Jun 02:06 CDT 2021, Peng Fan (OSS) wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> It seems luckliy work on i.MX platform, but it is wrong.
> Need use memcpy_toio, not memcpy_fromio.
> 
> Fixes: 40df0a91b2a52 ("remoteproc: add is_iomem to da_to_va")
> Tested-by: Dong Aisheng <aisheng.dong@nxp.com> (i.MX8MQ)
> Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 469c52e62faf..e8078efb3dec 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -220,7 +220,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		/* put the segment where the remote processor expects it */
>  		if (filesz) {
>  			if (is_iomem)
> -				memcpy_fromio(ptr, (void __iomem *)(elf_data + offset), filesz);
> +				memcpy_toio(ptr, (void __iomem *)(elf_data + offset), filesz);

Ouch, we should have caught that during the review, thanks for spotting
and fixing this.

That said, it's the ptr that's __iomem, so the cast should be on the
first parameter, not the second.

Regards,
Bjorn

>  			else
>  				memcpy(ptr, elf_data + offset, filesz);
>  		}
> -- 
> 2.30.0
> 
