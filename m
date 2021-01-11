Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C15DC433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 21:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9F5422CAF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 21:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732638AbhAKVlA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Jan 2021 16:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732524AbhAKVlA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Jan 2021 16:41:00 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD348C061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 13:40:19 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id c132so41601pga.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 13:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YAZpy6BnklcTFR4y2uqR/HOMIneLtln1qkeJb17jmmI=;
        b=Sktn3WigfNxAfBk5bHXDlcDF/Q3JQf3REoXsi5zkmHrLxgBCkxkvFekowTmcZf20xA
         ZjpP9QSCJdn8xdfiiV6lNL2iFf/rQEXXRzcrS+AUV4NNvE/OMpwA/y3jo930vK3ehrpo
         Any5usxFUGmR35kGgsD2VVE8b8LE/TSNM8BZnMNgJPJr0NuDJ3nfOBZALah/ecvPvTey
         dSrxNZKQPjt0F+cyL9MlIO84Iqt7x813X6NcEoxjHRJqeTbluiCJechAKCuff0Fi4taR
         bBIVegJuvS2eZlBitYJGWJhe6z/nX4TTAKHq6vvKztvXUHtXcW+Bpi5XyVybBn9T2SlQ
         3MRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YAZpy6BnklcTFR4y2uqR/HOMIneLtln1qkeJb17jmmI=;
        b=SIBAE0gH9PiQoThBPnv+6WOXQ/XIwF8Jvs/FiQfGn8cxyRzcCJmyo0mAgg2WoczCLG
         SMT6ftuw5wYphuL6t5KqjQMRc3rv7rAHq1l0EWqDWrIWcjgolMhkYu4Q9PI2KvaXKHdu
         T7cs7St76WfqvTjwCpqkQXs9P7QB6jeTun41F6icxTfetNG4EJZSzLbniqJbM5aliId1
         Qh2oBVeNKgs5T4h+8Wd3guP5MrEmDgWQcWHVFtSyXpyKgTZtiEncSL4W0rZD/EFSQV1t
         +aSEYG0HAXVVw+ROa0rAs61suuDzy4t6pto/EjC1XHszK5RhrKgWmuL0hxTNyFF0zqQp
         X9Jw==
X-Gm-Message-State: AOAM532UkeWtnzKyaapBNrZ5q4qk7TqYF54NIYy4218rfk3chuIaP1sa
        BHGEQZDc1jvZ6i80JB7Fa6kUEA==
X-Google-Smtp-Source: ABdhPJxUmdX9ILSl+pQlfGD6TgGmxFtU5TAEjlgyDaHxYjNhn5lWIdtwZnfLRlEnWWaHluaMywZ2ag==
X-Received: by 2002:a63:5d7:: with SMTP id 206mr1481880pgf.384.1610401219258;
        Mon, 11 Jan 2021 13:40:19 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 36sm669534pgr.56.2021.01.11.13.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 13:40:18 -0800 (PST)
Date:   Mon, 11 Jan 2021 14:40:16 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH V5 6/8] remoteproc: imx_rproc: support i.MX8MQ/M
Message-ID: <20210111214016.GI144935@xps15>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-7-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229033019.25899-7-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 29, 2020 at 11:30:17AM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8MQ dev/sys addr map and configuration data structure
> i.MX8MM share i.MX8MQ settings.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/imx_rproc.c | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3c0075dc1787..f80428afb8a7 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -88,6 +88,34 @@ struct imx_rproc {
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
> @@ -138,6 +166,15 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
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
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
> @@ -496,6 +533,8 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
>  	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
> +	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
> +	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },

I don't see a patch that adds those to the imx-rproc.txt bindings document.  As far
as I can tell the patch that does that was part of your first patchset [1] but
was not resubmitted after that.

It would be very nice to have an example of how the DT is laid out for those 2
platform, otherwise I have to guess based on the code I am reviewing.

[1]. https://patchwork.kernel.org/project/linux-remoteproc/patch/20200724080813.24884-2-peng.fan@nxp.com/

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
> -- 
> 2.28.0
> 
