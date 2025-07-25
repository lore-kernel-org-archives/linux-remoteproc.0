Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E5224225
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444774; cv=none; b=D+TGk/fWQUDz/AtA8XxvGJAF53xdTKZCF1WMHbtCSuoTtsmKU/jhzPvfxQq8jXDwk//mAa0cqDd4YkX+zHykR/Lr59o2TemPfdL1KxrL3WZAcriBo3HjTE7Q584miPkUGGHwPjfJYu6GCLcWO07rnPBn1abPBJzwtWIigTUO1MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444774; c=relaxed/simple;
	bh=V8hirrUVOWBBWHrhJ7nvVXSHaacevucbhSLPMWQvrV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V5pJAGKgaImIkMsX2hwOfcgcUg2VFvEkmsRAKu0Spcw/qPFCT7tUxFGHzWVL6dHu9Qg2A3BDt69TTrIlZcBF0+ZMd5hU4PIerbre1U+UZlOWi/03AxWHZyaSMTTsaqe1GuGWA0400f1z5wGbtEeOLekzb+9sHCgGifkFoZXPbNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jks17feB; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jks17feB"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-53140c33563so1321973e0c.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444771; x=1754049571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=jks17feB4YVwQMdTk9Kf+TecwypC7zayGUDlRVrdfoyOI12hoy6sAsE9pbQ4dsDbFq
         KoCDMNR84DN8I2cBQSkSw4ZJJOaADQnO5TvUzhwHCvfbjpiuGbH9jUu773CI2/6rB4d4
         tWJeWU4YMIt1E46/zTZpUQxCQeLOd+vP2U/ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444771; x=1754049571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOvBSwwtmNG8Z+SjWPY5aek+Y4mrxHqGqroX/bR/8SM=;
        b=HxBa5aA+gBtVpqdVinoyCtDHGWZaWMhDD1Ut5NX8drT3YwlzGjFu8bZYyNyI7lWQE4
         YgSuqH89wK4vc9jzkfa86Ulr3ak3T5VbYXwPtJhU04SwWA1lcLVb/X2ohFsUyzVa77Jb
         748tvDJOD3m8j3rEzvIZeGhuWtWNkr+x2A4YbH/uHllQHdxdWhAnp3aCo+z1A8PLtFRl
         0kVFkKFO8fxi2fRI994sL1uam4gnJd2JdlSuvCnUtMY8qLDE+uJwooStwgTBMieDse30
         aPM61CISYGatykS+/Hij2ODA4/i1JgBJGjUo77PbnnYfKejdiB+cLZsG7OGYUVuwg9/F
         cd/A==
X-Forwarded-Encrypted: i=1; AJvYcCXpDidI9IivaLHQcUqXfXqeomYZ13CeYLddmITH6N9lAoMuVM+7W3ZIn2OW3wdG0YlpedLqQHXOMYnQYnc/x63e@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm6lfTIOL8HdcXpX75uV5YrDQV98+qglbdSQ6mnhZrEE6f9eXm
	tdap3+AU1XoD9wf32IDFx1+WV3T1ea0nd8o0f+92SzUM9deRir0Z1a8h5LKhxiHm3e7oPm4UvhO
	xtTE=
X-Gm-Gg: ASbGncvZnMM8nKB/eVJRmfbvnWvpR7JMJZZb5NCC+T00KbNJ55ayxRrsop4yUrR7i1p
	xZ1WNKGFkjuUYJuQQLo5a7FZ6HS3ibPnwUzvmEN+Uysze6TwLitNx9BiSBHZ4rQc3pu/gybElak
	kcH8mgdkn0lamHQATiElJjQfwPuCsTAGPxzM4eqN1mvejQthsLvVTOmLRW/B3dC8PBISHhCEyEi
	bdMDI/33KByutSu/3NWZM+od5aVuJL7TZb/ns4OhbYEOfHdWr6htx79D92N5NrnIuSkTbPaHm5U
	JBHEpDTwfk86LKOeNrcLHSieS0gy1+CrqdnNCjkiHsgCuIFPbWKmBdUT9orEu9fagtkk2Cb399L
	F30hJi1Pc5piIqD7862qyMYGGi2lZfjFxLRpGFMUVUKaXqRbeZ8pQoAQkLbRfKw==
X-Google-Smtp-Source: AGHT+IFE3duRxMmB9FUqKscGfL6p5bT7+2y3jv97MfV3/2KKfgKXPj1oS8hRlpndkfFszYEPZT2Mcw==
X-Received: by 2002:a05:6122:2525:b0:52a:79fd:34bd with SMTP id 71dfb90a1353d-538db529ff0mr440510e0c.4.1753444770837;
        Fri, 25 Jul 2025 04:59:30 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-537bf8607fdsm920908e0c.23.2025.07.25.04.59.30
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:59:30 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-53140c33563so1321957e0c.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTWUPbybhAaj8TwNSoEa5mcs9CYeHkEKo3UJ7y/CqvX5OjiYn0CU5+6YHCN1xgiM/3oaneNu/mIvHwa11uEBQT@vger.kernel.org
X-Received: by 2002:a05:6102:358c:b0:4e4:5df7:a10a with SMTP id
 ada2fe7eead31-4fa3fc6be93mr374132137.16.1753440996607; Fri, 25 Jul 2025
 03:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:55:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
X-Gm-Features: Ac12FXy6b-EYxcfTGxWYM-OfSnpWrsOFjS6YFWPk3kTV_ZIdvcSVvNebJ1JSwHk
Message-ID: <CAC=S1nhwrq60q-=jMZQ2u8TwwG9HHnQFWrFRx58VF2K6Xi16XA@mail.gmail.com>
Subject: Re: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators,
 rtc, keys node names
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
> The node names for "pmic", "regulators", "rtc", and "keys" are
> dictated by the PMIC MFD binding: change those to adhere to it.
>
> Fixes: aef783f3e0ca ("arm64: dts: mediatek: Add MT6331 PMIC devicetree")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6331.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6331.dtsi
> index d89858c73ab1..243afbffa21f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> @@ -6,12 +6,12 @@
>  #include <dt-bindings/input/input.h>
>
>  &pwrap {
> -       pmic: mt6331 {
> +       pmic: pmic {
>                 compatible =3D "mediatek,mt6331";
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> -               mt6331regulator: mt6331regulator {
> +               mt6331regulator: regulators {
>                         compatible =3D "mediatek,mt6331-regulator";
>
>                         mt6331_vdvfs11_reg: buck-vdvfs11 {
> @@ -258,7 +258,7 @@ mt6331_vrtc_reg: ldo-vrtc {
>                         };
>
>                         mt6331_vdig18_reg: ldo-vdig18 {
> -                               regulator-name =3D "dvdd18_dig";
> +                               regulator-name =3D "vdig18";
>                                 regulator-min-microvolt =3D <1800000>;
>                                 regulator-max-microvolt =3D <1800000>;
>                                 regulator-ramp-delay =3D <0>;
> @@ -266,11 +266,11 @@ mt6331_vdig18_reg: ldo-vdig18 {
>                         };
>                 };
>
> -               mt6331rtc: mt6331rtc {
> +               mt6331rtc: rtc {
>                         compatible =3D "mediatek,mt6331-rtc";
>                 };
>
> -               mt6331keys: mt6331keys {
> +               mt6331keys: keys {
>                         compatible =3D "mediatek,mt6331-keys";
>                         power {
>                                 linux,keycodes =3D <KEY_POWER>;
> --
> 2.50.1
>
>
