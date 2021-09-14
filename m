Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DF7C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Sep 2021 17:46:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61CA260F4A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Sep 2021 17:46:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhINRsD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Sep 2021 13:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhINRsA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Sep 2021 13:48:00 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85691C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Sep 2021 10:46:43 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id g184so13449801pgc.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Sep 2021 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7UFM2ZEfyisKcjzE2kztorsuEGj60mmoqCDZgmBx5qk=;
        b=adISV1GzrtR3BVLqWylk7j+Nf0f9LohcT8NA2GxEC5o5Ir6X0Rf80NFfjWbiZ4MfIH
         ARLEjkxxSPs8mBEmc9VUj2WyjNFe0RkVCmXChHcxpVOh50a4gFrHiqvBH8BTPF2sT1jd
         aaLZPBnnrqTDq2NK/mwpYYUhvoXrF1JBe6706NdMEh8Iua+zLYFmVbYAU5GTw8bwA/dt
         di+mdi9j/bH5jgWOne9zkrkyVO32aegprpms/DaZkgojU9DnTvLT91RNBHstQRZS/ktF
         c4MOx8GF/wpcp/CSo05i1B66s/sOZBxxhFS/d0ZvSSStyIXEIXRE+t+8FKHmY81HfZ5E
         CcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7UFM2ZEfyisKcjzE2kztorsuEGj60mmoqCDZgmBx5qk=;
        b=Me+zoHS3T6KrEg2vZTsZLfShuN3vGSuH6adqgeZkUkg2R8Skv74g/pgl2FdVJqB0nQ
         d8uCl2+xzB9j+lzLQoSYUD83mHPwz+JSfeYkNdglmKd59We8dp0q1bO2w1HRGkQugcIV
         w8QLGRZ+GpglAWU7jqpwcNscfyJrp3+xPJdkXYeVuxv08VsO8wksowCM4KCgRIbT7q53
         2P70ZaRL33OIIhXS3yoV7u5ynpHioY5kKAClyDAdWFaDRAMBAOeu0TQvElmgSZtsKlm3
         foytpdkZmjLNTYddKdWumKSK5mnSxQ3KvoqVN4yA3DB/BraBteA4lOoNb2D8wKcQkc/c
         s6Qg==
X-Gm-Message-State: AOAM531qqw3VJ8o6B4H3rObfJI4hrYD9a2DkU4eyD6shVSCKlFMvDp3G
        g/ZK+r6Vdwt9FundzWjcXIGK/w==
X-Google-Smtp-Source: ABdhPJzNx8VjnH2V9I2EnHJTuQp2w956w0/y+JiYMwH4mCa/ph7gOkFElD1jQd/qXlADKOpBI9CZjA==
X-Received: by 2002:a63:da49:: with SMTP id l9mr16290385pgj.277.1631641602979;
        Tue, 14 Sep 2021 10:46:42 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id pc3sm2354264pjb.0.2021.09.14.10.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 10:46:42 -0700 (PDT)
Date:   Tue, 14 Sep 2021 11:46:39 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, daniel.baluta@nxp.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH v4 1/4] remoteproc: imx_rproc: Move common structure to
 header file
Message-ID: <20210914174639.GB1719994@p14s>
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631092255-25150-2-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 08, 2021 at 05:10:52PM +0800, Shengjiu Wang wrote:
> Move common structure imx_rproc_att, imx_rproc_method
> and imx_rproc_dcfg to header file which can be shared with
> imx_dsp_rproc driver.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 28 +------------------------
>  drivers/remoteproc/imx_rproc.h | 37 ++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/remoteproc/imx_rproc.h
> 

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index d88f76f5305e..b0da0130c3b6 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -19,6 +19,7 @@
>  #include <linux/remoteproc.h>
>  #include <linux/workqueue.h>
>  
> +#include "imx_rproc.h"
>  #include "remoteproc_internal.h"
>  
>  #define IMX7D_SRC_SCR			0x0C
> @@ -72,33 +73,6 @@ struct imx_rproc_mem {
>  /* M4 own area. Can be mapped at probe */
>  #define ATT_OWN		BIT(1)
>  
> -/* address translation table */
> -struct imx_rproc_att {
> -	u32 da;	/* device address (From Cortex M4 view)*/
> -	u32 sa;	/* system bus address */
> -	u32 size; /* size of reg range */
> -	int flags;
> -};
> -
> -/* Remote core start/stop method */
> -enum imx_rproc_method {
> -	IMX_RPROC_NONE,
> -	/* Through syscon regmap */
> -	IMX_RPROC_MMIO,
> -	/* Through ARM SMCCC */
> -	IMX_RPROC_SMC,
> -};
> -
> -struct imx_rproc_dcfg {
> -	u32				src_reg;
> -	u32				src_mask;
> -	u32				src_start;
> -	u32				src_stop;
> -	const struct imx_rproc_att	*att;
> -	size_t				att_size;
> -	enum imx_rproc_method		method;
> -};
> -
>  struct imx_rproc {
>  	struct device			*dev;
>  	struct regmap			*regmap;
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> new file mode 100644
> index 000000000000..23d8e808d27f
> --- /dev/null
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
> + * Copyright 2021 NXP
> + */
> +
> +#ifndef _IMX_RPROC_H
> +#define _IMX_RPROC_H
> +
> +/* address translation table */
> +struct imx_rproc_att {
> +	u32 da;	/* device address (From Cortex M4 view)*/
> +	u32 sa;	/* system bus address */
> +	u32 size; /* size of reg range */
> +	int flags;
> +};
> +
> +/* Remote core start/stop method */
> +enum imx_rproc_method {
> +	IMX_RPROC_NONE,
> +	/* Through syscon regmap */
> +	IMX_RPROC_MMIO,
> +	/* Through ARM SMCCC */
> +	IMX_RPROC_SMC,
> +};
> +
> +struct imx_rproc_dcfg {
> +	u32				src_reg;
> +	u32				src_mask;
> +	u32				src_start;
> +	u32				src_stop;
> +	const struct imx_rproc_att	*att;
> +	size_t				att_size;
> +	enum imx_rproc_method		method;
> +};
> +
> +#endif /* _IMX_RPROC_H */
> -- 
> 2.17.1
> 
