Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD543D994
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444090; cv=none; b=NMMcW5S/Pv9cAZs7BMbWJvfY8bvLlmhw6UWJCkkmw3EWXkWCpJbEt09KxAGC6ztTLBTkF9w88ABVP+8/Mgvkp3iJ4NNAd/j6ebfUs9GU334pJzVOUaVC6kwI4edd7k+fN6h2uSZsJy4FeHfFD1VWeaf0i0xnZzfjfga0ZfEnvzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444090; c=relaxed/simple;
	bh=70cZJ5+MOSuyvoTc0hRAELy7cfRbFrHaFdQesC+yVH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNvNvMy1kijYHRXRsMG47LOJIUMnMnR1NOj75ZpmpuwSqawUd7gsn33udyB89gWFIFBhOsXmrlklSyMEY9R2FlTLFqInTWdyqYeRn3Hb/XPSjTwG2jZ8QjRRJMgailOpEA9LyCHQS7BJtE+nQXhwh8dujXZMKibPCsbh569B3gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g4qH/j4Q; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g4qH/j4Q"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2e95ab2704fso1569996fac.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444088; x=1754048888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=g4qH/j4QX7uYTbCCSA5zNQwiRLqlDPu49LX/pVzjKI65+1NG4UQAAT1IJQTZjsCoqr
         nc1+hzb9JM9jR2X/y0iqCBpLXByLHV7G4CJRpXADP8Ds5SNNTBlqqemqOU53V1Bb5xrQ
         z5dnMatNl47Y6UDvCTLUF8g0zh1gBeiz0CuBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444088; x=1754048888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
        b=hRCiE05JgV4FjnlyC9jTd8tRAgkLgs9pSpRTh1GwhzCy9df44n2yPqpaChs1gKxuRp
         BYP9qBc43XKKcbXUnAf/nYXwR+VjGIo1xASwfeK/5o9Aau9YPjRvZa5rPmKTUdjSd8/v
         SYMiMi86mgwORu7y4bhfkChABv+4nCYVPVeUoT2M5TqaOYyJCXtOFCbBGCqpRAVAiH92
         64Gdxc0GPYz6uZrxMZerr9xO1+12cevXVjfmwFkWK6tUX3cv9QMCrcFQW2+oJxkQafXc
         cwI4HLVJatXtOFxZ9/X7YBd45KqPJSjmHRZ2byszGcnESUqq2OJhossqDVQlm18a7N55
         ro9w==
X-Forwarded-Encrypted: i=1; AJvYcCXT6q92fEPlVffidurKklamAsCpRlSCydHcoLPMNulsHh3qXLlFXbKJvkru2Zysx4B/HKZ2C0wCtOMyFMHQEf6l@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo0alcmKjvMKoov9Bx8jVTQ4XLcoAqyg868XJVDVQ8dzVgKOxx
	bSTiS2dK5w1BBcR+ShGrQvxhxptiDK2WcZym5rDMH/77Ir7X/Uk+3QdGA/Y3YFADQzZQ+WYRf/5
	huqpk7A==
X-Gm-Gg: ASbGncuPdNoN/jicBLGkEZnK9JysIjtHzjJQRNah8qLOfCCoMXN5JTz6eyYMLShhKOh
	78cG5lssy+g/5jhSzV5egTUGqcC5/2UQZzeOGZ+8hut/tVEhE4zDJsFEuXjhM63IEodhme7YZD1
	sMaNvjytK+lL22MKHdENvdV47EHt0Zo2MZpE7RViuZeDtm8Y1Da7kVaVmNVrypBr5rhpv+Uc8Dz
	D14fvV9RQzZY/MJ8ZSgpORuGwyoZiyFF5E3g62EXXAang0qXmCZ13VTUf7xks6r0WZh2aBNopeM
	31uKQy6JlkLplIlpBjyPZ5B3nNBtQDVoqPRMzF3ApK42WJx0MJ78tXD3vDPAbTrrwSCOgKpH7g4
	qRZqgSpB3T4VaiUDEhBBfPZi7vl+g3TZIMShoA0r1kan+q390+uan9sgN4g==
X-Google-Smtp-Source: AGHT+IGCv/9BEhDff9c/NBaLE6xMBTAUaSk/5SnqeUff8YTmz1EH+1KeNWrn4Rn01JqxFLwZag/zAQ==
X-Received: by 2002:a05:6871:7292:b0:2e8:797b:bf23 with SMTP id 586e51a60fabf-30701f6c5c3mr867864fac.21.1753444088035;
        Fri, 25 Jul 2025 04:48:08 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7412d2eb6c4sm639509a34.43.2025.07.25.04.48.07
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:48:07 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73e810dbf5aso1179339a34.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:48:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9xC1vupWEkuSMPvh6iD9Yub+Bsk7nf4rrFEv1nWbSo+BIHVOwnc279AYmFEWNjaCsofyV7RhQa2siscYZi0qc@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:4eb:f003:a636 with SMTP id
 ada2fe7eead31-4fa3f8f1683mr313640137.0.1753440679035; Fri, 25 Jul 2025
 03:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:50:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
X-Gm-Features: Ac12FXxJVbrVgIPSlm6u4--DKBHxaHRjM_36IT45XEIgpl9bR5PM8dE-s5Wt-28
Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
Subject: Re: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The binding wants the node to be named "i2c-number", alternatively
> "i2c@address", but those are named "i2c-gpio-number" instead.
>
> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
> dtbs_check warnings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

It'd be nice to mention in v2 (if needed) that this patch also drops
redundant #address-cells and #size-cells, but it's minor.

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/a=
rch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..6d2762866a1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -64,23 +64,19 @@ wps-key {
>         };
>
>         /* i2c of the left SFP cage (wan) */
> -       i2c_sfp1: i2c-gpio-0 {
> +       i2c_sfp1: i2c-0 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         /* i2c of the right SFP cage (lan) */
> -       i2c_sfp2: i2c-gpio-1 {
> +       i2c_sfp2: i2c-1 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         leds {
> --
> 2.50.1
>
>
