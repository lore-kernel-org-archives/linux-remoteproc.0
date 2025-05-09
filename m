Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC9138FA3
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 May 2025 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787061; cv=none; b=aEmQ+Q05ZbDv9O+pZxt5kRqOxmAwCTN691viXslSGh5hUr0Sg9ocCRChtNdB0q31dgOerDy8AaDa87k6XnnIUaAZXeokD3zHAHY6Uu9SueAHeyBbPQXlotJJA+pO+ivN7C8q0Ew+yfY93Zkt7l8kyp4gbspkoOmsrkaPsa4qZKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787061; c=relaxed/simple;
	bh=0fs5ylNaOzunUNujH/KRjBP5JnkjVQPfv0qiTCj0QOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJkYDf2M5LEI0r/rSTMEj6BDLX+3hDY3Psn7GbVgJ4/X/j31Qd74mddR3kFRWvCZ76cKGxzasIiXSoB8nzElMo4hGrmFHlopqczABQJg0yxOoQhJV0leEFAmbpKdg3bBZgtp/ygsghu3oihjUYC1tRb6o7ma+LpIe31RmUq3h7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NeJruesJ; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NeJruesJ"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so1981486276.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 May 2025 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746787058; x=1747391858; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v8HWqsBnOgHqfOkli6JOl9XjSbPGwepeT1L+AmPmiow=;
        b=NeJruesJzTdilt5Nz8IvRTwygeOse2yABoSUvpGFnFfEaAHtetn4ND+Xkt1dsg9/di
         B8hbnQA3MF3/ct3GhH9e4V5ilXVcK5AI5VE8+9EjWJl1b3HYXgGL5RGOHZNlK7vE3DpX
         IFsDxqaUt40D97Bby8KyovKCfBKirNKbOMb1NONyPHHbDaGbnwLGL1tK0waooqX0cq1A
         GsGzCdBEHOsOrUTOSqh/a8eeWurKO3/k7cIFO/MNO2yn1rxNw6D3jXSr3ioLOwT5SQzx
         x8HOOksWy6ySYg9SHm9mGg7kolo2q68AwT2QQyIb1O3lPNuW992pLnZ6N1C7yMfQcQXZ
         cEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746787058; x=1747391858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8HWqsBnOgHqfOkli6JOl9XjSbPGwepeT1L+AmPmiow=;
        b=nKrQioah2x0U4rtHklul0lsCi275UyynM7KhMRTDJhE2/hRl9wQXsJIdyzWU3RC6Be
         7L7/mRj7xJZMZZpXwcTqIHWkp90IyB/0cnE0MzcwMs/B44v86q17pXvYllRYBkk9hQLi
         7Pk6Z16ylWe/RU1oMJl8KSMWJ8mGgSjt7QU0cjiSOWWXLRrimNoT1kThnoPQAdKNO1TK
         arhLAbG+2bOj635GeGtr78cVBu+vjtlzp6IWVlK6TBjA2642+HZmbpzERJFPFFkYYBa7
         6Ledpm2oF5xesqm8uzRL4ne0KgJoul90zWTaG/UVuf9zx/srVkbobr74oVRGgdNDbNV0
         Hqdg==
X-Forwarded-Encrypted: i=1; AJvYcCUS46kBhGPKYUijWzFGh/5zICj7VQEKUVQniZnZNCDykS0mOKm8jQ4gIsNvMNN2QN+QXn3GO14b9RRrqkj1Qy46@vger.kernel.org
X-Gm-Message-State: AOJu0YwnYrhhc5Ej2q75bELbVztNoL4xGHuQaf1bxURNiPYcqRb4zlBB
	49fmyPQwc1XQ0/nGy7f6T2XqE+bHXqfxA6/CcHcOJqnaeseQCVLlQ7qYWo+bxgS5AXK9OhH4KXd
	QORobT6NOTflwrd8a+D3+C5kbL2DQIdDo+5Tgzw==
X-Gm-Gg: ASbGnctqfH6A039Orn/4SL+lSWLTLRKelowYQALR4pMqBKgF3Xk13ApGSuGU2u4vT0m
	OqO1W0+ur9AUuxIfKRegFP8hAwqNxyGzvysdOQCsJTzVxFH8+SYMlxvYGa7/v4wSyufQqUUaOEC
	8V+DrKBmuIBlMbDsx+eo6yX0Y=
X-Google-Smtp-Source: AGHT+IHGUQjJVdBjTJmRKFe+lI4Dr7Yvcb3JZ9EYjARYtthQZOUUjBw0vFstcVpvdszrsUfiNCJi95xf6kgp4EbzMV4=
X-Received: by 2002:a05:6902:161c:b0:e73:1b5a:940e with SMTP id
 3f1490d57ef6-e78fdc94c29mr3707287276.12.1746787057898; Fri, 09 May 2025
 03:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com> <20250508202826.33bke6atcvqdkfa4@hiago-nb>
In-Reply-To: <20250508202826.33bke6atcvqdkfa4@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 9 May 2025 12:37:02 +0200
X-Gm-Features: ATxdqUFDC_Pl3jlEgS_HbLn5g6wqCpqO-dLCHrdHv6je6wX2F4IVnpafFiKhvog
Message-ID: <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> Hello,
>
> On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > When the remote core is started before Linux boots (e.g., by the
> > > bootloader), the driver currently is not able to attach because it only
> > > checks for cores running in different partitions. If the core was kicked
> > > by the bootloader, it is in the same partition as Linux and it is
> > > already up and running.
> > >
> > > This adds power mode verification through the SCU interface, enabling
> > > the driver to detect when the remote core is already running and
> > > properly attach to it.
> > >
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > suggested.
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > >                                 return -EINVAL;
> > >
> > > +                       /*
> > > +                        * If remote core is already running (e.g. kicked by
> > > +                        * the bootloader), attach to it.
> > > +                        */
> > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > +                                                               priv->rsrc_id);
> > > +                       if (ret < 0)
> > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > +                                       priv->rsrc_id, ret);
> > > +
> > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > +                               priv->rproc->state = RPROC_DETACHED;
> > > +
> > >                         return imx_rproc_attach_pd(priv);
> >
> > Why is it important to potentially set "priv->rproc->state =
> > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> >
> > Would it be possible to do it the other way around? First calling
> > imx_rproc_attach_pd() then get the power-mode to know if
> > RPROC_DETACHED should be set or not?
> >
> > The main reason why I ask, is because of how we handle the single PM
> > domain case. In that case, the PM domain has already been attached
> > (and powered-on) before we reach this point.
>
> I am not sure if I understood correcly, let me know if I missed
> something. From my understanding in this case it does not matter, since
> the RPROC_DETACHED will only be a flag to trigger the attach callback
> from rproc_validate(), when rproc_add() is called inside
> remoteproc_core.c.

Okay, I see.

To me, it sounds like we should introduce a new genpd helper function
instead. Something along the lines of this (drivers/pmdomain/core.c)

bool dev_pm_genpd_is_on(struct device *dev)
{
        struct generic_pm_domain *genpd;
        bool is_on;

        genpd = dev_to_genpd_safe(dev);
        if (!genpd)
                return false;

        genpd_lock(genpd);
        is_on = genpd_status_on(genpd);
        genpd_unlock(genpd);

        return is_on;
}

After imx_rproc_attach_pd() has run, we have the devices that
correspond to the genpd(s). Those can then be passed as in-parameters
to the above function to get the power-state of their PM domains
(genpds). Based on that, we can decide if priv->rproc->state should be
to RPROC_DETACHED or not. Right?

In this way we don't need to export unnecessary firmware functions
from firmware/imx/misc.c, as patch1/3 does.

If you think it can work, I can help to cook a formal patch for the
above helper that you can fold into your series. Let me know.

>
> With that we can correcly attach to the remote core running, which was
> not possible before, where the function returns at "return
> imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> rproc_validate().

I see, thanks for clarifying!

Kind regards
Uffe
