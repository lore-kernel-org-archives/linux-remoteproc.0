Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF0722B8CF
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Jun 2025 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952594; cv=none; b=BL+9t9+mQv1qrCr/Xzi2x1bb0hHVVrbHYFs2Tf6HHPI4y0caWdzUvMBx3ivUXfyH1nyo4/VsXL5rPLC000cnnX+h2lX+/rtSP0QaeYTxeO5+pSw4dNAwLbfibzRU2AUfK2v6gnTt+PY5D0d8U/YLN5/0wzP42rHxUwxeLhu2u5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952594; c=relaxed/simple;
	bh=YryBAYYqkusGLWOaZUx/ENPVrzfzihfvA3OAF4RkZyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjPte7TvQc2wIXsS0ROu8iz7JYxBtoIIuDAywPYsXI71uOjMSE4O0nhanh3KxHVeyvqfj9gLBQu3xqTtXojJ7LztDaAvw5/5vYziWRVGOJqyJajQDvL7sahQEE06zcwYllR6kjvKPdbvmiMFAS9V9hOmGocheuQABem7ou41cjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKjE60on; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKjE60on"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e64b430daso48788287b3.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Jun 2025 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748952591; x=1749557391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wkgkfx1ZHJ5WRXN3wk71OJao3glFFdhvQiWlOBbCHtw=;
        b=QKjE60on8C0B1uf7Wkdr4vd3wZEUNW/3x685xZ2L1Ujg5MCiUKYJVHko1af2IRHuCw
         eiZlimKJqQe561ASjCIvjujo/a63N+xe4UPdANf0Mk+eP172bgz2yHZQ5ZKgItNkps0d
         8bjOdPteDQF4uyTGMcvppPAeOERxrH+gdS1gvmyPh9phN9LCKcbXM7dMEqGStpPMaWd6
         fPzTKrePbM7X2xzNuiOxKfGnErudddrnTJoRo6luOt5ona3WXNTPktOj4HgeFNRsCyB7
         vZCC9fQycUzJqkIMqqatqK6CtGCOD28cecO9XgWuaZypgtdmUSX+VMK9NHfOtxU0YoQU
         xr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748952591; x=1749557391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkgkfx1ZHJ5WRXN3wk71OJao3glFFdhvQiWlOBbCHtw=;
        b=Pi25q6lf6nm+Zs/1dyYd71aoavgz0Zc9mudUViPTBvgv7NBHo+9fNr2hjX7TEjf0n9
         F8qbbQO3Gk3xn79HqzFUh6/75600gOmMwbAF20xA1bKNcnw4f91vXUq6UqV/ZVOGns8N
         lYEvoyGo0SBMPMIOy9sPxy1m8LBIwRQdEMQjSJCjIw4T/0heRDElD5pWogqXSVIVuiT5
         abhe4HwQj8Qx335fCd3gnWQPiGLjWotkFw94j+gn17Jg2AQLlz7dM2DSACfzgn4GZajM
         Y4NM2NV1KTEcFXUUTeCS0mZWvRULDg9U/UpEureyd15zyKU+d23W3r3V+7RcdBohmML6
         XgRA==
X-Forwarded-Encrypted: i=1; AJvYcCVXRpWs/z9ooRHIWJ9QxI3Zr98tX46GG1u4fxABqbhcn9RORsonp59uAV/dwUuGUeSy6Zo+holt6uQofUl5wJpE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/PIUZDE9CCEyy9XSXOsEMtMQqsWeRdeoWKImTPoELadeXUg2
	H8rw5WHBROJpIVR3Tbn7zpYYiDikXDO7hNu//otXVS2WBEK4k7dHTcoF172/ZfpUMl8A7t8TPct
	O3DEU/IDu1gq4D6f7Mw9jVj4x067DmDO7jDEhL/7Fdg==
X-Gm-Gg: ASbGncv4jpffPsFT6Ebhsrv4Wsi+CA1viD4zElLUjfhzyUwxF59uZ/ra1k5SvZpuoSh
	7HCIYrhGY3bSwW1EhaKjv9HcKaW2MGZ1l+wHrYZviJPbbENMe1qcKlzlhRBTzYizC/T/sTXTjMm
	ureJIDnVkPm/dfJy4qQ05wwjD3/05UcsTwCo8tDsANP7E=
X-Google-Smtp-Source: AGHT+IEBu6kRLR+QihKU16+LErg47sPGw3yJ9MbHWp+STBlEAPmBRdPA2kKSotqf4d+nhihTdrEqxcQCav79Y/SEImk=
X-Received: by 2002:a05:690c:6888:b0:70e:923:2173 with SMTP id
 00721157ae682-71097c2a76fmr158597817b3.5.1748952591135; Tue, 03 Jun 2025
 05:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602131906.25751-1-hiagofranco@gmail.com>
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:09:14 +0200
X-Gm-Features: AX0GCFuMy0nMLljWiQ8PZlmv65MxrymGJ77Eb8A4CZbrmvODDSNF3Eq2H4oVdUw
Message-ID: <CAPDyKFrUAF5oWkyc3mLf0+R9VAypBotNyR4B5Chr3KQFYJOjbw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 15:19, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This patch series depends on Ulf's patches that are currently under review,
> "pmdomain: Add generic ->sync_state() support to genpd" [1]. Without them,
> this series is not going to work.
>
> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
>
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is already
> powered on, the driver will attach to it.
>
> Finally, the imx_rproc_clk_enable() function was also changed to make it
> return before dev_clk_get() is called, as it currently generates an SCU
> fault reset if the remote core is already running and the kernel tries
> to enable the clock again. These changes are a follow up from a v1 sent
> to imx_rproc [2] and from a reported regression [3].
>
> [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>
> v4:
> - dev_pm_genpd_is_on() introduced to drivers/pmdomain/core.c
> - imx_rproc.c updated to use the generic power domains instead of the
>   SCU API call, which depends on Ulf's patch series.
>
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
>
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
>
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
>
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
>
>  drivers/pmdomain/core.c        | 27 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 33 ++++++++++++++++++++++++++-------
>  include/linux/pm_domain.h      |  6 ++++++
>  3 files changed, 59 insertions(+), 7 deletions(-)
>

We are awaiting further feedback on the other series [1]. As you have
tested it, may I add your tested-by tag for it? Or perhaps if you can
send a reply to the cover-letter for it?

Anyway, for $subject series:
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
