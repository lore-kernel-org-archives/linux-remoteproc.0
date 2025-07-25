Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05E1F0E26
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 11:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443957; cv=none; b=Zjp5rX7Rii9zMlauDzNkYG/IOCiu1D2hQMUjyA/aD6/kp6kwvKcuhdGXTAORxfooUru3Z6O0eemDD0XAYxGOHo6IeaFujvCVIFEtC/+tAcgY6Hi9N7ttnnNh0c3NHXlOT6SxDThUksTBddr4El95VSI7fYa7kdJ0sHpq4qO0f7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443957; c=relaxed/simple;
	bh=DZf8o481vjpJ7QSUoolpwJajFBT1Vwo8xHyfUgSq//c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5ZO9lY18xi957u1IY3XWAvk9T4PyMoo6z+6Y+Uugn3OsOUQwOU3GzSg6Q9fkRvdntAVpaUvnRWhNWAo96gHxgZcuTKxzutsTFCM99uMUcXYwTLPM0aSNfGcgcuNEK8A2m9BHWd4YhFMfi4R8GWGR6GQ8jccSzWfrAlsGol5rCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dDoiNNEP; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dDoiNNEP"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e62a1cbf81so286558585a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753443954; x=1754048754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=dDoiNNEPAC6awiJ8PLVxRr1tMGIjZ2HRVDfNorrtIAS5SKKNLb6bwq2Srr5TTFEjr7
         IWD/rPe6t//3pVGsC/vVakdpDCWKqtY3m2mKZVOWEgoMJ/t1R4e+i35JmED4q8etHePb
         PYLvlEcFZRkiCpKAY5XZLSHkf0YUxSLkLNpQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443954; x=1754048754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlkE41QL6s4x1GqYESsGC6jimQ+2xKl71+VqMJsnR/Q=;
        b=NRaJSRLkmbx2FBp4AyXNF/5a/DMj4FF+98a5xmt3SDKj7jAIO9W4Ys9uPs0KyRir7M
         L80A0OgQFVZRjt2amWv9wzWjmCj1PjDxmQlN9BORpomYTxYtfzZYu5N2wC8sDM8alHot
         4IT+qyftz35Nw7bxSrGghZ6I2e7MD44FiFnVCW/+2pPyJrMUBnFu9bMsfLe1eGoTROIJ
         j/5yBJwqvQ15t+/BHsp32tsNhzijZSzwsQ3cKrw2ikNT75eZyouosRJ6nrQpCnSLRJvm
         Jgl1xECEf5jK1wxzPLIXOyx4yJa4OWavKg+W+yVwJ+DgVuHRUOGkhTq/nJ/LUJBuceSd
         T+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUmukP5C93Bzo8uQezXOVbLdDesRnUKpfdw0ULaTaF1M2koeDpk0zx4dnkXHaBmCo738QtgXtUROlWMNle23/7n@vger.kernel.org
X-Gm-Message-State: AOJu0YxnbvDnSENQPCeBP3cM2HK5VldaumdWYUZSs1g+hnV0ZS7/tJiX
	PvNgKATZPuOHyGW5dHTSsqmQxgk+ji95OxMMf1kw45CRiYe8bNSR3a7PXvAMD5fiJwRmifwTZqV
	ts5Irog==
X-Gm-Gg: ASbGnctpYxESXHjbEQ4LJwPebptt3/peqd8QDKBF9+1fPyKOQJE352oK3SDPUZ35Ab7
	OZ+MHj9atIkkO9m5Zk44Sm7QqyhQf2TUrYX/guEzAHx24F3X578omS6Fcm1UFHSqpy2c3l2Ocb0
	SnwTy/mG2+uZDrI1qni5bB/XM+1MWQKOGH8uiQYZg3NXRR0+XiT4bmC2auLlKPM7gSCtYEbs4qL
	LP5idZJVlpMplYaSOwERrnj1Nk8wE+1h3u+yLpouFbTH7DlMwH+1WxXMB8kE+H/v0Q1FGyFrEkQ
	eNFS7mZmZwDr960Kl357KmnrI61mIMlrPZjDdI5iRT5qghm5b8FUKzrDNuA5GLlOMQtrSpuZzIy
	HF+ofPxozYFBpH9Xbk4RYad8kXjDwUsBNP/q5ctmk1XILIAJ4v6lakGyQreK+8t3GbrIa
X-Google-Smtp-Source: AGHT+IH3/0l7zMxxhCdLVUdZS5tsmpzyX1gq22pKwN8LwDsxwNqmW2TIV9q+FHYYyBpnnFYxW56Nlg==
X-Received: by 2002:a05:620a:a81b:b0:7e6:31f3:eabc with SMTP id af79cd13be357-7e63bf53dbemr158210885a.5.1753443953799;
        Fri, 25 Jul 2025 04:45:53 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632e1b822sm243299285a.63.2025.07.25.04.45.53
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:45:53 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-707204de185so6138306d6.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:45:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyi1YXb4Aoq3uYhM7/14Vn8SST5UalV9Y4wDJUAMnyF2E5ySsHby+9SS/59sBh8rtAIOX9oBP6XVdl5FjK+aRZ@vger.kernel.org
X-Received: by 2002:a05:6102:4a8f:b0:4e9:a2bd:b456 with SMTP id
 ada2fe7eead31-4fa3feb1976mr334393137.12.1753439957846; Fri, 25 Jul 2025
 03:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:38:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
X-Gm-Features: Ac12FXzORC58mPF_B982fHDjnhtiL_-5O2nAq5PI4bkUJDNwvq8vw0VlaVEnRW8
Message-ID: <CAC=S1njc7_+EhDA_HrVsPfhYsrFEmeb5TQ55X+YOKE=NrpoCaA@mail.gmail.com>
Subject: Re: [PATCH 38/38] arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible
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

On Thu, Jul 24, 2025 at 5:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This devicetree contained only the SoC compatible but lacked the
> machine specific one: add a "mediatek,mt8516-pumpkin" compatible
> to the list to fix dtbs_check warnings.
>
> Fixes: 9983822c8cf9 ("arm64: dts: mediatek: add pumpkin board dts")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts b/arch/arm64=
/boot/dts/mediatek/mt8516-pumpkin.dts
> index cce642c53812..3d3db33a64dc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dts
> @@ -11,7 +11,7 @@
>
>  / {
>         model =3D "Pumpkin MT8516";
> -       compatible =3D "mediatek,mt8516";
> +       compatible =3D "mediatek,mt8516-pumpkin", "mediatek,mt8516";
>
>         memory@40000000 {
>                 device_type =3D "memory";
> --
> 2.50.1
>
>
