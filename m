Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12067C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 18 Jan 2022 18:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347596AbiARSuX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244421AbiARSuW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:50:22 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C449EC06161C
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jan 2022 10:50:22 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id s61-20020a17090a69c300b001b4d0427ea2so3210376pjj.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jan 2022 10:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hyUFOt/DRN/Ski8ME3oR/RR/GlHotAPBehInw4A8rwg=;
        b=y0uHrHAf2EdqIaf/AqU82TqNKrpbwUkXwrbqc6KO03IC76LIlrawu1QkyCK7VawJIr
         ayt647OaYmn2qHUROh/897uhEy0KbOrkrbqej+Q5WoqiRb0TiG6py3+iYqHDWf1V8X7V
         PCPCCfXKm3viwQEnTbnqe9Hmvx1VxNUkOa0NwoTmfUAtHQ7xNDJVaeY7TbE2SJ6J5kuu
         75U8FZSMBUPGqizJxOentmcFNl7FOnpt5ykfIxpmzOPW+81qsNoHASPIiv9Ag0m91pYO
         A7PMhk6fvhY2M+gk3AqzeeVbmDAR4ZQbksIaWPq0JOO6KlRRJ7BkspSL/eeHwxGWWUuR
         0W9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hyUFOt/DRN/Ski8ME3oR/RR/GlHotAPBehInw4A8rwg=;
        b=OUEzcU6emlJKyce/iyd/M/84cU64yjSJOKcGoFXCEsdtjnmB9vK0tnAOZotY/g56k3
         B5o1pkAxVH+VDqZqLVs7got6G6Hz2sVptxBYTAWweese4gNCC73o9/CBZ7DUoWta9tTm
         wUSYKDaSN4fWnXTaSzmECUeFGLmP9WJ1kBqP/w+1jMseFjLxie34lz60v8wbmgDHo5zG
         8arhKVAQGrCSokhxuJBo7aBAoxICmMaPNQFUsE7LR44hPdU4Rf7CYzzqMyJXt0LZK8cD
         QOlcYhUeGNSdXA7sNsnrX3gCWvRLmoPO/JwFb1aPSglSCXdev8fmQ6gO1U6xm1C6yLp6
         LgMw==
X-Gm-Message-State: AOAM532b8wNf3StfSOOYJcOWRWSFhA/oTI/CDoTxYiUCTulM1ofRW3fK
        rSsNjDjCrV/SrWdZOfQVBEy3fQ==
X-Google-Smtp-Source: ABdhPJyENdKr8qIAthVQEawv5CUFjquAyiYxPmTNdkS3Ztf2vdRDQRZu+ZJIjFg7sqSDSNJxNt8pNQ==
X-Received: by 2002:a17:902:b598:b0:14a:ca21:9737 with SMTP id a24-20020a170902b59800b0014aca219737mr7192664pls.73.1642531822281;
        Tue, 18 Jan 2022 10:50:22 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id q64sm3472329pjk.8.2022.01.18.10.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 10:50:21 -0800 (PST)
Date:   Tue, 18 Jan 2022 11:50:19 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 5/9] remoteproc: imx_rproc: make clk optional
Message-ID: <20220118185019.GG1119324@p14s>
References: <20220111033333.403448-1-peng.fan@oss.nxp.com>
 <20220111033333.403448-8-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111033333.403448-8-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jan 11, 2022 at 11:33:29AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> To i.MX8QXP/QM/ULP and i.MX7ULP, Mcore maybe out of control of Linux.
> And in such case, no need clk, so make clk optional with has_clk.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7b2578177ea8..0e99a3ca6fbc 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -89,6 +89,7 @@ struct imx_rproc {
>  	struct work_struct		rproc_work;
>  	struct workqueue_struct		*workqueue;
>  	void __iomem			*rsc_table;
> +	bool				has_clk;

I am usually weary of bloating structures with flags.  I suggest achieving the
same functionality with a macro that compares priv->dcfg with the right
imx_rproc_dcfg structure. 

>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> @@ -724,6 +725,9 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	if (dcfg->method == IMX_RPROC_NONE)
>  		return 0;
>  
> +	if (!priv->has_clk)
> +		return 0;
> +
>  	priv->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
> @@ -768,6 +772,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	priv->rproc = rproc;
>  	priv->dcfg = dcfg;
>  	priv->dev = dev;
> +	priv->has_clk = true;
>  
>  	dev_set_drvdata(dev, rproc);
>  	priv->workqueue = create_workqueue(dev_name(dev));
> -- 
> 2.25.1
> 
