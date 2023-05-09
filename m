Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A62C77B75
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 May 2023 20:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbjEIUIn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 May 2023 16:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjEIUIm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 May 2023 16:08:42 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FD410C8
        for <linux-remoteproc@vger.kernel.org>; Tue,  9 May 2023 13:08:41 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1aad55244b7so48467785ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 May 2023 13:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683662921; x=1686254921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R5yFXJpFYYPBvv2gYtK4nzvS+8gi0j0YQx+tpAx3do8=;
        b=L4iW/eajQ1x43A3kVh5iovfAlknWcDNfeXtCswRGgNTSezbbw7WPVcJVEkuu3YTi3w
         HZ4gHUbO7bdG/2a1KNobEGpb880qVxVkJz3mbMEZm18mpDComMQqgI8/RmV5iNNC2N5P
         eNTO6EIl62w6O3JP1YjqYLO1wBvZoDyGhOFAUGIstyOrJDmqVnw9Ew3LfKm4o+V7fzpJ
         smF0JFgstQK2UgaRRunidHmw7LUZ46bE4gUoDNA5ktFBOSoOuoGRIdoQNyC3dqxD6cW1
         /uYMMl53WRytk6jlUA9wUoJHwvHGfemm/ILIBUvIU4cg9CCQn7ltKNQ6mB8cFTzwyWmt
         LzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683662921; x=1686254921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5yFXJpFYYPBvv2gYtK4nzvS+8gi0j0YQx+tpAx3do8=;
        b=ZttRPJsPngXrvBfsdPkREzEj5q1vPSpDSyhBafFSzQS7vi2PqcWiMiWcLnyk3eoPSy
         s3KhHF7dEtYZnHqJTVrgVKtDz6DRRqQgQaxmAtuCnLFVDmAqXrN0ELs0YHYqFVrwFmuH
         lSeFU1knTfecNmJIyt34EZwu0D2mrCMxNuNw+rmnP8lq5+v485j5UrtMyzIlso6TAVPz
         FkJo+UaLx4ndw+vfhrPAcO9KZiqoYb1hYNaglBb+T7ic+BnXJyH8fAqKvyRAXE5rKSa8
         iv4EuqQMEOBsYQfzI5RCaoWlYyXQhTM6UgIV02UZqF6oTg/0Wq21U/lREdteHpituQUP
         zg1A==
X-Gm-Message-State: AC+VfDwFMhQpmb6eQ4ou6m3yfT19tJE/CBdL0uFh2N9Gomg1qK+v3aX5
        dxCd3qPjedBv54z4zg04XKftog==
X-Google-Smtp-Source: ACHHUZ5YyMLX+oPAbFkOBk3bKpJA2/DvBwAFKb4s52WAPzLQ83YhSWdLsdsodIXw+4xsQjjgjgXkdA==
X-Received: by 2002:a17:902:ecc3:b0:1ab:528:5f85 with SMTP id a3-20020a170902ecc300b001ab05285f85mr19803294plh.59.1683662921049;
        Tue, 09 May 2023 13:08:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5e48:ff40:3eaf:3f9e])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902f68400b001a19f3a661esm2015563plg.138.2023.05.09.13.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 13:08:40 -0700 (PDT)
Date:   Tue, 9 May 2023 14:08:37 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: use modern pm_ops
Message-ID: <ZFqoRdARznP/tPIq@p14s>
References: <20230420213610.2219080-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420213610.2219080-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 20, 2023 at 11:36:04PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without CONFIG_PM, the driver warns about unused functions:
> 
> drivers/remoteproc/imx_dsp_rproc.c:1210:12: error: 'imx_dsp_runtime_suspend' defined but not used [-Werror=unused-function]
>  1210 | static int imx_dsp_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/remoteproc/imx_dsp_rproc.c:1178:12: error: 'imx_dsp_runtime_resume' defined but not used [-Werror=unused-function]
>  1178 | static int imx_dsp_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> 
> Change the old SET_SYSTEM_SLEEP_PM_OPS()/SET_RUNTIME_PM_OPS()
> helpers to their modern replacements that avoid the warning,
> and remove the now unnecessary __maybe_unused annotations
> on the other PM helper functions.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index cab06dbf37fb..2d75dea43f20 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1243,7 +1243,7 @@ static void imx_dsp_load_firmware(const struct firmware *fw, void *context)
>  	release_firmware(fw);
>  }
>  
> -static __maybe_unused int imx_dsp_suspend(struct device *dev)
> +static int imx_dsp_suspend(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -1278,7 +1278,7 @@ static __maybe_unused int imx_dsp_suspend(struct device *dev)
>  	return pm_runtime_force_suspend(dev);
>  }
>  
> -static __maybe_unused int imx_dsp_resume(struct device *dev)
> +static int imx_dsp_resume(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	int ret = 0;
> @@ -1312,9 +1312,8 @@ static __maybe_unused int imx_dsp_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(imx_dsp_suspend, imx_dsp_resume)
> -	SET_RUNTIME_PM_OPS(imx_dsp_runtime_suspend,
> -			   imx_dsp_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(imx_dsp_suspend, imx_dsp_resume)
> +	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
>  };
>  
>  static const struct of_device_id imx_dsp_rproc_of_match[] = {
> @@ -1332,7 +1331,7 @@ static struct platform_driver imx_dsp_rproc_driver = {
>  	.driver = {
>  		.name = "imx-dsp-rproc",
>  		.of_match_table = imx_dsp_rproc_of_match,
> -		.pm = &imx_dsp_rproc_pm_ops,
> +		.pm = pm_ptr(&imx_dsp_rproc_pm_ops),
>  	},
>  };
>  module_platform_driver(imx_dsp_rproc_driver);
> -- 
> 2.39.2
> 
