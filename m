Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C48C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Nov 2021 18:29:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C48361360
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Nov 2021 18:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhKRScK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Nov 2021 13:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbhKRScK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Nov 2021 13:32:10 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296CBC06173E
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Nov 2021 10:29:10 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 28so6150733pgq.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Nov 2021 10:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uSpY8+ZZw7VrKc1FtbyhIu09kHALiBf3b1wB2/ERM84=;
        b=FFDOLGcNCvLCzew0kAl/PrKO6GF2WJn0StIk8lHWGW/Nsegh4lz7mceUZxz0rj3xpg
         zv9r0YDfv48Tk0S2QuVib3gTJYpn7lsBm+mgXLUjl0dA7OtUV/twZggjJT5/XLGQ1Lgo
         yJCThsCKqhtw7RYN0FPeMP7R4JimYDPQiA/HNJSHS+gJr1Nra7mJF6bhXbWZCqcgdXGi
         OD+PN1T/Z3IMbXTAerzxq7ZO8dt2mO4dgwnHyTOGsyb0iqWO5Mcpx2Ws84AeZjPhUHXv
         506ausdqvVSQpNg//HRe3ZUWt52rGUt9eLhqPWTphicODw1IjaEM6xPTYtxQuDiplH5g
         DyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uSpY8+ZZw7VrKc1FtbyhIu09kHALiBf3b1wB2/ERM84=;
        b=DCxctV1fGvQzywZwynJD5NHiLsrc1nUHETiyJufDFx7AKdsUdncEDy6huLP4t5kfb5
         WdmhlkK6ofjrm+4IXl/R/HjB4b/UAJm6nySWg1OGf068wBgvxhKp6GkHDFqYgMvT5svC
         I/0Wxxg6AfYvwazH6c8wUIjogBWHuCiRbLztlzpAJKRumow+Nqg1DxfQNnzqkVxK5Bxt
         QFg8fxQ00ok3DqUObiPAui0pi6O90T49RjsEaCxm0Edd5vnQeeVtifTNZ2H/c2LvmWVU
         z2YFd0nkBRrglj535tPRwoNqe/eEJ802LliEeUvyqfbLG83el2NP8ZbkqVCBKZMRUk1i
         +/3w==
X-Gm-Message-State: AOAM532Uj1cWfBYleHijweZs9AxREZA6CZX8L9jMCgY04BTsDuq82jxg
        lCiKrfekklPTb171k1mDGDXvTw==
X-Google-Smtp-Source: ABdhPJwy3KjQMrd7Y6BMNeVoxIqHpThnIeHkISg6+ofmx1GlKl2PNcRgVasH/MbvMqrZYDcJwBeo4g==
X-Received: by 2002:a05:6a00:181a:b0:47c:1057:52e with SMTP id y26-20020a056a00181a00b0047c1057052emr17426322pfa.76.1637260149673;
        Thu, 18 Nov 2021 10:29:09 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id v15sm298349pfu.195.2021.11.18.10.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:29:08 -0800 (PST)
Date:   Thu, 18 Nov 2021 11:29:05 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: use imx specific hook for
 find_loaded_rsc_table
Message-ID: <20211118182905.GE2530497@p14s>
References: <20211112063416.3485866-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112063416.3485866-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Peng,

On Fri, Nov 12, 2021 at 02:34:16PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When loading elf and kicking M core from Linux, previously we directly
> use the address of the resource table in elf file. After i.MX8MN/P
> RDC enabled to proect TCM, linux not able to access the TCM space

It would be nice to know what RDC is and what it stands for.  Moreover I assume
you mean "protect" here when writing "proect".

> when updating resource table status and cause kernel dump.

How was it possible to boot an i.MX8MN before this patch?  Why wasn't this part
of the patchset that introduced support for the i.MX8MN?

> 
> So let's check whether rsc_table is available, if available, we use this
> address.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index ff8170dbbc3c..96a56ab39ccb 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -497,6 +497,17 @@ static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc
>  	return (struct resource_table *)priv->rsc_table;
>  }
>  
> +static struct resource_table *
> +imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +

This is lacking proper documentation.  Please specify which remote processor
is supposed to find a resource table address in the device tree and which should
rely on the address in the resource table.  It would be much better to rely on
the remote processor model to decide where to get the resource table from, and
return an error if it is not where we expect it to be.

Thanks,
Mathieu

> +	if (priv->rsc_table)
> +		return (struct resource_table *)priv->rsc_table;
> +
> +	return rproc_elf_find_loaded_rsc_table(rproc, fw);
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> @@ -506,7 +517,7 @@ static const struct rproc_ops imx_rproc_ops = {
>  	.da_to_va       = imx_rproc_da_to_va,
>  	.load		= rproc_elf_load_segments,
>  	.parse_fw	= imx_rproc_parse_fw,
> -	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
>  	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> -- 
> 2.25.1
> 
