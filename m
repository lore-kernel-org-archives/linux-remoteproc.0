Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E73C433ED
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 17:49:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20C1161176
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 17:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347352AbhDMRt6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 13:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347340AbhDMRt6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 13:49:58 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB669C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Apr 2021 10:49:37 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id s14so4021641pjl.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Apr 2021 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LR/kpiLYxcoerfHBg9UUUi//0uIfBkykKPg0p1xhzVI=;
        b=z754KZYShk0DnqmpTLvEXFBoX0DbtHXAHmHbjtUCupA+saYRfG2GJ1Gz/gaEXxrc2x
         ScsIoXJEfpADsyfId4tqgPeEtOOo6YoL/BonwEXnu6GVfM2u2fHMsoSVjXrOMWW1Mm7m
         iawK5Z8H7LcbH2nWR2YTixqvHW3yGPSgSARxS8FTfNVeQWYTYcsvuhjZOf94zVGfsW1j
         5FQpHfL1e0eIQYvOFVcgmN8mfTUDre6Wl8cyCH1iaRorc2tdrH9x9ffHhWBvm28E6x1q
         AKkhqyddw7NiFT48seSctXU5LZXnkNaSEeinTs/ea+Vnm5nsIJ/GpEO6k/i9tO+2/lhk
         Hl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LR/kpiLYxcoerfHBg9UUUi//0uIfBkykKPg0p1xhzVI=;
        b=Jc9FOx+NnYgC3CsLVeT4/l/5AvE4jx8TlSUKra8lfTRKLMTxfdeRZ0bECtUJv606gE
         zcpSGEwq3zmpovFk3819v7cq/uCovne9rHG5uGejuDnEeUXJYA93P22edgS45m/5onAK
         RBlNWgIBCihCvGtL2T70vexiQ2qVkX6/UKserXpBC8KoDPhD2BOJvRaBOvmnXzsWPdSM
         sKuHCO+JkU9ihxCcOFe/XWWaCTPNg+LLHeB391scBksEBaEaVznJYVPUFV0Ml/zRi/gG
         6LsuKTlJiCwY6fENVpG9C//gat/JA9eWtW5T78eEiYshDXDqaodpl9TNFJNaiIUfYN8m
         G5ZA==
X-Gm-Message-State: AOAM531e//UsK9SWYi+dOHs9rcbseCA1Tfs64bcwkLfISUZDgMUcNpaF
        n+bDaAYKAmacD229i2cyPq+OGQ==
X-Google-Smtp-Source: ABdhPJz91wIZtAKvaPoUmSMwbHZvTMRvzFH8IAjyjJKj/beXEoNWGKzQG/4yV8SCxH8D6vx/1Z4rUA==
X-Received: by 2002:a17:90a:fa14:: with SMTP id cm20mr1244169pjb.125.1618336175085;
        Tue, 13 Apr 2021 10:49:35 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id u7sm2785326pjx.8.2021.04.13.10.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 10:49:34 -0700 (PDT)
Date:   Tue, 13 Apr 2021 11:49:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 7/8] remoteproc: imx_rproc: support i.MX7ULP
Message-ID: <20210413174932.GE750651@xps15>
References: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
 <1617846898-13662-8-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617846898-13662-8-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 08, 2021 at 09:54:57AM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX7ULP A7 core runs under control of M4 core, M4 core starts by ROM
> and powers most serivces used by A7 core, so A7 core has no power to
> start and stop M4 core.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index a7fa9d7fc2d1..b911a7539897 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -147,6 +147,14 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
>  	{ 0x40000000, 0x40000000, 0x80000000, 0 },
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx7ulp[] = {
> +	{0x1FFD0000, 0x1FFD0000, 0x30000, ATT_OWN},
> +	{0x20000000, 0x20000000, 0x10000, ATT_OWN},
> +	{0x2F000000, 0x2F000000, 0x20000, ATT_OWN},
> +	{0x2F020000, 0x2F020000, 0x20000, ATT_OWN},
> +	{0x60000000, 0x60000000, 0x40000000, 0}
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* OCRAM_S (M4 Boot code) - alias */
> @@ -207,6 +215,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.method		= IMX_RPROC_MMIO,
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
> +	.att		= imx_rproc_att_imx7ulp,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
> +	.method		= IMX_RPROC_NONE,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
> @@ -598,12 +612,16 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  			return ret;
>  		}
>  
> -		if (!(val & dcfg->src_stop)) {
> -			priv->rproc->state = RPROC_DETACHED;
> +		if (!(val & dcfg->src_stop))
>  			priv->mode = IMX_RPROC_EARLY_BOOT;
> -		}
>  	}
>  
> +	if (dcfg->method == IMX_RPROC_NONE)
> +		priv->mode = IMX_RPROC_EARLY_BOOT;

As I pointed out there is no need for priv->mode.  Just declare a boolean
variable that is local to this function and use it to determine the state of the
remote processor:

        if (dcfg->method == IMX_RPROC_NONE)
                early_boot = true;

        if (early_boot)
                priv->rproc->state = RPROC_DETACHED;

> +
> +	if (priv->mode == IMX_RPROC_EARLY_BOOT)
> +		priv->rproc->state = RPROC_DETACHED;
> +
>  	return 0;
>  }
>  
> @@ -724,6 +742,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id imx_rproc_of_match[] = {
> +	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
>  	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
>  	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
>  	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
> -- 
> 2.30.0
> 
