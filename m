Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70DE2DA77D
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Jul 2025 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752580221; cv=none; b=DxNThAuoxQdqkRrLo0qorgZVRGvhOw8rTBnZlCHlaHQqE9gaOHjGbdHGkv+AULNUkfarhum9VREyLm/s9S2uG0v0ucWhnM0pD0+k9gt47aDynSJhIzn9yBgNDGtGxRSUSUKUG4dJDSK9JKkICCaNMzzj4aGAwoAV+1cO01yc8R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752580221; c=relaxed/simple;
	bh=QNcCDmqQ5Df7rSq9TtFAWYVAUpPVzmHMgnOLyE7lX6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0oFdGWos3KB42wr+dhbX/2M36ocdqFAr8CJ21w3TW39SJP5ZTolC5oW9OKqzbg0Z+x6lX+qI8O7SsrixisusuV9CGW4Grj/ar1j/Dujqx9J8tvSttWwo1NN7n4BqhSeETa9KN50NgWpR+mgJqxmf4q6ctjiuUnMH24Qga/Ipa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1I8KR70; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1I8KR70"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-711a3dda147so57229157b3.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Jul 2025 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752580219; x=1753185019; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4wNySUjatYeI6OvV2zA4z/a1VqMlHoZrAYnvby/JKWM=;
        b=j1I8KR70P6F5yMATLVDnhuOHbDdqhP7kWYbqS3zCm1CEm2fFiCZ3FVVD6pvQtBEqZY
         wZQM8srF+xabr+VKvvYgxXZQkGCtx9kALLprEqxkX6rFJ8ndA5YI6X75qQ7La5GPWw7k
         N20odE9i4g2/63bhfOjLEqiq/hE8GPa/EkHVbU14ClMS1FXevJ7CBO/qG5WnktxyF38i
         RUbpDDRnBZVjS/Ft3zWCxhdZaum0q3ykiLu39ySrr1ao0mJLFBsgF5b6M6WS3eL1waWn
         XNo3Kk/IJcSx3kDKHFlWA772WJvTHcYEL9NUFC6fY5LmL1NVJgHKPYh5XXX09JtyjAQJ
         cP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752580219; x=1753185019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wNySUjatYeI6OvV2zA4z/a1VqMlHoZrAYnvby/JKWM=;
        b=WHctPYsCh62Dr82hDwVWXgR28oPIVB83IH4bBLcZDTEqE5T9zqQhzlYIJ+Tg+0rNja
         xghCJD4U5AmAjMkFBMbESQtyzvdKCK8D+qlXESw4Q/jGjqiQvJH+gdSKzJwb+dWt1fC8
         eNNcbOd3potSAHQN5bHtiiyPmlxTTQP34cK42PtFVt6DNumMvEOvcuTRu9IO5tiwrtui
         OpA+vbHKbWFtUphSHAiGrnNZ2K/0l7MPVR4IdWTPrqFPLiyX6UhGpKrN8gaQDlLjXMZ2
         xAmWCg+mepI2Dqalwg51EJPKrG9GCEsX0n5gMhlSUXMd6IZmqtH6SlG3LDtJla/t4QC1
         n/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXILU4+k2QH9ya4L8gpHMdmBZPHhM8BwUFPAdoyW4uSnvAyMRI5XBuxrgK9BzA3Pu5OgHFW3T1Z3WkdfInuqYFg@vger.kernel.org
X-Gm-Message-State: AOJu0YzdYul03HZMYPEUz3ekfnqnBklCezUAIeBX5X0sCdn66MaSMwMo
	VeMl5tW6XFyfWggJEpiTcdiBTJmHv/veE33vIU2puwR87OikT/NYgBkPrIGRciiIhiwsY778KRv
	b5kLmzpJtV2B+ueSagKgq1sxDKGZrYiHc8OLHYv4MYw==
X-Gm-Gg: ASbGncsSL64DNrXM1mR190DTAJiclvaTdBE0zn3AQhlsC/m4WzHPbZTs1oXMVhkj125
	i4MyYLk3AIEoTRRK9Bq+bC3s3wMWZwbexxES7cnxKbQ/xRc5Oy5kvmQCim6CLF0TZOxpgw5d2fP
	MxrUrQZt8Ff0YjFkImIQHzN+xUTK0HsB6MTBhnFsH55Ei322o61NrL53Wq9ZZiHdNJEeCZezo7g
	v/E1W8g
X-Google-Smtp-Source: AGHT+IF/K38yeveYq70L/mHAPtfjeL+GIee4NoKApQPc4/AmworpqftrKbu0K7Q7h4oLInJZL2btkmXzEuBJtreqbG4=
X-Received: by 2002:a05:690c:7483:b0:716:3dc5:a35f with SMTP id
 00721157ae682-717d5e94ad5mr256657057b3.19.1752580218628; Tue, 15 Jul 2025
 04:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629172512.14857-1-hiagofranco@gmail.com> <aGazjaJQXl03HUJE@p14s>
In-Reply-To: <aGazjaJQXl03HUJE@p14s>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 13:49:42 +0200
X-Gm-Features: Ac12FXwJ5N_wrB84X7RLvjAxpSUj8wCAKwcHpPhNOwV7kx7yjVIlAOOax7yXEA4
Message-ID: <CAPDyKFpUF+S8EqVsHct7TFZGupq71Bu7eL3t2Sr=ibhZ518nsQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Hiago De Franco <hiagofranco@gmail.com>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mathieu,

On Thu, 3 Jul 2025 at 18:45, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> Hi Hiago,
>
> Many thanks for re-working the changelog and comments in this patchset, things
> are much clearer now.
>
> Thanks,
> Mathieu
>
> On Sun, Jun 29, 2025 at 02:25:09PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This patch series depends on Ulf's patches that are currently under
> > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > Without them, this series is not going to work.

The series above have been queued for v6.17 in my pmdomain tree.

Do I have your ack to pick $subject series via my pmdomain tree for
v6.17 too or do you think it's better to postpone to v6.18?

Kind regards
Uffe

> >
> > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > started by the bootloader and the M core and A core are in the same
> > partition, the driver is not capable to detect the remote core and
> > report the correct state of it.
> >
> > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > returns the power status of a given power domain (M core power domains
> > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > already powered on, the driver will attach to it.
> >
> > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > return before dev_clk_get() is called, as it currently generates an SCU
> > fault reset if the remote core is already running and the kernel tries
> > to enable the clock again. These changes are a follow up from a v1 sent
> > to imx_rproc [2] and from a reported regression [3].
> >
> > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >
> > v7:
> > - Added Peng reviewed-by.
> > v6:
> > - https://lore.kernel.org/all/20250626215911.5992-1-hiagofranco@gmail.com/
> > v5:
> > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > v4:
> > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > v3:
> > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > v2:
> > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > v1:
> > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> >
> > Hiago De Franco (3):
> >   pmdomain: core: introduce dev_pm_genpd_is_on()
> >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> >     SCU
> >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> >
> >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> >  include/linux/pm_domain.h      |  6 +++++
> >  3 files changed, 73 insertions(+), 7 deletions(-)
> >
> > --
> > 2.39.5
> >
