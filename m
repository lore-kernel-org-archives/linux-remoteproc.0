Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB23DC433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 16:58:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C1CA222EA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 16:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwtsdkSt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730645AbgJSQ6k (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 12:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730356AbgJSQ6j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 12:58:39 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BD8C0613D0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 09:58:39 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id q21so282815pgi.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 09:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JnKBqiVPCUZogEowjztR7BAxa3AoxcS+bS5AdwrjCEo=;
        b=LwtsdkStSJkKaZfp2gwZS5LjXrN+2QRD3Zg8fYk4x3vK+m2XY52+0BOnjhAtRUvY65
         JwsIk/RszcuzbchFGdgJ0A/ChDlHglioMu7Qwuh6+23fslNYZB3IyYbl6aTBFK2LRLxJ
         AXRBQmVwF7McFh2AO6lOQDSulGsuLUkV8gjeMOoIksNjRbs72WSGLhmhe17Z2hHDZSmu
         HxbQmYjG4bNHLGA4x1GOW7yD7GVhMuAbD2tpQ8RWG0yq8E61tr6Q3BbWIFaHFzMa+tJc
         VpnO+Z5Eg8Gbmb/NRiA35d9HU2VUyggXODiIYPnQj4R7tagz0PbC3rqTiKrou+hK0I32
         2VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JnKBqiVPCUZogEowjztR7BAxa3AoxcS+bS5AdwrjCEo=;
        b=odEiqdED0eoeqRLltA/c9VxV52boYOAGDtUdoueBZkXtX5CqQV9fD2J9+aT2jzIP0q
         aq9tYEEiEHz37iIqv2mEKEAn3SiiDceFJJRYm9TYrsbu1NPxNPs711VVJ6fBGphoOiQP
         RIlYKPNOtiY54R5rA8DrM7dAytZaRfDShHoV4XLbT4sRmzVCQh0MtHt6vCq6/mmFojyW
         ibUBgZwFJNoFGWuxs8xoYIGgDzHizpvCg148o+sadReoQbASMjRRo2REtoUi0Ol8AWYF
         qVD8atIzrsrb6RBQMnd0oiHMCawkI3GuCSiPL9XzC86XdbZBJ/8y5Frz++L16DUMjeRX
         ZSBg==
X-Gm-Message-State: AOAM531vsSejY03WewW2xTIr+WXo3M5odVENfrb4b9/GRv6+AAvOD6fJ
        w/sjlhgWZonyTUL9HpGbtye9BQ==
X-Google-Smtp-Source: ABdhPJwlye7aQSicTs24CltVgwd7j+JZRLatEs81/2/YGvnuDJkBXaWq/REbtaoK7HycIMYoYc+D9g==
X-Received: by 2002:a62:503:0:b029:13e:d13d:a0f9 with SMTP id 3-20020a6205030000b029013ed13da0f9mr484841pff.21.1603126719149;
        Mon, 19 Oct 2020 09:58:39 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q13sm390220pfg.3.2020.10.19.09.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 09:58:38 -0700 (PDT)
Date:   Mon, 19 Oct 2020 10:58:36 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH V2 1/7] remoteproc: elf: support platform specific memory
 hook
Message-ID: <20201019165836.GA496175@xps15>
References: <20200927064131.24101-1-peng.fan@nxp.com>
 <20200927064131.24101-2-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927064131.24101-2-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Peng,

On Sun, Sep 27, 2020 at 02:41:25PM +0800, Peng Fan wrote:
> To arm64, "dc      zva, dst" is used in memset.
> Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,
> 
> "If the memory region being zeroed is any type of Device memory,
> this instruction can give an alignment fault which is prioritized
> in the same way as other alignment faults that are determined
> by the memory type."
> 
> On i.MX platforms, when elf is loaded to onchip TCM area, the region
> is ioremapped, so "dc zva, dst" will trigger abort. And ioremap_wc()
> on i.MX not able to write correct data to TCM area.
> 
> So we need to use io helpers, and extend the elf loader to support
> platform specific memory functions.
> 
> Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 20 ++++++++++++++++++--
>  include/linux/remoteproc.h                 |  2 ++
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index df68d87752e4..6cb71fe47261 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -129,6 +129,22 @@ u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  }
>  EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>  
> +static void rproc_elf_memcpy(struct rproc *rproc, void *dest, const void *src, size_t count)
> +{
> +	if (!rproc->ops->elf_memcpy)
> +		memcpy(dest, src, count);
> +
> +	rproc->ops->elf_memcpy(rproc, dest, src, count);
> +}
> +
> +static void rproc_elf_memset(struct rproc *rproc, void *s, int c, size_t count)
> +{
> +	if (!rproc->ops->elf_memset)
> +		memset(s, c, count);
> +
> +	rproc->ops->elf_memset(rproc, s, c, count);
> +}
> +
>  /**
>   * rproc_elf_load_segments() - load firmware segments to memory
>   * @rproc: remote processor which will be booted using these fw segments
> @@ -214,7 +230,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  
>  		/* put the segment where the remote processor expects it */
>  		if (filesz)
> -			memcpy(ptr, elf_data + offset, filesz);
> +			rproc_elf_memcpy(rproc, ptr, elf_data + offset, filesz);
>  
>  		/*
>  		 * Zero out remaining memory for this segment.
> @@ -224,7 +240,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		 * this.
>  		 */
>  		if (memsz > filesz)
> -			memset(ptr + filesz, 0, memsz - filesz);
> +			rproc_elf_memset(rproc, ptr + filesz, 0, memsz - filesz);
>  	}
>  
>  	return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 2fa68bf5aa4f..1f5fa2c772df 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -392,6 +392,8 @@ struct rproc_ops {
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	void (*elf_memcpy)(struct rproc *rproc, void *dest, const void *src, size_t count);
> +	void (*elf_memset)(struct rproc *rproc, void *s, int c, size_t count);

As with every other operations, the above two addition should be documented.

With that:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	unsigned long (*panic)(struct rproc *rproc);
>  };
>  
> -- 
> 2.28.0
> 
