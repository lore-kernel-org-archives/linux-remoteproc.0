Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB35C2EF
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Jun 2025 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034695; cv=none; b=O6PbbHL303dUjoX3PN4TpK7DDjtyU8BltR8y7Y1u4S0v2utB185pmUKEP/auQN95RH2sQf6r1AKJ5HbIBxUIRjGIC0fqj6MxD/eilUFN1Mz8Cf8s+dBz8TweF9KCo574SFIZMI4Jx/4g8bY/qR9jI57YbHZ4tL3cEAY3fnTtGPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034695; c=relaxed/simple;
	bh=B1BdE0J+jY6ME5BrRSZux1zOeKpTZZ4DlpXlyhs8zxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPEYIjZw7kuxPVCupS+1pNHwn++OwBYI/LW7EBrge6Lpm8+3cjsoD1Neyih5dXOGCvgtUb8tk4xrLRmWrtPzocHXSNNfkPll67a8yzV3vYU5gf/QTKtsTbLjeBiCJuFuAlopmZyepYtOCiLYH0ZdMSyc6IlGqozQ9GEvM4x7FnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X15TK5B2; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X15TK5B2"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so3210996a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Jun 2025 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751034691; x=1751639491; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8o5xo7GeehPDbRd+X/7D8FpirwN/TZkXVzx9zL2sssc=;
        b=X15TK5B2V1rLeKkJ9wU5Xr0orKYbmRRqGr9S0RVf2ulX2MghILw3tjttiglnpKsyIN
         CRXcaUxMqgmZwfdT5inUh5hTtd8LF8YFhWlnE9wYyP2T4iDAVSVs8ytbigF9VK/llu9P
         iD4hW8Jb0DiLH6OXbJxkMEVL5C5qNUxoKevMQZ4IEsHENA4/RThtxOJakLgX7+Nm32HZ
         e3eXwXlKIoczXAhAGo3cAsKZvWZBGmemfQO6alAIaKrLREmmd1/rs+1+xug+waFxotd3
         WTUMATMEZB5etKoIISu5G6GiTiIYzaGWAx/glxIY858o9BTWoKCkZO4cI30p8SOJzBDs
         UKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034691; x=1751639491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8o5xo7GeehPDbRd+X/7D8FpirwN/TZkXVzx9zL2sssc=;
        b=qK3ctgRtOIi5QtbTtfQkLd2pv3ujgqXFdZ2PfxYj8VNUD2xVn+OdnmYNzbIoD4vcBf
         fa6ylH5Leu7vxrMPxGIxDZ7RkvOu7QCUeD4jCI/CezxaJpgjNIQE803smufgNEAw+M8f
         0fW2ut0c/EDm5tpoLoBxXFaCLkx79H0Sh3wZ+flKEQReZVsYRlYU1SDdhI9JsUBJv3hf
         SnDvIdql0VddKc4nsodVI+Raz5JSBUwV2/Gxfry9pEXj+B4XJMlvHeW8/gvRKrzmszKR
         FfJEpMFlXsts1YcEsOMvlXCTvrtY3JqR0c2E5d8IROCW/9Kevo1vsuDocV207MIcwra+
         +ZOg==
X-Forwarded-Encrypted: i=1; AJvYcCUmf2K9bkW9cPRZcvTJNE8/hrRgEE84fOWAJZxqcsGCeFmEseFFIDc0V/v1VYxZN1jAgFLg9JoNr+XVPfO5vXcF@vger.kernel.org
X-Gm-Message-State: AOJu0YzCNus2NHQoC8MOhTUSEUhLSpGYPhCQssEJEHHcrWvV22nmQj0J
	YJaR9HdGmbdqbIxl+QvF/BkHt2bOSSSwWs6BzYChNZU8XdYZq6lQZINsvp66yffKgxLyFkvG4Af
	ySlvfnbmJpl/Hy6/OfsjfAmFNXyteCqydOhTWykpLWg==
X-Gm-Gg: ASbGncsXWN8x+bdEQSG+WvqHQ+woghoeF8G2805oVYiBeJJXKUYzg5rtbjZ2/dY+i2E
	7697oStihJPjT9JpPksJw3mCeww8KUrPgUhyZwrsHIZjNQ/1CscMrTNvPTgd6KLtPdLAMKiwA9o
	299d+YdICAk1i/dkESxK6+xvyKu6rGOqUarsRTLTfvfSbN04wxJRoPyJcYgwSCbH37XsM18NfXT
	fGCbg==
X-Google-Smtp-Source: AGHT+IEL785XIeur6WCbc2OIj5nk/sVLVVNkV3GZ+ObEePJ/qNpPBLIGoWwmBJBgA18YqNdBbv+6Y6RgOuBSpzWsw/4=
X-Received: by 2002:a05:6402:5bc4:b0:607:eeb1:b18b with SMTP id
 4fb4d7f45d1cf-60c88d9c37dmr2283943a12.8.1751034691378; Fri, 27 Jun 2025
 07:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626215911.5992-1-hiagofranco@gmail.com>
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 27 Jun 2025 08:31:20 -0600
X-Gm-Features: Ac12FXyLrcISUGMKifq1LXY0djWn87ywvC4vhLqatRfOsnXR-16wTizuirmCxWY
Message-ID: <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
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

On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This patch series depends on Ulf's patches that are currently under
> review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> Without them, this series is not going to work.
>

I thought we agreed to repost when the feature referred to above and
the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
to do with this patchset.

> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
>
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> already powered on, the driver will attach to it.
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
> v6:
> - Added "reviewed by" from Ulf and Bjorn.
> - Fixed and improved commit descriptions of patches 2 and 3.
> - Improved the comment inside imx_rproc.c file.
> v5:
> - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> v4:
> - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
>
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on()
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
>
>  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
>  include/linux/pm_domain.h      |  6 +++++
>  3 files changed, 73 insertions(+), 7 deletions(-)
>
> --
> 2.39.5
>
