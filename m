Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00CEECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Sep 2022 20:09:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiISUJv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Sep 2022 16:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiISUJu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Sep 2022 16:09:50 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059057669
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 13:09:48 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id t190so358286pgd.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 13:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=q7hoVLqn33/PgcVaKNRBWv3m1lMuwn8DT/v7+VpDQeg=;
        b=OFPKwExaWSnq0GeZV0ziPzDUKJ7ht3CQ0GbxxsB79vPXfsKcZLbfTr9tBzpL7+OPuW
         YnHk+FGAolhUe/HsCX/Mv9XHuDReOrrfMGCwPy33Zwqwfb5sa+jDNOPiMXEhMJVryqCB
         Q2Ac+hMtbQ8jqwTpZ5JbkdWE4QaFQXtJHdMnRYAGc9rbIPwNbZ4Xhzs7A2vOyxK6QPqO
         o0mxP8zISwmhEJp8lGmVtxGryJS2Q/5NIgaFEZmgOJpmt4YPY1pwyU3DA5JQg/K07JCH
         jl2ZcELY1JH01cHlYS+4Gk5xBoRyOKOBLCd9Oq6jSnA0gq3dOcT0eIjHgyZA0/YZXmum
         sd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=q7hoVLqn33/PgcVaKNRBWv3m1lMuwn8DT/v7+VpDQeg=;
        b=Ae2aFCSlJPZyIRD+2jIa2FxkoDG46hqWG9eVt+BaiSed0tUzWe4GjMyWjzgqggwbFT
         xSEdtz9t6ogxqjUdu7QCnoEPLBJFL5KfXDtwiqabcLDOy6p3TDB0m/K+WR++BH2S4SG9
         VncAfdK4g3WwVo9/5GckfqGVXQqVdNdV5s9BtKjO67jt3O8zC2sgrIK+3UQ3NHuhQn1K
         RW5wlUXpNn6zJN3RjVBoIfVaEhfbvW4jBqoBi1dLa5gNW64T8HC1sui2NSZfen1Hzk51
         XkcfsnKBZbSdGyTXLCJjrwXnELAyyEk/8lulRy9YSJj7empwylcus2/3OCV0ziVhp8F2
         1Z1g==
X-Gm-Message-State: ACrzQf0pIMYftITiQwkDzX9zbOTU3i03HgAdoDZrQPXUkX+kWP2bcj1c
        F6K3p3zVzsHd0DvHJ2d0sA8zhA==
X-Google-Smtp-Source: AMsMyM7gA0Ia684MoifEEQmDi7GWTLIwzT8HnZ+m0K7Q5+DSEavVVLHJFlerNwQAAFN8/N5IQVsYnQ==
X-Received: by 2002:a63:1d22:0:b0:439:3e7c:8af7 with SMTP id d34-20020a631d22000000b004393e7c8af7mr17207430pgd.78.1663618187545;
        Mon, 19 Sep 2022 13:09:47 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001769cfa5cd4sm21136781plf.49.2022.09.19.13.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 13:09:46 -0700 (PDT)
Date:   Mon, 19 Sep 2022 14:09:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bjorn Andersson <andersson@kernel.org>, Suman Anna <s-anna@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kishon@ti.com, danishanwar@ti.com, nm@ti.com, vigneshr@ti.com,
        grygorii.strashko@ti.com
Subject: Re: [RFC/PATCH] remoteproc/keystone: switch to using gpiod API
Message-ID: <20220919200944.GC759648@p14s>
References: <Yxe20ehiOnitDGus@google.com>
 <20220908215747.GA246255@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908215747.GA246255@p14s>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 08, 2022 at 03:57:47PM -0600, Mathieu Poirier wrote:
> On Tue, Sep 06, 2022 at 02:08:33PM -0700, Dmitry Torokhov wrote:
> > This patch switches the driver away from legacy gpio/of_gpio API to
> > gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> > make private to gpiolib.
> > 
> > Note that there is a behavior change in the driver: previously the
> > driver did not actually request GPIO, it simply parsed GPIO number out
> > of device tree and poked at it.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/remoteproc/keystone_remoteproc.c | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> This change looks good to me but I would like someone from the TI brigade test
> this before applying it.
>

Applied.

> Thanks,
> Mathieu
> 
> > 
> > diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> > index 594a9b43b7ae..95b39741925d 100644
> > --- a/drivers/remoteproc/keystone_remoteproc.c
> > +++ b/drivers/remoteproc/keystone_remoteproc.c
> > @@ -14,7 +14,7 @@
> >  #include <linux/workqueue.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_reserved_mem.h>
> > -#include <linux/of_gpio.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/regmap.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/remoteproc.h>
> > @@ -59,10 +59,10 @@ struct keystone_rproc {
> >  	int num_mems;
> >  	struct regmap *dev_ctrl;
> >  	struct reset_control *reset;
> > +	struct gpio_desc *kick_gpio;
> >  	u32 boot_offset;
> >  	int irq_ring;
> >  	int irq_fault;
> > -	int kick_gpio;
> >  	struct work_struct workqueue;
> >  };
> >  
> > @@ -232,10 +232,10 @@ static void keystone_rproc_kick(struct rproc *rproc, int vqid)
> >  {
> >  	struct keystone_rproc *ksproc = rproc->priv;
> >  
> > -	if (WARN_ON(ksproc->kick_gpio < 0))
> > +	if (!ksproc->kick_gpio)
> >  		return;
> >  
> > -	gpio_set_value(ksproc->kick_gpio, 1);
> > +	gpiod_set_value(ksproc->kick_gpio, 1);
> >  }
> >  
> >  /*
> > @@ -432,9 +432,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
> >  		goto disable_clk;
> >  	}
> >  
> > -	ksproc->kick_gpio = of_get_named_gpio_flags(np, "kick-gpios", 0, NULL);
> > -	if (ksproc->kick_gpio < 0) {
> > -		ret = ksproc->kick_gpio;
> > +	ksproc->kick_gpio = gpiod_get(dev, "kick", GPIOD_ASIS);
> > +	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
> > +	if (ret) {
> >  		dev_err(dev, "failed to get gpio for virtio kicks, status = %d\n",
> >  			ret);
> >  		goto disable_clk;
> > @@ -466,6 +466,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
> >  
> >  release_mem:
> >  	of_reserved_mem_device_release(dev);
> > +	gpiod_put(ksproc->kick_gpio);
> >  disable_clk:
> >  	pm_runtime_put_sync(dev);
> >  disable_rpm:
> > @@ -480,6 +481,7 @@ static int keystone_rproc_remove(struct platform_device *pdev)
> >  	struct keystone_rproc *ksproc = platform_get_drvdata(pdev);
> >  
> >  	rproc_del(ksproc->rproc);
> > +	gpiod_put(ksproc->kick_gpio);
> >  	pm_runtime_put_sync(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> >  	rproc_free(ksproc->rproc);
> > -- 
> > 2.37.2.789.g6183377224-goog
> > 
> > 
> > -- 
> > Dmitry
