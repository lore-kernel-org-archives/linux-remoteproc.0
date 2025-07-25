Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0BC8834
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443957; cv=none; b=jEkkBOKILQG335MKRDY0r6Opbc5rSu3/PZIgxjIeDfpjFk8Hg09use7MnpBGtMp+jh8cAzMWI8K2vQ2N1V1NcFyyG6sVgQ2RlWe1ZiUnf+azDEOq5PrOWUfXP+6DyTEmFo4eRmhKzR4MYUAO1SfLabD3X5jsbJ/wsObAL+0PRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443957; c=relaxed/simple;
	bh=/FWxLS8hqus1+HRqR+NgfMdxvAEHUA0sDpoYtqNCdMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZyT6ph5mvu55gf0IVMTKZDfbopQkrST+7c7Ak6pklhwuk+/141E7IHRNtRsAWalahLJU+tO2Le1PCDG0X64DZ8DrNjAS8WH1tvhcmaH5uBHmeLNuJanDgLVGxGuTgdkCSu3G4dngyl89F50MNIN63701r4JE4YH0ajHdsOKoDE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LpsuPOsn; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LpsuPOsn"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60efc773b5fso1321954eaf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443954; x=1754048754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mqK1RSBPE9C31GyE2vJbWJ8NDfAV+1bNXjXR8+rtBo=;
        b=LpsuPOsn4nqUUAT2uR6SpYA2MzOpoundiAJ7YO7Y/0ZYwCR/e1VCDdfk6ctCjxgag+
         1SXaF1bndIt0bsqvCpX5E8x42Qefb/HBGYU9oYt8MjPUGm9nDONT8UtnQtaE7QKtDKXj
         tu04GZlBb2GuT5N/rdz/pS9IkYByyTcIs7M2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443954; x=1754048754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mqK1RSBPE9C31GyE2vJbWJ8NDfAV+1bNXjXR8+rtBo=;
        b=iKiL6YKB4pcRTxfasTgi7b8jCp/VbOBKjdyhNNlH87nRR+DQNDGdWBSKjNiou/BYGY
         oZww9+GtsdUJB0DL/hH6GUQNlMya7AFE12r25ZbEcBVFkk2oJrzbPrTxi6a/uYMiNrUf
         O7NWThSRuwNuL0A0jkbgGSRNiJ1Jrfve9kijKdV7d7ILDP2Kn0ocD3DB5iJZKrVhol/j
         SPlPVhBSW3w8E2Oa8y/Iemhs6UL8UlkDBKFVvZqDs1YpAfm3y8MN7DtpH3oJ3Eb5AK8B
         rKhxE78OR/1ZLnSgzj2XzbHa6YboidgSE3yh40/xSSTnFIi/Cqk8E9JX0rMfApq7siMR
         7GnA==
X-Forwarded-Encrypted: i=1; AJvYcCURlrxjck+5E4JA3hkDjEIlD4rJFtz3DdGdkS4xMMZEywx1Qzdm/sMUbm3pQ22OLznQZ9Fop1dNvXBSDm9ylpBd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83uX1WYbZxpT4UhDHRm1JRpRtNbroAk2iLFKTkyfH53RMv6Td
	TupUKE1BWe2l5rTmdkQVer7jQNIra8cZghJS1cLKbzYYycUihdcG+JOyxRs3FazN6V2IaZbpDAs
	jbLtyyw==
X-Gm-Gg: ASbGncv+koW8QgJF+eKDP8WiQ2URSNKoSafCf22jyojqCUvE+2S1t0VVDWwRWEDuirv
	xGX8FTJVkYWmBfD1KTXZhUn08dcWo4Q6fk5Kob1SB/zmLejx35oW4M9VURWmsCXFYh5QLBy8ZtB
	r+v5ck+gKrWA5lkP2qKyIrIkyjLe1p/u08vikel3xzs2SoxZF+NhjoW9xPFdNS1DTqF7pthn3dX
	ghoboKtYr+8dkHWR4MB7c8QgZwEH+tExOSqz5FVj6p93WIpx27+KDbrW1HUaYT3VpgsqhioWpPk
	P49Jf9tZzMwr5CCUF6sqcj8hqUwF70P7ofERT6C8ck6mgwToJDKq9udvsGA/2MRQQaOEkqDCS8G
	oCDdJv2e1a97JYqCPKOOkx8AOPhftqbYxhlS0pCbjHmyMAcFJj467ss4I2w==
X-Google-Smtp-Source: AGHT+IEX5PGj92UMoSx8ozYmlcFPK+MXiCRg0p5WwriWRoV49na1gdGDxP9KEoYT7hiv0KI9PCX9zw==
X-Received: by 2002:a05:6870:f221:b0:306:9f1d:da2a with SMTP id 586e51a60fabf-30701cb9582mr1109577fac.5.1753443954244;
        Fri, 25 Jul 2025 04:45:54 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-306e1ec042esm1029034fac.23.2025.07.25.04.45.53
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:45:54 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-30008553e7eso957724fac.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:45:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmSXsCGvRjx8j+Vw8KI43p11yDdjsgXujCL+HogWT1vNLDRMBXNZ4wqDsYjrknTgqzrbJWQBaLOu1dBr0/Unlw@vger.kernel.org
X-Received: by 2002:a05:6102:5a92:b0:4eb:502c:569a with SMTP id
 ada2fe7eead31-4fa3fb3f3f9mr285813137.9.1753440864290; Fri, 25 Jul 2025
 03:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-19-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:53:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1njpbfARTSBwddCeeO+c0vvf=GVaD6+QhauJOki0NS9dTQ@mail.gmail.com>
X-Gm-Features: Ac12FXy3jzZS4uZ6X5J7uIwzpvgV1oXiUrEGuonvNPTbsP1Oacxt9m6NF-3FvZA
Message-ID: <CAC=S1njpbfARTSBwddCeeO+c0vvf=GVaD6+QhauJOki0NS9dTQ@mail.gmail.com>
Subject: Re: [PATCH 18/38] arm64: dts: mediatek: mt6797: Remove bogus id
 property in i2c nodes
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
> All of the I2C nodes in this devicetree has a bogus "id" property,
> which was probably specifying the I2C bus number.
>
> This property was never parsed and never used - and besides, it
> also gives dtbs_check warnings: remove it from all i2c nodes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6797.dtsi
> index be401617dfd8..f2d93bf6a055 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -285,7 +285,6 @@ uart3: serial@11005000 {
>         i2c0: i2c@11007000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <0>;
>                 reg =3D <0 0x11007000 0 0x1000>,
>                       <0 0x11000100 0 0x80>;
>                 interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
> @@ -301,7 +300,6 @@ i2c0: i2c@11007000 {
>         i2c1: i2c@11008000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <1>;
>                 reg =3D <0 0x11008000 0 0x1000>,
>                       <0 0x11000180 0 0x80>;
>                 interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
> @@ -317,7 +315,6 @@ i2c1: i2c@11008000 {
>         i2c8: i2c@11009000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <8>;
>                 reg =3D <0 0x11009000 0 0x1000>,
>                       <0 0x11000200 0 0x80>;
>                 interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
> @@ -334,7 +331,6 @@ i2c8: i2c@11009000 {
>         i2c9: i2c@1100d000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <9>;
>                 reg =3D <0 0x1100d000 0 0x1000>,
>                       <0 0x11000280 0 0x80>;
>                 interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
> @@ -351,7 +347,6 @@ i2c9: i2c@1100d000 {
>         i2c6: i2c@1100e000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <6>;
>                 reg =3D <0 0x1100e000 0 0x1000>,
>                       <0 0x11000500 0 0x80>;
>                 interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
> @@ -367,7 +362,6 @@ i2c6: i2c@1100e000 {
>         i2c7: i2c@11010000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <7>;
>                 reg =3D <0 0x11010000 0 0x1000>,
>                       <0 0x11000580 0 0x80>;
>                 interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_LOW>;
> @@ -383,7 +377,6 @@ i2c7: i2c@11010000 {
>         i2c4: i2c@11011000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <4>;
>                 reg =3D <0 0x11011000 0 0x1000>,
>                       <0 0x11000300 0 0x80>;
>                 interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
> @@ -399,7 +392,6 @@ i2c4: i2c@11011000 {
>         i2c2: i2c@11013000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <2>;
>                 reg =3D <0 0x11013000 0 0x1000>,
>                       <0 0x11000400 0 0x80>;
>                 interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
> @@ -416,7 +408,6 @@ i2c2: i2c@11013000 {
>         i2c3: i2c@11014000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <3>;
>                 reg =3D <0 0x11014000 0 0x1000>,
>                       <0 0x11000480 0 0x80>;
>                 interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> @@ -433,7 +424,6 @@ i2c3: i2c@11014000 {
>         i2c5: i2c@1101c000 {
>                 compatible =3D "mediatek,mt6797-i2c",
>                              "mediatek,mt6577-i2c";
> -               id =3D <5>;
>                 reg =3D <0 0x1101c000 0 0x1000>,
>                       <0 0x11000380 0 0x80>;
>                 interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
> --
> 2.50.1
>
>
