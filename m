Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC24499B8
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785517893; cv=pass; b=VKFqhF8gemQVo2gb4nbBOf6aOwubUN8iB1E4TLEaop1/ErPIPqskx70aX0MHSmyyALNEJLiMVyRmByp3ytkRYDpu596ox4uWDcPkHQtyl9EUYyvnOhz1kjvl2bF7YM62w+5QCglsjboDJ9Aof6W7l0aH3MN8j9AqLyGzEmp+0Tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785517893; c=relaxed/simple;
	bh=Uhh8q41hmOlByjiX1nPXF362Jh+d49ZbfzvIl+Q5Sug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRNAWbWzRMkmf4I4y7qEfjae+g0AstFnWEa6HlmLPtt+yR8XyKa1btNb2GejesWWwBXnuWcxY9XJJ4DFQ6o3Bl3yqFafsVwH4EDeo91Z38IAAI+rSnnE9IoNNsLn6Tw3dG0fA8NsLH/dT5WXTG5o9MkLUj8mWUGRe16upObwlYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Exy5EQ16; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Exy5EQ16"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso2164643a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 10:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785517890; cv=none;
        d=google.com; s=arc-20260327;
        b=UyqfM9LZafvCCuMs6X0qjUYVSrL2FYiUq+ZfUqR43Gt+0AVRX1TCShVjjND3zbYa+w
         n3YQ0l1KukJ8DaFZ6Th33PEzj2daoZGXeST0dswBSJwQSsOhwMfAeWP8Zl9SzTo4/HRj
         UZQrn0EsG89uwCaKpMUh/5aDPl9UbKp0NOXoaKr/vYNG5WA4QmQ94F03zfZTnONzlOxq
         l0CUmFHU3EXZ3wbI04CEvKyW59WekJjJf2J72yaaTiUuVjiEvfTHir1VhW+6hOLx1Qmx
         pEvlzE1Vkw1TDY19JzyUaeHqgwBQC80hJlZxiw5VDbLfXYsR9FT6becIKwUIRTVNYg4e
         y7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        fh=HFqKxqb+ty2IHNL/5mtGcMNpO0nAPeXlifSDshoTi2I=;
        b=pOLxdZWLmigLWF+hduBNK6MoYkwmzEeZqJHMVMC36tDyEPhKmzvWax5NYC8Ek+dxZm
         2rGPSN4m+6DEipVxI7Np/WIP5ce2/mWlxxjH1GeVJGTqkedBQ1q5yyK4qNG1/W2/V8y3
         5YVLS1TNoIIS5GJyZpunRmNwA97fDu4o6jg2vVyJjDVvnyn8NqfIqYDW8HsUMCOJ0RiM
         IN47E6WWtd4Z0GEzuQhip0Kia7sa2Pg4gDJJWVw3e7qpEDF+rwk8J3DkAlXQ/sZqT95l
         EgJ4VmljzC/k/h3rwQulRbyt/LuddoAnn22ShzxbsRmLgEv2N2YOW8GAqqRInaKoknGB
         F09g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785517890; x=1786122690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=Exy5EQ162dvgPIB46DJfZCIj898OhNHYTDXIQagaTUngdPry8jW88hSxi6aVeP31S7
         YzgozmElj0AURbi6rlolpsPiLByD3Dd4Ii6jY6wqjM621Fqqa0b22PEBuASgo8mAw4De
         q9L3mNgaXd9xOA1YKaScbjzyuSCFbwu3UiiXTk2ghLdVxl1k256wj9vTvGHuymhzwrX5
         N1QWFADLLAUwVNfVysAJrQvM98upHj4eMDVgmRkgOseJP/GEExxCmGqFNrQL6nBDdWuh
         5q9mOh7bcYV0Wbl5Q5V2ykhADYOUtuUfmzcCHvOZ5sPgDDKDntg7uK7b27OmDy1F3uAo
         XHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517890; x=1786122690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=I/2U1wkxqM5rdp4yS8v8yTSLxcUqicNTv9oO9j11yIiJgZM0X/bzDDodYjk58llPs6
         DSBl+g6b1iXZ/V9stIXvscEFvY/KkkSwksX2NwAizuJeTa1D1iq4njLImyTKqprw+IJ2
         10ySgGvDrn0A575Gu4cPdS60g4cHP+YDzuoFHcY6/iqz7K8SQYmB0gd96EVh07Gl3I8+
         yNzHKSdhoHfUSeEyKj4ahfRqNNwqptZ++kSVbcfznm9xkoZTiQuu6fYD5wsbawv2PoxV
         n/zm17a5AdvuvP+mPYOnAw9GrgQ1zmmfyvnf23qLr2tZxCCq96JaxPndSlxD5p+T+avi
         SwGg==
X-Forwarded-Encrypted: i=1; AHgh+RrzqrboYnrjG9KjGBffp8ysSyvkE3NWlojwh6CTJKMzld5h5s73obl6qRdvahk7qeiQNIWXmFX+CiIaXRJ6tYpv@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBs0oZAy7p2x8+oyfSIBucXvUAeItF7cJNVaC6f4ztZo9gojb
	1O7G3iNcRXhZ306loY7ZkteoafdSDI79JGr4HlkWVP267wC8HpEGOGZM7uHb3qBT9eH7g6RJTgu
	7MgcGZhpnBDqVPq6hrtFpa57suA/cHAmXokZ0xSGVJA==
X-Gm-Gg: AR+sD107ahL6EVMVHBP0kkO8g418SmA5m4mZD0qOoVsXbpXgZlOtdYinApeFzWeIXxf
	AU3GaXYpKTA5t59fPaVXUyVfICnouXbkEDyrx5zhm06jgLnRXyRqcwsidR2EVhM+H+DasrH+euZ
	weVbOp5DGCmqIvGCoybmWDEXCbP3Tvk8DH3v3O4llgT81fuz4SjDtuuAIxwaI4g3o6zjGtR54gD
	9qvwNWzOfwdXveTeT5w+NxmdfictIeTAkgqGfSbd6uLCaa1+SaL0Ni9TWnQVFJ4j+deVfekdVAf
	/5YzsAUi9drGoXXl2SA/C/xTvarDdQoLySc1KubMcZo+uXWW4Y5L2HmSV0yYDOHYYSug7OWP05i
	7En+KiUF83zY32g==
X-Received: by 2002:a05:6402:449a:b0:697:de29:c802 with SMTP id
 4fb4d7f45d1cf-6a0a7ccb364mr275774a12.18.1785517889487; Fri, 31 Jul 2026
 10:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2026 11:11:17 -0600
X-Gm-Features: AUfX_mwyptmYyOf4p0ZyWTJXkdByXi3n4edVXueGHxTjG-w_nq_PAPMefUUmQKw
Message-ID: <CANLsYkyJ=qOz_7x8igcwkiHsJQWP8JizB4-q5QV5gv-s+e6eVA@mail.gmail.com>
Subject: Re: [PATCH v15 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I won't be able to review this patchset until the week starting August 17th=
.

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote=
:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v15:
>  - Update Kconfig description per AndrewD and Julian's feedback
>  - Enable the GPIO driver even without a DT node per AndrewD's feedback
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback
>  - Code cleanup according the new gpio-rpmsg.rst and sashiko-bot's review
>    feedback
>
> Changes in v14:
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
>  - Modify rpmsg-core to enable prefix-based matching of RPMSG device IDs.
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
> Shenwei Wang (5):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   rpmsg: core: match rpmsg device IDs by prefix
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 587 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 984 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
