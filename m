Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33DEC1B0D8
	for <linux-remoteproc@archiver.kernel.org>; Sat,  5 Dec 2020 00:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A41B922B40
	for <linux-remoteproc@archiver.kernel.org>; Sat,  5 Dec 2020 00:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730692AbgLEARl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Dec 2020 19:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730647AbgLEARl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 19:17:41 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37931C061A4F
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Dec 2020 16:17:01 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id t205so8172098oib.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Dec 2020 16:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=utTeGzYjnre0QYpGB+o+Kx5Eh/EBZWte4MIpGCS97Mk=;
        b=RnvGMIvVG6Xy37R27w0nFCZsfL8SMYfr1j2g6qflxujBDijVLd19buyf8rD4Nict9a
         JYI9wOCh94Yhtz+hVW/NRKrwlNM+VygZrGeFtpzetbkMWcE5xrE1uJs0fURBEjLdGEui
         gTaC9pGyXUYKYc7lv0jypQ9tygpmh/+h2bZyVq9Qo0t+CK4AFnm23uuxcSb0XBfs2OHs
         RTXC5sWfQ0v5CQdk+RSPcRB8EOhoPcuQmj3c75PJoclm9PeOr2dHU81165ghKLCK+ETT
         veCpidLi8ww6qq92kNe7xD9dhB+lWUoxD2BfNKKoJf9Ndc1NMSoAANI6yofqqiaR1n04
         LFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=utTeGzYjnre0QYpGB+o+Kx5Eh/EBZWte4MIpGCS97Mk=;
        b=GJxt86BjnjokNDQOvC7plJ6OZMdh8/QpmI0uDPyegNkYXC08AFiCQkdXpqaPz0u9fS
         gkdVN2v4A2YICpHXahHGJ/PLrvmpI6tBASE27jijANUNshQQJXj8n1VnZssZ3qxogHVO
         MWQVKTuiPxrYgnQp2ItacDvlNGgTdbJlo0Tdq2oMZcIflM0xiHCQ/NNpdGwLA4LZnEat
         KbPs9ncx/5e+SJ5D1kcSd+0Ii5lSJPmrr0j3YTQPLTB078OL9xtdDgoLtAdEP53AEGr/
         8soEZqCGJPbMC+QcavPe1oQcOQnQxGkLP04typJZE8HLKRoSNORdU5K5p0uyX9LsfveE
         EUAQ==
X-Gm-Message-State: AOAM533YkN9QuUxKpYIoeJvmYecF8ZDv3cmlVuhfT+5tEv+fHBG1wiKj
        eJ58YKjdvPLeaEw8mmeuZApHJw==
X-Google-Smtp-Source: ABdhPJxfhocvHXizIEP4tvs8LbPR8A8BuVXu9GscgqkwyR3FWCBYfhdQFs9rxANMhBsPduJ4JO39rQ==
X-Received: by 2002:aca:6106:: with SMTP id v6mr5106782oib.158.1607127420378;
        Fri, 04 Dec 2020 16:17:00 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r7sm1013171oih.21.2020.12.04.16.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 16:16:59 -0800 (PST)
Date:   Fri, 4 Dec 2020 18:16:57 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH V3 1/7] remoteproc: elf: support platform specific memory
 hook
Message-ID: <X8rRedNHet9gm5lJ@builder.lan>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
 <20201204074036.23870-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204074036.23870-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 04 Dec 01:40 CST 2020, Peng Fan (OSS) wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
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
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 20 ++++++++++++++++++--
>  include/linux/remoteproc.h                 |  4 ++++
>  2 files changed, 22 insertions(+), 2 deletions(-)
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

Looking at the current set of remoteproc drivers I get a feeling that
we'll end up with a while bunch of functions that all just wraps
memcpy_toio(). And the reason for this is that we are we're "abusing" the
carveout to carry the __iomem pointer without keeping track of it.

And this is not the only time we're supposed to use an io-accessor,
another example is rproc_copy_segment() in rproc_coredump.c

It also means that if a platform driver for some reason where to support
both ioremap and normal carveouts the elf_memcpy op would be quite
quirky.


So I would prefer if we track the knowledge about void *va being a
__iomem or not in the struct rproc_mem_entry and make rproc_da_to_va()
return this information as well.

Then instead of extending the ops we can make this simply call memcpy or
memcpy_toio() depending on this.

Regards,
Bjorn

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
> index e8ac041c64d9..06c52f88a3fd 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -373,6 +373,8 @@ enum rsc_handling_status {
>   *			expects to find it
>   * @sanity_check:	sanity check the fw image
>   * @get_boot_addr:	get boot address to entry point specified in firmware
> + * @elf_memcpy:		platform specific elf loader memcpy
> + * @elf_memset:		platform specific elf loader memset
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
>   */
> @@ -392,6 +394,8 @@ struct rproc_ops {
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	void (*elf_memcpy)(struct rproc *rproc, void *dest, const void *src, size_t count);
> +	void (*elf_memset)(struct rproc *rproc, void *s, int c, size_t count);
>  	unsigned long (*panic)(struct rproc *rproc);
>  };
>  
> -- 
> 2.28.0
> 
