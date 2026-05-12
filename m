Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A5379C51
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 07:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569612; cv=none; b=WVBwcsoKPLoPmqrGwb8VUdR35xtSVaTUveLJXy/CXYpjbbaG9r+fI8mIVBXZS2U2TFgqp2upcZ8HdGFfrWvVctt6gABPopc6SjN/VjbU6/K04vaoo+LlVrjBCGy907aqo2gQAHRsJ7fUf3O0TfbGewRtjlwwhT29kosu8qr6Aw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569612; c=relaxed/simple;
	bh=UcY4jP/18r1gef8ACE5/GJ4a0vJN1v/bPa2Q4C10n3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5e7F8iU69fZV8uHCPFg4kFoZ5Zx++hidVIJ3eLfIKv8sOSqfb3meDdInsIaxUGaKA9TVW0rvLR+VUgmdkd+bQSW5skI4eGebOMQfwje3u/b15CAAxn0nGdyDkNclgZuueOgZW1/IsOsRxSu9Pk5o+uEI2qp2tu37q2rO80gcbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57524e53749so1604636e0c.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 00:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569606; x=1779174406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6U9R02UyT6PCn4mJzYYl/CPWidpbIlIhzjolxdPX7hg=;
        b=WGcxEYw3EoZc0s3jcLEpI2k5EeafSxBfHZGDnZqnnuXHk0GL/nb0heOiSdjeT+uAdF
         JPIvsNZFwsShHkJWkJnoDmRp2uIdYkPJ11KvDTyy/QbF4jnhumKW5uCsUWCYL3EEo6nZ
         DoShMrz2h5eQLdoe7XfUS6yfftbc5cCfCvcioCvv1uRExJSPp4UNqwXqBze1nfWfAI2X
         v/ljL8pDbBdtiRPBpheDFT+jlTqJ2U32HKpeFFkg6I3wug358Ac8nbndOsrRSQksua0M
         cdjXMKu1WFyzzEWDUnLjPpUZzkX8wSMnF4whqtxaCG9khpAMt3pCu7kQR6nk/4cqP2/l
         TesQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NqEYfEM8fmcO8nRLtPVW1k1krsL+PHU/J+JzC3+O45PoU5WwF6j2Ds6drNOm1bYgCH+SwXuqP2pPfmsY3UHrT@vger.kernel.org
X-Gm-Message-State: AOJu0YzcmeCDsLlcfj1aemU/9XUBY8cfbqpoVqqGBxSRKSMgsqIonmMo
	cC5zfdAtKXGoyQXnY+x4qDqOhXA0mb3SS+mP2/StLKdFs4L2V8OiAtSuyrOo57+A
X-Gm-Gg: Acq92OFMpwrlUhC+auffYHMSwPHlJ+IjKkI08vvqd6PyrfbCTXvu6DV8T6qlwPxGCCm
	horiiLkbhPpH0UGWYShJTNH6NOrR948U96BDQTnwTPTvV1AiN90A3w7FWTKeEI9r0yivubs+nnZ
	fQKGtLO9Eu+JoH36nrgu2fFg7Aw9nlO44TgLHfZuDzVKFDxoVE3YBA/nH440uI06DSwa/oCg7+f
	/WUwzMv9JDeRTYc5ucmrTU3FsGujUdFyyHiTtENm/fH+ZtAZWr3u+W2koEaTvUsB6Et1GFrKL+S
	sDT9G4Jkz20az+MzZWNjmBzAulKNQbocHGqlH0SXq5XLPNISXRPPXniTtVazbGgpMPEanxYY0tb
	QjzA6qOObwAZVkJHbt8pjOf0grKnNjLVqxHF1bbbTrStp9KAmdqD864b3pQFyVF2jf2ZkRogbpE
	VV18FxfnZ4GcZcvGtQUhY5k0x/odp7AHKF1QgbNAfNwxHiuhOfV3JP5bLY0iyc
X-Received: by 2002:a05:6122:400f:b0:56f:b674:783f with SMTP id 71dfb90a1353d-575d4247652mr611723e0c.6.1778569605524;
        Tue, 12 May 2026 00:06:45 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ee065asm20438598e0c.15.2026.05.12.00.06.45
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:06:45 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ff05af29b4so2017338137.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 00:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9vLRfSCvRpXj1U63wgZL6ar7hlhA7hmyuYezjnFIVvCPh1bMlmSx9GGul4jYVSpjYX4dW3Wi22WZlpFgbaA7RA@vger.kernel.org
X-Received: by 2002:a67:e7c5:0:b0:631:26f6:701c with SMTP id
 ada2fe7eead31-636187cd6ffmr637420137.31.1778569604976; Tue, 12 May 2026
 00:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com> <20260511211841.284809-3-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-3-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:06:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
X-Gm-Features: AVHnY4Jzn5XG3w_TFgzZrTYfNPhFMcAA9wRYKEMGtDIRqvMdxDHMc6dhfvtpVZA
Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: switch exact-match drivers to wc-ioremap callbacks
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi Ben,

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Replace the exact-match carveout map and unmap callbacks in the
> existing remoteproc drivers with the common wc-ioremap helpers. Leave
> the zynqmp R5 TCM callbacks alone because they also clear the mapped
> memory and are not exact matches.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

Thanks for your patch!

>  drivers/remoteproc/rcar_rproc.c         | 33 ++---------------

This change also makes sure mem->is_iomem is true, which looks like
a valid bug fix. Do you know what was the impact of not setting
this before?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
