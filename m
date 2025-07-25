Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BED14E2F2
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444273; cv=none; b=eOuoL4Vys0KXN10sPw7M1hrSgGN4USuY9HTcreL4TC8PBxpYfES1qWNTsc1ZDqYa5J3LtskshzZ3NvQ2SEZzSY8GJtRbsote7ftX5KgkzyqMPzS8zdie0bnc5I1H499T3Vp+iKeRYS8bD0sl+F5E2R3ipH+dF7I6tpzyileEZ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444273; c=relaxed/simple;
	bh=wuFFxAizy2X1aAZ/SF2x06cfnVSKnpsKMko3UN4we2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cuuRjoUvxY7F+OGmHxZs1VV6P9oz4alyhOlusUhUzy8Tq7irLSBrN0cLJzphjIwaJU0o+rlp3PnXAwRwiNgmc3z/5hg6cxE0wonJfhN34QO7kpqLHku+JR7TgW4AjcRZkUW1m9E9RMk/dJrFgQPBprcB41/ixq3rw0cV+kdi8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h0PtMwvg; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h0PtMwvg"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab5953f5dcso19649111cf.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444269; x=1754049069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaRYlYWMnL5FdToAvFBY21N9TEhebXI6JAmJStjizl0=;
        b=h0PtMwvgnei/k9UFAtjGUyDKkBjk0xsFkJNrM815mJw5N53JfHPXf0a5MoLK+Hy2U7
         RN5FzZ1fiMnEdnHgNh6DBkOlN4472q8KRN1sLuIEadjmWvSHwiDhZpX+KgnHwBFiPpAx
         r41ht+xUQkGHs7+BqO4fDXSp1vMDTebNbodKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444269; x=1754049069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaRYlYWMnL5FdToAvFBY21N9TEhebXI6JAmJStjizl0=;
        b=BCmxBtamLGnAOugOtbKufD9CbNYN1LYmj6yxPENM9iEEQTRRSdGxWGbFLjZ0CvYXU2
         VHoVGVhy2nAhiMNYxa83qaZFD8q/SI4ARJM9b/+l7A+bIXtS9lbl7oMPiy4zC2nWOqe8
         9tb0itmT98a0WJCcjQYddXT5S4V1X9KVJK/18CPRQrRYozrHHUumhtlEG1ZYMNYQb1aM
         vBvLBtFp7fMyX0js7D+5PM6aiQuxg1jn6WrgY07frnrBrv9ko1YJUXfmfy2cUZ+dHik1
         YtBJQhMiI/jTiypT9g9nViFWoBRkb1s8gPer1x6cMoijmNIjOlsBEIfWIwZD+9du2lyA
         sXhw==
X-Forwarded-Encrypted: i=1; AJvYcCWxsyTrzWXplDmMD5uuehin3qB/oG3DKD3gjGx31W2+9H0jP/fjlA8ROI8HiMkSVO0CQojdPf/68RoWzlDmZAfG@vger.kernel.org
X-Gm-Message-State: AOJu0YxpZ+mS3cKTW02NLLOWuOcjW3aqcfD4r9ONHrMpkJEcFMERhd63
	iBxP3bvOb2SI8tb/cMAoHahwDEeo1mj2jXFCisFvq4wgGm5/8G2as8T5fK3Sdb5U8NmzB7TZxxC
	U9fk=
X-Gm-Gg: ASbGnctgfYSRegFjDCVnmWAzo+i9f7XrDNptuUieBI5fFIL7Ihkw8KQBWdlU1vVLwfD
	y7Gyumjkj6yn7hqurSg3qpOZZovJgDFBatJ0jWern7jA7SmSIP4G/Gx7ZXv0XGJQaiCtLWvU4Jr
	8f8G+UNeJscvVb5Dx2CrBqfF2DlbULLi4PiHdkJ+tfahXZbLxzdeNuzKHeMTJB4C+73Wg03XhpS
	mfXvfp+FyNdA+ePqO/kSnFV5+mAwRaHQx5PDHRZpunxcJRP0WND2gmwdP8MT2zkW5cjNom7BQwx
	Tups+VMioDj2BjeZNv7mdv2EtLlt9eajuR7qbShTssVTA2Jgb/J6SOJ3Wr1XXXKjG63vpgqK7IS
	S4l7wPE50YaQeXz0dwptTnQDPXLyN95PcQ5N+gydIsa92xzTuJRslgBTN+an2gA==
X-Google-Smtp-Source: AGHT+IGb/SVd4+0B/lmPWDz1J3FUb42PvQEpr/uipq8+6SLrSJuN/EThx6MQGegSE19cgI+bb1/GKw==
X-Received: by 2002:a05:622a:1346:b0:4ab:3d2a:7f6f with SMTP id d75a77b69052e-4ae8f0b4a63mr16128081cf.33.1753444269225;
        Fri, 25 Jul 2025 04:51:09 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae7e57d4dasm22096661cf.60.2025.07.25.04.51.09
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:51:09 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab3d08dd53so18749951cf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:51:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTUPJsF8pQi9E6B8y9wPEb0YNqMRKtI5c7g8QyF1kpHWLbE0xS7YA8JIGGWuIiFjW8CM1efEfmT5iEJBBalMMy@vger.kernel.org
X-Received: by 2002:a05:6102:cce:b0:4e6:4e64:baeb with SMTP id
 ada2fe7eead31-4fa3ff55fbamr323634137.17.1753441040390; Fri, 25 Jul 2025
 03:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-18-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:56:44 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
X-Gm-Features: Ac12FXw-hSTS0fHSbHXeHNK-nhzfyTLOXfpWf3gYQQXz8LA0IhEjugCIp682sPw
Message-ID: <CAC=S1nh5bF6kZe7TFA_EGPGt8Xp_rfuc-rkeXgjRCU=QEtZQiw@mail.gmail.com>
Subject: Re: [PATCH 17/38] arm64: dts: mediatek: mt6797: Fix pinctrl node names
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

On Thu, Jul 24, 2025 at 5:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change the pinctrl node names to adhere to the binding: the main
> nodes are now named like "uart0-pins" and the children "pins-bus".
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 40 ++++++++++++------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6797.dtsi
> index 0e9d11b4585b..be401617dfd8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -135,71 +135,71 @@ pio: pinctrl@10005000 {
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>
> -               uart0_pins_a: uart0 {
> -                       pins0 {
> +               uart0_pins_a: uart0-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO234__FUNC_UTXD0>,
>                                          <MT6797_GPIO235__FUNC_URXD0>;
>                         };
>                 };
>
> -               uart1_pins_a: uart1 {
> -                       pins1 {
> +               uart1_pins_a: uart1-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO232__FUNC_URXD1>,
>                                          <MT6797_GPIO233__FUNC_UTXD1>;
>                         };
>                 };
>
> -               i2c0_pins_a: i2c0 {
> -                       pins0 {
> +               i2c0_pins_a: i2c0-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO37__FUNC_SCL0_0>,
>                                          <MT6797_GPIO38__FUNC_SDA0_0>;
>                         };
>                 };
>
> -               i2c1_pins_a: i2c1 {
> -                       pins1 {
> +               i2c1_pins_a: i2c1-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO55__FUNC_SCL1_0>,
>                                          <MT6797_GPIO56__FUNC_SDA1_0>;
>                         };
>                 };
>
> -               i2c2_pins_a: i2c2 {
> -                       pins2 {
> +               i2c2_pins_a: i2c2-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO96__FUNC_SCL2_0>,
>                                          <MT6797_GPIO95__FUNC_SDA2_0>;
>                         };
>                 };
>
> -               i2c3_pins_a: i2c3 {
> -                       pins3 {
> +               i2c3_pins_a: i2c3-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO75__FUNC_SDA3_0>,
>                                          <MT6797_GPIO74__FUNC_SCL3_0>;
>                         };
>                 };
>
> -               i2c4_pins_a: i2c4 {
> -                       pins4 {
> +               i2c4_pins_a: i2c4-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO238__FUNC_SDA4_0>,
>                                          <MT6797_GPIO239__FUNC_SCL4_0>;
>                         };
>                 };
>
> -               i2c5_pins_a: i2c5 {
> -                       pins5 {
> +               i2c5_pins_a: i2c5-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO240__FUNC_SDA5_0>,
>                                          <MT6797_GPIO241__FUNC_SCL5_0>;
>                         };
>                 };
>
> -               i2c6_pins_a: i2c6 {
> -                       pins6 {
> +               i2c6_pins_a: i2c6-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO152__FUNC_SDA6_0>,
>                                          <MT6797_GPIO151__FUNC_SCL6_0>;
>                         };
>                 };
>
> -               i2c7_pins_a: i2c7 {
> -                       pins7 {
> +               i2c7_pins_a: i2c7-pins {
> +                       pins-bus {
>                                 pinmux =3D <MT6797_GPIO154__FUNC_SDA7_0>,
>                                          <MT6797_GPIO153__FUNC_SCL7_0>;
>                         };
> --
> 2.50.1
>
>
