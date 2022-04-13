Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FEEC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Apr 2022 18:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbiDMSE0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Apr 2022 14:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237603AbiDMSC2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Apr 2022 14:02:28 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2D941314
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Apr 2022 11:00:04 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d15so2577268pll.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Apr 2022 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Svs19TUafKQm/jCU2RrZAsQ5QwXjh0iyJjgadXLqin0=;
        b=xLqG+MWjB+1ONdwrTD0/w1/RC8Cfa0ESVVwZNBb5TYNlChKDlGlurbuIAhq0g3JOLY
         HBalb10a9q5otPR4Ue4esCZJhdzZn3erpsytC0MtHM/NGjzOEojXQxx2TbJoL5PJ8x1n
         UJsuKYLvVWQiFf8eN47eWokol4IH5IeBctvKmR1hR7FpwfyJJ0VYotDpdg3xdere/5Du
         sbagu6ImkoKzwNfliSHrNBSzt0HwvxAWijAdaBWaHf0ne/1d0iEFTdmT2otr9T8AEKAV
         zO4XuNE+MQ7TquLYInmTp5lGFGMxdCBFaEsle5Ae7QbwHAS//6uDL6aqvyYwPcfU7nxj
         X8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Svs19TUafKQm/jCU2RrZAsQ5QwXjh0iyJjgadXLqin0=;
        b=tSuWBbQdk1QTWTpuyj8c6+xR8CA3BUd1Rbf6jrjW4Y85BXfMryb5MuzS0EMNQxsRGS
         FhVTO8sqbXYy54QCKse0Puv+iUzyWSpjmFyrzuX7TGQTC9ivQgI7kjH3pyb47VSFVGIJ
         0c9CkOS0BnJiqY9IqfihUlbw2rLVhuvDx7rtNpyobhfLe2b6adYG9ut4NCvChUPtJs0X
         jkbHeUrrJGPo0gm6SwugdCpX828/sfB51t2S6eNrN6hWj7QaN8k62OGkGP/BwTAL+V5z
         Z8SUFIkxUCdoOsghNOPqvzdmsMry0vW85qRhUsZz+VkhddMDw0CeATtx7ay/HXjZmHO5
         mOZQ==
X-Gm-Message-State: AOAM532yjudFXwfajK4VpBSWK7a+/ZBsoHweQmGMYguAdJDaR9zCX/8p
        JTT+kLtACQPbIzSF2gjC4I7teg==
X-Google-Smtp-Source: ABdhPJxC4fnpXtuWpOkL3gqwzMGvaPHtdemOp/P9bcKS6MectCfQp1h+7v//HPZZb5PfpyIJ6nKnoA==
X-Received: by 2002:a17:90b:384b:b0:1c7:41fd:9991 with SMTP id nl11-20020a17090b384b00b001c741fd9991mr12251421pjb.199.1649872802844;
        Wed, 13 Apr 2022 11:00:02 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k5-20020a17090ac50500b001cd5ffcca96sm1930645pjt.27.2022.04.13.11.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 11:00:01 -0700 (PDT)
Date:   Wed, 13 Apr 2022 11:59:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc:     linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        shengjiu.wang@nxp.com, daniel.baluta@gmail.com,
        Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: Make rsc_table optional
Message-ID: <20220413175959.GC547134@p14s>
References: <20220331103237.340796-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331103237.340796-1-daniel.baluta@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Daniel,

On Thu, Mar 31, 2022 at 01:32:37PM +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> There are cases when we want to test a simple "hello world"
> app on the DSP and we do not need a resource table.
> 
> remoteproc core allows us having an optional rsc_table.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 2abee78df96e..987ab1add761 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -802,6 +802,14 @@ static void imx_dsp_rproc_kick(struct rproc *rproc, int vqid)
>  		dev_err(dev, "%s: failed (%d, err:%d)\n", __func__, vqid, err);
>  }
>  
> +static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	if (rproc_elf_load_rsc_table(rproc, fw))
> +		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
>  	.unprepare	= imx_dsp_rproc_unprepare,
> @@ -809,7 +817,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.stop		= imx_dsp_rproc_stop,
>  	.kick		= imx_dsp_rproc_kick,
>  	.load		= imx_dsp_rproc_elf_load_segments,
> -	.parse_fw	= rproc_elf_load_rsc_table,
> +	.parse_fw	= imx_dsp_rproc_parse_fw,

Applied.

Thanks,
Mathieu

>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
> -- 
> 2.27.0
> 
