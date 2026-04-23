Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F7F3EE1D6
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Apr 2026 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948807; cv=pass; b=PzVPig3HYXXsIngebafY2MAzOFwlXaVoXW0+dlFvuTAPGHoIDxw6VnIVs0JWZMgmGJXt/0lhfvXvHlpZBEoQcdgPWO4Qt6t77Q7GtTHaAeB3iHpxUYj1RKVQqyxkN3FYYctBO7dKKlB6t0tlYfZ8rCeuoL7W3IiYOZK+Eu1EXB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948807; c=relaxed/simple;
	bh=F2lKZ/qSN6SIkBL+rAQMZomA6ldD6Jeu1f52cfpnYWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqzNgN+oE88kgkL4eqti+2d7TXg/eyGk2xvUzKpF2G7zAK1QkdwZnN1ieHt7VinAQTxgjkzQpRKlvAn3I61ItwMav3DkUgDC30Ig/9vkbJdRKnOthZXfv6Cp81kGRcccUbnc+mDVOV0VLF9AwSahUYpR9MbhQXjRvTCfpQMdz6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASlwJzSH; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASlwJzSH"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so96215766b.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Apr 2026 05:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776948804; cv=none;
        d=google.com; s=arc-20240605;
        b=f/hboggl7qYxnbMm9tIospDuHlgx19TVy8FWoYS25MbmYkQYbHJsFJABnprNhaVks1
         XZUE5NY7E/Y9v43DqBztWUxigOVYH/PN3U6NCVLuhpHwi6GhXQ/6Sghd4HA6E+8J9+d0
         VJsFFB0j1aHlhc9+o3evAk9cqNr3jR/Kfwsn8vIjkUbO9FC8QdQJhbOoOCWPl/0xK1Ox
         jmxiE2KlXNRmt4V6TRU0ddVzuggkgthpRs1RZ0SzjswpA7uk9E9l1hovk6JW6waq9JQA
         fl1Fg+dZvgHwm2xHSTqeMTbHKAnpc7Crjrt183HySUzPrIIYE1m6WcERoTq1w7DY6tPX
         g35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        fh=GA1700mQkjnOC3SpYjw4tnLShNqHyOPIMmNVoxMEssY=;
        b=kybYt1RnTci9GzA6IjsWoxHMNGL1Kto2zJ9r613Oh1GPcthWWZoZo2YJuOjAUFyqk3
         EGmWRudyJJLh/qFMHZrwjuQdJd4uqrJ/b5kK7ukxr/iOHmB1eydpDBbg8Lwj7kQya3SR
         VPoGp9mCGxulZMyHqMLyUVI0toT6EpsiVkw6pqgjkxCx1B/ucIgMprr6A7MvQkCnBGEc
         C7k0SWYSR0LxrvOTrtSBYdqcgTUjvlbnpa4LAlumCMHODkK2Y3hVDuBKtG7snLnikEYE
         BfpxIIHVQn9SmfDA2eg462fCHI/wWlgHNvqIPvLFbaX53JLvi8Qqk9kgOT0RoXoISite
         UX/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776948804; x=1777553604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=ASlwJzSHC/dQrb0JYRidEzn1VtTETAsTnh0iRtLd5k5wb9woApgz46P06CcHDf5Ez+
         LlO2V5NOvzbQQU9l/rI+J+Uhzu+YVcrLL7sXK6XkrCYxHBwik8lxghOGKWiIcxYumIhj
         Ham25yjBX3AM/yWsUwy80m+8LmXBITSsLHNo78d4ProoFFuCcpOmLjNPVrgjnoxqkRkT
         stx5pNZNofbYStKGhey2MCvb/djxYOXkDaB387SvBv/o4W+2N9xy77zb1qb9O3AdPd7a
         jnqbs9WELZxQOcdzHtnUcmJ9T0opZRDg3a+fX0e6jVspkPHbU8Z1Zz6OMfYzJbEQxRVR
         k4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948804; x=1777553604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=W28Crrcka0ZH8dVzWt9eJ9JlC3BF7uxC4YRi6fqjgZBnhLqbe8EcJIlAV5e5y2/NbI
         cV/g3xAP5tP5rAgsLxli4F1MgCW/pSfaWmGRdql9q9Y9/CPKhhSJ5AUz4T9xhJgceNqB
         i9hXIV4lj0HGmLaqFp7gfEIlq96eRMMjCljLRARSA5lk7LtHHXSckxkXZGE6ww0+xxHV
         5DPkA+4NaDiN0sJBe+bRlwI4PnMClu0U1swknVEV7D7yOhj7zntDEQaI+QX2LLGT7sVM
         GMH5muV8a6tOqbD7O0x131DG2ssGa34AnMa8p+LZVqcdYTVR1qAohkrj9bzWFMtT+GKD
         JNbw==
X-Forwarded-Encrypted: i=1; AFNElJ+a47vZ5WbWCidie3bpQOzqwofhoeWyYu4TxsythKCgyLC3OTzdgjErNtcks7uWONCci6MG5Y1aitW8csZiEucE@vger.kernel.org
X-Gm-Message-State: AOJu0YymqhvQBIHD/AkEMSnepm7NAFOo/V5HiSmkp93yYc2q5h0MTK0N
	BanzTFh25RrMKvwQFt0+6SZqBt37qmg2YErskl9ZiSyoNnAkwtuxg+lRKrX2BD7tmOn+fYHWnhZ
	i3WUV5KN8oNfOHbHo17FTHDLJy3JA2OuXJ/oQWaJY2Q==
X-Gm-Gg: AeBDiet/Oi3N6zv5RRWMzGt++EdeaXuBZ3uBkBW57f/jcNUwDCs0sIy6s8ZUtI73rOm
	yQZD9Mzd/Fdz6XYNo9fpIaXMgwRZQtsTdYE6O7ThFtR5X+L06cnthx1EjIKWbnDBASQ1Z1uKzzh
	2Xe0nq+KeuozEl5MzQTnYsoAws/KfOf1XovQo6lp9GjOfCuUhJbf4W3VB0nutV0vQnxndpJhg/+
	KD81QLACJ9w511lJqfNShRxFJQUEem8R30M2ZByv9tB9QbccMqBuaLjuWE1BW0jQZCGZxefacVs
	ThrAgSI70rgw825BS0Afo9jPhu8KU1ifgKLODnQcUNhxRqQB5QjR
X-Received: by 2002:a17:907:72c5:b0:ba5:bef2:2aa9 with SMTP id
 a640c23a62f3a-ba5bef2333fmr1133294666b.35.1776948803573; Thu, 23 Apr 2026
 05:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
In-Reply-To: <20260422212849.1240591-1-shenwei.wang@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 23 Apr 2026 06:53:12 -0600
X-Gm-Features: AQROBzBDIr-bn4DX0ExOJm0nVY72516bKXS1r-ubIMnAcS6p_qKbuXjU_FLZ6Pw
Message-ID: <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"

Once again Andrew Lunn was left out.

On Wed, 22 Apr 2026 at 15:29, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v13:
>  - drop the support for legacy NXP firmware.
>  - remove the fixed_up hooks from the rpmsg gpio driver.
>  - code cleanup.
>
> Changes in v12:
>  - Fixed the "underline" warning reported by Randy.
>
> Changes in v11:
>  - Expand RPMSG for the first time per Shuah's review comment.
>
> Changes in v10:
>  - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
>  - Add a kernel CONFIG for fixed up handlers and only enable it on
>    i.MX products.
>  - Fixed bugs reported by kernel test robot.
>
> Changes in v9:
>  - Reuse the gpio-virtio design for command and IRQ type definitions.
>  - Remove msg_id, version, and vendor fields from the generic protocol.
>  - Add fixed-up handlers to support legacy firmware.
>
> Changes in v8:
>  - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
>    by the kernel test robot.
>  - Move the .rst patch before the .yaml patch.
>  - Handle the "ngpios" DT property based on Andrew's feedback.
>
> Changes in v7:
>  - Reworked the driver to use the rpmsg_driver framework instead of
>    platform_driver, based on feedback from Bjorn and Arnaud.
>  - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
>    Rob and Arnaud.
>  - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.
>
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
>
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
>
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
>
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
>
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
>
> Shenwei Wang (4):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 266 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 573 ++++++++++++++++++
>  8 files changed, 991 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
