Return-Path: <SRS0=Skgh=52=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C531C2BB85
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Apr 2020 01:22:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F418D20769
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Apr 2020 01:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4QXqN8O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgDJBWS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Apr 2020 21:22:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43490 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgDJBWS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 21:22:18 -0400
Received: by mail-pg1-f194.google.com with SMTP id s4so322950pgk.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2020 18:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Q2KcR5vivg2vLIlkBGPIg0aMjasX9J0lCrxGu0EU40=;
        b=Q4QXqN8ObBhFo5YYd5MXFVPJmG6I8IpB8kCIEceSLNZEiohuJ1hYR1jU1OcFgHcgKQ
         NCzttmwJPGmGfkCMah1sHDOmdzepxCuLdX99/aWpWxiIoZOD7WM8w9+f6zXK+/Vuq9fl
         qnyw8+a+JSXDKZxg1FzlzhDpB8coXYjo9SJJiY1lyE04ppVt/tedfkdEJV9jwb7Hkw0B
         t0KEPJ2x3CRfar+D730Z3uT0m4LB3ADMTvFPduqnJttjbV8BYJD6UIEb2S77OLOq2D4e
         gXbG8UsCNFKtcqanJZV2VWqAa5c/gNuD63Bf0c9q97MTkHEgzy6RB97N9RHa7i676ygs
         0/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Q2KcR5vivg2vLIlkBGPIg0aMjasX9J0lCrxGu0EU40=;
        b=MYjFQ8ix4LWqY8RmzjEuPqfqnlfrZeSYu4fewkEyPf2SIs5RpvmbvX280YjOXJU+Wt
         /hZW89b/qMAAz76ZXvJUOY3W1qv9/GJWwE4xf7DdBendP3eh2wJ87cMAFKg+Wa05B1V1
         xgtp+FJrKizbcPxTzqfBpYtK5wz2BZRCTPuHYX2JYZzqBk/BYTqUIySXALR7bqVQLMbL
         weysyks5xgo3edPsQzSfDiQVduCMWe2o7v7sb6VsB9k6g8RatgGHnYwd9Ar8JUvW74nd
         9Ydul4WHvVBFiVDNkrmaHgxZjuI+nU6FsTS9LmGuVMN+IyDKzsq5FVqrgdoJLI++YmEt
         UenQ==
X-Gm-Message-State: AGi0PubPhOWTiKeh/D0gb3+m/qvlodQA3ydJubJtRLZk5azN+S+Due9U
        tFEV/QJWcU/Yl6fKbRxs/motSEDm218=
X-Google-Smtp-Source: APiQypLpOQFFR0tNf0woJcisRcnRh6SPZmJIFjx7rMqYqS9XD1Mx0/cSXdRJSatERIidaB8va0hhwg==
X-Received: by 2002:aa7:86cf:: with SMTP id h15mr2628240pfo.263.1586481737786;
        Thu, 09 Apr 2020 18:22:17 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u3sm337755pfb.36.2020.04.09.18.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 18:22:17 -0700 (PDT)
Date:   Thu, 9 Apr 2020 18:22:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 2/2] remoteproc: use filesz as backup when translate
 memsz fail
Message-ID: <20200410012226.GV20625@builder.lan>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
 <1586420572-28353-2-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586420572-28353-2-git-send-email-peng.fan@nxp.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200410012226.VZ-ry_-n2wGNUIhf2476xz0OjFJiepEUTH-keF_GBhc@z>

On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:

> Since we no need memset if memsz is larger than filesz, we could
> use filesz for the da to va translation when memsz translation fail.
> 

To me this implies that the firmware has a segment that's larger than
the memory that it's going to run in. I think even if we're not writing
to the entire memsz, asking da_to_va for the entire memsz provides a
valuable sanity check.

Regards,
Bjorn

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index cc50fe70d50c..74d425a4b34c 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -229,8 +229,16 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		if (!ptr) {
>  			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
>  				memsz);
> -			ret = -EINVAL;
> -			break;
> +
> +			ptr = rproc_da_to_va(rproc, da, filesz);
> +			if (!ptr) {
> +				dev_err(dev,
> +					"bad phdr da 0x%llx mem 0x%llx\n",
> +					da, filesz);
> +				ret = -EINVAL;
> +				break;
> +			}
> +
>  		}
>  
>  		/* put the segment where the remote processor expects it */
> -- 
> 2.16.4
> 
