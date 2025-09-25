Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7F92EA737
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758795558; cv=none; b=ANOREqjSIfUhIDbsDgQF6ISJRfCSzNZhzfwT/S6WcT4nW/zBFwyde+oFEA1uc8GliR7A5AUozqcIUKAbPPBy0Y6Sho4/4BEZq3oY60az2WuTOi2QSjsWLIFmHESR65ieKYs5YxOcSux0Kwi/nwTZh7zsjyFkuZaVm2jM9h+xYTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758795558; c=relaxed/simple;
	bh=dgLH66wmZN+5x92SJlx2bPunxAKU/QVWJ2EghvU0KZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVctPpMm+/awHPrEkze9mj6yzii7lWnvx8kDXfYLZlSsOoM/y3XUp+n79zGMHlRCzUx95paKBUUI0CDc9igTd+UhDCzzYMErbCxRBYWlp9U9QbxJ7/PTYYac8kpunQgb97NCXn6Ho3aoFvSabSJh2IiApaqFtfgHlLSDS+GCQ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SFpsh1/g; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SFpsh1/g"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-74625f748a0so6971377b3.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Sep 2025 03:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758795556; x=1759400356; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tfJ32hMp/SXase9EIClmjehsriaoWao+oyHfJjiFbug=;
        b=SFpsh1/gVf9IP+ka122JUYDKbb6gKDnEBLhVtetm+IiEMq+YLhV2MLQ4cL3ZERFm9E
         RERbqQI+7OjT07lFpL+neAp6blOBSP2hu3azFFVNWUDBGaxS2VgD2yjNXNBxaqdXKG5Z
         g+CrLqyFITYNV6qqRss44X3/DzTALD1rHSHX3SQoPah4u7QLa93S6CYV8srbnThbhbdk
         dg1GI3aemW+8/uF8su0oXe7Dh33ISEfwnB4IgP8/Fylj845dKgmN6vrYX9hU3D+jqpGn
         DALYAsFP0rAHLeQF/z3JtKomf8RzTcaCiT32hNBhHrIrprU+EXbVQvdrpEPtolWXt29A
         +H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795556; x=1759400356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfJ32hMp/SXase9EIClmjehsriaoWao+oyHfJjiFbug=;
        b=DSF0nDYa7rW9vYHl89Fmn6IJeewE2GSKJ+ElIl3G9FT1RJpluqSQ6Yo4oHVD9MdKIy
         vj4wwpoKgjNL1MQPEUEoUfs/ADsECSvLffpw8Q6v9arp7Brq+b5EpS6wL9zwfJUPbAI/
         Fo2I/am0ifH0mIAKHQ6Q7dj8zyR4i4ystChGFJ0q1cCvRXbsQVyJnaK5fCUgnaoiYDTd
         WQSC4w8Ep5skyccNUB2f4FlPNl76CzQ/MhkZ92w/nYpf4IbJTQObEJqgOdGz7HGRIw9F
         yGliGGVFcKluoohxHkBK1vS8ZDCkB+6eS60oEAHVTYu8wQIsnOXFFeoQhBOsOjfFr8aC
         mfiw==
X-Forwarded-Encrypted: i=1; AJvYcCUl9EspXOFUKTfmpSm/0+AQK4TkaeKoenrBcRsSgACRheR5r6FFSN7lwvqMAqYM04fQuLqEIsMy3GojGlbI9CuW@vger.kernel.org
X-Gm-Message-State: AOJu0Yydg/aIEGWEMsGNTCa9LC0oPDuY78wKdeQ0XDzcSQTAEPo2R9Be
	/PsAfWL1C7lia5YdwWgy+ZW0BVqa2iAI8sCZuxGwGKAegZBAhFavUPgGyFhnQsSeI3X/bWFeN1d
	YI6+3hTuyRopIKfEauP2QorS21m3KyIoioiH+o8YC2g==
X-Gm-Gg: ASbGnctDxUhm7NCvJ7UpyOZz4XwYRt6ixtNWbxqkOvbiNGLqVaDEMFAGN/fjYZbqIvw
	5fO53swXDEXaZWejgk4+LYfKImtXnLfF0HLrJgxPQCnssxxzQUqhgXUO1aCG02LDa+wA0+FWrob
	D8eC1303gt0VHGt4ll5hqWchYeXffTXioNg+YY7dTDRi7CKyLNEyY9uvJJxxF8/AL/AdT3crmoN
	nodKOXp
X-Google-Smtp-Source: AGHT+IFqegPV4dsBkr5tbUoAw3Bm05qqiJTdfJDLdA6jeqSgBdmgnNcHPAYMQZGNKgLNwd05Ndo4qwVQgs+KcKU2zhM=
X-Received: by 2002:a05:690c:61c8:b0:750:bb77:4433 with SMTP id
 00721157ae682-764f444f932mr17758937b3.19.1758795555565; Thu, 25 Sep 2025
 03:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com> <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com>
In-Reply-To: <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Sep 2025 12:18:39 +0200
X-Gm-Features: AS18NWBVvi4sa4FYZSi9ELVd8mD6lGopH5aCYkeAuSPCLUa8dQJVAPN_Zi7EgaQ
Message-ID: <CAPDyKFpjP07826FXh8XveXiH7ta+N=upYaowf7r6gyNWPSFfqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup
 order and error handling
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 07:17, Peng Fan <peng.fan@nxp.com> wrote:
>
> The order of runtime PM API calls in the remove path is wrong.
> pm_runtime_put() should be called before pm_runtime_disable(), per the
> runtime PM guidelines. Calling pm_runtime_disable() prematurely can
> lead to incorrect reference counting and improper device suspend behavior.

This isn't entirely correct as it depends a bit more on the runtime PM
deployment.

More importantly, even if you would call pm_runtime_put() before the
call to pm_runtime_disable() doesn't necessarily mean that the device
becomes runtime suspended, as it can be prevented by user-space for
example, assuming that is the goal.

To make sure the device is put back into a low power-state, this is
the typical pattern that is deployed in a driver's ->remove()
callback.

*) Call pm_runtime_get_sync(), to make sure the device gets the runtime resumed.
Not needed in this case, as the runtime PM usage count was increased
during ->probe() and not dropped).

*) Turn off resources that correspond to what the runtime PM callbacks
in the driver are managing.
Not needed, as there are no runtime PM callbacks for the driver.

*) Call pm_runtime_disable() and then pm_runtime_put_noidle(). This
makes sure that when ->remove() is completed, the device is in a low
power-state and the runtime PM usage count has been restored.

*) If there are PM domains, those are turned off by calling
dev_pm_domain_detach_list(), or from the driver core (after the
->remove() callback has been completed) for the single PM domain case.

That said, one could consider converting the pm_runtime_put() here
into a pm_runtime_put_noidle(), to make it clear that this is only
about restoring the usage count, but I don't think it's a big deal.

>
> Additionally, proper cleanup should be done when rproc_add() fails by
> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
> the device in an inconsistent power state.

Right, this deserved to be fixed.

>
> With using devm_pm_runtime_enable() for automatic resource management and
> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
> enforce correct PM API usage and simplify error paths, the upper two
> issues could be fixed. Also print out error log in case of error.

I really don't want to encourage people to use
devm_pm_runtime_enable(), simply because it's not always a good fit
when making sure things get turned off in the correct sequence. In
particular, as it's just about saving one/two lines of code, this
doesn't make sense to me.

I suggest you follow the similar pattern as I explained above for
->remove(), for the error path in ->probe() too. So, calling
pm_runtime_disable() and pm_runtime_put_noidle() should do the trick
for this too, I think.

>
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Kind regards
Uffe

> ---
>  drivers/remoteproc/imx_rproc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..12305f36552fb5265b0953a099ea0d561880e3ff 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>         return NOTIFY_DONE;
>  }
>
> +static void imx_rproc_pm_runtime_put(void *data)
> +{
> +       struct device *dev = data;
> +
> +       pm_runtime_put(dev);
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -1125,12 +1132,23 @@ static int imx_rproc_probe(struct platform_device *pdev)
>         }
>
>         if (dcfg->method == IMX_RPROC_SCU_API) {
> -               pm_runtime_enable(dev);
> +               ret = devm_pm_runtime_enable(dev);
> +               if (ret) {
> +                       dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> +                       goto err_put_clk;
> +               }
> +
>                 ret = pm_runtime_resume_and_get(dev);
>                 if (ret) {
>                         dev_err(dev, "pm_runtime get failed: %d\n", ret);
>                         goto err_put_clk;
>                 }
> +
> +               ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> +               if (ret) {
> +                       dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> +                       goto err_put_clk;
> +               }
>         }
>
>         ret = rproc_add(rproc);
> @@ -1158,10 +1176,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>         struct rproc *rproc = platform_get_drvdata(pdev);
>         struct imx_rproc *priv = rproc->priv;
>
> -       if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -               pm_runtime_disable(priv->dev);
> -               pm_runtime_put(priv->dev);
> -       }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>         imx_rproc_put_scu(rproc);
>
> --
> 2.37.1
>
