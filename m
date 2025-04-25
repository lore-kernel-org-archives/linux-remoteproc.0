Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCFE13633F
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595947; cv=none; b=lefuH5bJE460yUjfmIbQK9RPH+CfLtlVdGhZO4wwAmvUDAN/3DLbPU9ENGfWpyT+1cQQCPek0FR8A3LYUiE5oBphmltOGyqYE+5CD7DB3e/JIMtu8P8jFEZo07MmZBCGdaGxAGqgWJNKK5WdGRvmpJ7bVWgWYMdD78LcZl/4WMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595947; c=relaxed/simple;
	bh=s6S6tqtAH7VBP94mPMyDnPIdCggzBtOxIijklT/Atao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQf3LZ1usoGhEx2oT92gDDC355s7SPWwYDYoxIiS68Sj61dEO/jLBf2etGbiqh43aP7k0yaN4OvIjC8Ru4JYZare2giKp2xEHBgUwev2kHPrYuaE2RjFDU6lww7ujVntK1+xPVz0rgaLvbJWsZa0KNswVpNvixujteqS9daKEpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9qhh7lc; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9qhh7lc"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso4605256a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745595944; x=1746200744; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VXs9FQjEaSP6AkNuUDmsL7Vk1LpHpl5rslliTD8xE54=;
        b=P9qhh7lckynz8tYp7vWPQq872E6ORst2E9cUWPkVq795Y55S+7GAKs6hQpM+D9jGQQ
         9S3IV1tdgPZL474eCD0IkJQQjY0YBwBf9ekpvMnPVcRCoeoUCpdBj3P7qdvLC865FCqY
         mt9q5xDBVqt1TL2T+I1JcWTuLSDhyErOpndjMRkcOuF+9QWkWtXIqyww63CmYdepE42h
         NrbfNvjeBvnFuxRvDdSxJLB//pFEzY6Fdt+YYem3TG4oGRWRq4WIzdOiqy2uwijfEnK/
         VzuWh08Y0I8vx03m8eUaW2d7aICAiGu5dOBcgmfjh4uJ/Q48LclbccwCm+FVZJNjGG7V
         5L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595944; x=1746200744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXs9FQjEaSP6AkNuUDmsL7Vk1LpHpl5rslliTD8xE54=;
        b=FLcfNhOgNiIBADIWmhprDnzVWtP9HSD7JjudcnyunQ/TQuz3Oft6HhewQkpWaMyLYO
         eTimmP/ZN5ZxpLyK4NZIw6kuQ/sure1WPTEpKeIXMfrwdQNzlQIpAWlF863K6J1rpinM
         fIQjF9dUZmwW2cNLlZ6Hp7wJ+zV7RUkvdSUwOB9yndixY6Vs3QDEg9/KZr1R7GjN+IdQ
         Z8BQpSskWvXpznXCbVggrtUhcUHPhV0jqE/NkJmArEmt4FbiJO9iUTBDGNtIeFoKc7Xe
         DZDT7huyTnLbA7SBfoo8C+9pvTFc33YGyFjPf3w/TfE8GxKr3E5czQ0SIUkwDOzHHvzS
         eW6A==
X-Forwarded-Encrypted: i=1; AJvYcCXYG+NRHAwtWvMLlvnlLXO7TaC6uWdU9UFuamffMgAhaSy4UOWMiigQ7IoVVHUGgmvC7qF5HcRUMo+BA/cUbKRC@vger.kernel.org
X-Gm-Message-State: AOJu0YzNhYnAEeKosYrCvcHuuIAZnnJ2f4wCks6nh+8AqhYrfXrXD376
	do/mcCaX7hQvNKqQVoDZ+Y3HTFzwdmjG1OeWCzODVuLgKtxYi7cGbEAWKLyKditfl76PsC/n2ef
	LvHgGf1h1tlnsiB3VJl96Fqomua5o3Q3tidEKrg==
X-Gm-Gg: ASbGnctFwvK5IJyuoRk8mhQJAaQnBzMA+VbFk7TXp5GH7RkLqUdqkcsxHNyplthYT8A
	kWOHPGgEAg6aP42TzqVWvjqjgt5a8tVawzLvtmANe8CQ6PYHUC3y0719tRygmJl3mLW7ivtXDzP
	F7YmuV5AgVMrN8U6guXTpblq5eniAXltRM2hM2UvFKiG9Qh1NfNynpw+Et
X-Google-Smtp-Source: AGHT+IFXUbwR8lWOZRe6i8l4qlKEaAy0lQrqMm3qm7cct6CH/tyqA5l2fVQXchZfGfEONa/1rSun0UddIdjxj4mkjSo=
X-Received: by 2002:a05:6402:3490:b0:5e0:8c55:536 with SMTP id
 4fb4d7f45d1cf-5f722673509mr2375476a12.4.1745595943758; Fri, 25 Apr 2025
 08:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s> <20250423192156.b44wobzcgwgojzk3@hiago-nb>
In-Reply-To: <20250423192156.b44wobzcgwgojzk3@hiago-nb>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 25 Apr 2025 09:45:32 -0600
X-Gm-Features: ATxdqUHU3-XEnukdUIRYxREV00XSdPXJg99nk4e8g7abiVI9-VXjzJzYla2eMME
Message-ID: <CANLsYky2OyrVLqm5JWOQaFhR3Fxt0d_p_HG4-F1o-Tnh=OP3dA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with devm_clk_get_optional()
To: Hiago De Franco <hiagofranco@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	linux-remoteproc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 13:22, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> Hi Mathieu,
>
> On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> > Good morning,
> >
> > On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > The "clocks" device tree property is not mandatory, and if not provided
> > > Linux will shut down the remote processor power domain during boot if it
> > > is not present, even if it is running (e.g. it was started by U-Boot's
> > > bootaux command).
> >
> > If a clock is not present imx_rproc_probe() will fail, the clock will remain
> > unused and Linux will switch it off.  I think that is description of what is
> > happening.
> >
> > >
> > > Use the optional devm_clk_get instead.
> > >
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 74299af1d7f1..45b5b23980ec 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> > >     if (dcfg->method == IMX_RPROC_NONE)
> > >             return 0;
> > >
> > > -   priv->clk = devm_clk_get(dev, NULL);
> > > +   priv->clk = devm_clk_get_optional(dev, NULL);
> >
> > If my understanding of the problem is correct (see above), I think the real fix
> > for this is to make the "clocks" property mandatory in the bindings.
>
> Thanks for the information, from my understanding this was coming from
> the power domain, I had a small discussion about this with Peng [1],
> where I was able to bisect the issue into a scu-pd commit. But I see
> your point for this commit, I can update the commit description.
>

If commit 4f6c9832613b breaks on your platform then it should be reverted.

> About the change itself, I was not able to find a defined clock to use
> into the device tree node for the i.MX8QXP/DX, maybe I am missing
> something? I saw some downstream device trees from NXP using a dummy
> clock, which I tested and it works, however this would not be the
> correct solution.
>

If we make the clock optional, what guarantees do we have that the
clock the M4 is sharing with other devices won't be switched off?  To
me a clock needs to be defined in the device tree and referenced in
the remote processor bindings.

Thanks,
Mathieu

> [1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>
> Cheers,
> Hiago.
>
> >
> > Daniel and Iuliana, I'd like to have your opinions on this.
> >
> > Thanks,
> > Mathieu
> >
> > >     if (IS_ERR(priv->clk)) {
> > >             dev_err(dev, "Failed to get clock\n");
> > >             return PTR_ERR(priv->clk);
> > > --
> > > 2.39.5
> > >
