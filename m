Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8C61D54B
	for <linux-remoteproc@vger.kernel.org>; Fri, 26 Jan 2024 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706285572; cv=none; b=iIpCtQo5gNPQvCkj61X5o4JCsdQ0PIsBCgGm7Eun08WeosTkavp4kZ1ky/k3d64xWA4CkZA5fR6/ENa7ciH1j1Xbd9o+9G0uE2YTxkzFVbMHkKPXOXZYVCnSewVVV2xu3JHeoeUsEwYj6RpThTB4L6OsA/qicwf3AfS6KHS2hEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706285572; c=relaxed/simple;
	bh=NGUuwyDUt/V8BbgO0Ikz6ekMH3s9pITV7aBg2GJNeyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsTApoDbQmShuXnVxFJzgsCofp8UXENrMYcbHxVRo3sqGHt3f/nuAoQkeyJ6ukvrSIj8gFGgYO1FCbil51pNcEswYjytz9kwJOVWDuO2NGo7yc/hRE4Dg4IA+caDxPyxJN6ydD8moPRtquuNxoMXsivBiXgbqkwKfoY/taMdhoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BeIACOUa; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BeIACOUa"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a298accc440so86554366b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 26 Jan 2024 08:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706285569; x=1706890369; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcg3AUd2cqMzWvqXgXxGKA4Vgsv4bHXjz07Z4n2FDK4=;
        b=BeIACOUaUbltTIQ5Oespza4D2lupH9bhKbTv9eu/2wYoz3ef5Xu/rlOXNsxKaRZOMv
         r8UlPU8PlPZav4yXbYJA3d7jv4bSQ/Y8r8Vr9ds7yDGG5CiKPNEWLmo8mmX82ZEsIfcG
         LB80cWn8KkLgwNl/mUI/Ea0RaIZVG98/HCrkMmjMhvCZIxF0J1yiaJUwqA9tua9QUcuO
         I825pEW+xlDHsUZdl7W0ebBiy78k8pN8PQBZ+voOyHZLRm3W1mPxaG5omgP8rc/vX+b0
         xV/3jyLSlc9R0nrVsrDoIhh6lHDVRkWAwCXDu62ijRff1Ff7KKI2wayjDlK//vTHVCoO
         S5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706285569; x=1706890369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lcg3AUd2cqMzWvqXgXxGKA4Vgsv4bHXjz07Z4n2FDK4=;
        b=xEUxRQPp3Ec0w3J4hMKD2Ahg7LCj6Hu4xMVFIro8XrcRcu9k37TicayoadI4PNGYAL
         gN8h7KgX1zcazQ2SBI56BYCS2CfrAYiqIIr0CYR/QUaPnMGCta5qG+tElemlISqh9F28
         KB7M5jnlODpH7PpjTqHo6P0odYv+b5s1hD/JayLZMF8n3qxte60vQGLhDFv7olIYTd5p
         JDZBrUUdPSCe8m/vQpuHt7IXXTa1VxYFVPbq/1KpboqRJhBi5I94Z5JO1VpTSI9D6PdM
         uyzCGw3TDN5UCeMgrLhq2uENK0sv0uNHrasKIvFiOa8GSQr3aRyQISUT2rYoK62aUwre
         +iPg==
X-Gm-Message-State: AOJu0Yy8eq3dlaN73rAVd60nYXW0KSM7XP+P9AhUqRGtccpYV+XN2Z7u
	JDkmdB+B7qq3Y8VKq9VwoNCwur0Tvsy4JNhIOmf0kzd2LVGUfOJwuZdzjCtAy+Wu0plNNCnNEby
	a/5OvAKoOupa67OW/9MLeJcQd1sO8ui6mWZXcxw==
X-Google-Smtp-Source: AGHT+IFne1/xTwjOzXN0LiDrNgwHDmNg5oG+ktcyzY3HamyfJjBqdydrqWcvun6DTJpyaQxuZu8/43tMMiwe93Fpzl8=
X-Received: by 2002:a17:906:6d4e:b0:a34:977e:aa7d with SMTP id
 a14-20020a1709066d4e00b00a34977eaa7dmr1633817ejt.70.1706285568955; Fri, 26
 Jan 2024 08:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105160103.183092-1-ulf.hansson@linaro.org>
In-Reply-To: <20240105160103.183092-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Jan 2024 17:12:12 +0100
Message-ID: <CAPDyKFoGozKrNrAc0vpnNVuKvnorAuN_fg37DU4j0rq=egJ6Hg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PM: domains: Add helpers for multi PM domains to
 avoid open-coding
To: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-pm@vger.kernel.org, 
	Viresh Kumar <viresh.kumar@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Nikunj Kela <nkela@quicinc.com>, Prasad Sodagudi <psodagud@quicinc.com>, 
	Stephan Gerhold <stephan@gerhold.net>, Ben Horgan <Ben.Horgan@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jan 2024 at 17:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Updates in v2:
>         - Ccing Daniel Baluta and Iuliana Prodan the NXP remoteproc patches to
>         requests help with testing.
>         - Fixed NULL pointer bug in patch1, pointed out by Nikunj.
>         - Added some tested/reviewed-by tags.
>
>
> Attaching/detaching of a device to multiple PM domains has started to become a
> common operation for many drivers, typically during ->probe() and ->remove().
> In most cases, this has lead to lots of boilerplate code in the drivers.
>
> This series adds a pair of helper functions to manage the attach/detach of a
> device to its multiple PM domains. Moreover, a couple of drivers have been
> converted to use the new helpers as a proof of concept.
>
> Note 1)
> The changes in the drivers have only been compile tested, while the helpers
> have been tested along with a couple of local dummy drivers that I have hacked
> up to model both genpd providers and genpd consumers.
>
> Note 2)
> I was struggling to make up mind if we should have a separate helper to attach
> all available power-domains described in DT, rather than providing "NULL" to the
> dev_pm_domain_attach_list(). I decided not to, but please let me know if you
> prefer the other option.
>
> Note 3)
> For OPP integration, as a follow up I am striving to make the
> dev_pm_opp_attach_genpd() redundant. Instead I think we should move towards
> using dev_pm_opp_set_config()->_opp_set_required_devs(), which would allow us to
> use the helpers that $subject series is adding.
>
> Kind regards
> Ulf Hansson

Rafael, Greg, do have any objections to this series or would you be
okay that I queue this up via my pmdomain tree?

Kind regards
Uffe

>
>
> Ulf Hansson (5):
>   PM: domains: Add helper functions to attach/detach multiple PM domains
>   remoteproc: imx_dsp_rproc: Convert to
>     dev_pm_domain_attach|detach_list()
>   remoteproc: imx_rproc: Convert to dev_pm_domain_attach|detach_list()
>   remoteproc: qcom_q6v5_adsp: Convert to
>     dev_pm_domain_attach|detach_list()
>   media: venus: Convert to dev_pm_domain_attach|detach_list() for vcodec
>
>  drivers/base/power/common.c                   | 134 +++++++++++++++
>  drivers/media/platform/qcom/venus/core.c      |  12 +-
>  drivers/media/platform/qcom/venus/core.h      |   7 +-
>  .../media/platform/qcom/venus/pm_helpers.c    |  48 ++----
>  drivers/remoteproc/imx_dsp_rproc.c            |  82 +--------
>  drivers/remoteproc/imx_rproc.c                |  73 +-------
>  drivers/remoteproc/qcom_q6v5_adsp.c           | 160 ++++++++----------
>  include/linux/pm_domain.h                     |  38 +++++
>  8 files changed, 289 insertions(+), 265 deletions(-)
>
> --
> 2.34.1
