Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06637C54EE9
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Sep 2022 21:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiIHV72 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Sep 2022 17:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiIHV7K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Sep 2022 17:59:10 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DB313B10D
        for <linux-remoteproc@vger.kernel.org>; Thu,  8 Sep 2022 14:58:07 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id q63so17990042pga.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Sep 2022 14:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=zfA7HSiKgjWO9Mg4FuYytU28dDXflMeBRCSCwHqciIQ=;
        b=JG+3q0Mg9KVWzTtQllyN7SyXYZ61BCvGbeOdbe7ILmxsR8gV4dT/9vvk0QNT7thCFw
         2qOYXyQxpkm0xX2wvm8b3RWXE4aFt+zRerjIQWxYdkQ8nJ3VD/+2rLpCrBNvksxTQkvg
         SVmGTWdXMbgB3kyPcMjJQ95OVtvlQvYXvux6hzwGLGnejr9GV5O+nN4jjAylwMCGzxQh
         gTF8dp8d3rQ7ZgvJZjMAhcE9tL21pQa/Ad493sDXOYqri46mCrMGwb/XCEJC4tEooTlu
         ylYFvDBuI6P33uZRD0mdNPtkCb+0DwG56RCxdaTVKOXDNP34M5D0UOWhL6ENQ3YEt9Oy
         8FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zfA7HSiKgjWO9Mg4FuYytU28dDXflMeBRCSCwHqciIQ=;
        b=HsvOrBxHjBFGwSRiAB4nXqlpGUNgM+8mxCILSIdqU4rY5xqL/V92b5C3pFXs+IZZ4P
         dWbiwoSoWyQSGVUHvYyXP+VvHGI+xZz23V0pL12fdaLhwCw4YUZ8NYzP/LuM7XLE4pwl
         pGyJ/QmdukG6QeW+RyCgfFpM13Cr2tTc0qLTuZTc1WMCLK0auFMja/mwmYq5ZEm9ozh7
         f0nMmZL+2DGFXwNLPXhnNyCw/zs7S5OhZhUt6o3B5WuVV2fgUxBmbOX9kYcBkk6vP/3R
         +SNdA6ij8VEoSjrrYT+55a4tnhVwUVj62MhaLa7Aoo+L57IZ2tNXINW/DUV+slMd1cIp
         cUbw==
X-Gm-Message-State: ACgBeo3iAXmJt4KXPVKCcilhb72uC26MsDLVvxnH0SgJ8/ymB7P8byDs
        dKAi+vvWuwsDhNCr4eJMR8kxow==
X-Google-Smtp-Source: AA6agR5stbvgr0+jGXqDOfcEYUlDDFw8CQiyJW4hv1AG/W/6x+PNZtRFXDt0mlhkjhl+xDEfNEzKRg==
X-Received: by 2002:a63:a501:0:b0:434:ff77:1fda with SMTP id n1-20020a63a501000000b00434ff771fdamr7612456pgf.310.1662674270417;
        Thu, 08 Sep 2022 14:57:50 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709027e8f00b00176be23bbb3sm259pla.172.2022.09.08.14.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 14:57:49 -0700 (PDT)
Date:   Thu, 8 Sep 2022 15:57:47 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bjorn Andersson <andersson@kernel.org>, Suman Anna <s-anna@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kishon@ti.com, danishanwar@ti.com, nm@ti.com, vigneshr@ti.com,
        grygorii.strashko@ti.com
Subject: Re: [RFC/PATCH] remoteproc/keystone: switch to using gpiod API
Message-ID: <20220908215747.GA246255@p14s>
References: <Yxe20ehiOnitDGus@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxe20ehiOnitDGus@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 06, 2022 at 02:08:33PM -0700, Dmitry Torokhov wrote:
> This patch switches the driver away from legacy gpio/of_gpio API to
> gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> make private to gpiolib.
> 
> Note that there is a behavior change in the driver: previously the
> driver did not actually request GPIO, it simply parsed GPIO number out
> of device tree and poked at it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/remoteproc/keystone_remoteproc.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

This change looks good to me but I would like someone from the TI brigade test
this before applying it.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 594a9b43b7ae..95b39741925d 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -14,7 +14,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
> -#include <linux/of_gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/remoteproc.h>
> @@ -59,10 +59,10 @@ struct keystone_rproc {
>  	int num_mems;
>  	struct regmap *dev_ctrl;
>  	struct reset_control *reset;
> +	struct gpio_desc *kick_gpio;
>  	u32 boot_offset;
>  	int irq_ring;
>  	int irq_fault;
> -	int kick_gpio;
>  	struct work_struct workqueue;
>  };
>  
> @@ -232,10 +232,10 @@ static void keystone_rproc_kick(struct rproc *rproc, int vqid)
>  {
>  	struct keystone_rproc *ksproc = rproc->priv;
>  
> -	if (WARN_ON(ksproc->kick_gpio < 0))
> +	if (!ksproc->kick_gpio)
>  		return;
>  
> -	gpio_set_value(ksproc->kick_gpio, 1);
> +	gpiod_set_value(ksproc->kick_gpio, 1);
>  }
>  
>  /*
> @@ -432,9 +432,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  		goto disable_clk;
>  	}
>  
> -	ksproc->kick_gpio = of_get_named_gpio_flags(np, "kick-gpios", 0, NULL);
> -	if (ksproc->kick_gpio < 0) {
> -		ret = ksproc->kick_gpio;
> +	ksproc->kick_gpio = gpiod_get(dev, "kick", GPIOD_ASIS);
> +	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
> +	if (ret) {
>  		dev_err(dev, "failed to get gpio for virtio kicks, status = %d\n",
>  			ret);
>  		goto disable_clk;
> @@ -466,6 +466,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  
>  release_mem:
>  	of_reserved_mem_device_release(dev);
> +	gpiod_put(ksproc->kick_gpio);
>  disable_clk:
>  	pm_runtime_put_sync(dev);
>  disable_rpm:
> @@ -480,6 +481,7 @@ static int keystone_rproc_remove(struct platform_device *pdev)
>  	struct keystone_rproc *ksproc = platform_get_drvdata(pdev);
>  
>  	rproc_del(ksproc->rproc);
> +	gpiod_put(ksproc->kick_gpio);
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	rproc_free(ksproc->rproc);
> -- 
> 2.37.2.789.g6183377224-goog
> 
> 
> -- 
> Dmitry
