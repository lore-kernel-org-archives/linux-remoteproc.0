Return-Path: <SRS0=9bPA=DG=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49117C4727C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 18:01:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D912D20702
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 18:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltm7u1Iz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgI2SBt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Sep 2020 14:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727863AbgI2SBr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Sep 2020 14:01:47 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723F4C0613D1
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2020 11:01:45 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t7so3083186pjd.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2020 11:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p2KegjCaWpZfkKR5IwwEO7WoWrrwh7P9M4al+Q9eyFw=;
        b=ltm7u1IzNbmPXd4mELnjFy6fBuCuAEmTAWvG7wgY2Ju0Y2xDjUwBwmcqJz0HcdGXGj
         owX73g8pFXrJQOGgBQ8VFf2/h1rfVzz57wAgJlQ1RXjI2yuj0FdNfmBHZhhrh7RhKj/U
         THAagurUTSLh9MsQFHsao2aA/B81jzXhS4VhW2QroQXlgldavwNU+MnuG2iwuNlEbRI8
         BTTP7ejSIkq5gj15IAj6cza0LmSX3yCq4dWxAlEw4G0tcZrVuIqVWmEuC9W8Me8R5T1r
         hTfHhiPAt1PhaKDY4zdOz6cHVH38koWX6O1UULSeqvSWmlcsTmos7qg/uWQkDd3xieev
         mwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p2KegjCaWpZfkKR5IwwEO7WoWrrwh7P9M4al+Q9eyFw=;
        b=LcBHxdRxwJ0XLW5CDATGvg+RZgy4M4rLXImjtJQTji5tI8OBgBG0b5eIu7E8VB4iox
         FOyl9yL2XSsSk7dfFovO4nvq/+EFnEZtZXP9N0RoGrhsOCdpcr/zdzDw/SdWAIjRBq+r
         /3cgg7+JWTS4mj+iVjNZSeaydtV8pbhxxFYkTMmnIFl2/gP2bwV3/lD+SXbOuLIG1SZh
         r1Uv9Rfy9QqntMez4tcGwSMVoRFBzaQc8WN6pkvWNmJDEpUiWj6LpRIrrYkyb30XOttB
         Njzn3L6vFixM8KRJEVVIQ0tY6A5HF1vm66++Vs74pTVN6T5dYslo39U/9KO8Wdl0HsTX
         S23w==
X-Gm-Message-State: AOAM533dip1iY+ZJ5079OwRxxykEhye32UETNdjQlju4jM/CYP11fT86
        yFJmCOaTCT27dWsulTdckF8aKQ==
X-Google-Smtp-Source: ABdhPJz5fuCu0iwJuiJcxoduPOjH/Dc8pBwOSprE2AvYkGXrMkTGOaSUFFpecrmFSuUfh4qlWaiRWQ==
X-Received: by 2002:a17:90a:9912:: with SMTP id b18mr5292485pjp.192.1601402504742;
        Tue, 29 Sep 2020 11:01:44 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q15sm5782201pgr.27.2020.09.29.11.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:01:43 -0700 (PDT)
Date:   Tue, 29 Sep 2020 12:01:41 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Alexandre Bailon <abailon@baylibre.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, gpain@baylibre.com
Subject: Re: [PATCH v2 3/4] remoteproc: mtk_vpu_rproc: Add support of JTAG
Message-ID: <20200929180141.GC124290@xps15>
References: <20200910130148.8734-1-abailon@baylibre.com>
 <20200910130148.8734-4-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910130148.8734-4-abailon@baylibre.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 10, 2020 at 03:01:47PM +0200, Alexandre Bailon wrote:
> The DSP could be debugged using JTAG.
> The support of JTAG could enabled at build time and it could be enabled
> using debugfs.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  drivers/remoteproc/Kconfig   |   9 +++
>  drivers/remoteproc/mtk_apu.c | 151 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 159 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 4ebea57bf4c8..310462346bd8 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -61,6 +61,15 @@ config MTK_APU
>  
>  	  It's safe to say N here.
>  
> +config MTK_APU_JTAG
> +	bool "Enable support of JTAG"

I think it is better to simply go with "Enable JTAG support"

> +	depends on MTK_APU
> +	help
> +	  Say y to enable support of JTAG.

Same here.

> +	  By default, JTAG will remain disabled until it is enabled using
> +	  debugfs: remoteproc/remoteproc0/jtag. Write 1 to enable it and

s/remoteproc0/remoteprocX

> +	  0 to disable it.
> +
>  config OMAP_REMOTEPROC
>  	tristate "OMAP remoteproc support"
>  	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
> diff --git a/drivers/remoteproc/mtk_apu.c b/drivers/remoteproc/mtk_apu.c
> index 6d2f577cfde5..07157fdc24ba 100644
> --- a/drivers/remoteproc/mtk_apu.c
> +++ b/drivers/remoteproc/mtk_apu.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/bitops.h>
>  #include <linux/clk.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/highmem.h>
>  #include <linux/interrupt.h>
> @@ -14,6 +15,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>  
> @@ -48,6 +50,11 @@
>  #define CORE_DEFAULT1				(0x00000140)
>  #define CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU	(0x10 << 0)
>  #define CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU	(0x10 << 5)
> +#define CORE_DEFAULT2				(0x00000144)
> +#define CORE_DEFAULT2_DBG_EN			BIT(3)
> +#define CORE_DEFAULT2_NIDEN			BIT(2)
> +#define CORE_DEFAULT2_SPNIDEN			BIT(1)
> +#define CORE_DEFAULT2_SPIDEN			BIT(0)
>  #define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
>  
>  struct mtk_apu_rproc {
> @@ -57,6 +64,13 @@ struct mtk_apu_rproc {
>  	void __iomem *base;
>  	int irq;
>  	struct clk_bulk_data clks[3];
> +
> +#ifdef CONFIG_MTK_APU_JTAG
> +	struct pinctrl *pinctrl;
> +	struct pinctrl_state *pinctrl_jtag;
> +	bool jtag_enabled;
> +	struct mutex jtag_mutex;

Move this up to keep all the struct together.

> +#endif
>  };
>  
>  static int mtk_apu_rproc_prepare(struct rproc *rproc)
> @@ -166,6 +180,137 @@ static irqreturn_t handle_event(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +#ifdef CONFIG_MTK_APU_JTAG
> +
> +static int apu_enable_jtag(struct mtk_apu_rproc *apu_rproc)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&apu_rproc->jtag_mutex);
> +	if (apu_rproc->jtag_enabled) {
> +		ret = -EINVAL;

The JTAG is already enabled, I think enabling it again isn't a big deal and
should simply return 0 rather than an error.

> +		goto err_mutex_unlock;
> +	}
> +
> +	writel(CORE_DEFAULT2_SPNIDEN | CORE_DEFAULT2_SPIDEN |
> +		CORE_DEFAULT2_NIDEN | CORE_DEFAULT2_DBG_EN,
> +		apu_rproc->base + CORE_DEFAULT2);
> +
> +	apu_rproc->jtag_enabled = 1;

s/1/true

> +
> +err_mutex_unlock:
> +	mutex_unlock(&apu_rproc->jtag_mutex);
> +
> +	return ret;
> +}
> +
> +static int apu_disable_jtag(struct mtk_apu_rproc *apu_rproc)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&apu_rproc->jtag_mutex);
> +	if (!apu_rproc->jtag_enabled) {
> +		ret = -EINVAL;

Same as above

> +		goto err_mutex_unlock;
> +	}
> +
> +	writel(0, apu_rproc->base + CORE_DEFAULT2);
> +
> +	apu_rproc->jtag_enabled = 0;

s/0/false

Thanks for the patience,
Mathieu

> +
> +err_mutex_unlock:
> +	mutex_unlock(&apu_rproc->jtag_mutex);
> +
> +	return ret;
> +}
> +
> +static ssize_t rproc_jtag_read(struct file *filp, char __user *userbuf,
> +			       size_t count, loff_t *ppos)
> +{
> +	struct rproc *rproc = filp->private_data;
> +	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
> +	char *buf = apu_rproc->jtag_enabled ? "enabled\n" : "disabled\n";
> +
> +	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
> +}
> +
> +static ssize_t rproc_jtag_write(struct file *filp, const char __user *user_buf,
> +				size_t count, loff_t *ppos)
> +{
> +	struct rproc *rproc = filp->private_data;
> +	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
> +	char buf[10];
> +	int ret;
> +
> +	if (count < 1 || count > sizeof(buf))
> +		return -EINVAL;
> +
> +	ret = copy_from_user(buf, user_buf, count);
> +	if (ret)
> +		return -EFAULT;
> +
> +	/* remove end of line */
> +	if (buf[count - 1] == '\n')
> +		buf[count - 1] = '\0';
> +
> +	if (!strncmp(buf, "enabled", count))
> +		ret = apu_enable_jtag(apu_rproc);
> +	else if (!strncmp(buf, "disabled", count))
> +		ret = apu_disable_jtag(apu_rproc);
> +	else
> +		return -EINVAL;
> +
> +	return ret ? ret : count;
> +}
> +
> +static const struct file_operations rproc_jtag_ops = {
> +	.read = rproc_jtag_read,
> +	.write = rproc_jtag_write,
> +	.open = simple_open,
> +};
> +
> +static int apu_jtag_probe(struct mtk_apu_rproc *apu_rproc)
> +{
> +	int ret;
> +
> +	if (!apu_rproc->rproc->dbg_dir)
> +		return -ENODEV;
> +
> +	apu_rproc->pinctrl = devm_pinctrl_get(apu_rproc->dev);
> +	if (IS_ERR(apu_rproc->pinctrl)) {
> +		dev_warn(apu_rproc->dev, "Failed to find JTAG pinctrl\n");
> +		return PTR_ERR(apu_rproc->pinctrl);
> +	}
> +
> +	apu_rproc->pinctrl_jtag = pinctrl_lookup_state(apu_rproc->pinctrl,
> +						       "jtag");
> +	if (IS_ERR(apu_rproc->pinctrl_jtag))
> +		return PTR_ERR(apu_rproc->pinctrl_jtag);
> +
> +	ret = pinctrl_select_state(apu_rproc->pinctrl,
> +				   apu_rproc->pinctrl_jtag);
> +	if (ret < 0)
> +		return ret;
> +
> +	mutex_init(&apu_rproc->jtag_mutex);
> +
> +	debugfs_create_file("jtag", 0600, apu_rproc->rproc->dbg_dir,
> +			    apu_rproc->rproc, &rproc_jtag_ops);
> +
> +	return 0;
> +}
> +#else
> +static int apu_jtag_probe(struct mtk_apu_rproc *apu_rproc)
> +{
> +	return 0;
> +}
> +
> +static int apu_disable_jtag(struct mtk_apu_rproc *apu_rproc)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_MTK_APU_JTAG */
> +
>  static int mtk_apu_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -242,6 +387,10 @@ static int mtk_apu_rproc_probe(struct platform_device *pdev)
>  		goto free_mem;
>  	}
>  
> +	ret = apu_jtag_probe(apu_rproc);
> +	if (ret)
> +		dev_warn(dev, "Failed to configure jtag\n");
> +
>  	return 0;
>  
>  free_mem:
> @@ -259,7 +408,7 @@ static int mtk_apu_rproc_remove(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  
>  	disable_irq(apu_rproc->irq);
> -
> +	apu_disable_jtag(apu_rproc);
>  	rproc_del(rproc);
>  	of_reserved_mem_device_release(dev);
>  	rproc_free(rproc);
> -- 
> 2.26.2
> 
