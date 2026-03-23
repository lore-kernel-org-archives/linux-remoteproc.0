Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908BE3DE442
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2026 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297258; cv=pass; b=tdupEClTsx9wfKRH1XJrT2ratVNJBpQs7DeC6T4FKPNmAYebe65LygRY+zFnJCjyibALbrusfpApRkzLj0mNSusmWgS1MIZi9KnMUXqMd4ZOJoyu+LzksZtszQVguvkvLQ4YG+NS8fV/wFPMqiwi17GK9rW0QBSDYIx86GsYAuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297258; c=relaxed/simple;
	bh=jtHo4zFglLi9NA2q+v0xNbZU3hxJXWVRVktvnGWVBk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNhmiQunthMM3qdkoCZAs9p+EaBcCANvh64L1e2yhWyo8C0drtM20uKCjTDe3J2uT0DIPYkBANV+CY8irPuJ2RcLaXv08XfEvW2+kzLPH9Clg83CjM/a6NQlvkUpgED1TPt5IvO0Z7mRptwv3hLv84m+ORARMCIBNrrGjvi9pXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr9tSUZE; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr9tSUZE"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1273349c56bso4379711c88.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2026 13:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774297256; cv=none;
        d=google.com; s=arc-20240605;
        b=UaTqkFl8S0KDYchlTqoqCjKGwPMMVOjzJAzlsg4nihzslVcGSfRrhAEM1/ifg+EJ1j
         VQ+Q6D6YI/Vb5quTcoMIdgTvClDD3Lc7qJD75iKwq3zj4uy9dMFCsG2G+5KVPNvqUUJG
         TzdjrkfwxOxJvA+M495ICfJ5WxXPC1scRPrUq/59guOtg2Zb05EH034e4bHVrqoVzcR/
         Y0A4cZNRom4sasI3e9ksB0WuNy8ImFGMPtK1Fq5NCPQQoYzsDCCQQRM6fn8OYvNYEtmH
         PTVgfRcrgut1iO0Y6yms4tWaJyV767gVcWe9K3NXa475w52ob+UZuPM1GnRASbRyD+KK
         95Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=;
        fh=0j0SdpTM4qOT9gIFX0pxLGkZcX8mbGNTspnHfu1rd9E=;
        b=kvmk6/Rlmlws4FSM8LXHhdVP/fVpiyZjjCTtfR6zjHpSXK5xtE9D+Fm+crSdgfSV12
         zkAIzs8ira+pK8Ujbkpv0hfOoAa5VJmPqwk+t4NKKp16OkxUWuTcFxw7PnfaJ/Uc4tsn
         JrkT032ClBH6sohdUkDbNcUrm1DzArJyNBtHyyRtrplJEJnJ5Gi6AH4UHbSPNZpBaVRr
         AM4RWFCsXV0CRMhFdcJPal+CLX33qS3Gmhyb5x2CGe4EmQ9TCxri5Y93xhexo4TD/399
         fo7i/TAVYKWRltp77wobFr+T7kKU59VG93bejJP4bMn3DnCSRpaYaDogDFhFBNeIhibB
         rrRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774297256; x=1774902056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=;
        b=cr9tSUZE1Q4WN6u8K/G/dyenxLA39MrMLaX5Gb40T+7ajb+rBGoP8cFmBCMdeedlrT
         /WrQkvwT68768WAStPkB+NE4cOAxZtz43YnhGceIWNMkB9gt9tCkxJT35kB+lR/UcwoF
         HB4NrfcPu/WJOKAUhJ7hDQHxfYO4Rt+guloqmhWaJ6BGsUau4Kn+0TfBAp4+qb67wEoA
         lhy6/6J12U0iBa6NV0QCozbvch1MCWxVf7Un2Su2DIiZwwc+feOkXIJv7wze405q2eZO
         AlKqGRgtNy6mQ1Rk16XcGx785jMfhWrZmArIajdTaZQJbs9UPD7u4HIe52xyPgBSxT8i
         2Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297256; x=1774902056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=;
        b=DOLm+ezGAHPfCkM4NukoHgzOgLyEFX0f7sP7V8+vgc0ESGkn++CrMdncAlNdsPkE1+
         E+Ez0p0F1ZIOrAdnjPtfNVHrJIKNNe/+z7CyY69CTHdvSLsWaHJsukC4tFPhmA/YgFGM
         3jDdP/hNMbHIjAoae98L76NZ/epPNtE5juhqH/1YYeUEmp+wVJ8Y/EpH5XNYkCxNAb+I
         BxZT301y18nJMwNIoBl9scnLqswrJmX/LySSzagfLLlhZguT8+8CW4UpN9qCF/7UmurZ
         nvgcCV0vVz7DZP8eGc5etdOCwzl15Nf6pTvfXIrK4E8zoA9Hh7BeavIrLlXItpPEMrBv
         TSwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9ZUm+MgDq0ChrbAfVduUToRIcH+J3VnS6/vlfyzenIdZgf1I74AXAlc767tMec6X1bs/EPWavs16CKTRmhKG0@vger.kernel.org
X-Gm-Message-State: AOJu0YyWibCA5dT99HZzj9CRex2Y2AhNpMJcSuApSmEz0n/6Ez2Qxy+G
	G9F+lqjmbBpu3BWfuM/jh3T/iPaNeb44MA850WTdSArHttxkKybrQbmwuSzJq4p6nRKb2BLesB8
	Ep3hIy7B+OSPzw9mfmUk6NHwTsm85kLw=
X-Gm-Gg: ATEYQzx6xaUQ119GUu7U32/IKyklLbnkfqkNY+PMJQbzHseuAR/tkR2vx0z0Hk0CFNE
	G23//wVW7+D0Z41zyyEIKoCRYCpqwuUyDxcSy7OrZ8bR0LMgnF2G+OjVgpvWGW7vsREycV5EMfM
	voNojCraqeYSLUO+UN2jd1c/CjwZpLfrVxCpw35zmr3Rf603RbGN7BUNfCJjB4+NzZXB94IaTiG
	YlQ19eNF4vg6GxpXQ4BwT+atL1rH7I8M964VRuZjvyL9SaYcbjfB0YE6wdUmpUHtsZLXt5bFXjc
	FkXFA9yclI+f+8Ztb2WOhtxmF7GdqDKp7Lixn54U9C8KgL+q4Zlv06x2ZFKtvpoXbgGj/L80S3x
	bbEGIOIDT2ifiG/1IZjyap3gfD2ibfYXl
X-Received: by 2002:a05:7022:6713:b0:128:d1c9:3633 with SMTP id
 a92af1059eb24-12a7265f60dmr5589793c88.13.1774297255634; Mon, 23 Mar 2026
 13:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com> <20260323191529.GA1054724-robh@kernel.org>
In-Reply-To: <20260323191529.GA1054724-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 23 Mar 2026 22:20:42 +0200
X-Gm-Features: AaiRm51XzKk2n6IioMvqGKwYdcIMaisSl_WziBcqMgfR8j04ziwnDez8lFdfqYw
Message-ID: <CAEnQRZCbGPqBBKjQiGB_pRj_8GYMFXXXVmpfsU0_AOjo3J5cPQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
To: Rob Herring <robh@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 9:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Mar 12, 2026 at 08:36:56PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Cortex-M[7,33] processors use a fixed reset vector table format:
> >
> >   0x00  Initial SP value
> >   0x04  Reset vector
> >   0x08  NMI
> >   0x0C  ...
> >   ...
> >   IRQ[n]
> >
> > In ELF images, the corresponding layout is:
> >
> > reset_vectors:  --> hardware reset address
> >         .word __stack_end__
> >         .word Reset_Handler
> >         .word NMI_Handler
> >         .word HardFault_Handler
> >         ...
> >         .word UART_IRQHandler
> >         .word SPI_IRQHandler
> >         ...
> >
> > Reset_Handler:  --> ELF entry point address
> >         ...
> >
> > The hardware fetches the first two words from reset_vectors and populat=
es
> > SP with __stack_end__ and PC with Reset_Handler. Execution proceeds fro=
m
> > Reset_Handler.
> >
> > However, the ELF entry point does not always match the hardware reset
> > address. For example, on i.MX94 CM33S:
> >
> >   ELF entry point:           0x0ffc211d
> >   CM33S hardware reset base: 0x0ffc0000
> >
> > To derive the correct hardware reset address, the unused lower bits mus=
t
> > be masked off. The boot code should apply a SoC=E2=80=91specific mask b=
efore
> > programming the reset address registers, e.g.:
> >
> >   reset_address =3D entry & reset-vector-mask
> >
> > This reset address derivation method is also applicable to i.MX8M
> > Cortex-M7/4 cores.
> >
> > Introduces the optional DT property `fsl,reset-vector-mask` to specify =
the
> > mask used for deriving the hardware reset address from
> > the ELF entry point.
>
> Why can't you fix the ELF image to have the right address?

This is a good suggestion! Or parse the ELF file and figure out the
reset address at runtime.
>
> Or just imply the reset address from the compatible? It's fixed per SoC,
> right?

This won't work because for the same SoC depending on where you want
to boot from (e.g ITCM, DRAM)
the reset address might be different.
