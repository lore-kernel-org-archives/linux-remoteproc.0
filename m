Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA32F7AAC
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236768; cv=none; b=YtinaY8XNEV/bdkGq6pzRJFW/3CpfKJ13uU+VDV+im31kwjpC9+JMuv+3PrbDf6NRiIE5V9h7EK9abXVvu21tzndcPFWoEdiHCUVzTpUnHNKY2laKBl1QOpHFaBcqkgcgjRxckK4IzplBTgqJk4zci8zDBP0VK8PFXcgIQNx9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236768; c=relaxed/simple;
	bh=BozujfBMNFOAkBaY8sQBuZ358iA+1CjMFPAb+E4RieI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhyvJakZeYs7Qgx31Om9+M6CWOdAOgbXfxOj4+OFHLsUML+IMsRvniJzPjG4VuByxIYBj9BFnm5ZFgvkAWS67/Th+joj73ltLw5puCvAABq+0/GM4rGJZMluV8k81LxnprKRybjVhFTz3GoRgrLTlwD90oEqFiVfQeHhUsSGTEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56641b5a471so2310241e0c.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 02:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771236766; x=1771841566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P13RQBdg6K1Wy1Hr9r4bT32rks9Vl0ToNw0MIIfQKTs=;
        b=u2YfYaAfz92KGHGgbLzpBjWVy9lxa4um4bqSK57OHvClK7Kfibt86sJd+l4ok3itWs
         dRnl9BaZ5lyo2YGFMNyh7xvPpsIw9021lEghqK8P5XOsNpsEVrHUopV3+KjFSVbUO3pG
         BHw32d8w5dzBQb233MKsYZsCVje9ZvkmGENm7L0L83cM49n0DX6hW+kFoexB661tHQqD
         V/4C/n7pRw1OKXrMMC71ngMtHZDsmvSsCBuP649YalOHYzOhFeKWFpJkMrotgvPE3ty5
         oxqu5Ws+ziyTiNlKDpwtz8aMsdfqBzf9Fm979ysPGdDfehvPw9kkNu6vMVCAn/G/YTpR
         3ecA==
X-Forwarded-Encrypted: i=1; AJvYcCWHlE6HNlBOWomAlZIMsx1KcSOMSbR1hc+JE1KJOY/IRAAsgObfTLznND4idZBvTLmIvaiV35ITLfwJ1r7QH0Xs@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwBR/r1xwfHGFDjGKgvDeVKiVRyhD/xVvvW+LFYQzI+yubkH4
	BRytLbGWMRoZQC+BF0ZXr3BiY4RWoMwlsH/fMT1AZzkwz47O0yDVY5MREynpZpy2
X-Gm-Gg: AZuq6aKG/znvppwpjzuYEiPCS2qHYmlcec11c5mQuvZ2FXxs15QMVVXpGT1yjyYwTGd
	abcDvrzH/MhQW7/iaM493kMi31xdiL/CQYjozU4EsqEB1xPUweLK/3naJQhhyPmmp9prUjb+k5Y
	3A/cuCbPEVXsT/CTO2YgAikeZDthTK/OC9pgMyZQueSIr0CAboy37ixCIZaEZjqiR9ZiX+sIrdm
	b4HZI2rjEz9gGnlACDEd6GokxaqrV+aBKRxHqqboZdpiQHUGx6AHuzTJmtDsdJoR2B7usYG4Jgw
	FWEZHETDC5YX2NqUAZXgTqvCh9mQ9t3qeSQuWiQrx9tciZ7QsNLZYZ9IjHwPR656ewG/hcWa2G2
	MUjHUxLSOnkcBkAyAPpnWcq3b57ZGCKh4m4ekRJ1npFxXxxaeImVoD9/8tF/eWrndmdTAlTd3m8
	fR8ca2E+I/dOEm9bjXnTxM1KytQ6UN7sKwO2ib5AA8Fz9abyEz00kI0h2u3pgTRvUY
X-Received: by 2002:a05:6122:a03:b0:559:6960:be0d with SMTP id 71dfb90a1353d-56889c06729mr2290717e0c.13.1771236765768;
        Mon, 16 Feb 2026 02:12:45 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674bff1078sm8121068e0c.7.2026.02.16.02.12.45
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:12:45 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56641200d6eso2830827e0c.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 02:12:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7qHFcnwoBW4LgFKURSIQi3fKOoMFXRNxmHVHd7YET4IhBsmZ/2ZBoD4joc92r2TVR12nK1fy2vXLSuIpoGyG2@vger.kernel.org
X-Received: by 2002:a05:6122:a03:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-56889c06729mr2290707e0c.13.1771236764971; Mon, 16 Feb 2026
 02:12:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com> <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
 <aZLVU9toZRX2vKX7@ninjato>
In-Reply-To: <aZLVU9toZRX2vKX7@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 11:12:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
X-Gm-Features: AaiRm53XX8yh0yo47xtUNtlKS0oVTVKQWhwNHvxvJ08yrbcLBEFD0v6qPau1ZLw
Message-ID: <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, linux-renesas-soc@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, 16 Feb 2026 at 09:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> >    Don't you break the existing users of this API with this change? I s=
ee
> > you're fixing them up in the followup patches but that's not how it sho=
uld
> > be done -- the compilation shouldn't be broken...
>
> I am not breaking them. The helper is an additional feature and the old
> way still works until patch 8. Until then, all users are converted.
>
> I built tested it :)

Is that the statistically most-used response to that question? ;-)

drivers/hwspinlock/sun6i_hwspinlock.c: In function =E2=80=98sun6i_hwspinloc=
k_probe=E2=80=99:
drivers/hwspinlock/sun6i_hwspinlock.c:182:16: error: too few arguments
to function =E2=80=98devm_hwspin_lock_register=E2=80=99
  182 |         return devm_hwspin_lock_register(&pdev->dev,
priv->bank, &sun6i_hwspinlock_ops,
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~
[...]

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
