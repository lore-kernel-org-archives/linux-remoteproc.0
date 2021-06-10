Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542B9C47094
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Jun 2021 17:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26568613E1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Jun 2021 17:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhFJRIJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Jun 2021 13:08:09 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53]:41474 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhFJRIJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Jun 2021 13:08:09 -0400
Received: by mail-pj1-f53.google.com with SMTP id go18-20020a17090b03d2b029016e4ae973f7so3143459pjb.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Jun 2021 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zsuHs8q2OPqCHBMokULd2KXAu5PDhngkMlqiRUWGhEQ=;
        b=F2TUxQY2snWw8ctmSasL8n8yd1F/8VJkGWADtJezydVUh0feZ2ggQESqkLle9qp1HM
         HvmpS7ERNGH6v5vjMBIcnp6UatHp8sjOPLrasDOQJo9y4hUB9QC6h290zuTr/sq6mRmA
         zFdQpBJ8yEny9GV6JXukn1KXu3DE12KljL1elMAFh2aaDATN/+ie62uhTdb+pLrZwaC9
         gOz2ELUAr9QT5ixrEFveLybjpjZcKoUEKXp0k7MamWMLH4B5Dm8HtVfqRpCzM/Tb/qXg
         opEp6Gc5PFhHZyvPztLLkM/+vwrJJqeW5AFCwjiIl6S6N+xz2VAPdJlBet0cFlIP3kEK
         FMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zsuHs8q2OPqCHBMokULd2KXAu5PDhngkMlqiRUWGhEQ=;
        b=n4zBttTiK7ht5sk20vXIPhUYWb6raUF0OOQWKzlGqWUjQPt2NLAV1DEQDhlLQIeWjr
         grm52+FPUTkpLULF4mh51LBSglxNGTKXRiAU6e4R0uLfOKflFo1lMW0/T+ugUSxzxEO0
         ILYXqC9IERfQxIJ/vz8q3E7M/N79E7wsW4+j/e8p9ByaBoepZFI889EmE4xJLHYgd/Q3
         tVolAtxxSdt+PH5+scSEV0i6cYhQtqxOsaZLMjHcwGvLw0Z0aZ4opqNR9ofSBedZ0J3W
         DmW/QKaakps6v7PBwwdg+5Tw3qem0NyslOEt4VGhvFrnnhm8Qz9lI7kUwYwJPCD6MS7+
         L1tg==
X-Gm-Message-State: AOAM5314NZ1fXcI5sWLBCPJcDMceg6RMURESAQjPpW8lhQMSEb5PZAmG
        SK6rqtHl0fDwkbhg9gYbk1UvHQ==
X-Google-Smtp-Source: ABdhPJxjWwnJbs8N7HYKTbnCv8+sVi6XLob6NDA40U/LIZlS7d/nvHV2Ol/uuIWQ9gr5lVB8cFcUeg==
X-Received: by 2002:a17:902:bc81:b029:ef:3f99:9f76 with SMTP id bb1-20020a170902bc81b02900ef3f999f76mr5901515plb.33.1623344712906;
        Thu, 10 Jun 2021 10:05:12 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id r28sm3077053pgm.53.2021.06.10.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 10:05:11 -0700 (PDT)
Date:   Thu, 10 Jun 2021 11:05:09 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_rproc: support i.MX8ULP
Message-ID: <20210610170509.GE34238@p14s>
References: <20210604072311.9186-1-peng.fan@oss.nxp.com>
 <20210604072311.9186-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604072311.9186-3-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 04, 2021 at 03:23:11PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8ULP is a new SoC with Ultra low power support, it has a Cortex-M33
> core and two Cortex-A35 cores. We need to add new configuration because
> it could not reuse the previous i.MX7/8 configuration.
> 
> i.MX8ULP M33 core is kicked by ROM, it is not under control of A35 core.
> So need to mark the method is IMX_RPROC_NONE.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7cc0cadea1cc..d88f76f5305e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -172,6 +172,12 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
>  	{ 0x40000000, 0x40000000, 0x80000000, 0 },
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx8ulp[] = {
> +	{0x1FFC0000, 0x1FFC0000, 0xC0000, ATT_OWN},
> +	{0x21000000, 0x21000000, 0x10000, ATT_OWN},
> +	{0x80000000, 0x80000000, 0x60000000, 0}
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx7ulp[] = {
>  	{0x1FFD0000, 0x1FFD0000, 0x30000, ATT_OWN},
>  	{0x20000000, 0x20000000, 0x10000, ATT_OWN},
> @@ -246,6 +252,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.method		= IMX_RPROC_MMIO,
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
> +	.att		= imx_rproc_att_imx8ulp,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
> +	.method		= IMX_RPROC_NONE,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
>  	.att		= imx_rproc_att_imx7ulp,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
> @@ -824,6 +836,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
>  	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
>  	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
> +	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
> -- 
> 2.30.0
> 
