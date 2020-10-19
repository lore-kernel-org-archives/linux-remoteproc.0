Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AB6C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 17:59:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE4FB22276
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 17:59:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rp4gVOZ/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729691AbgJSR7O (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 13:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbgJSR7O (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 13:59:14 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5335AC0613CE
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 10:59:14 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y1so153915plp.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hiVYdmseDgTcf3ogCK/hiyF3Du3HoHohHT9xW6cSjbU=;
        b=rp4gVOZ/0TZkEXcBRNNDAjMSBz4a4MMv1hG8aQjzCZR3BgEno0zsegcn5V8WeNuH/Z
         1i7we6rQmvpbkHePnHpfcihRFHYNZgRbrVPe3Z/rqpB/mD9zGrMyPya+GgwQUsOYq/bq
         fYNdp/rvYi5nGYliKaFNwcUv6x1L7uYvrmGb6mo9sRhwVQgb7tD4k3CO2DR39xVhi6OK
         shS1MN90Zw7jlAFPTONwcElPD3Tm5bKXYtbIZYeRObmgXMoGMZCbP2m9aXVx1iDn6Eum
         mshRUdW3oDQLlS+TDe6CNEK95qTt+NVcEa9TGTdWyM2tD1L6xvIneU/pgNnjDilassea
         Zm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hiVYdmseDgTcf3ogCK/hiyF3Du3HoHohHT9xW6cSjbU=;
        b=goo+0Fwy2JBd8bkd3yZhgp4wDqYYRcpOHUFhHEAo4nA9QfwkL9l7YK3PylJnONbXmk
         zrvkEPiLNvxOPmPJUTcsGYy2JiLutrO8GNIm63z6YcHo49rJ/TtYGTRGd4PpOe5TGg4O
         2fuWzYeblhejdhAPyZK83RDEFl/kAX/3tig2phpdQyGje2RNngm3adDCpbUtTjVxF62x
         52esyQWSBYbzDQq1sfjvqr/dd8QzbbYMGjQZCMbiuqQuMKroSL5AODmyo0LFj+S2lfdG
         tsUV41o1G3UbCvWO7nLp/RMfSm7V+SrR+Y4GXHeahIO+0NhqG4iA53VG0jyyM6EvyZzc
         9tcQ==
X-Gm-Message-State: AOAM531GxnWPixaJ3eM6SrrqJ4uDzvW7cuVfdhSJUaGvCGmsQKVHTJpn
        LJ6nOZE3N6BazpyZ/gb9BnOOjQ==
X-Google-Smtp-Source: ABdhPJylBSbG1cp6q7D7Bk4B6OIwKr2+3mjvnsHeP4/9U0stoa7Kf1nkb6X5JoMiVB6S1RxQH6Tlcw==
X-Received: by 2002:a17:90b:17c4:: with SMTP id me4mr528341pjb.91.1603130353779;
        Mon, 19 Oct 2020 10:59:13 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id e2sm175304pjw.13.2020.10.19.10.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 10:59:13 -0700 (PDT)
Date:   Mon, 19 Oct 2020 11:59:11 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH V2 6/7] remoteproc: imx_rproc: support i.MX8MQ/M
Message-ID: <20201019175911.GD496175@xps15>
References: <20200927064131.24101-1-peng.fan@nxp.com>
 <20200927064131.24101-7-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927064131.24101-7-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, Sep 27, 2020 at 02:41:30PM +0800, Peng Fan wrote:
> Add i.MX8MQ dev/sys addr map and configuration data structure
> i.MX8MM share i.MX8MQ settings.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 40 ++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bd3a42892b22..0f69f3f745ab 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -90,6 +90,34 @@ struct imx_rproc {
>  	struct clk			*clk;
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* TCML - alias */
> +	{ 0x00000000, 0x007e0000, 0x00020000, 0 },
> +	/* OCRAM_S */
> +	{ 0x00180000, 0x00180000, 0x00008000, 0 },
> +	/* OCRAM */
> +	{ 0x00900000, 0x00900000, 0x00020000, 0 },
> +	/* OCRAM */
> +	{ 0x00920000, 0x00920000, 0x00020000, 0 },
> +	/* QSPI Code - alias */
> +	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> +	/* DDR (Code) - alias */
> +	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
> +	/* TCML */
> +	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
> +	/* TCMU */
> +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> +	/* OCRAM_S */
> +	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> +	/* OCRAM */
> +	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
> +	/* OCRAM */
> +	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
> +	/* DDR (Data) */
> +	{ 0x40000000, 0x40000000, 0x80000000, 0 },
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* OCRAM_S (M4 Boot code) - alias */
> @@ -140,6 +168,16 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
>  	{ 0x80000000, 0x80000000, 0x60000000, 0 },
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
> +	.src_reg	= IMX7D_SRC_SCR,
> +	.src_mask	= IMX7D_M4_RST_MASK,
> +	.src_start	= IMX7D_M4_START,
> +	.src_stop	= IMX7D_M4_STOP,
> +	.att		= imx_rproc_att_imx8mq,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
> +	.elf_mem_hook	= true,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
> @@ -517,6 +555,8 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
>  	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
> +	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
> +	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
> -- 
> 2.28.0
> 
