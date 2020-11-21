Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6B4C388F9
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 04:01:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6B4D2078E
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 04:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lti1Djhh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgKUEBJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 23:01:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgKUEBJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 23:01:09 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A01C061A47
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 20:01:08 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id f16so10733188otl.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 20:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4Y9FIWVpvTLLbYlbUzqI1xM7m60PgV6jgRpEFOF8Uyk=;
        b=Lti1DjhhP6ysaccoEG93dtY6MGklRO7Sd/vtMqCI+/C7eW8IlTQASlFNkmQvkz3nlf
         R2qU/FxfjSGTfUBYQ1ciq1CqWkpY2Ykbs6Bzo9lCJn7BjWRz8uaBNMNQAQXDmnaq0wH6
         3I/iahDUDUSauTopH/G8yWC5pDTz27/rQAG86WUhZwBwCqHTYxsa57DvaXFtzaOC6v2J
         ZmxQlex9F4wuP8jmrVEcWgBu2pOa5cM89tsYOgM2CPn+ekcPiKJYrpVpjQXsWd8MNJYG
         ZJ7P219jT+YoRg93kh38EmC9ses2iRdO1qlWdx2s/MDygqZVRwXeyWwiRRSHarcZbSfK
         vfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Y9FIWVpvTLLbYlbUzqI1xM7m60PgV6jgRpEFOF8Uyk=;
        b=K+NYFqqi7Iwg+e+t7eLMlW7W160sfTLvqjxxpFhUAczHmwkLxsQgy+X6NuqCG5i++o
         7W3ATKY+eAWII/+0GdkYvIfYUivA0MWtdCJ9v56FHsEFOLx5njUE08BBlz6VfOdbObOu
         nXDvANtAm0r1zw+/dndUuIvsVnD5zzSlk9i/LauK/X8VLjfgEGn+rnjzY1PPUPH4RLpU
         i4xjOpzzCm1t0bo8qpUnZvncgNoWdCaFEjnzrwGw6YCL/lFOzNpgKDOpcD3aSIATSfCb
         Q7CnqMzPUyMwsD+PD7mjMLZwsxIQXc5wN+o9JlQzXmcQSScm/mefot7VjSIPav68YGcp
         f9+w==
X-Gm-Message-State: AOAM533SFnWcZ+6gBgMHkN7LQVfcy0Dst8BRaE+WJn19TZC7sbGEgMmU
        TT9omM1fPsE/GT9yQXmH5qGxCw==
X-Google-Smtp-Source: ABdhPJwjen+PgJxLI01D46s2aM7Dve1f7PrvOg8pCENIYb9WfW/aQ3fvsh9yzAjpDL03AVgwcQaRDw==
X-Received: by 2002:a9d:2923:: with SMTP id d32mr2629084otb.117.1605931267979;
        Fri, 20 Nov 2020 20:01:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k26sm2667521oor.6.2020.11.20.20.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 20:01:06 -0800 (PST)
Date:   Fri, 20 Nov 2020 22:01:04 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     fuyao@allwinnertech.com
Cc:     mripard@kernel.org, wens@csie.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwspinlock: add SUNXI implementation
Message-ID: <20201121040104.GI9177@builder.lan>
References: <cover.1605767679.git.fuyao@allwinnertech.com>
 <f2b445651339e616af5348f2e7008dbc42275159.1605767679.git.fuyao@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2b445651339e616af5348f2e7008dbc42275159.1605767679.git.fuyao@allwinnertech.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 19 Nov 00:44 CST 2020, fuyao@allwinnertech.com wrote:

> From: fuyao <fuyao@allwinnertech.com>
> 
> Add hwspinlock support for the SUNXI Hardware Spinlock device.
> 
> The Hardware Spinlock device on SUNXI provides hardware assistance
> for synchronization between the multiple processors in the system
> (Cortex-A7, or1k, Xtensa DSP, Cortex-A53)
> 
> Signed-off-by: fuyao <fuyao@allwinnertech.com>
> ---
>  MAINTAINERS                           |   6 +
>  drivers/hwspinlock/Kconfig            |  10 ++
>  drivers/hwspinlock/Makefile           |   1 +
>  drivers/hwspinlock/sunxi_hwspinlock.c | 205 ++++++++++++++++++++++++++
>  4 files changed, 222 insertions(+)
>  create mode 100644 drivers/hwspinlock/sunxi_hwspinlock.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e451dcce054f0..68d25574432d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -737,6 +737,12 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	drivers/staging/media/sunxi/cedrus/
>  
> +ALLWINNER HWSPINLOCK DRIVER
> +M:	fuyao <fuyao@allwinnertech.com>
> +S:	Maintained
> +F:	drivers/hwspinlock/sunxi_hwspinlock.c
> +F:      Documentation/devicetree/bindings/hwlock/sunxi,hwspinlock.yaml
> +
>  ALPHA PORT
>  M:	Richard Henderson <rth@twiddle.net>
>  M:	Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
> index 32cd26352f381..4d0d516dcb544 100644
> --- a/drivers/hwspinlock/Kconfig
> +++ b/drivers/hwspinlock/Kconfig
> @@ -55,6 +55,16 @@ config HWSPINLOCK_STM32
>  
>  	  If unsure, say N.
>  
> +config HWSPINLOCK_SUNXI
> +	tristate "SUNXI Hardware Spinlock device"
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	help
> +	  Say y here to support the SUNXI Hardware Semaphore functionality, which
> +	  provides a synchronisation mechanism for the various processor on the
> +	  SoC.
> +
> +	  If unsure, say N.
> +
>  config HSEM_U8500
>  	tristate "STE Hardware Semaphore functionality"
>  	depends on ARCH_U8500 || COMPILE_TEST
> diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
> index ed053e3f02be4..839a053205f73 100644
> --- a/drivers/hwspinlock/Makefile
> +++ b/drivers/hwspinlock/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_HWSPINLOCK_SIRF)		+= sirf_hwspinlock.o
>  obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
>  obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
>  obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
> +obj-$(CONFIG_HWSPINLOCK_SUNXI)		+= sunxi_hwspinlock.o
> diff --git a/drivers/hwspinlock/sunxi_hwspinlock.c b/drivers/hwspinlock/sunxi_hwspinlock.c
> new file mode 100644
> index 0000000000000..2c3dc148c9b72
> --- /dev/null
> +++ b/drivers/hwspinlock/sunxi_hwspinlock.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SUNXI hardware spinlock driver
> + *
> + * Copyright (C) 2020 Allwinnertech - http://www.allwinnertech.com
> + *

Please remove the remainder of this comment, it's already covered by the
SPDX header above.

> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/bitops.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/hwspinlock.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/err.h>
> +#include <linux/reset.h>

You don't need all of these.

> +
> +#include "hwspinlock_internal.h"
> +
> +/* hardware spinlock register list */
> +#define	LOCK_SYS_STATUS_REG             (0x0000)
> +#define	LOCK_STATUS_REG                 (0x0010)
> +#define LOCK_BASE_OFFSET                (0x0100)
> +#define LOCK_BASE_ID                    (0)

No need for the parenthesis on these, please drop them.

> +
> +/* Possible values of SPINLOCK_LOCK_REG */
> +#define SPINLOCK_NOTTAKEN               (0)     /* free */
> +#define SPINLOCK_TAKEN                  (1)     /* locked */
> +
> +struct sunxi_spinlock_config {
> +	int nspin;
> +};
> +
> +static int sunxi_hwspinlock_trylock(struct hwspinlock *lock)
> +{
> +	void __iomem *lock_addr = lock->priv;
> +
> +	/* attempt to acquire the lock by reading its value */
> +	return (readl(lock_addr) == SPINLOCK_NOTTAKEN);

Please drop the outer ().

> +}
> +
> +static void sunxi_hwspinlock_unlock(struct hwspinlock *lock)
> +{
> +	void __iomem *lock_addr = lock->priv;
> +
> +	/* release the lock by writing 0 to it */
> +	writel(SPINLOCK_NOTTAKEN, lock_addr);
> +}
> +
> +/*
> + * relax the SUNXI interconnect while spinning on it.
> + *
> + * The specs recommended that the retry delay time will be
> + * just over half of the time that a requester would be
> + * expected to hold the lock.
> + *
> + * in sunxi spinlock time less then 200 cycles
> + *
> + * The number below is taken from an hardware specs example,
> + * obviously it is somewhat arbitrary.

Thank you for the good explanation.

> + */
> +static void sunxi_hwspinlock_relax(struct hwspinlock *lock)
> +{
> +	ndelay(50);
> +}
> +
> +static const struct hwspinlock_ops sunxi_hwspinlock_ops = {
> +	.trylock = sunxi_hwspinlock_trylock,
> +	.unlock = sunxi_hwspinlock_unlock,
> +	.relax = sunxi_hwspinlock_relax,
> +};
> +
> +struct sunxi_hwspinlock_device {
> +	struct hwspinlock_device *bank;
> +	struct clk *bus_clk;
> +	struct reset_control *reset;
> +};
> +
> +static void sunxi_hwspinlock_clk_init(struct platform_device *pdev,
> +				      struct sunxi_hwspinlock_device *private)
> +{
> +	private->bus_clk = devm_clk_get(&pdev->dev, NULL);
> +	private->reset = devm_reset_control_get(&pdev->dev, NULL);

You should check the return value of these, e.g. for EPROBE_DEFER and if
so return appropriately from sunxi_hwspinlock_probe().

So please move them to the probe function to make this easier and
cleaner.

> +
> +	if (private->reset)
> +		reset_control_deassert(private->reset);
> +	if (private->bus_clk)
> +		clk_prepare_enable(private->bus_clk);

Both of these apis start with

	if (!argument)
		return;

So there's no need for you to check for NULL before calling them. Also
to make it clear that you want these to be deassered and prepare_enabled
between probe and remvoe, move them into probe (and next function into
remove).

> +}
> +
> +static void sunxi_hwspinlock_clk_dinit(struct sunxi_hwspinlock_device *private)
> +{
> +	if (private->reset)
> +		reset_control_assert(private->reset);
> +	if (private->bus_clk)
> +		clk_disable(private->bus_clk);
> +}
> +
> +static const struct sunxi_spinlock_config spin_ver_1 = {
> +	.nspin = 32,
> +};
> +
> +static const struct of_device_id sunxi_hwspinlock_of_match[] = {
> +	{
> +		.compatible = "allwinner,h3-hwspinlock",
> +		.data = &spin_ver_1,

If all cases comes with the same "data", then please just put nspin in a
#define until you're going to support hardware that has some other
number of locks.

> +	},
> +	{
> +		.compatible = "allwinner,h6-hwspinlock",
> +		.data = &spin_ver_1,
> +	},
> +	{ /* Sentinel */ },

No need to spell out "/* Sentinel */", leave it emtpy and please drop the , at
the end.

> +};
> +MODULE_DEVICE_TABLE(of, sunxi_hwspinlock_of_match);

Please move this down by sunxi_hwspinlock_driver and use
device_get_match_data() instead of of_match_device().

> +
> +static int sunxi_hwspinlock_probe(struct platform_device *pdev)
> +{
> +	struct sunxi_hwspinlock_device *private;
> +	struct hwspinlock_device *bank;
> +	struct hwspinlock *hwlock;
> +	const struct sunxi_spinlock_config *config;
> +	const struct of_device_id *match;
> +	void __iomem *iobase;
> +	int num_locks, i, ret;
> +
> +	iobase = devm_platform_ioremap_resource(pdev, 0);
> +	if (PTR_ERR(iobase))
> +		return PTR_ERR(iobase);
> +
> +	match = of_match_device(of_match_ptr(sunxi_hwspinlock_of_match),
> +				&pdev->dev);
> +	if (!match)
> +		return -ENODEV;
> +
> +	config = match->data;
> +	num_locks = config->nspin;
> +
> +	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
> +	if (!private)
> +		return -ENOMEM;
> +
> +	bank = devm_kzalloc(&pdev->dev,
> +			    sizeof(*bank) + num_locks * sizeof(*hwlock),
> +			    GFP_KERNEL);
> +	if (!bank)
> +		return -ENOMEM;
> +
> +	private->bank = bank;
> +	sunxi_hwspinlock_clk_init(pdev, private);
> +
> +	platform_set_drvdata(pdev, private);
> +
> +	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
> +		hwlock->priv = iobase + LOCK_BASE_OFFSET + sizeof(u32) * i;
> +
> +	ret = devm_hwspin_lock_register(&pdev->dev, bank, &sunxi_hwspinlock_ops,
> +					LOCK_BASE_ID, num_locks);

This returns 0 or -errno, so rather than returning ret if ret otherwise
0, just do:

	return devm_hwspin_lock_register(...)

> +	if (ret)
> +		return ret;
> +
> +
> +	return 0;
> +}
> +
> +static int sunxi_hwspinlock_remove(struct platform_device *pdev)
> +{
> +	struct sunxi_hwspinlock_device *private = platform_get_drvdata(pdev);
> +
> +	sunxi_hwspinlock_clk_dinit(private);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver sunxi_hwspinlock_driver = {
> +	.probe		= sunxi_hwspinlock_probe,
> +	.remove		= sunxi_hwspinlock_remove,
> +	.driver		= {
> +		.name	= "sunxi-hwspinlock",
> +		.owner	= THIS_MODULE,

module_platform_driver() fills out .owner for you, so please remove
this.

> +		.of_match_table = of_match_ptr(sunxi_hwspinlock_of_match),

Please skip of_match_ptr(), it will just cause build warnings when
compile tested without CONFIG_OF.

Thank you,
Bjorn

> +	},
> +};
> +
> +module_platform_driver(sunxi_hwspinlock_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Hardware spinlock driver for SUNXI");
> +MODULE_AUTHOR("fuyao <fuyao@allwinnertech.com>");
> -- 
> 2.29.2
> 
