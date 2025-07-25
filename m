Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE902DA776
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 10:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438697; cv=none; b=piYNuDyZmEOlhcyhEuHJigBzZ3Zi+qA2YrY3rddwSNINE4FeTE4gDQhfgPKYeDkEzs+v8hqL/8j9bOlXK8SS4nkdZ2KdDGS0A/x+018JjrH8x2z/p41ma92TEpjD7Yi2VRhGk0AgUklpKCfSpfxogHx0f+2hcindIS4D0jsxe90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438697; c=relaxed/simple;
	bh=2XXVnmKfKOuWrZjQTjDdYxCXEPvU5YjHEeLez+QHVDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pzwg1bQRXKQH6TToVVsC5Q4e/ZM3i1FjvG93OPmUtjAVAsswp/c7n16PpYxYzbAmn6VvHt5yaqUUqhRCsALHPLEMTOpAvFYYatW5rdYkQYAhmZyXphucMLvqfC+MeSSNIhAZr5Xx/EDeTP5bbvv+kbzM8gsDfp03W96jKBw3lEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mwVXwIYT; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mwVXwIYT"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53185535ed9so2084009e0c.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753438694; x=1754043494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=mwVXwIYTfSfVo8CJ1H3a68QRzCngDA76zmNtN8/yBQWboq1G84DT+G5sBf9Cbm0/pw
         oVlB4aR9yrEodIPE4z1kVMKuWat2WvdOgJKYypHNb+MrJgiKw6LDp/ZZ0mF6qvlg7i8I
         OYspRLpGiQpbBok2vqwLj4dITzRn4F1R20+Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438694; x=1754043494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9CPe4n6W7cHa+GL0hIjIVMWtvIyx6LwWGjspV/N2Ok=;
        b=VphB431aSGnz7VkgEQy5IxbEDwmJLC4PC+w2jr2vBrpB9ui6Y+uvpBao4Te9tBQifr
         kkabMy3mUgBFlA/gKzFqMmwkhQuLc+sUXZwDmjf2mu02N3uCOCUcxTLkFUrSQ68VyU8j
         7/tSA2f8lKd831rMZnZs/d4SR9zR2FlB15jIjDEsn57EY1vTfiTqqgBcuug5crnWMLKj
         GOpnm/gymQgoKg11WSyUIPmFdYY/yaVgVLi+YXidFs7NokOVOQEmxWTnxyQPHwq0GUIG
         rjEIecreyhfExtZ+BZeVu/fb4h9cdWyGPK/qNvQmFwYFOu4itvWrf71WbrCiOiI4pr/G
         RTYw==
X-Forwarded-Encrypted: i=1; AJvYcCUwZtjg7HYM0tN3EnAs4HG3uTZUCqTdqv9lM65VU8zwA9Q8fMa63mFgMPsE0JtFq1bl4bMMSk6A1IFeY3oWTZHx@vger.kernel.org
X-Gm-Message-State: AOJu0YxxMEBPjoPmtjVVcRTYmf08uyWoBVw4Dz2cnru+eSlBUSB2ni/T
	py1KFEZb9oYSozSS77oLqrKbQNi8YEy6qHqJom+ZCOvR0VcigKKendF59lVA4HYhAKL6m7gI4bW
	GVNU=
X-Gm-Gg: ASbGncsMIe4146O71OzrLUG2gwQYdxEfWlVdExiEZp8FAcPqR1oBITZXof76gJmrge7
	B8FvRrCkLwUZNYJrO3a2jJogcY5GvCZTDz0D1hP3Q9Md/sHtNglC5WKUZeHlQiF/Uck+i/Oij8D
	5dTNB1vViEycGtMSKTM9EMsDx3cG+3gaf1YFIh/ZVmKZZHAfxGi99YRKQ5OgN9G7cXcjt7Z+hR4
	ZnAyaFjZ42fmtSU9BrLMfyxzQ9vGS5vDJJlD8ZfLuAA67RBvIuT4yKOligIaWuaJJY3JK/ueevC
	dTi1hjP7BjIGA3evjCTTLB1pezP5FP+nMJeG7Jb/uUb3XRS2JbF8jqYIv5haVEEgHYixha1pLH2
	wgkcff4EqsAhBiT5srk0HTxBeTtMbY/+TSZLcVWauJ3bbX3kJVW5OELro4g==
X-Google-Smtp-Source: AGHT+IGLVA5C1Ib4tgbF96J6vyqrjCKSW7jF51iyt7GCbgWA4eee60W+o9Js0QdKj663ZVa9QhB7IA==
X-Received: by 2002:a05:6122:6c0f:b0:537:a216:6b76 with SMTP id 71dfb90a1353d-5384e163e98mr2870397e0c.0.1753438694576;
        Fri, 25 Jul 2025 03:18:14 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538d6a8ebf4sm351192e0c.26.2025.07.25.03.18.13
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:18:13 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4f2f2f22c1aso1140233137.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 03:18:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpKZRvus0NZeiYddfkW2y7a8f/lVEv7N9NhS+9xh1t1ABJrucm71PW940vS9rz+ke5XdyS1iFDp0o28ol9ZS+h@vger.kernel.org
X-Received: by 2002:a05:6102:1623:b0:4fa:dd4:6877 with SMTP id
 ada2fe7eead31-4fa2eb0ce5dmr2502816137.4.1753438693359; Fri, 25 Jul 2025
 03:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:17:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
X-Gm-Features: Ac12FXzF0-E5XCOaIf5MFeMvqjYMvWSzSdwqzh1uEwhsUpfXPcd-rqBecXNopmU
Message-ID: <CAC=S1niM4ddPSaOM9uMRQuUS8HwPw+gtxe9kGUggWQx6uio5eA@mail.gmail.com>
Subject: Re: [PATCH 30/38] arm64: dts: mediatek: pumpkin-common: Fix pinctrl
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 5:50=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm6=
4/boot/dts/mediatek/pumpkin-common.dtsi
> index a356db5fcc5f..805fb82138a8 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -198,8 +198,8 @@ &usb_phy {
>  };
>
>  &pio {
> -       gpio_keys_default: gpiodefault {
> -               pins_cmd_dat {
> +       gpio_keys_default: gpio-keys-pins {
> +               pins-cmd-dat {
>                         pinmux =3D <MT8516_PIN_42_KPCOL0__FUNC_GPIO42>,
>                                  <MT8516_PIN_43_KPCOL1__FUNC_GPIO43>;
>                         bias-pull-up;
> @@ -207,7 +207,7 @@ pins_cmd_dat {
>                 };
>         };
>
> -       i2c0_pins_a: i2c0 {
> +       i2c0_pins_a: i2c0-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_58_SDA0__FUNC_SDA0_0>,
>                                  <MT8516_PIN_59_SCL0__FUNC_SCL0_0>;
> @@ -215,7 +215,7 @@ pins1 {
>                 };
>         };
>
> -       i2c2_pins_a: i2c2 {
> +       i2c2_pins_a: i2c2-pins {
>                 pins1 {
>                         pinmux =3D <MT8516_PIN_60_SDA2__FUNC_SDA2_0>,
>                                  <MT8516_PIN_61_SCL2__FUNC_SCL2_0>;
> @@ -223,21 +223,21 @@ pins1 {
>                 };
>         };
>
> -       tca6416_pins: pinmux_tca6416_pins {
> -               gpio_mux_rst_n_pin {
> +       tca6416_pins: tca6416-pins {
> +               pins-mux-rstn {
>                         pinmux =3D <MT8516_PIN_65_UTXD1__FUNC_GPIO65>;
>                         output-high;
>                 };
>
> -               gpio_mux_int_n_pin {
> +               pins-mux-intn {
>                         pinmux =3D <MT8516_PIN_64_URXD1__FUNC_GPIO64>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>         };
>
> -       ethernet_pins_default: ethernet {
> -               pins_ethernet {
> +       ethernet_pins_default: ethernet-pins {
> +               pins-eth {
>                         pinmux =3D <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
>                                  <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
>                                  <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
> --
> 2.50.1
>
>
