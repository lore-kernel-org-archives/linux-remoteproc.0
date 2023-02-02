Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6A2C05027
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Feb 2023 21:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbjBBV4y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Feb 2023 16:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbjBBV4r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Feb 2023 16:56:47 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EAA5EF93
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Feb 2023 13:56:32 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id t17so2252387pfj.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Feb 2023 13:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMwlRpkq9CUjLciSPcd5+pqtbJtQxFyxa7YlVYfafe0=;
        b=dhjxYIRXRWeVQ6xcykloqXco/9Oe5ZSV9joCqNU/biA3/B57ff1tuda8tj7roNFEGc
         oCw0UPiZ72XP9Y37t/5ewo//KGLGKS3ZxHzpmtwfGUHn9+Rah8KZIgsRZn5td3hcEp3N
         3kPNl3e+vlPG4TNtE6WSpmMkqMFNwn/du9nuOwed72AxpJZll38PAjidZjj1zgHoNKSV
         R+zyFwcz16lzmlEfale7T1esTS9WodnPK2QHU2hEaJagjjUhHIHNHbWK92GlEodnCMpN
         0GDxb3C4daAN6meejhLN0DLBcyizuIoZ4gc+A0bc8gxOlz/RBT3S/qULcvXgiSmlwGDN
         ZchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMwlRpkq9CUjLciSPcd5+pqtbJtQxFyxa7YlVYfafe0=;
        b=e85/VcNw5EMLAQBpb8+dW6HtNVYoqiueIUgkgGxgw8e3zymg++yGWSiwaOE7IgUnSZ
         Oih2Ccc7EpWnAcq0XUgh09R//2ZSh95SLp9gNfMoEu72l95q9iHU5MqVS4lwgDqaSdrR
         MqN0iKA3BvhGj7SjP2xkWv7ESt5xjc/duKVpvC3r36UUSZJVX5OVYuveUb/XHLGIsOLm
         1JJmHyfD3BlTh/oPgoq7OfC5LcVJHIvK4kMLyc+dTDU6gkE0IBUTM1qxUlUlAqxfx6w0
         dBYr21QL07OV4iCit/nz+DAr8qdcFvCnxDN2gM+39NCwLia/gKqLKYYNoqW5jxO234/3
         /Udw==
X-Gm-Message-State: AO0yUKVIQjI7xaftZkgDjHZC+aXEnPaAcpw1cc1uMpE6QiGG4F6xrOMr
        eNoB9Fgz722z2Z/4QQNcVQWmrg==
X-Google-Smtp-Source: AK7set+fwyRorG4sv5PBqZsi46Y0vpw5s6YN28pLqvaogJ6j0urfyqhb7hJThiO8+FprZTADE3wE9A==
X-Received: by 2002:a05:6a00:b4e:b0:575:b783:b6b3 with SMTP id p14-20020a056a000b4e00b00575b783b6b3mr8898810pfo.28.1675374992168;
        Thu, 02 Feb 2023 13:56:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:bb50:10cc:f6a5:2176])
        by smtp.gmail.com with ESMTPSA id p67-20020a622946000000b0059390c02c22sm179324pfp.30.2023.02.02.13.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 13:56:31 -0800 (PST)
Date:   Thu, 2 Feb 2023 14:56:29 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        arnaud.pouliquen@foss.st.com, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 5/6] remoteproc: imx_rproc: set Cortex-M stack/pc to
 TCML
Message-ID: <20230202215629.GC1147631@p14s>
References: <20230127092246.1470865-1-peng.fan@oss.nxp.com>
 <20230127092246.1470865-6-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127092246.1470865-6-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jan 27, 2023 at 05:22:45PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX8M Cortex-M core not has ROM. It has a requirement is
> the stack, pc value should be set in address 0 and 4 from the view of
> itself. From Cortex-A core view, the region is at TCML start address.
> 
> The stack and pc value are the first two words stored in section
> ".interrupts" of the firmware, and the section is the first section in
> the firmware.
> 
> When the firmware is built to run in TCML, there is no issue, because
> when copying elf segments, the first two words are copied to TCML also.
> 
> However when the firmware is built ro run in DDR, the first two words
> are not copied to TCML start address.
> 
> This patch is to find the ".interrupts" section, read out the first
> two words and write to TCML start address at offset 0 and 4.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 295e0e0e869a..f5ee0c9bb09d 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -7,6 +7,7 @@
>  #include <linux/arm-smccc.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
> +#include <linux/firmware.h>
>  #include <linux/firmware/imx/sci.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> @@ -23,6 +24,7 @@
>  #include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
> +#include "remoteproc_elf_helpers.h"
>  #include "remoteproc_internal.h"
>  
>  #define IMX7D_SRC_SCR			0x0C
> @@ -634,6 +636,39 @@ static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc
>  	return (struct resource_table __force *)priv->rsc_table;
>  }
>  
> +static u64 imx_rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const u8 *elf_data = (void *)fw->data;
> +	u8 class = fw_elf_get_class(fw);
> +	u64 bootaddr = rproc_elf_get_boot_addr(rproc, fw);
> +	const void *shdr;
> +	void __iomem *va;
> +	u64 sh_addr, offset;
> +
> +	if (priv->dcfg->devtype == IMX_RPROC_IMX8M) {
> +		/*
> +		 * i.MX8M Cortex-M requires [stack, pc] be put in address
> +		 * [0, 4], so the da address is 0, size is 8 words.
> +		 */
> +		va = (__force void __iomem *)rproc_da_to_va(rproc, 0, 8, NULL);
> +		shdr = rproc_elf_find_shdr(rproc, fw, ".interrupts");
> +		if (!shdr || !va)
> +			return bootaddr;
> +		sh_addr = elf_shdr_get_sh_addr(class, shdr);

This isn't used - why is it still there? 

> +		offset = elf_shdr_get_sh_offset(class, shdr);
> +
> +		/*
> +		 * Write stack, pc to TCML start address. The TCML region
> +		 * is marked with ATT_IOMEM, so use writel.
> +		 */
> +		writel(*(u32 *)(elf_data + offset), va);
> +		writel(*(u32 *)(elf_data + offset + 4), va + 4);

Here you are writing 2 words at address 0x0 and 2 words at address 0x4. Why are
you saying the size is 8 words in the comment above?

> +	}
> +
> +	return bootaddr;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> @@ -647,7 +682,7 @@ static const struct rproc_ops imx_rproc_ops = {
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
> -	.get_boot_addr	= rproc_elf_get_boot_addr,
> +	.get_boot_addr	= imx_rproc_get_boot_addr,
>  };
>  
>  static int imx_rproc_addr_init(struct imx_rproc *priv,
> -- 
> 2.37.1
> 
