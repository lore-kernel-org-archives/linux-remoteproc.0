Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A202DBF45
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 10:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753439909; cv=none; b=jXfNhcFavvoBq4D/P7a/OA04aFMU6fB20RIipA3YhNzNukcInjjzrZ3XuC8oIVNsZ88xKa3nAev/mUTYENKklMKAoezkkYsJ5pWW9lZ7XV/L3LbRcsDdHKyviF388fISxkV4ekKaZww37WA5sB69sQnf1QTuA8r5M3CfZT9wP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753439909; c=relaxed/simple;
	bh=neLJ2LNFLvS6lJPQrIgKwy7onPWVY8g22J6pC1uMoyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWMD4/BZKC90s73+GPrO0/CLNF1O7G17/s5Th1mR2PP4g2ytyOmYT6NrDJX0T4vWtUtvlJCw5BBX1txA4u+xgXP5Z3//KE8/OoCdRLJSLpFAHoUjeqSVvOGn0313JfBcKn5Zmb4EQ6KwINJjylOxMhV8lirG6ba16tDXy3XDUzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y9gZChAK; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y9gZChAK"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e2b5ffb932so586588137.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753439906; x=1754044706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrirJd8VRiPqD9MKXgOuUU8KSWZo2kqc4pWOmW9YaxM=;
        b=Y9gZChAKgCfbb4SyGLew6n3ZwMUe338vCtq5uRtozPGRlj8nbVyysyDwxtA4cTYWO/
         4+7+L3qaOXpUu04fGy95/Eu4AF6fJSWCLnY8sjeDhLByFkmkz2uDh8XhlEzVSMgumGql
         clDVvzJgWRoB9CK8WPpXZn4oR9Qd3NPYo1zk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753439906; x=1754044706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrirJd8VRiPqD9MKXgOuUU8KSWZo2kqc4pWOmW9YaxM=;
        b=ZXl8lUrAf+jMEMNU9iHHXRhS65FlU+q1vRd8ZW6arreSqzUONbp6aSPsGbkxXratYf
         +XKcPPKEcUWMor5RFCwSrpDRIuPTD+DnrUP8TJzr+7OeNUhnuoyN1RQIk5wEGzXXnScs
         yOFYjb/nw8Z1MYaa4cQ92OyLkw1uZSxZUV5jPS5z7UFutCCRO+2NF5MyMPBfuQIPJJcG
         lIu0c835xyu8bmQplHWHEyIRr4ERiP5Cv76HdKAM2z7USybmOxhvt6+B3ujCpqLhextO
         QBiK3ES+DXWV9yTxRrgxfqrA5yAsaBzmabcG8tpUQa42fqgLzr7nw6bhyJIBFDqo9CHU
         LEFw==
X-Forwarded-Encrypted: i=1; AJvYcCXhtRs5YW6ko/+o8esRSAFChi++cylXU2/7NtOnrur1cuAL2MXd3CEcUbc6GKFLPvOVUDwXgObfbwomCUqDBqaX@vger.kernel.org
X-Gm-Message-State: AOJu0YxdeSFZYLmH7tu3EDGGLy19Dl7CTGJsSDUVzzpLaInfe0LdOlj2
	Ja7V9ibj99SZAE4JQLe8v9evyYhQUlzlHedbvrL4ydG/ntEqOJKYODBM2L5852pNz8pUgQ1aUEQ
	ILOZ2hg==
X-Gm-Gg: ASbGncvAztg2iYRKqlZjQhYSrRGoWAbIrGv2IcdxkgCYDmUPlss2qtZ6pYdMyiz3dBz
	ZBwK0C8WL4d4i9zNY/RcD7Axv0AOB09AK4wvYbVUkijmmbo4eHo0kwO+cyvq17JGHultedxPoqc
	jLOa0aOlKGtEXLBpkgUCv7i52R/buA2KKkgclIyDokhyM8/9lmaolYIg0kK+lzg5L0YZVDzgeEi
	k29whUI/w61W9PbwMmdVaQDZFSkUWzpyfDImt79xGUBkpezVF8ZVUZSPs4V2mwNCQwhDYks3AuN
	8UvAzYbLLqVORR21ZUr7nLGJb8o/M7degkxkYN0guOnYIOFOCKFkv72r0TjqsfXIWLqMz9r1soh
	0oYs4qOUgKrPDXvV2gihuJwaAWK1RvAqJW6CHaoB6RwD2pjtZUP1HSODul7snFPeMm0A4
X-Google-Smtp-Source: AGHT+IH3OfhENnhViP1bKdh1VcZtDNbfwF1npAm8ZNkz9nN0vYYVfr1Uo8Yvedm3g1rJd4yozSOztA==
X-Received: by 2002:a05:6102:2acb:b0:4e9:9659:3a5f with SMTP id ada2fe7eead31-4fa3fa8633amr264994137.10.1753439905848;
        Fri, 25 Jul 2025 03:38:25 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa2a81cf38sm671587137.10.2025.07.25.03.38.24
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:38:25 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso528442241.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 03:38:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXi1kaBZTfHkXARz1BLthG00y7QOQ+bJkhPaH3s2S6tRm5aSMe8SlzDQJr/RF6rf9u1D64DoXLdCeOIiiUSgF5v@vger.kernel.org
X-Received: by 2002:a05:6102:4189:b0:4e7:efa3:6475 with SMTP id
 ada2fe7eead31-4fa3feec1c3mr259497137.25.1753439904300; Fri, 25 Jul 2025
 03:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-30-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-30-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:37:48 +0800
X-Gmail-Original-Message-ID: <CAC=S1njj09KgrNa_3VX7VeaK3nsW+jqBZF7aEg_Umv6WLSRRDw@mail.gmail.com>
X-Gm-Features: Ac12FXxdd5uFk8-UFyXPvWwDifRa0isEQfedIYH5-7QbMGirM6GwiOfkuIBzx6U
Message-ID: <CAC=S1njj09KgrNa_3VX7VeaK3nsW+jqBZF7aEg_Umv6WLSRRDw@mail.gmail.com>
Subject: Re: [PATCH 29/38] arm64: dts: mediatek: mt8183: Fix pinctrl node names
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
>  .../mediatek/mt8183-kukui-audio-da7219.dtsi   |  4 +-
>  .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi |  2 +-
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 22 +++---
>  .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 16 ++--
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 12 +--
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 12 +--
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 78 +++++++++----------
>  7 files changed, 73 insertions(+), 73 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi =
b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> index 586eee79c73c..f69ffcb9792a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> @@ -39,8 +39,8 @@ da7219_aad {
>  };
>
>  &pio {
> -       da7219_pins: da7219_pins {
> -               pins1 {
> +       da7219_pins: da7219-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO165__FUNC_GPIO165>;
>                         input-enable;
>                         bias-pull-up;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dts=
i b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
> index 548e22c194a2..c4aedf8cbfcd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
> @@ -17,7 +17,7 @@ ts3a227e: ts3a227e@3b {
>  };
>
>  &pio {
> -       ts3a227e_pins: ts3a227e_pins {
> +       ts3a227e_pins: ts3a227e-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO157__FUNC_GPIO157>;
>                         input-enable;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 80888bd4ad82..f2afca63c75a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -395,14 +395,14 @@ &pio {
>                 "",
>                 "";
>
> -       pp1000_mipibrdg_en: pp1000-mipibrdg-en {
> +       pp1000_mipibrdg_en: pp1000-mipibrdg-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO54__FUNC_GPIO54>;
>                         output-low;
>                 };
>         };
>
> -       pp1800_mipibrdg_en: pp1800-mipibrdg-en {
> +       pp1800_mipibrdg_en: pp1800-mipibrdg-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO36__FUNC_GPIO36>;
>                         output-low;
> @@ -410,20 +410,20 @@ pins1 {
>         };
>
>         pp3300_panel_pins: pp3300-panel-pins {
> -               panel_3v3_enable: panel-3v3-enable {
> +               panel_3v3_enable: pins-panel-en {
>                         pinmux =3D <PINMUX_GPIO35__FUNC_GPIO35>;
>                         output-low;
>                 };
>         };
>
> -       ppvarp_lcd_en: ppvarp-lcd-en {
> +       ppvarp_lcd_en: ppvarp-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO66__FUNC_GPIO66>;
>                         output-low;
>                 };
>         };
>
> -       ppvarn_lcd_en: ppvarn-lcd-en {
> +       ppvarn_lcd_en: ppvarn-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO166__FUNC_GPIO166>;
>                         output-low;
> @@ -444,27 +444,27 @@ pins2 {
>         };
>
>         touchscreen_pins: touchscreen-pins {
> -               touch-int-odl {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO155__FUNC_GPIO155>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               touch-rst-l {
> +               pins-rst {
>                         pinmux =3D <PINMUX_GPIO156__FUNC_GPIO156>;
>                         output-high;
>                 };
>         };
>
>         trackpad_pins: trackpad-pins {
> -               trackpad-int {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO7__FUNC_GPIO7>;
>                         input-enable;
>                         bias-disable; /* pulled externally */
>                 };
>         };
>
> -       pp3300_mipibrdg_en: pp3300-mipibrdg-en {
> +       pp3300_mipibrdg_en: pp3300-mipibrdg-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO37__FUNC_GPIO37>;
>                         output-low;
> @@ -472,13 +472,13 @@ pins1 {
>         };
>
>         volume_button_pins: volume-button-pins {
> -               voldn-btn-odl {
> +               pins-voldn {
>                         pinmux =3D <PINMUX_GPIO6__FUNC_GPIO6>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               volup-btn-odl {
> +               pins-volup {
>                         pinmux =3D <PINMUX_GPIO5__FUNC_GPIO5>;
>                         input-enable;
>                         bias-pull-up;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index ff02f63bac29..472d4987615a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -304,35 +304,35 @@ &pio {
>                 "",
>                 "";
>
> -       ppvarp_lcd_en: ppvarp-lcd-en {
> +       ppvarp_lcd_en: ppvarp-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO66__FUNC_GPIO66>;
>                         output-low;
>                 };
>         };
>
> -       ppvarn_lcd_en: ppvarn-lcd-en {
> +       ppvarn_lcd_en: ppvarn-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO166__FUNC_GPIO166>;
>                         output-low;
>                 };
>         };
>
> -       pp1800_lcd_en: pp1800-lcd-en {
> +       pp1800_lcd_en: pp1800-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO36__FUNC_GPIO36>;
>                         output-low;
>                 };
>         };
>
> -       open_touch: open_touch {
> -               irq_pin {
> +       open_touch: opentouch-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO155__FUNC_GPIO155>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               rst_pin {
> +               pins-rst {
>                         pinmux =3D <PINMUX_GPIO156__FUNC_GPIO156>;
>
>                         /*
> @@ -349,8 +349,8 @@ rst_pin {
>                 };
>         };
>
> -       pen_eject: peneject {
> -               pen_eject {
> +       pen_eject: pen-pins {
> +               pins-eject {
>                         pinmux =3D <PINMUX_GPIO6__FUNC_GPIO6>;
>                         input-enable;
>                         /* External pull-up. */
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index da6e767b4cee..1b21e3958061 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -292,35 +292,35 @@ &pio {
>                 "",
>                 "";
>
> -       ppvarp_lcd_en: ppvarp-lcd-en {
> +       ppvarp_lcd_en: ppvarp-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO66__FUNC_GPIO66>;
>                         output-low;
>                 };
>         };
>
> -       ppvarn_lcd_en: ppvarn-lcd-en {
> +       ppvarn_lcd_en: ppvarn-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO166__FUNC_GPIO166>;
>                         output-low;
>                 };
>         };
>
> -       pp1800_lcd_en: pp1800-lcd-en {
> +       pp1800_lcd_en: pp1800-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO36__FUNC_GPIO36>;
>                         output-low;
>                 };
>         };
>
> -       touch_default: touchdefault {
> -               pin_irq {
> +       touch_default: touch-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO155__FUNC_GPIO155>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               touch_pin_reset: pin_reset {
> +               touch_pin_reset: pins-rst {
>                         pinmux =3D <PINMUX_GPIO156__FUNC_GPIO156>;
>
>                         /*
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/=
arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index 8b56b8564ed7..a85c73b43195 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -296,35 +296,35 @@ &pio {
>                 "",
>                 "";
>
> -       ppvarp_lcd_en: ppvarp-lcd-en {
> +       ppvarp_lcd_en: ppvarp-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO66__FUNC_GPIO66>;
>                         output-low;
>                 };
>         };
>
> -       ppvarn_lcd_en: ppvarn-lcd-en {
> +       ppvarn_lcd_en: ppvarn-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO166__FUNC_GPIO166>;
>                         output-low;
>                 };
>         };
>
> -       pp1800_lcd_en: pp1800-lcd-en {
> +       pp1800_lcd_en: pp1800-lcd-en-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO36__FUNC_GPIO36>;
>                         output-low;
>                 };
>         };
>
> -       open_touch: open_touch {
> -               irq_pin {
> +       open_touch: opentouch-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO155__FUNC_GPIO155>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>
> -               rst_pin {
> +               pins-rst {
>                         pinmux =3D <PINMUX_GPIO156__FUNC_GPIO156>;
>
>                         /*
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 400c61d11035..8f3a0e85b4ed 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -435,7 +435,7 @@ &mt6358_vsram_gpu_reg {
>  };
>
>  &pio {
> -       aud_pins_default: audiopins {
> +       aud_pins_default: audio-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO97__FUNC_I2S2_MCK>,
>                                 <PINMUX_GPIO98__FUNC_I2S2_BCK>,
> @@ -457,7 +457,7 @@ pins-bus {
>                 };
>         };
>
> -       aud_pins_tdm_out_on: audiotdmouton {
> +       aud_pins_tdm_out_on: audio-tdmout-on-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO169__FUNC_TDM_BCK_2ND>,
>                                 <PINMUX_GPIO170__FUNC_TDM_LRCK_2ND>,
> @@ -469,7 +469,7 @@ pins-bus {
>                 };
>         };
>
> -       aud_pins_tdm_out_off: audiotdmoutoff {
> +       aud_pins_tdm_out_off: audio-tdmout-off-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO169__FUNC_GPIO169>,
>                                 <PINMUX_GPIO170__FUNC_GPIO170>,
> @@ -490,22 +490,22 @@ pins-bt-en {
>                 };
>         };
>
> -       ec_ap_int_odl: ec-ap-int-odl {
> -               pins1 {
> +       ec_ap_int_odl: ec-ap-int-odl-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO151__FUNC_GPIO151>;
>                         input-enable;
>                         bias-pull-up;
>                 };
>         };
>
> -       h1_int_od_l: h1-int-od-l {
> -               pins1 {
> +       h1_int_od_l: h1-int-od-l-pins {
> +               pins-intn {
>                         pinmux =3D <PINMUX_GPIO153__FUNC_GPIO153>;
>                         input-enable;
>                 };
>         };
>
> -       i2c0_pins: i2c0 {
> +       i2c0_pins: i2c0-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO82__FUNC_SDA0>,
>                                  <PINMUX_GPIO83__FUNC_SCL0>;
> @@ -513,7 +513,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c1_pins: i2c1 {
> +       i2c1_pins: i2c1-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO81__FUNC_SDA1>,
>                                  <PINMUX_GPIO84__FUNC_SCL1>;
> @@ -521,7 +521,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c2_pins: i2c2 {
> +       i2c2_pins: i2c2-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO103__FUNC_SCL2>,
>                                  <PINMUX_GPIO104__FUNC_SDA2>;
> @@ -529,7 +529,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c3_pins: i2c3 {
> +       i2c3_pins: i2c3-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO50__FUNC_SCL3>,
>                                  <PINMUX_GPIO51__FUNC_SDA3>;
> @@ -537,7 +537,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c4_pins: i2c4 {
> +       i2c4_pins: i2c4-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO105__FUNC_SCL4>,
>                                  <PINMUX_GPIO106__FUNC_SDA4>;
> @@ -545,7 +545,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c5_pins: i2c5 {
> +       i2c5_pins: i2c5-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO48__FUNC_SCL5>,
>                                  <PINMUX_GPIO49__FUNC_SDA5>;
> @@ -553,7 +553,7 @@ pins-bus {
>                 };
>         };
>
> -       i2c6_pins: i2c6 {
> +       i2c6_pins: i2c6-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO11__FUNC_SCL6>,
>                                  <PINMUX_GPIO12__FUNC_SDA6>;
> @@ -561,7 +561,7 @@ pins-bus {
>                 };
>         };
>
> -       mmc0_pins_default: mmc0-pins-default {
> +       mmc0_pins_default: mmc0-default-pins {
>                 pins-cmd-dat {
>                         pinmux =3D <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,
>                                  <PINMUX_GPIO128__FUNC_MSDC0_DAT1>,
> @@ -625,7 +625,7 @@ pins-rst {
>                 };
>         };
>
> -       mmc1_pins_default: mmc1-pins-default {
> +       mmc1_pins_default: mmc1-default-pins {
>                 pins-cmd-dat {
>                         pinmux =3D <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
>                                  <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
> @@ -643,7 +643,7 @@ pins-clk {
>                 };
>         };
>
> -       mmc1_pins_uhs: mmc1-pins-uhs {
> +       mmc1_pins_uhs: mmc1-uhs-pins {
>                 pins-cmd-dat {
>                         pinmux =3D <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
>                                  <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
> @@ -663,15 +663,15 @@ pins-clk {
>                 };
>         };
>
> -       panel_pins_default: panel-pins-default {
> -               panel-reset {
> +       panel_pins_default: panel-pins {
> +               pins-panel-reset {
>                         pinmux =3D <PINMUX_GPIO45__FUNC_GPIO45>;
>                         output-low;
>                         bias-pull-up;
>                 };
>         };
>
> -       pwm0_pin_default: pwm0-pin-default {
> +       pwm0_pin_default: pwm0-pins {
>                 pins1 {
>                         pinmux =3D <PINMUX_GPIO176__FUNC_GPIO176>;
>                         output-high;
> @@ -682,15 +682,15 @@ pins2 {
>                 };
>         };
>
> -       scp_pins: scp {
> +       scp_pins: scp-pins {
>                 pins-scp-uart {
>                         pinmux =3D <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
>                                  <PINMUX_GPIO112__FUNC_TP_UTXD1_AO>;
>                 };
>         };
>
> -       spi0_pins: spi0 {
> -               pins-spi {
> +       spi0_pins: spi0-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO85__FUNC_SPI0_MI>,
>                                  <PINMUX_GPIO86__FUNC_GPIO86>,
>                                  <PINMUX_GPIO87__FUNC_SPI0_MO>,
> @@ -699,8 +699,8 @@ pins-spi {
>                 };
>         };
>
> -       spi1_pins: spi1 {
> -               pins-spi {
> +       spi1_pins: spi1-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO161__FUNC_SPI1_A_MI>,
>                                  <PINMUX_GPIO162__FUNC_SPI1_A_CSB>,
>                                  <PINMUX_GPIO163__FUNC_SPI1_A_MO>,
> @@ -709,21 +709,21 @@ pins-spi {
>                 };
>         };
>
> -       spi2_pins: spi2 {
> -               pins-spi {
> +       spi2_pins: spi2-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO0__FUNC_SPI2_CSB>,
>                                  <PINMUX_GPIO1__FUNC_SPI2_MO>,
>                                  <PINMUX_GPIO2__FUNC_SPI2_CLK>;
>                         bias-disable;
>                 };
> -               pins-spi-mi {
> +               pins-miso {
>                         pinmux =3D <PINMUX_GPIO94__FUNC_SPI2_MI>;
>                         mediatek,pull-down-adv =3D <00>;
>                 };
>         };
>
> -       spi3_pins: spi3 {
> -               pins-spi {
> +       spi3_pins: spi3-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO21__FUNC_SPI3_MI>,
>                                  <PINMUX_GPIO22__FUNC_SPI3_CSB>,
>                                  <PINMUX_GPIO23__FUNC_SPI3_MO>,
> @@ -732,8 +732,8 @@ pins-spi {
>                 };
>         };
>
> -       spi4_pins: spi4 {
> -               pins-spi {
> +       spi4_pins: spi4-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO17__FUNC_SPI4_MI>,
>                                  <PINMUX_GPIO18__FUNC_SPI4_CSB>,
>                                  <PINMUX_GPIO19__FUNC_SPI4_MO>,
> @@ -742,8 +742,8 @@ pins-spi {
>                 };
>         };
>
> -       spi5_pins: spi5 {
> -               pins-spi {
> +       spi5_pins: spi5-pins {
> +               pins-bus {
>                         pinmux =3D <PINMUX_GPIO13__FUNC_SPI5_MI>,
>                                  <PINMUX_GPIO14__FUNC_SPI5_CSB>,
>                                  <PINMUX_GPIO15__FUNC_SPI5_MO>,
> @@ -752,7 +752,7 @@ pins-spi {
>                 };
>         };
>
> -       uart0_pins_default: uart0-pins-default {
> +       uart0_pins_default: uart0-pins {
>                 pins-rx {
>                         pinmux =3D <PINMUX_GPIO95__FUNC_URXD0>;
>                         input-enable;
> @@ -763,7 +763,7 @@ pins-tx {
>                 };
>         };
>
> -       uart1_pins_default: uart1-pins-default {
> +       uart1_pins_default: uart1-pins {
>                 pins-rx {
>                         pinmux =3D <PINMUX_GPIO121__FUNC_URXD1>;
>                         input-enable;
> @@ -781,7 +781,7 @@ pins-cts {
>                 };
>         };
>
> -       uart1_pins_sleep: uart1-pins-sleep {
> +       uart1_pins_sleep: uart1-sleep-pins {
>                 pins-rx {
>                         pinmux =3D <PINMUX_GPIO121__FUNC_GPIO121>;
>                         input-enable;
> @@ -799,14 +799,14 @@ pins-cts {
>                 };
>         };
>
> -       wifi_pins_pwrseq: wifi-pins-pwrseq {
> +       wifi_pins_pwrseq: wifi-pwr-pins {
>                 pins-wifi-enable {
>                         pinmux =3D <PINMUX_GPIO119__FUNC_GPIO119>;
>                         output-low;
>                 };
>         };
>
> -       wifi_pins_wakeup: wifi-pins-wakeup {
> +       wifi_pins_wakeup: wifi-wake-pins {
>                 pins-wifi-wakeup {
>                         pinmux =3D <PINMUX_GPIO113__FUNC_GPIO113>;
>                         input-enable;
> --
> 2.50.1
>
>
