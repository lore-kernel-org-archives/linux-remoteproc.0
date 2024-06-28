Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB37200C7
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Jun 2024 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609835; cv=none; b=nQsX0bQg7TEKkihCkRRsgvavBHm206+u04XH9b58MjqtCYqjQrdQlYO/9DUDICc0PoDvLwp67sQfWPx/TVPBucurJYxCLowspHQbcsdsnin4AcWH21qYXcalIlWjFJO8iLkomuCAcb/UkEAjb9RfawywAefRTKYfRXB4jH+VpDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609835; c=relaxed/simple;
	bh=I395gSmM2mRVaufGoBhAubG4eI18NB5NGs1I5z8QfNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttPcy5y136+DLJX0DUdOpqJIfV2X5mXnEC1Z0EdLBuDzA3lpC3o30hG0NdP4iowFZ0aJKDO1WbIBSrQ4vhlJEsZ3NZLU5fmXPp91GaVDambPrbMsnY7T6UbC/nq599opdzdR1QqIgV/N6HK5AbMlcGBMQiBtjgPLdmOV3ZckQBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RnvAyi2s; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RnvAyi2s"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57d05e0017aso1392386a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Jun 2024 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719609830; x=1720214630; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fPONzgFDKNc6mvaoY/BV8TnQODNhboH9X4hMvRJS3Xo=;
        b=RnvAyi2seA+w/m/gAKe1RPMsydMjxsJzusqqBHSLcsFUjH3AgFV7qW9gFTZxceZvQP
         DvPyVcfsxW0ifN789trvFSQ6z0yWvRpQBhTXd2k5AbKCR5tht5P2QL6xuOWNYkJaVdp2
         gvAH3zV6BPhxl1FZpuSQNW9Idb0vDkFExMYsI6z22kaEPSsLdcrUEDZU9S6wCo3O0YVD
         k9BAe6aPAMEnxEUZyawUc9/l83Eey8AktiM9tW9+us5PLQAdWV4l0z8p2x1UPuKcRsPb
         jpE7tDAPkPcBArF6qYDXdyc8nprawzAdVVArXcVmVkp8VmSkvgD3zhrFTf3KU4Xi5Tz9
         alKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719609830; x=1720214630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPONzgFDKNc6mvaoY/BV8TnQODNhboH9X4hMvRJS3Xo=;
        b=vF2P0WWLDVpcq9eEtK4CN9+1iWPrFR5GN9QkcYA6AdWA2lbHgLCZM5/mmQ5NniDm8X
         ZutMIcruCZ4Jz7WosyAOJda0tAHzLQdP/Qwid1YLSPXJvwpB6WsVj3ur6L3MPGc+0cCB
         pakRI6zQEpmGRlfD+Q4F6QtD3OKm+P9tMtSU3JQXTgEQpoAz9sgUlg6AaRsujlckppen
         uu9bEoowl63amTd+56fjoABSTxUl2E0mZzc77TMqbRbBCZBoCOVLpfnCWPTqs12fU7Ix
         JBdREeuGyq0RehSGbI2RGc405RKlzQOhgzWkoUpJTbHFNGdPupvGP0e5EdowzZDILYqT
         DwSw==
X-Forwarded-Encrypted: i=1; AJvYcCVpphdbepPN9OOtuOzE2gLUl2G8Xp4wvy8VMeua+8SVkY/E882/idX4Pn1mRA+VJ/bTaZocVw8wSUnG18bZ72jVHr+4BP/nt/CHnD7ursY2xQ==
X-Gm-Message-State: AOJu0YzVbBv6oo+OJpTGr3S+J6z3fe+WeQKENbnlWZvYnNLEk1DhuI/8
	NMugH46fzZJlernbxo1QFUGRfJBgoPVOQYc7Mkqmb1T+OdQ+Eo4ppakeJhQO/CGzCDSKxPSX959
	SD19MKIaIE1+r6xUKPvg5QHQiZ5jALr/3QAemwg==
X-Google-Smtp-Source: AGHT+IHP5K9VyaLHbZkzSrUTRDHOKNmezm41XM6NEtYOq+8i5E6s2bM5BtHkDtB12x/NAsn0biKrdMvFHJpJ95d30hU=
X-Received: by 2002:a50:9342:0:b0:57c:6d58:e1f1 with SMTP id
 4fb4d7f45d1cf-57d45780309mr12092712a12.9.1719609830495; Fri, 28 Jun 2024
 14:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
In-Reply-To: <20240621150058.319524-1-richard.genoud@bootlin.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 28 Jun 2024 15:23:39 -0600
Message-ID: <CANLsYkyVW_PVRVA_POi9D1ug4mS-6G9Xdu9qD0Keh6Las6uu1A@mail.gmail.com>
Subject: Re: [PATCH 0/4] remoteproc: k3-r5: Introduce suspend to ram support
To: Richard Genoud <richard.genoud@bootlin.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Hari Nagalla <hnagalla@ti.com>, "Andrew F. Davis" <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Suman Anna <s-anna@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Udit Kumar <u-kumar1@ti.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2024 at 09:01, Richard Genoud <richard.genoud@bootlin.com> wrote:
>
> This series enables the suspend to ram with R5F remote processors on TI K3
> platform.
>
> The 1st patch is actually a fix, independent from the others
>
> The 2nd patch introduces the suspend/resume handlers.
> On suspend, the running rprocs will be stopped (or detached) and then
> re-loaded in resume.
> The logic behind this is:
>  - shutdown the cores that Linux started to save power in suspend.
>  - detach the cores that were started before Linux.
>
> Then, the 3rd and 4th patches introduce the graceful shutdown of remote
> procs. This will give them a chance to release resources and shut down
> in a civilized manner.
>
> Without this series, the suspend fails with:
>
> omap-mailbox 31f81000.mailbox: fifo 1 has unexpected unread messages
> omap-mailbox 31f81000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
> omap-mailbox 31f81000.mailbox: PM: platform_pm_suspend returned -16 after 16328 usecs
> omap-mailbox 31f81000.mailbox: PM: failed to suspend: error -16
>
> Patches 2 and 4 are based on work from Hari Nagalla <hnagalla@ti.com>.
>
> @Hari, please feel free to add your Co-developed-by:/Signed-off-by:
>
> Tested on J7200X SoM
> Series is based on v6.10-rc4
>
> Richard Genoud (4):
>   remoteproc: k3-r5: Fix IPC-only mode detection
>   remoteproc: k3-r5: Introduce PM suspend/resume handlers
>   remoteproc: k3-r5: k3_r5_rproc_stop: code reorder
>   remoteproc: k3-r5: support for graceful stop of remote cores
>
>  drivers/remoteproc/omap_remoteproc.h     |   9 +-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 196 +++++++++++++++++++++--
>  2 files changed, 188 insertions(+), 17 deletions(-)
>

Nishanth, Vignesh, Hari and Andrew - I will wait for you guys to
review this patch before moving forward.

Thanks,
Mathieu
