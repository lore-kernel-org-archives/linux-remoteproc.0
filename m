Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6FC49BD9B
	for <linux-remoteproc@vger.kernel.org>; Thu, 24 Sep 2026 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261690; cv=pass; b=MqARGHxEhxc9FqDG+R1JlusAkSwI26CKf6STdE+qAC7Py782BEsiY7/+uZX2xNn9qwrb6M2kyEbDcHXzb7//Eu1njR8QSMf3O5hcP+jnzWYHSz8iY4eGa8S+gjLM+BofKuj92Pbk681dCSTqcnSFMxUeTmrVagaEqEhcqnwgLmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261690; c=relaxed/simple;
	bh=Dw9t/OY5XtdoJNFnVnV3phV1v1Dmx6nMPDcxT0P4VfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0ACPI/IvDDuQKKqSYhZ/NbYziM6faLqUmcvVRka49IP9xmt8JYrEsJtwvqEwO7+tubk9vsCG/WweBGXXd3eNGQZaMGwPya9Vtdj77BEQ1XAnRKgUHTH7sz2TLH9V37Bnmbvz5x7uLNeyhnZfPw1MN9NlfzLJq6W9lLrushm//s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTGu+8gO; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTGu+8gO"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso4390201a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Sep 2026 07:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790261680; cv=none;
        d=google.com; s=arc-20260327;
        b=jwnEgpxyPXLEl6rWWoZynMK2qUjXIro7qZj4qrljewgSXzsLZdZ5aOBmC+RE22Ir9r
         KaEdSdM3Q5TkMrKO/G3g9oO6v7Hjuwrdwbx+z6IouNf1geDZI5nSt19p6G14hGZLCOmx
         MGFcuNFpmJU4x9RVPejraJjvaFtVcJYDkNiOrFmU8xisqsht4+/GRIEOm5i/lWgPPxNa
         EGh6RXY0A7+1bSbOt6ZqZo00CehLkQ+M03qTRANlbQz7DkRquUTGpxx/eQvU8CFuuEHM
         uRkfqVpX2tj3iYC8XLIVVk6CBsFklqqJSMdQHy5k5fbnQb3loDUU0R2WAsiRvM2kLkPr
         hFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        fh=MjL8PAZ/q44hS/9aL/tcKTCoHtkM9SyeAs8jllkzDkM=;
        b=G4e4ZWkAb8r4snCmPJX/d1zGAoEkLWSu2M2wFdTTz9mL/mnlm7Re5t/n1McQdgjt7J
         lwDPkCs1RDMZhsrJ5TkgXZ801zcsW6HtDUnusH+IHkyWgec25SQNnuKCFstx2UkJcqRP
         4NhBs/XkX0UU9Q15YWsWRH4sFh46E3GvSy4/svmXZDu1No6+tzWX0vC/lPywI9ktsN+Y
         mTV7JCGZuEngrqgcGiB3wLGuMzj0xEAVrIF6Z1gHigMXnVWCFhDVejumYxx14xpFSZOd
         3woF8ZkM+qXcwFVckEEObw65e1ow9g5n45gnd+oWvN2nvyLU7Lpe9gdO13Hk4ITZQeql
         +20A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790261680; x=1790866480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        b=UTGu+8gO7vQzw58/FIe+B3HSMqc2LWDldCqly92KrtnUttvTtJd7kVyUOVBiXroTO1
         85M0zwNiTfKNEfWlvw2gcYUMAN2l1HAkyVrXvIAd00QagHKikxlFOOL17/EMTNIoNIap
         +p9gSsFc166FIfBE+ymd4jdQqtBJEqfBjGhxcbwyc5x6KdWaBui61hZgroGXMeVaNeKP
         x0uw6PZGHD3kdl5qPaNVoITiK14q+U3pdtzqG7nW10DGXIMFDVsBG4cz9evCtSmUI71e
         oHBopkJY2wcY1DSuw2we2+5GLKonSkXhTkVt1VV+CdN7gtltoy6nN2iguGLg8JIVc/7+
         0Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261680; x=1790866480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        b=XfO9X0GiraQBFdH9aXJELRY4SId74F38B0md5O0FWrPYFA7kTUTbJaWs147pmfDbn8
         9rWNsXcLU3WlyS1rmldmLhTTXsBRkd/2mjQIA9OIEp5OFGlRLxDI/MNCP80WmIf31032
         76Q9knJnA3TGZf/Fiu4rCTSQxM5Du3iQHAsRUToKXOEZmSbpHJKEiEgXMJaJc44jPW4q
         zxLv1VLBQFYMi4usMHZBMXV8mW7JB0zY9DHgboPDhPaK4SsWrI8k/eNEKQnAb3UD0AZr
         MeQuu84EFgBbzaWpFK2zEgrzEyCf6Ubmvl1Gp7NbBLzGHgzSpy0KnDqdwMYLmNqnHgNi
         sZ+Q==
X-Forwarded-Encrypted: i=1; AKwUvByQhTbFT7xBEOMqtb0KZpgI6KM4eV/+M5m6rGpzp+lWGSTDdTOpaP0UlzAT4uHqpn/LkZ895IOvkVpqoZeifYxq@vger.kernel.org
X-Gm-Message-State: AFuF++mYFXl44ZH3r4IndoacM1D82Ltpn55Z7Vd15SrTBMuszdF0p9aH
	PR4B6iO+Ulnb+NuPl2jqBxCaxo+tG+P+pIrMoqj7fGqv5rLjh0s/nK2VHD3TozGjz09gBQyjWWB
	knin9+RScfpi7+J7YHc+oLv5wYsMbsFg/FeQiYp2R4g==
X-Gm-Gg: AYBFou3wQvWdO6eu1vFWQ/jTOvAC/XSiR7K8LnhwIrhQCXNgpXYgt8pEIXXKMa72KeT
	4oks5+v886iBh66RsCJ4j0ojSp73q0VHI4/NiGM42H4ekXSfl7URnv/yTfgS91O0WaJHv55Gsu7
	5I4ShPZfGM7Iyp8RkHPTjTTynGK+jZhHJz8SFTAk1NWdZg5GOAAv2NQUALdKb+OkR9tj+fVwCF6
	2qVzixi1HSCwksC9PajndgvPWtQ9opBfCV08T5ER71kx9Sftk3tVDN4/5XU6N/aBPFxymlNel3e
	0Vl9Vg6wBU+Dd/m48+bBxoQ/JT/KU0cu2Ia/6S2TU3FQFc6Qmf78klzabCPNuyR7fb6yEq0LgZD
	3V17cPQ74gEgtwfQ4jnY74Czg
X-Received: by 2002:a05:6402:5110:b0:6aa:932:7b51 with SMTP id
 4fb4d7f45d1cf-6aac90c8a6amr2540369a12.28.1790261680223; Thu, 24 Sep 2026
 07:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 24 Sep 2026 08:54:29 -0600
X-Gm-Features: AclHuK8a_-TqJQY1w6hSbt62KYLX7bNKh0_jYOMr-qlDR34nbomWXG0un97vMAU
Message-ID: <CANLsYkwCE07uV1fa_R3ztmErd7pSDh5_OG=-W8N5bsuhqnJ34w@mail.gmail.com>
Subject: Re: [PATCH v16 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
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

On Wed, 23 Sept 2026 at 12:43, Shenwei Wang <shenwei.wang@oss.nxp.com> wrot=
e:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v16:
>   - Removed linux/mod_devicetable.h and an extra comma per Uwe's feedback=
.
>   - Added the "packed" attribute to struct rpmsg_gpio_response and set
>     "can_sleep =3D true", per Sashiko's review comments.
>   - Removed the channel node from the rpmsg node in dts layout.
>

I will not review any new patchset on this topic until an agreement is
reached on the DT bindings.  Rob and Krzysztof haven't replied to my
previous email, which leads me to believe they have questions or
comments from earlier versions that haven't been addressed.  I suggest
looking into that instead of spinning off new versions.


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
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  46 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  23 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 585 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 973 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
