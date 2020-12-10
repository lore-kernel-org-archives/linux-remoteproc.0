Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B52C4361B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 16:55:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D41C23BE5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 16:55:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392268AbgLJQzK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 11:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392158AbgLJQzA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 11:55:00 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF63EC0613CF
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 08:54:20 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id 11so5486983oty.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 08:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vurmz2AICTUDcX6IY3FlJE2gspqHSkQXNIWoIOF7OW8=;
        b=gPT7OBlIe/fFjFrU9XH1LNYyZVlhmhZW3pSV4IywxBESC2WFe0OO5mVef0wIY4TK8P
         i/agynuR7JACFOLvWlXWoOtxj5xdyiIaZSiN11LQza1+JhCSiNydUtaMu041+gVy+AkS
         mPJOzWOVfeUKqROG4M1pfiQyiuguaX9uzOwLYPK/wKs3dOwXB6Z2kAdZ230Zb84TZy6j
         ILGi3RjMNGDjDj2xlcMq8OwXIADYcQ4dn1L29tDL3m9pm/59DQ17MO790QvPsXzjE/nE
         JqJHdulEJP6TOR1v4RRa2PeY/Gmoh2cO4Qe6gEsgAt5kcBXPLDYiPr78wDCZx3J9BD8s
         ZiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vurmz2AICTUDcX6IY3FlJE2gspqHSkQXNIWoIOF7OW8=;
        b=KBWlsAYwJgmgGukdDIpvidrxLkU/bMgoumjHnY3uzGH6P11qxak14mfMovw3xdsVT+
         pJmPDBzaUcb+eNR10jjoRJozi1e0+9+RV/GHib9jn56L7DpyJ/2r8g7ETZgzvL+QxhZk
         I6GFkPvDlNQ3zyN+6tEQsyWdQG+smQ1/wf/q/eNELwsUKkKF4MdSNl/68pwwwzV58lBe
         OOOryFuY5zx+8zo1J0Ae0eT+bo/szNfc0fZYLI7IPNwWOCciQk8OrGmBuRaU+1gBTTDy
         ShQnVrqvmFWZjBcg/gnGQQjGw1CHcv4yMdRJx/5hJF6RbvCgxZNtFrF1YONxjJXRdnwo
         nJuA==
X-Gm-Message-State: AOAM530qqLSimKP/5Ajgzn+Cfy2FIFrQDAg47b6SkRNuoryxaA1c5ygN
        z73CvCRId6olrSfJUi37E90b4A==
X-Google-Smtp-Source: ABdhPJzPwVQfOZzDeC8a3Hed8fH1ZnMNEwmW6mcEEm/dAwYIi04Oz2k8ebCpEGW2Ik21A+qTSfM2QQ==
X-Received: by 2002:a05:6830:1352:: with SMTP id r18mr6312865otq.73.1607619259977;
        Thu, 10 Dec 2020 08:54:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r12sm1111949ooo.25.2020.12.10.08.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 08:54:19 -0800 (PST)
Date:   Thu, 10 Dec 2020 10:54:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH V3 1/7] remoteproc: elf: support platform specific memory
 hook
Message-ID: <X9JSuY9tohnN2TCf@builder.lan>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
 <20201204074036.23870-2-peng.fan@oss.nxp.com>
 <X8rRedNHet9gm5lJ@builder.lan>
 <DB6PR0402MB276056A300BD72EA59FC429488CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB276056A300BD72EA59FC429488CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun 06 Dec 20:07 CST 2020, Peng Fan wrote:

> Hi Bjorn,
> 
> > Subject: Re: [PATCH V3 1/7] remoteproc: elf: support platform specific
> > memory hook
> > 
> > On Fri 04 Dec 01:40 CST 2020, Peng Fan (OSS) wrote:
> > 
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > To arm64, "dc      zva, dst" is used in memset.
> > > Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,
> > >
> > > "If the memory region being zeroed is any type of Device memory, this
> > > instruction can give an alignment fault which is prioritized in the
> > > same way as other alignment faults that are determined by the memory
> > > type."
> > >
> > > On i.MX platforms, when elf is loaded to onchip TCM area, the region
> > > is ioremapped, so "dc zva, dst" will trigger abort. And ioremap_wc()
> > > on i.MX not able to write correct data to TCM area.
> > >
> > > So we need to use io helpers, and extend the elf loader to support
> > > platform specific memory functions.
> > >
> > > Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > ---
> > >  drivers/remoteproc/remoteproc_elf_loader.c | 20
> > ++++++++++++++++++--
> > >  include/linux/remoteproc.h                 |  4 ++++
> > >  2 files changed, 22 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> > > b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index df68d87752e4..6cb71fe47261 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -129,6 +129,22 @@ u64 rproc_elf_get_boot_addr(struct rproc *rproc,
> > > const struct firmware *fw)  }
> > EXPORT_SYMBOL(rproc_elf_get_boot_addr);
> > >
> > > +static void rproc_elf_memcpy(struct rproc *rproc, void *dest, const
> > > +void *src, size_t count) {
> > > +	if (!rproc->ops->elf_memcpy)
> > > +		memcpy(dest, src, count);
> > > +
> > > +	rproc->ops->elf_memcpy(rproc, dest, src, count);
> > 
> > Looking at the current set of remoteproc drivers I get a feeling that we'll end
> > up with a while bunch of functions that all just wraps memcpy_toio(). And the
> > reason for this is that we are we're "abusing" the carveout to carry the
> > __iomem pointer without keeping track of it.
> > 
> > And this is not the only time we're supposed to use an io-accessor, another
> > example is rproc_copy_segment() in rproc_coredump.c
> > 
> > It also means that if a platform driver for some reason where to support both
> > ioremap and normal carveouts the elf_memcpy op would be quite quirky.
> > 
> > 
> > So I would prefer if we track the knowledge about void *va being a __iomem
> > or not in the struct rproc_mem_entry and make rproc_da_to_va() return this
> > information as well.
> > 
> > Then instead of extending the ops we can make this simply call memcpy or
> > memcpy_toio() depending on this.
> 
> A draft proposal as below, are you ok with the approach?
> 

Yes, this looks very reasonable and should be directly useful for the
other users of ioremap as well.

May I ask that you rename the boolean "iomem" with "is_iomem", to make
it obvious that it's a boolean in the cases where we're already juggling
physical, virtual and device addresses?

Thanks,
Bjorn

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 46c2937ebea9..bbb6e0613c1b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -189,13 +189,13 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>   * here the output of the DMA API for the carveouts, which should be more
>   * correct.
>   */
> -void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *iomem)
>  {
>         struct rproc_mem_entry *carveout;
>         void *ptr = NULL;
> 
>         if (rproc->ops->da_to_va) {
> -               ptr = rproc->ops->da_to_va(rproc, da, len);
> +               ptr = rproc->ops->da_to_va(rproc, da, len, iomem);
>                 if (ptr)
>                         goto out;
>         }
> @@ -217,6 +217,9 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> 
>                 ptr = carveout->va + offset;
> 
> +               if (iomem)
> +                       iomem = carveout->iomem;
> +
>                 break;
>         }
> 
> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
> index 34530dc20cb4..5ff9389e6319 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -153,18 +153,22 @@ static void rproc_copy_segment(struct rproc *rproc, void *dest,
>                                size_t offset, size_t size)
>  {
>         void *ptr;
> +       bool iomem;
> 
>         if (segment->dump) {
>                 segment->dump(rproc, segment, dest, offset, size);
>         } else {
> -               ptr = rproc_da_to_va(rproc, segment->da + offset, size);
> +               ptr = rproc_da_to_va(rproc, segment->da + offset, size, &iomem);
>                 if (!ptr) {
>                         dev_err(&rproc->dev,
>                                 "invalid copy request for segment %pad with offset %zu and size %zu)\n",
>                                 &segment->da, offset, size);
>                         memset(dest, 0xff, size);
>                 } else {
> -                       memcpy(dest, ptr, size);
> +                       if (iomem)
> +                               memcpy_fromio(dest, ptr, size);
> +                       else
> +                               memcpy(dest, ptr, size);
>                 }
>         }
>  }
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index df68d87752e4..20538143249e 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -175,6 +175,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>                 u64 offset = elf_phdr_get_p_offset(class, phdr);
>                 u32 type = elf_phdr_get_p_type(class, phdr);
>                 void *ptr;
> +               bool iomem;
> 
>                 if (type != PT_LOAD)
>                         continue;
> @@ -204,7 +205,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>                 }
> 
>                 /* grab the kernel address for this device address */
> -               ptr = rproc_da_to_va(rproc, da, memsz);
> +               ptr = rproc_da_to_va(rproc, da, memsz, &iomem);
>                 if (!ptr) {
>                         dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
>                                 memsz);
> @@ -213,8 +214,12 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>                 }
> 
>                 /* put the segment where the remote processor expects it */
> -               if (filesz)
> -                       memcpy(ptr, elf_data + offset, filesz);
> +               if (filesz) {
> +                       if (iomem)
> +                               memcpy_fromio(ptr, elf_data + offset, filesz);
> +                       else
> +                               memcpy(ptr, elf_data + offset, filesz);
> +               }
> 
>                 /*
>                  * Zero out remaining memory for this segment.
> @@ -223,8 +228,12 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>                  * did this for us. albeit harmless, we may consider removing
>                  * this.
>                  */
> -               if (memsz > filesz)
> -                       memset(ptr + filesz, 0, memsz - filesz);
> +               if (memsz > filesz) {
> +                       if (iomem)
> +                               memset_toio(ptr + filesz, 0, memsz - filesz);
> +                       else
> +                               memset(ptr + filesz, 0, memsz - filesz);
> +               }
>         }
> 
>         return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e8ac041c64d9..01bb9fa12784 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -329,6 +329,7 @@ struct rproc;
>   */
>  struct rproc_mem_entry {
>         void *va;
> +       bool iomem;
>         dma_addr_t dma;
>         size_t len;
>         u32 da;
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index d6473a72a336..dfa0bd7812a5 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -194,7 +194,7 @@ copy_from_user(void *to, const void __user *from, unsigned long n)
>  }
> 
>  static __always_inline unsigned long __must_check
> -copy_to_user(void __user *to, const void *from, unsigned long n)
> +copy_to_user(void __user *to, const void *_toiofrom, unsigned long n)
>  {
>         if (likely(check_copy_size(from, n, true)))
>                 n = _copy_to_user(to, from, n);
> 
> Thanks,
> Peng.
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > +}
> > > +
> > > +static void rproc_elf_memset(struct rproc *rproc, void *s, int c,
> > > +size_t count) {
> > > +	if (!rproc->ops->elf_memset)
> > > +		memset(s, c, count);
> > > +
> > > +	rproc->ops->elf_memset(rproc, s, c, count); }
> > > +
> > >  /**
> > >   * rproc_elf_load_segments() - load firmware segments to memory
> > >   * @rproc: remote processor which will be booted using these fw
> > > segments @@ -214,7 +230,7 @@ int rproc_elf_load_segments(struct rproc
> > > *rproc, const struct firmware *fw)
> > >
> > >  		/* put the segment where the remote processor expects it */
> > >  		if (filesz)
> > > -			memcpy(ptr, elf_data + offset, filesz);
> > > +			rproc_elf_memcpy(rproc, ptr, elf_data + offset, filesz);
> > >
> > >  		/*
> > >  		 * Zero out remaining memory for this segment.
> > > @@ -224,7 +240,7 @@ int rproc_elf_load_segments(struct rproc *rproc,
> > const struct firmware *fw)
> > >  		 * this.
> > >  		 */
> > >  		if (memsz > filesz)
> > > -			memset(ptr + filesz, 0, memsz - filesz);
> > > +			rproc_elf_memset(rproc, ptr + filesz, 0, memsz - filesz);
> > >  	}
> > >
> > >  	return ret;
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index e8ac041c64d9..06c52f88a3fd 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -373,6 +373,8 @@ enum rsc_handling_status {
> > >   *			expects to find it
> > >   * @sanity_check:	sanity check the fw image
> > >   * @get_boot_addr:	get boot address to entry point specified in
> > firmware
> > > + * @elf_memcpy:		platform specific elf loader memcpy
> > > + * @elf_memset:		platform specific elf loader memset
> > >   * @panic:	optional callback to react to system panic, core will delay
> > >   *		panic at least the returned number of milliseconds
> > >   */
> > > @@ -392,6 +394,8 @@ struct rproc_ops {
> > >  	int (*load)(struct rproc *rproc, const struct firmware *fw);
> > >  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> > >  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware
> > > *fw);
> > > +	void (*elf_memcpy)(struct rproc *rproc, void *dest, const void *src,
> > size_t count);
> > > +	void (*elf_memset)(struct rproc *rproc, void *s, int c, size_t
> > > +count);
> > >  	unsigned long (*panic)(struct rproc *rproc);  };
> > >
> > > --
> > > 2.28.0
> > >
