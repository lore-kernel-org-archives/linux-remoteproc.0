Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E0F2D97B5
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Jun 2025 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038842; cv=none; b=tn8GlhlcOMyC3fPAfI2bovvWENL2Gf3lbbgXn+ucLW4OnHliimMGYp0uGMQDNQ4pM71jWWRCXslj8f82x9M/05wAiM99LgjiYZrCLyYCMYdQgPXrRlMInUStUuoCcv9K05VYgBE4AiRHuX3RWTOFTMF5Gc1GNBIU06nM/jfHtKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038842; c=relaxed/simple;
	bh=d/GwnZrXW005mxplKA0+3KM5bSTcbwWbAmIzKExtCRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0q2MSW722R5ufIBOdHQEMo+8ABvGiINVxLyxQuhElG9KE1z3E4Z/4J+2gC2Ka6Ic9q7rxKkbQrVVPjEWicvv+Jr1COY4z6KH4R+q4/hJxHRcPHkMNrWjxoVxcaY2+iFkK1Pfv9YZgxJRwFId1fxfjA2MaUhlBxuYIoxN7ntCSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bFQQlKYP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bFQQlKYP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c6fea6742so3886221a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Jun 2025 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751038838; x=1751643638; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jj2bLybNvPyHSij0xa+7vNe8FDo/UYuhavfR08FTa9E=;
        b=bFQQlKYPKxiyY8eG3TYrpt5hGovP45sXfReq1O19GCqO0OxSR9Qqbi6is3EvjLr1FZ
         IpGq+Wo1S4Q3jMmgINzHLjCjqnctW1OI4i8Ml7cjmgyfBYEyXz9I0vr+EmCVI64edhL1
         n104rNkadhyL9CB81cN2Hm4qHquz66o1q7cE5FlVPVi1AwZPvBUMAtqDDi1AtaOknSRk
         8F4Qso0Fe473bMMlSPDpB6LnHCgATC7Ha4ggUcJqGsspp9hPGEtgwiyn/GEcxy32jMwx
         +mBnjt7O+6BI/eAbm4KyEnDfr6suvOOd/ygrdK8nnHD/zWfKu0kfXpVkP9Z0i7y0Mg41
         HHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038838; x=1751643638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj2bLybNvPyHSij0xa+7vNe8FDo/UYuhavfR08FTa9E=;
        b=swmdoctmtWfn6ocm1zOgsPqKjnRIFvakKpQdMaGiMKcNLiXqF2Ty1FWOiqSrBHaRnp
         wZFoST/tlapCwQ2F61rOhchCXplLXvwe1VSuGv/vJF7VGBwZzsyalowz50eFJGq+6JWa
         Of53VpqNoGQQRtUHOilqj3SIT6LaqiDQPuIlgpcP9V5pcNceK9IuyHSqX4Hn38baddBG
         237CJ/etrjFgHE9HZR7cgJyI2OYWdeyKfeJobOalcgioS61fM4O96VYcfEg2CO/UcHQZ
         A4UXzSOLkhW9DQJVuDn3bZAZtdhmBHafiHyZy6AtBPn+QL2F78P6iPJmCwQVaJcgR6sU
         XCBA==
X-Forwarded-Encrypted: i=1; AJvYcCVwHN4vBN7IuHk8ZpWxD/6zvKAYm9QU0BeyF5vuqTa2fQ4o32zFg/q076aDOQBDBUFSGxWetVgiTFQ4GBtaS03P@vger.kernel.org
X-Gm-Message-State: AOJu0YywMYtNZw/mKDDFr04ojGKv13OCN1VvuHmN+msWiubeuG1/b2WH
	PuJTVhz0dqh6cSiWIXicprpxWv9CoMl7smi8Pqz34pk6HCJEOSsQusFsCL+dTHb3EhxOKDjVING
	raLMP9HGLbDk1bYVGVLuUDCVMNyX70pjqcwDJ9TFBGCmKbiD+VGmMjwA=
X-Gm-Gg: ASbGncuU7xUUOErHZ3fNKRNAVAuBYRlJORP9SCcs2r5/RYo2EUPlCeLfrgA8q1PQD3v
	JpdF6JJNQi5Gxgup6+Ytelzf34L4N8QkFluq+k55tacuXsVPXbUFJElPGLVZNvJ6Ar/XvEsvLy9
	2TeL+V3fqFiYJZzgTljHDGbTpEWz1NpoOsqWiaIqJ0FXfvMxp0zwHa2v7mjVyolp8O1RxwKFaZQ
	cYgqA==
X-Google-Smtp-Source: AGHT+IEvkXr4JcCj5oD0vFiY1H6Wn1hmSJv40jglC0KLoMmc4+ZOMxDrQflQwFqUtAQPpKoqyo8PcKiVmvrT6rHam7I=
X-Received: by 2002:a05:6402:2802:b0:608:6711:a06f with SMTP id
 4fb4d7f45d1cf-60c88b33e2bmr3273384a12.4.1751038838221; Fri, 27 Jun 2025
 08:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626215911.5992-1-hiagofranco@gmail.com> <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
 <20250627144955.tbmk6ako3rgv3djo@hiagonb>
In-Reply-To: <20250627144955.tbmk6ako3rgv3djo@hiagonb>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 27 Jun 2025 09:40:27 -0600
X-Gm-Features: Ac12FXyUCI-R2q8qxbHAG9epzvsz_v3mTi9fyUrRB-IT5cqGx_PrRwpqh4kxuRo
Message-ID: <CANLsYkz3SD1PPnVwoBnnKhyCUig67o+=NgoDucq5m+4sQ=xMYQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 08:50, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Fri, Jun 27, 2025 at 08:31:20AM -0600, Mathieu Poirier wrote:
> > On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > This patch series depends on Ulf's patches that are currently under
> > > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > > Without them, this series is not going to work.
> > >
> >
> > I thought we agreed to repost when the feature referred to above and
> > the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
> > to do with this patchset.
>
> Sorry Mathieu, my goal was to update the whole patch series with your
> reviews from v5 so you could take a look and then I would resend
> everything again once the others have been merged.
>

Ok, I'll take a look next week.

> If you prefer I can wait for the other patches to be merged and then
> send the next v7 corrected.
>
> Best regards,
> Hiago.
>
> >
> > > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > > started by the bootloader and the M core and A core are in the same
> > > partition, the driver is not capable to detect the remote core and
> > > report the correct state of it.
> > >
> > > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > > returns the power status of a given power domain (M core power domains
> > > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > > already powered on, the driver will attach to it.
> > >
> > > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > > return before dev_clk_get() is called, as it currently generates an SCU
> > > fault reset if the remote core is already running and the kernel tries
> > > to enable the clock again. These changes are a follow up from a v1 sent
> > > to imx_rproc [2] and from a reported regression [3].
> > >
> > > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> > >
> > > v6:
> > > - Added "reviewed by" from Ulf and Bjorn.
> > > - Fixed and improved commit descriptions of patches 2 and 3.
> > > - Improved the comment inside imx_rproc.c file.
> > > v5:
> > > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > > v4:
> > > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > > v3:
> > > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > > v2:
> > > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > > v1:
> > > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> > >
> > > Hiago De Franco (3):
> > >   pmdomain: core: introduce dev_pm_genpd_is_on()
> > >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> > >     SCU
> > >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> > >
> > >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> > >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> > >  include/linux/pm_domain.h      |  6 +++++
> > >  3 files changed, 73 insertions(+), 7 deletions(-)
> > >
> > > --
> > > 2.39.5
> > >
