Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901AAEB64DC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 15:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbjGJPy2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 11:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbjGJPy0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 11:54:26 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C489519F
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 08:54:02 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-666e64e97e2so2323767b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689004442; x=1691596442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMSW+hTxoeJnUQYqOp6d0h2caQRlX9Av8EhOOGVFTdk=;
        b=j5bN/2rGOIVOFWr6X1GxmlgVr6bzZ0LPBAVI7aDzgir9DCNfZrW1F/SVJgVyq3Rn4Q
         NDm7p30jKHaWDprDZ+XFmDVuiwsyT1xpW8VI4hyFR5rmOeghNtvx4wRYJD52vImzvUx7
         75UmCw8cDp9xCXA2h/bYLZR6WzWHJizYT+colT6IneOP+DatYucsm2TRwuUvv7UEBA1D
         y4xdA6EjDACtLy0jeSsV23qoqRh5VDo+HsgNbz7ztXFJSg3JoFsaWVy3jYyEcSP9kCzA
         z4FnEDysqwdH4JzoJ9GoImIJ3yhdKyFIbyFL8wafIPpkg7xrhK5ZLWsQ+PAyT3M8BnnU
         sekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689004442; x=1691596442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMSW+hTxoeJnUQYqOp6d0h2caQRlX9Av8EhOOGVFTdk=;
        b=Jee43DUuW6vWxAUqUgzvDCI0OT46zRRICHOGBiXeD1FC/6RKxBvp7jfC/q03IeyOP/
         i4YSbMCxC5AlhXDvRE8GcD0ZMCvjm0cWivBoOWyQFj+BWryUSyS5XphIqVKq5UwEeCy/
         L5N6s1qE4FuX+gQqf3BBwLKux07gkN0NTwSDzFpDwhQhQhAz/ErDyH2m6Iha6aODvKYV
         x4e10MEfL+2dep2frRCHMc4wJzEyazg43pAhFJ0qfdyisSHXHhlUk4oX+tXhpulDnZpR
         /XkaqGGPtSSyGJ/vJY5pgWERFPkkK9X8IXw8So2gllEBQIcXpNz4X0K1S+Syhsl0iizw
         bxjg==
X-Gm-Message-State: ABy/qLbBa3+W/wCM6a0B542heBuDYJReSxaM8aky2n/vbhJrcYWu4pXK
        HKepFLokJl5xlvA9JwEL4pPb8A==
X-Google-Smtp-Source: APBJJlG9Kvh6R1bq3ZlIOnrsRa803tXNfyhlL8ge26rigJUw8qNHealMTt6slSq+7Yq3p7tL2TFJlg==
X-Received: by 2002:a05:6a20:9188:b0:122:cb38:637c with SMTP id v8-20020a056a20918800b00122cb38637cmr12807361pzd.49.1689004442259;
        Mon, 10 Jul 2023 08:54:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a799:9acc:26b9:1451])
        by smtp.gmail.com with ESMTPSA id bg4-20020a1709028e8400b001b53be3d942sm49863plb.232.2023.07.10.08.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 08:54:01 -0700 (PDT)
Date:   Mon, 10 Jul 2023 09:53:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-remoteproc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] remoteproc: imx_rproc: add start up delay
Message-ID: <ZKwpl1ZGJcX2RmJb@p14s>
References: <20230707232444.374431-1-marex@denx.de>
 <20230707232444.374431-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707232444.374431-2-marex@denx.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Jul 08, 2023 at 01:24:44AM +0200, Marek Vasut wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is case that after remoteproc start remote processor[M4], the M4
> runs slow and before M4 finish its own rpmsg framework initialization,
> linux sends out vring kick message, then M4 firmware drops the kick
> message. Some NXP released Cortex-M[x] images has such limitation that
> it requires linux sends out vring kick message after M4 firmware finish
> its rpmsg framework initialization.
> 
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Note: picked from NXP downstream LF-6630-2 remoteproc: imx_rproc: add start up delay
> https://github.com/nxp-imx/linux-imx.git 0b1b91c95b291a3b60d6224b13f6a95a75896abf
> ---
> Note: Literally all of the NXP BSP 2.13.0 firmware builds fail to boot
>       without this being set to something like 50..500 ms , so this is
>       rather useful to have.

My stance on this hasn't changed - hacks such as these do not scale and are a
nightmare to maintain.  The problem should be fixed in the M4's firmware.

> ---
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-remoteproc@vger.kernel.org
> ---
>  drivers/remoteproc/imx_rproc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f9874fc5a80ff..d0eb96d6a4fe1 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
>  #include <linux/interrupt.h>
> @@ -110,6 +111,7 @@ struct imx_rproc {
>  	u32				core_index;
>  	struct device                   **pd_dev;
>  	struct device_link              **pd_dev_link;
> +	u32				startup_delay;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -382,6 +384,9 @@ static int imx_rproc_start(struct rproc *rproc)
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
>  
> +	if (priv->startup_delay)
> +		msleep(priv->startup_delay);
> +
>  	return ret;
>  }
>  
> @@ -1090,6 +1095,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	if (rproc->state != RPROC_DETACHED)
>  		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
>  
> +	ret = of_property_read_u32(dev->of_node, "fsl,startup-delay-ms", &priv->startup_delay);
> +	if (ret)
> +		priv->startup_delay = 0;
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> -- 
> 2.40.1
> 
