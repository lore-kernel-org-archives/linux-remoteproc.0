Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B04B2E8B67
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776687932; cv=pass; b=LJLRJNDP6DZ5D8BbTh+0JCiB+C9uP0N6JqzyHylYk3W/PMV24F92PAPnXsyfuuayEOy9ATZ6zJ2be9ZApZxEWVPhn5YR/JPQY4+C6TCOa1+gqMqYnKVj7mgOS7IcXUmKktRJ07ppvrDvtZ7d2SLAgSvYNZ7qzZEzAWEOLTO5jas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776687932; c=relaxed/simple;
	bh=x7limQPZ9fbfVmUFX6+p6BilNYOm67GKW1SfJR896uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLZxEgXZrYI5jLFo0xLFqm1vZnlfC84K6MO/p75o+0r1wlx1Kohw8Vmu8+JVmvgP5cVsZemtJsrdzrHpZknaAIma80vEB4XbjF7YBURXBvURUrSYLWv3hOkAOUl7OwNL/6Co0d3mGueq7XehYVlPIQWZPulwtO0BzpdoDKXPD0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWRgMSzg; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWRgMSzg"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so584342966b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2026 05:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776687930; cv=none;
        d=google.com; s=arc-20240605;
        b=Gjz77cZGUOw4GF9fzDavrCVDUOCXwMSXYejrRKpODXSqC3tW/TCRMYifpTg552IwpV
         0ulKenCPrrkIMigLI7qyx9GbUowtOTiwX3gNJLeiya58aUPQ/3CNpJ0bhnTIF2M9WnPJ
         qhQesfOB5pPWn3c14WqNqE9cCi77GsOAD6loDOFx4Pxo4S8y5xXxH2vWvjM7mrS005b1
         oNCRkDQ6V52THk/1zd+wKfKWUwKQMcJysxdMRgZRYoqVVrw6AXv/uVR4lMAIB8ShGXu+
         X6YHbRxWd3dw8vyXIVJYSx5DoK2ZGzjmwlCjp8qxgIE+G4lShz22rT9+Yq0QM6L6z01P
         i6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        fh=ld/NLAVpxv5Fdgj3jU8NIw2/wmHxNOkcxSvmGsJUalc=;
        b=GIArQog/TQslg0XH0vuktSdAi3k27NZV3uM2LUDvO/TR386bydrUoj0QZwSQ99BDFZ
         ydiORoRHjrn19GZDW7bdFogMHT2qHuppzuow0vum5AAtFHVmNS/PeEgDvxxHBI1p63nX
         tHcj0hVBfkZJQc9L6dyMgx0FRYP16mp5xmeyM50lrtUENjSDWI52F5naBuUHBA8Zeo/k
         Wf5GnK/CrycFvrHcTRGookFcQGGNmYwn2qIN1Pggw4nn1nBpRVA2P+ctRAkP/+SS2zE+
         5mps0G7GS6M4aVUH2fbSh9OdNR1E29Xmtc+yNPFpw6Eod5q+aopBtotxJaYwJx0UHCK8
         Sfkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776687930; x=1777292730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        b=IWRgMSzgASfwTirAv+jAMpycvP51eazjjMjcb2OM8zVREW+KcqG0R5iPV5AhRsVHX9
         P8OOK9D9nFMOBxyDJl3XTuNG/+jvwzFcd3lOZZJuQlZdJH7zlD9omavQVFLm6rsNuAhQ
         JFTCs52WOhFqolVQW5cHRHX9fa6KskFQVAPML0V8HH8zqs2zETAlgswj6ga2UtpaZdev
         yLQeOOH7a1tnikplGxS9jA160pRc2my7eBChV6mJsY47PzDlzD9DC7IcSPmzMozre5eJ
         E0qIxoo9QYTub7xXC99gLe+kNmLLlPC8zSOvHZDJRgiwdcIizBd5D+6do11pItvN+Rja
         Bvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776687930; x=1777292730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        b=pjgadEgpMnV6DQiiwxW34Fl+C04MMVupRRO8ayrEy1ysZB6yKoDTuUpmegyW1cFovB
         1SvGTSY7OV22/DQYT5WuFfmmGVTYSmA/nFDjlv3clm9/WAzvNFyfiOY5cm92vQ+IqIGv
         EARC1aEMWFjSOFc+RLrouIoW1ZxQsp8TjtOd/6+/u0/C978aLLnmCWGus9TVEmdjKSD8
         z+pfZp4IiuJM92HNpvUXGz0MqyHhpynnaH1n3AofbRva97xsGN7Msm0pMOVICZApcPaD
         vllsEOvyLL44n7HXPY9+EQSRru7zzwptjZKSmMl8ggpDnXyMhcfWE8wAWOroXv4gqyDb
         b7Wg==
X-Forwarded-Encrypted: i=1; AFNElJ+Hh0jwct6WR0CiceaFZwutf3/BcYH8uu33bODTgFmGimSiwVeg/9kqZcuiBkFCh/DlegWqqefQkPQdGQOThJkl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw5rtHFwpW8uOZNn8tm+IbRNKRt0Omc0M8XUx8U8mHr3CzBqrb
	ZCtdtCA5qrxu+xzyn2CvJiixWFdIyHVWaFC7IrGYuqToA4DLumFm266tUeYnnk41jkmsdVtksDv
	z30Ify4JeobggtYfY+IsUD/y6wrtqenY=
X-Gm-Gg: AeBDies5zs8p5Wkw629Ke5VpQd0M/Jwbg6gthAs2q5l6dFmB9X2zePUvBsNK1k9Erop
	Ce0O6QyS1Vm6rnLtqrNOUga9P9rXo3RPu7JFVgi/rAnCSLB4MxZIFVIYY1QU6U9CTFjX/i2eUVR
	ehlcSBBBB4iHscw4gCoAWzVKUdWe5tiYHXWe6Gi2Za8tKvEOA+AjtIm0DL9wwZt/0qu6kRDXOXx
	3aS6deGin5M0c9IC70dXlluRMheH1HQs+X2tQq2kVECWhT8gjJFs2oNUHrg+6pl7F9p4vaCQFk8
	QY8CWYeWC5cBwc9aYZD5TiD/gEZfcDMaatDNLNonEU52s7ESKUBz1183aOE3JwlkxOeh0iUlXxG
	L7K7ua8wIEJTiT+qLfRsdUnlQW6jaK0A=
X-Received: by 2002:a17:907:c30f:b0:b9c:bc70:e928 with SMTP id
 a640c23a62f3a-ba41a91d717mr643541666b.25.1776687929243; Mon, 20 Apr 2026
 05:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com> <20260415-imx943-rproc-v3-2-9fa7528db8ca@nxp.com>
In-Reply-To: <20260415-imx943-rproc-v3-2-9fa7528db8ca@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Apr 2026 15:28:27 +0300
X-Gm-Features: AQROBzB0Pu-szzo1dJ4AB7xUuHS3a3UgZozivXv7bKFQ8_vmaUhxl3EQBT9jCiY
Message-ID: <CAEnQRZC1vtN9nsbR6zBD++VkBVcVxxOBmPfEToeg2FimmkNMFQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] remoteproc: imx_rproc: Program non-zero SM CPU/LMM
 reset vector
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 10:49=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Cortex-M[7,33] processors use a fixed reset vector table format:
>
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
>
> In ELF images, the corresponding layout is:
>
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
>
> Reset_Handler:  --> ELF entry point address
>         ...
>
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
>
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
>
>   ELF entry point:     0x0ffc211d
>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
>
> Current driver always programs the reset vector as 0. But i.MX94 CM33S's
> default reset base is 0x0ffc0000, so the correct reset vector must be
> passed to the SM API; otherwise the M33 Sync core cannot boot successfull=
y.
>
> rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
> hardware reset vector address. Fix the issue by deriving the hardware res=
et
> vector locally using a SoC-specific mask:
>
>   reset_vector =3D rproc->bootaddr & reset_vector_mask
>
> The ELF entry point semantics remain unchanged. The masking is applied on=
ly
> at the point where the SM reset vector is programmed.
>
> Add reset_vector_mask =3D GENMASK_U32(31, 16) to the i.MX95 M7 configurat=
ion
> so the hardware reset vector is derived correctly. Without this mask, the
> SM reset vector would be programmed with an unaligned ELF entry point and
> the M7 core would fail to boot.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
