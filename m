Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525E8223716
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444104; cv=none; b=kG1UjGdPvim1+TjsK4xU3Iv42blg22B/UoIKQVZHDWmXUK2z/yBL5No7TTBMKYM4RW7WRFLPcpGmCPPgoXaVxwkDvoVH0S1cINcTqjfEYoV5DdNMXPZYXb4/vE66pso74IANkr2ocG+rM24hOFR9LkN5IdjC3Z1XaGdFzbp3+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444104; c=relaxed/simple;
	bh=7Lq+L8ybIKzJFE7aCP8K4OUgb0w5TEGi1D/8HV86VOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsbcXEmdQMrV747vE6PrIX/tFHV6cusSKfbXA0zIBF6v5r5xx1SGZbOCLTxX0r84s+xqt6xFgG6oa07o+SD5UowOfc6TCsKT8qF7zfNp3fRRFL0BMZQuT0PH3OaN4pMpvqLvqTlTmtdbk/3pZxzndbSzUOBk4cygR3emdfaie9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C2BkIULB; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C2BkIULB"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ab58105261so35711631cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444102; x=1754048902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=C2BkIULBaB/UoInkzN5MY4APFxdhuabKXNfPOjeEs7FY3yyjrbkxV3aSDBj32q1pH/
         3cfrNhi0iq+1gGYLizaYo4hsxD8mnKpXZ7p2p/60zZ2M9z94CuwW1l6A+c5SbBYZO5KA
         goexIRMjbx5vq0cUNNQ041vr1aE9bTZi5eZPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444102; x=1754048902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=Yy28Kv0SAJqZtZTbnwtEjif7PbwjFylEXJS10K8ibxFN4c7MEVODiylBzmSQe7mGWe
         50FZTV8R49l4vMVsg4+hAC7pTtOfOunGlGDwDfMECKZwMOOJARKXG+w/KQfXPiNd6ZnA
         k4zP95ssns0v4ueE/pjx4NW9nAuUOwx5vBg9Y2uVagcDlhY2BtpFN8hs9vZx7X4pNQqZ
         OHobttQ/op/2t9Myv3OIDrE+nBD/pQIK8Q1eGeaHIWp9wY1zp15dlYaYoVe5wJeJhaDd
         cAPGFGHBs3UqNflYLxDnHq4W44cRpKuGq0Vtt+nUN/Nd5AtdhZHUAVek+f6glb7C1vwX
         2MZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0eCJxpfxmOCAv4andXzFtYTL3O0ON/nu6AtjTkqMxt2zziajNvcLC8uMA8Iiu+cLaeRukfAcv9jBnqkISQzPb@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxDifD5EnPdTCPOVArWZHwLnBa4aWOtA44ZpiydHQ1GiHzFup
	x1BHuty1DpSTFe4Ups+iqVoOdSVu2uj4iJChipBSuEOG/I+uwJgSg+7ensVTxbR30c/HBpxKylN
	zX7dMsA==
X-Gm-Gg: ASbGncvXO6mIKO5p5HNIe4XwGXAlycE730VB48rnkE4nyqfoygZoX0rlnsfcy3tNhzW
	XceReLPxFrJU+QMOmsUqHgKryhqL4zQyaiKntKoOw+9dhnX7po6r/cCxkMeB34SI5+HuUKxKHdi
	n7hWQI0fOOS8Atbp+icsxip6GA7eOfheZz6TGtk7GOZQ2hC8I4xJl+dI1eQsvOU4ngYm/O50v1b
	+Jj971BaZBxje8gTX/i43ugi6Yl2nCzhkzfLdpoEy7ISl4Gyqi60ndhbc835kh4/hw6v0ROEm8s
	vxoH9tEviUHWam357fo0PuCo5wzsNTMBpu6Vxq6vh+KB8Jb8qnc/G6bL5H8QV3X3gdlOmUy1zmN
	D9D/Blz3sbDPHNDpknyP39DiKPseRaeP4cGM3qSoNJZpJJPeDWzIxu1I7nw==
X-Google-Smtp-Source: AGHT+IE9o7rMBvBgZXE/zkCJLHi2PLfW8KTVkCO2/Gknebfa3uVadW0QjofnyVKs9aE72WbBBNK6IA==
X-Received: by 2002:a05:622a:388:b0:4a9:cd88:2ce5 with SMTP id d75a77b69052e-4ae8f13c782mr20509271cf.43.1753444101945;
        Fri, 25 Jul 2025 04:48:21 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae7e355017sm22784771cf.27.2025.07.25.04.48.21
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:48:21 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-7072628404dso1983296d6.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXahY3uqTcmkaJkb6rhqmKxYepYjbEdiy9ZpTNkVMuSmFt6M2j1UYm5AvtASb4CaRvtTkJorrAaJt6K7WHRRg3a@vger.kernel.org
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr316348137.17.1753440787376; Fri, 25 Jul 2025
 03:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:52:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
X-Gm-Features: Ac12FXzhNEGCOc6TL2wVpoG5kEXhC599YdNWu941VvXlO0dL7_W9Jc4if8EyMHA
Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
Subject: Re: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek,infracfg
 to iommu node
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
> The "M4U" IOMMU requires a handle to the infracfg to switch to
> the 4gb/pae addressing mode: add it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6795.dtsi
> index e5e269a660b1..38f65aad2802 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -427,6 +427,7 @@ iommu: iommu@10205000 {
>                         clocks =3D <&infracfg CLK_INFRA_M4U>;
>                         clock-names =3D "bclk";
>                         interrupts =3D <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
> +                       mediatek,infracfg =3D <&infracfg>;
>                         mediatek,larbs =3D <&larb0 &larb1 &larb2 &larb3>;
>                         power-domains =3D <&spm MT6795_POWER_DOMAIN_MM>;
>                         #iommu-cells =3D <1>;
> --
> 2.50.1
>
>
