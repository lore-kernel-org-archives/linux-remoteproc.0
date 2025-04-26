Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA921E9B06
	for <linux-remoteproc@vger.kernel.org>; Sat, 26 Apr 2025 21:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704085; cv=none; b=NI23esSinOCCJcbZY+xCdcKGJGHR30nmswcaOX59UG60wwZcjwihd2+oCQBoGhBzEt25n1rOGK3wUTLaYWKn4Qk/BVQioP3iZ/gOEcjVGjhHO3sb0f/ZOx11zCLXvnvJqiM5DnhKNuzGcwdVKe5TdMG7Os9WPx6LMv6+7rsN640=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704085; c=relaxed/simple;
	bh=oWYLX7dpN+fD/9inCG2hgdQ2kFKwj94e3UoW+HiolvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMCuqbObNDm4NcikxXqPbwDA/eqW9JYxjqQR8YXhIDIb+qlGkL5/o+XCMwUQ/afqOHxTmg3JosWIFG+jBtAtuDfX2NO8fmBKQGiCYABdBnGrr8x3977dCTKU/bmUBYMZsGk5J5cd2rnxX71W+OuKl78h/3k5HwrDyl7vYNAgIyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhvQDfZm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhvQDfZm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso6557547a12.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Apr 2025 14:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745704081; x=1746308881; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NkBG4q84aKP7XuricBxZ0SqZkCQnMNoFILLSDq32ATA=;
        b=hhvQDfZmHZHYJCmtqk90zB8pE6Y83sT+GAgb1FJvGontxzHAV+gLSw1nLNlXVaNiaI
         qu4cNPlPoA53JlTcsli0hjjOK5dD3Jm8/uE8e2t2CQg/97cPotbQ5hAd23jbYkH/8oOC
         9d+NBBbPgYjyifmazOz5sU/bg+/aZ3544OcY//uJ7awfB0owKz63fOQ2s5YqXvkgDdJ4
         E60b0F1Lx/sJtLP93ijtb6SPQYJlBGZl7dFqE4bzu+kL0eaFYTFmsupnalC+58E5Ja/B
         kAd3SmGgkNAdqR7wpDf+U8zRBBIexN9Zz3+4OkwnyR3eUSP4Ce0t0W+Y8RAj8AKVxMJV
         kZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745704081; x=1746308881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkBG4q84aKP7XuricBxZ0SqZkCQnMNoFILLSDq32ATA=;
        b=Il5fZxFxZcNgVdLX595rFaIua5gTWj/rYTd8FVBG8hHU+VyQC7mUQ4MUVrcbQsZG0y
         qt8IZMXFu0VV+hCVO4fS0DB+fjtbpFhOOVZW22466I++loKY5/SxZjRja/BqaRRKBgx8
         mZLJXAd1OjfhzvAhiQr/WeqBznX+UFS/tj+XzIKccRh00hQIcc2x0IHe/EsLONVOYFJN
         g49LMixhbO/ATD5CKCnF6fmaqEcJ7+zRBHVK19JsnasZrwXFC+uH2b6zhAFvQjVIVU94
         dt3ASmMpTgtze2gbocQPS6NiZ5XvoQa77CAVyBwKdp3ChtOW3BCL2HKrsFhEEnwYlFDM
         MPvg==
X-Forwarded-Encrypted: i=1; AJvYcCWa8iIL2kvElgYLLwUBmVfFyJ3hPDRSWGqdNK2Kg5f4tOOsJ4RkUQR0MMayzM+C5eM/YbmziFIvW96QbWUdHMq+@vger.kernel.org
X-Gm-Message-State: AOJu0YyfMxZwOuFZqC+SupyenIxyQmWUs15XLJXkmseoNm/RgmXFeWAG
	RfU7VMmTLzKC2nsVnCdN5Dqy8XQbdhhCVOLoKnV1Bz27EAsfk8/3WD4UH0d9XsiTzuQiZncvMwv
	2P5zBQuyqybCmytg9/giU+n5167b9QfwFmDltTQ==
X-Gm-Gg: ASbGncvIGq9XYlH1wMDwyPuTdLXBLLlHbv5u0LYkOtqaETztQwniB+T7RDw85A4Y8U3
	mlU4wqoIbxlGT9dKVtHI0nBOJVOMwgxpMhUXXpY5CTVV2jEWOrPgsOWqnwbviwjy0PgQWYHunJg
	8xEBYp1KpR5L52oMsh6kB9xxwaBye0exeZRJGs/XZhAFw0oJWlvcoQ7hxtXvEO19l8hWU=
X-Google-Smtp-Source: AGHT+IGQG+/iNDNxq2Wojrkp26M1m1o/MKvGupfTVFI6rnZy3H/DlTzVUpcASBLitbwtfzmCUVICXWKVbeUjUf+UKWY=
X-Received: by 2002:a17:907:7ba3:b0:acb:b6c9:90af with SMTP id
 a640c23a62f3a-ace848feea2mr331721366b.16.1745704080990; Sat, 26 Apr 2025
 14:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s> <20250423192156.b44wobzcgwgojzk3@hiago-nb> <20250426134958.GB13806@nxa18884-linux>
In-Reply-To: <20250426134958.GB13806@nxa18884-linux>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sat, 26 Apr 2025 15:47:50 -0600
X-Gm-Features: ATxdqUEjP3yZ0cE-UqcG-bjotjV4NxJHuMem2scnUTZE4sa3KXJBizNJEQMu5o8
Message-ID: <CANLsYkzLZKHpwv+Zz7YqtU4NCy7ZmapuzpgtfxsRfoV=Ve8rVg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with devm_clk_get_optional()
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, daniel.baluta@nxp.com, 
	iuliana.prodan@oss.nxp.com, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 06:41, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Wed, Apr 23, 2025 at 04:21:56PM -0300, Hiago De Franco wrote:
> >Hi Mathieu,
> >
> >On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> >> Good morning,
> >>
> >> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> >> > From: Hiago De Franco <hiago.franco@toradex.com>
> >> >
> >> > The "clocks" device tree property is not mandatory, and if not provided
> >> > Linux will shut down the remote processor power domain during boot if it
> >> > is not present, even if it is running (e.g. it was started by U-Boot's
> >> > bootaux command).
> >>
> >> If a clock is not present imx_rproc_probe() will fail, the clock will remain
> >> unused and Linux will switch it off.  I think that is description of what is
> >> happening.
> >>
> >> >
> >> > Use the optional devm_clk_get instead.
> >> >
> >> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >> > ---
> >> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> > index 74299af1d7f1..45b5b23980ec 100644
> >> > --- a/drivers/remoteproc/imx_rproc.c
> >> > +++ b/drivers/remoteproc/imx_rproc.c
> >> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >    if (dcfg->method == IMX_RPROC_NONE)
> >> >            return 0;
> >> >
> >> > -  priv->clk = devm_clk_get(dev, NULL);
> >> > +  priv->clk = devm_clk_get_optional(dev, NULL);
> >>
> >> If my understanding of the problem is correct (see above), I think the real fix
> >> for this is to make the "clocks" property mandatory in the bindings.
> >
> >Thanks for the information, from my understanding this was coming from
> >the power domain, I had a small discussion about this with Peng [1],
> >where I was able to bisect the issue into a scu-pd commit. But I see
> >your point for this commit, I can update the commit description.
> >
> >About the change itself, I was not able to find a defined clock to use
> >into the device tree node for the i.MX8QXP/DX, maybe I am missing
> >something? I saw some downstream device trees from NXP using a dummy
> >clock, which I tested and it works, however this would not be the
> >correct solution.
>
> The clock should be "clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;" for
> i.MX8QX. This should be added into device tree to reflect the hardware truth.
>
> But there are several working configurations regarding M4 on i.MX8QM/QX/DX/DXL.
>
> 1. M4 in a separate SCFW partition, linux has no permission to configure
>   anything except building rpmsg connection.
> 2. M4 in same SCFW partition with Linux, Linux has permission to start/stop M4
>    In this scenario, there are two more items:
>    -(2.1) M4 is started by bootloader
>    -(2.2) M4 is started by Linux remoteproc.
>
>
> Current imx_rproc.c only supports 1 and 2.2,
> Your case is 2.1.

Remoteproc operations .attach() and .detach() are implemented in
imx_rproc.c and as such, 2.1 _is_ supported.

>
> There is a clk_prepare_enable which not work for case 1 if adding a real
> clock entry.
>
> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?`
> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
> if imx_rproc.c is built as module, clk_disable_unused will still turn
> off the clk and hang M4.
>
> So for case 2.1, there is no good way to keep M4 clk not being turned off,
> unless pass "clk_ignore_unused" in bootargs.
>

Isn't there something like an "always on" property for clocks?

>
> For case 2.2, you could use the clock entry to enable the clock, but actually
> SCFW will handle the clock automatically when power on M4.
>
> If you have concern on the clk here, you may considering the various cases
> and choose which to touch the clk, which to ignore the clk, but not
> "clk get and clk prepare" for all cases in current imx_rproc.c implementation.
>
> Regards,
> Peng
>
>
> >
> >[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >
> >Cheers,
> >Hiago.
> >
> >>
> >> Daniel and Iuliana, I'd like to have your opinions on this.
> >>
> >> Thanks,
> >> Mathieu
> >>
> >> >    if (IS_ERR(priv->clk)) {
> >> >            dev_err(dev, "Failed to get clock\n");
> >> >            return PTR_ERR(priv->clk);
> >> > --
> >> > 2.39.5
> >> >
