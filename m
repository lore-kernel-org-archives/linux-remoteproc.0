Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764FA2E8B98
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569648; cv=none; b=CAI6u1Xqa5mdV9q8QQmdM6NTqrA8KX9A9AP1rTxC42J2mYte8UVA+zn7dI1PayuSafewbZeJyneSz16AOgwCLlcJAU55SIAEzfXeHKrIrp6oXBTgUiDsbnCeczlpKLRpmrUj0rnNtk4SXnEtIMST8LDSfrRo1KbIjLW0xNtD/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569648; c=relaxed/simple;
	bh=QOuhUbECchN9O5z4tSuzAVzWrzBcGh/7OTIvurcyros=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIvWnWfHF40IukU1cNnBs0Bbzbq9Goxe+/GxBQwJpF3FoWxD5Tin6PhrfX3Yb5g4A6L+JEBP64tJ3f2nEpcqCvfqIKt+EPvXuN3IbmoXa9tDMxzGEZ+y7MMdaEJHCZwifQ/w4I0kqzcg65H5f25qImlW3aCrFy2dMR5+MPoyMmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56f6afbd205so2844889e0c.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 00:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569643; x=1779174443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FuciPnJNj5AwtRdMcxDTBtjQGaobaVWkr7dCuNdv28=;
        b=MGK5qQbr24pHDg65QcVObDsl3bRkwSH/Wq+DGx596jtRa0aBKqy3FAJwNEhyjk6Wsw
         PSHynHOFgHoDzDA4vxgYtmttmleU2Bcgx4fc256SQXRo1e+Zd7FJqtzdtv/3MBQe16P3
         kq82SF8xkfYv2BVQLhPZRgBByqBtA/9NwQ1kB0xIxpIriLUvr1qKsgElD5Zxy/YN0Ltg
         qobQw1EuFYXWcxaLei8CnXTRuNK2x1/yiMS4MzU9jZAmVw4TShXXw0BToyKYFw76xBDz
         QdnJJt7EGcA0cefwXNLh0zFPjx4E7odXgBHb/VSRTZxrPpTn/SHZQojHm+11NVsNRs7M
         5frg==
X-Forwarded-Encrypted: i=1; AFNElJ8lUH45FoRHmUA34Oi4Vy+z9YmoX/o63mdD3nA6AFqiXnyG71sGRWLFw93oFSEr7c1CAxNLRnqvX4v9jqsh3e6L@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrpl/pPU46K2LoKzGOJ8nEj8sQpmgsNVpKNwASsgi2kGfcjXEH
	fOa9/n/IFlP7/nuK4aDYpZAPr+nAxm2LaEmzqrOEWnrU7pUe/+FJmFEOiEwBxYFI
X-Gm-Gg: Acq92OGjEtAfQ3piOYXx8dB+P/25n+TfW5Xh+bvXyDpba1nIh4m+QydFcFM75puqgp1
	NCy1NOEvtANY5W6AlOJRv9hsvRQRnMwBHa0pQO5LMCNJEcN/DsXmVdwrYH3p5WM03vjj13xaD16
	MK0SGI/cIGTs66M1+z9QFt1o0woTH85JajkbpHQYDCEDhxC8ErCMk7Aca1wPQLlTtdf3KQKiTLL
	Izd+e8P4YYb9IM5ZWXUmlpaeLnrcVKPN9shjAQpBMh8TMHQYtwDmar9R1CklyprIr78lF0SxBvO
	wVfi14CvuNCEgWkmyujltYBD495WHxDqYbaHHY3NuO/LmZd6nrCYNlDgFSr+ny2XAcnMmxBpi+m
	LxQLBXDjM4hXadhHndYmaBiWQkbiRTPk+0xGfFUwuKB+dhHWTT88ONG6JyRWPyRE04f5NklBQ2N
	69V3KKoyRIBvnWg9CBpNjLnlBbbRI8YKCvS4xkcLJzn/nTbZjBWkjriaxXbcZf
X-Received: by 2002:a05:6122:3408:b0:56d:86dd:d1b0 with SMTP id 71dfb90a1353d-575cf8ccd6amr1300095e0c.0.1778569643244;
        Tue, 12 May 2026 00:07:23 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef4012sm21783607e0c.18.2026.05.12.00.07.22
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:07:22 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-631ca15d35aso1977911137.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 00:07:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+k1WNZXSvDzhfJIVH+U4O3TshHrS0JAfNVAeVB9aFTvHWRFM8SHO335LSgISUG4MO8tF3Ba7PVGEZW+T5tEvXf@vger.kernel.org
X-Received: by 2002:a05:6102:41a7:b0:631:5717:5248 with SMTP id
 ada2fe7eead31-635d27ded2cmr1082007137.21.1778569642797; Tue, 12 May 2026
 00:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com> <20260511211841.284809-5-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-5-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:07:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
X-Gm-Features: AVHnY4IHIx-N6TjHjhDj_v4IyNJlawKxUXPhLNy1xplrNwtoo77SAjjbsdZbWCo
Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] remoteproc: switch drivers to optional resource-table helper
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Use the shared optional resource-table helper in the remoteproc
> drivers that currently ignore a missing table. This keeps the missing
> resource-table case non-fatal while letting other parsing failures
> propagate to the caller.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

>  drivers/remoteproc/rcar_rproc.c         | 13 +----------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
