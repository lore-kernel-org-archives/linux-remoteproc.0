Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AB4C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Apr 2022 17:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353840AbiDLRuV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Apr 2022 13:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbiDLRuU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Apr 2022 13:50:20 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AAF5D5CE
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Apr 2022 10:48:02 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id f3so18159496pfe.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Apr 2022 10:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kBQhwTh4wGFWQQwe4mM4wltP+peU9rNcUNkHbTMG0qg=;
        b=oM7dH7p7ixQjtv91MZcAmU9zCDwrKw6QynMRiSX5QxutMf0ZdCJgbAgDI3wJL5UPpr
         6FNHRy3Pr24OYLzFQqtgyX6b4MNf3y71tgLfbqW0trh7/KnJE/0HQAploRCAyFaZYvM8
         tw4EdzYpXIYkg4ExyuFf3MB5rg8/wUR31ymFufKgvNZDXMx+s4ypDJfnPQjaYCcRXB9g
         SQ/Z28O0piaUYOJ3l4THQfw26JLJwXgZEP271PAEgipV9/Ot8KaQrsUgIvOsxvU/cdXX
         L1B/z6tDEFv9hPe1xt8fkP7DujOqR4Jz+vP3s0wHPv7PzwlDtqw0eJ1B+O1cSEfek26o
         T66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kBQhwTh4wGFWQQwe4mM4wltP+peU9rNcUNkHbTMG0qg=;
        b=Tdw2h9icTOPtaQbrAgwuPu4X36rAF8oQcuGaYyd1pYzPpqTxHDoMtZUSr10m2gszcz
         WxNBi64EcQFtcci2qFYQDGsBawRfYqfZ2dfTxUDHZZw2o7GZIMLMvX2XTMwfPJUbORX9
         B1z4T/gkNVfm61NHD6sg4T6sRr500ZkU6r/Z4tniio3yZ5KgiSCqgl6jmT0kRx6sUeju
         PhDFtLWnKKFsMtoxQuiDQMmDBzMfCiU1ZZ+PmNZL+xMFS0+CCyEm3zOLTTjxdofDdjfm
         8CXqdJvDNOZTnbhRFRUV1IiDm3YJNf9xGwSmCT3vuju6KeecplMW4bPqeqbNyS6wfFWU
         s1/w==
X-Gm-Message-State: AOAM531k/6hUN+jvBp0TLP77B5OFDxrT4sZbIJ5OqGorYoXrlSxmrtBV
        rClMZgCaADTHpMEfHcj0WTlE2w==
X-Google-Smtp-Source: ABdhPJy0V0sgG6uM7pznulDzc1E8eQeVDwDpFM11r3aOV36Hr5GwPLKpjkcmRjXwpK47iDiMzaJ6dg==
X-Received: by 2002:a63:ec0c:0:b0:39d:3aa6:4513 with SMTP id j12-20020a63ec0c000000b0039d3aa64513mr11851204pgh.391.1649785682142;
        Tue, 12 Apr 2022 10:48:02 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 13-20020a17090a0ccd00b001cb8984dc28sm137579pjt.22.2022.04.12.10.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:48:00 -0700 (PDT)
Date:   Tue, 12 Apr 2022 11:47:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, shengjiu.wang@nxp.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] remoteproc: elf_loader: skip segment with memsz as
 zero
Message-ID: <20220412174758.GB465495@p14s>
References: <20220323064944.1351923-1-peng.fan@oss.nxp.com>
 <20220323064944.1351923-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323064944.1351923-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Peng,

On Wed, Mar 23, 2022 at 02:49:43PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per elf specification,
> p_filesz: This member gives the number of bytes in the file image of
> the segment; it may be zero.
> p_memsz: This member gives the number of bytes in the memory image
> of the segment; it may be zero.
> 
> There is a case that i.MX DSP firmware has segment with PT_LOAD and
> p_memsz/p_filesz set to zero. Such segment needs to be ignored,
> otherwize rproc_da_to_va would report error.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index d635d19a5aa8..cb77f9e4dc70 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -181,7 +181,14 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		bool is_iomem = false;
>  		void *ptr;
>  
> -		if (type != PT_LOAD)
> +		/*
> +		 *  There is a case that with PT_LOAD type, the
> +		 *  filesz = memsz = 0. If memsz = 0, rproc_da_to_va
> +		 *  should return NULL ptr, then error is returned.
> +		 *  So this case should be skipped from the loop.
> +		 *  Add !memsz checking here.

There are several architecture where XYZ_da_to_va() does not return a NULL
pointer when @len is 0, making this comment inaccurate.  Please remove that
part.

> +		 */
> +		if (type != PT_LOAD || !memsz)
>  			continue;

I have reflected long and hard on this one...

If @memsz is 0 then @filesz _has_ to be 0, otherwise rproc_elf_load_segments()
returns -EINVAL.  If @filesz is also 0 then nothing gets copied (for
architectures where XYZ_da_to_va() doesn't return a NULL pointer when @len is
0), which is exactly the same as what the above change does. 

As such I am inclined to view this set favourably.  That being said we will
have to proceed cautiously.  If something breaks we will have to revert it.

Please send another revision as quickly as possible so that it can stay in
linux-next long enough to, hopefully, catch any problems.

With the above and for this set:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
>  
>  		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
> -- 
> 2.25.1
> 
