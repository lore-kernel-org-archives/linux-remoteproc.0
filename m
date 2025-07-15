Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1971F8937
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Jul 2025 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752593876; cv=none; b=V6vbCYOvmiG1NPgB6V4jNhM+0zhmGNL6ErRegPbQQgTXWGGsTYjQUdeQwfrrS+/QGmmK0ynqBVWGrNm0Vi23Wa7vAcQpxRUpD0+y9eP4ifQlI3aBh2qAHS5D1HndvpDP/4ZTNAVYKY0g66oK0NGoaotNaHD3KKeJsCg8qOua6Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752593876; c=relaxed/simple;
	bh=MNjWM8Z0QuCnshVnQ1bsNB+5oVUx8sdzUpPC+lIh8FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaPom+857DT3m7ARYTwpw/X6HR5zmJGMEp8B5WwPns2psL4oW1EKv/mllMpWwLmqzunqpvJcdZ8jkjl3I319ZpG1vWZPKiMU/tG3+3mRyDFQvuFS5tC1UIv4Mhj9qXK/2a7aIhunHIPs8UcguKj6mtXw6KNuA7Rr6ulxoMu2zLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQ7wW0d2; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQ7wW0d2"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747c2cc3419so4571111b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Jul 2025 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752593873; x=1753198673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzNEH5LOAV7uVf2fuNEUyq4fxGqo7XGg0gkJqBbGqwk=;
        b=XQ7wW0d2v+neIPi0veYQojVA7KkWBWU9Awufi7ABVD1y83PBYucam/qmACaAyfrvn9
         Ga0bHG3ypDJqdEvT7i9OaNvt7WZRUAOzZHSL4Fqhbnf4m/fxbXsrP1StAA84LU6EDulq
         F+JGKwgHvp60VWhvFvDbGjuM1q6MWnyU40d4sE7k8J4s0hSBVQTE8U3c6O/YEcfXzBXS
         LuT8juLJzyl4Z4Yw6JOqImqP+1hjcThkyM8EhVr5U+05qq47GDHTcLIO69xB2Rsx3cPV
         t0fKygRAP9p8psm2EQjwumfgpa1cF1QB4qnYJIPNB5g24bZJTappwJ9ec7fLWqiy4HM3
         fgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752593873; x=1753198673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzNEH5LOAV7uVf2fuNEUyq4fxGqo7XGg0gkJqBbGqwk=;
        b=WUn7hM5iEM03DpReyrPRVe1+gdHwRaA1v+aO0sKrOcryw4ptrUH0aYbpIx7eYDOf6W
         P6295PHgkplJL6Nwc/eI22ZxMgndV4YPfxEbXlCBEd9SGEU+OBhDOLayShW8iwEu7o2B
         YXhSs1vWXgYBAhOGTqH6OxLyPyiOTXv4HSsxvwXz2pTVJ6TYULcd3zsfsrMa4/IYHl+n
         SHG5fctKu8kSBO7jFIS3Ej0gDgeJCVOYxrqBpLCFCKc+NRfsuiTUfglXz5bFEGvcitY+
         vAs9ZY+aYaLgvrCzcV8Eov5G4fPJk8XyeVLcBaUkk8t022eZWFoWcCP0wodMchzLp/OU
         hhyg==
X-Forwarded-Encrypted: i=1; AJvYcCU6qUxeyXzUqLWpFZ/gQprR3Z4NQMNwH1EU9rmOMInT4o81NOhKzdviFTijYfm3pgehgYKef73YpU1zHVQ/l+FH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92nrJxnf6hBaLzMCRa+TZ+eysuJrRcsDp4iwvL9qBW8y4YCmP
	G2Xu80s+HcblIuMUaSjziNlJdg7qPy4WvIuRDskzyJGjGW6spV26JgGuetUHOs8wIMc=
X-Gm-Gg: ASbGncvXpJZRx4qP0ApNai2NMK6Q86WhNOdEQeI/E0lJYo98gmaPXejoCghY2ZFB9VB
	CjsXSNDLi++q9nlqm4ENLCsUhHwfOZfAm1czr9Gd5KhiBOT4dkEONWHEZjP41Kh5ROIZWtyCFqI
	/QmAvQ0ox0lsmNeLT2QWYPnwwB/G+egRK4OUTqOxDjtTPxhdUGwjwinNyABArGQEVifrmOaSKZ+
	VH+2dLMsfjjtJwVw8Rosz3tg7g9CrI0+zkXVJYErID5NSnJFb1C2lfKijswdk9Ln8qq24Mu1vmk
	LUtJVMVNRp6GfXC3uZnXNPl0yphp7xVod8GsuiqZWDYbHo37bUZCeKAJCGxw7MLeMx+MrYewVBb
	7FBr2ppE2w4BXlkIgUWvzLXYW
X-Google-Smtp-Source: AGHT+IGfUd3Wq8tKCUsCK6+tRCHhWda76Q4+cIiZSoc97uhXtJTnyEkJT/SdNOXKgCueM3T97WS1Aw==
X-Received: by 2002:aa7:8887:0:b0:74d:247f:fae4 with SMTP id d2e1a72fcca58-74ee0bb5748mr26983642b3a.4.1752593872779;
        Tue, 15 Jul 2025 08:37:52 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3f17:6d67:cf82:708])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd605dsm12780538b3a.18.2025.07.15.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:37:52 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:37:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hiago De Franco <hiagofranco@gmail.com>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <aHZ1zRiAuX2PVYcU@p14s>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
 <aGazjaJQXl03HUJE@p14s>
 <CAPDyKFpUF+S8EqVsHct7TFZGupq71Bu7eL3t2Sr=ibhZ518nsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpUF+S8EqVsHct7TFZGupq71Bu7eL3t2Sr=ibhZ518nsQ@mail.gmail.com>

Hi,

On Tue, Jul 15, 2025 at 01:49:42PM +0200, Ulf Hansson wrote:
> Hi Mathieu,
> 
> On Thu, 3 Jul 2025 at 18:45, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > Hi Hiago,
> >
> > Many thanks for re-working the changelog and comments in this patchset, things
> > are much clearer now.
> >
> > Thanks,
> > Mathieu
> >
> > On Sun, Jun 29, 2025 at 02:25:09PM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > This patch series depends on Ulf's patches that are currently under
> > > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > > Without them, this series is not going to work.
> 
> The series above have been queued for v6.17 in my pmdomain tree.
> 
> Do I have your ack to pick $subject series via my pmdomain tree for
> v6.17 too or do you think it's better to postpone to v6.18?
> 

I may have spotted an error condition that is not handled properly in 3/3 of
this series.  Given that we are already at rc6, it is probably better to way
for the next cycle.

Thanks for sheperding this work.

> Kind regards
> Uffe
> 
> > >
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
> > > v7:
> > > - Added Peng reviewed-by.
> > > v6:
> > > - https://lore.kernel.org/all/20250626215911.5992-1-hiagofranco@gmail.com/
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
