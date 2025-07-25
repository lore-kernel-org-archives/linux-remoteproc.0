Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8D8232368
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753440655; cv=none; b=L28Dp6t+2lLeDBGk/FYsZfu1jVE5JvgD292kcszr/WYYMX+2bVZRnOxlymp+9bjynP8kbI4w2mj+FcOZl0Zc8ZXizflYFKoX51ecASTdyz3bRCVCL6+4UwKDqNIbf0BtX0i0FOi6Msg6CMLv4kGY53aUEK3zvaOpAbwLspAuOnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753440655; c=relaxed/simple;
	bh=KqH01V/ZQOGZhBJpHb3zgphhQB1Sh25Ttt4gkVmURXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0OsbNpGrBr4HSKomphxWpmRgGRHzsBiIV3VH+tVtn5cWu5lTfpR7u/4JfUfXoaYEd8pqA9BPWopHesWtQEjTcEH0e7tErlhOFu/00pl2vIidxH4XfVH3DCU/zgYA3X0yVhQdeFI2BLZTILysglIDuJohNfzJotJYV4Inm/ewIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=blVMQV/P; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="blVMQV/P"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73e88bc3891so1125612a34.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 03:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753440652; x=1754045452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=blVMQV/P1dLyhrQy6WaudrByj4QcboI6TV+1s44BTDyNKPmHjQrspwcxw1yLFsTNi1
         kXTfrOay+4KAvWWCLcWzzpvSGUqjGMvibqCfMPQZ+yMvORn2XAhV/0CqEBlRoNMPcs26
         Ca7Qp9efSRiE/aW2bYY+s883bwhALW0oP9J/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753440652; x=1754045452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=Hj2ZmWduFc0wzniE7oqZYQq9Tk7V7RgiFj7z9sWuZhq8b7vhje0tXHr8dlR9PbAW3g
         AOqMI/4A+5Tti/tCA4eJim4RQmImIQR5Pjpk3okfPTCrYuuvkMqz4UxNo9gQp2ck3XdN
         sTOfCONWUTfJ+732rhAKl/m4vs5mwZhslytT+JyyPd6e1gzZOvqzwynQjsCf0S1hRBio
         1sf9f1HMFJdpW00cIl44E0OQuCihF/BHvlVa6f58E2s+tTIpnpHMS7b3nR21YjEMzEFU
         na73iLHl5AOmqN2jI2NQ9gP/MspUpAk6RtbsFSRQsjdzZa6c2o4GxU4M8VrP+Qtde8Q6
         fSOw==
X-Forwarded-Encrypted: i=1; AJvYcCVST9lhWC8u8Pr76PIzPBSLRtOGiAJXFymTWQl61dLSgXwtrqAu3h4qAnIXQRPbl9KfDhA41jLG8tQhYMgYQMqn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+/Q5ddDTwOAWxm5TInlWOaGuEhpwExbqBlS0A69zS1BvlpcAE
	ysWNGaxpWxdoFPV9PBKkhEeuJajB7fPdEZklbh4F+6IpLphlGVOl9Q1QDqxh3a6jxU/nhFp9Z29
	OpQUW1A==
X-Gm-Gg: ASbGncvPcxNjYo1bthcu+ZBMHenaWguf3pjuOQLMc6qIlITZt70kcmYEN3O1BOJLDEV
	XL0yUNPB+N8pQTNwH+8JeX2cs7Sc9B5QGMNe3deORGrFmTamuHhUxMK/sKvR7IzlkX1Cb/wu3eV
	0hUip4MCljWPt0RaBzFjIHt3Sgh/a3tyZ6Rp+16b2USjHjNtkYhhpLDFBP2p0k8rTKS6y0A37Qx
	AueKXsM0QugXnKWK3M4NG1Xi2dCKQbp0eSHtq0pSgysuOayvpQUHx2Vc3sZyeTaUMSrDUAt/Hqn
	d34mkNCYSkiFrl+JNzWUpAh6ZKVmugTUEgURNWB3DRIUuT6Wihf8xzaF/WEWqVhd7eS2eN1+ntE
	KMeE009TsXzLi2KEh89gvcNZGofFKeGkCwnB0T7P2DUGNFqjOt19IwmFWLizW5A==
X-Google-Smtp-Source: AGHT+IHyZNfXhJlx79LzWETZVWRGAnn1EeiBWclBn+MMxO99CuxDmlNHj41KFujF5WSv+Z21KoMUuA==
X-Received: by 2002:a05:6830:3150:b0:73e:9ee1:3d49 with SMTP id 46e09a7af769-7413dd4287cmr784288a34.19.1753440652101;
        Fri, 25 Jul 2025 03:50:52 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7412d31e128sm628441a34.55.2025.07.25.03.50.51
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:50:51 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-41cfa50c73dso1023602b6e.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 03:50:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbnL8ul2JkuasoXc+yht4T4T5043ubiWAvK5QnW6C+6QfZh2mdBmEjQvvdHd9OcnFQjf4Aq3UEgiWJ6y//miR4@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:4e9:b7e3:bdcd with SMTP id
 ada2fe7eead31-4fa3fad468amr285963137.12.1753440273293; Fri, 25 Jul 2025
 03:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:43:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
X-Gm-Features: Ac12FXyc7RkTIKa4HnSlf_SM-GYdwIREUn6AcAkOBKhNuekdCdvFzy29o7Ufs68
Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
Subject: Re: [PATCH 23/38] arm64: dts: mediatek: mt7986a: Fix PCI-Express
 T-PHY node address
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
> The PCIe TPHY is under the soc bus, which provides MMIO, and all
> nodes under that must use the bus, otherwise those would clearly
> be out of place.
>
> Add ranges to the PCIe tphy and assign the address to the main
> node to silence a dtbs_check warning, and fix the children to
> use the MMIO range of t-phy.
>
> Fixes: 963c3b0c47ec ("arm64: dts: mediatek: fix t-phy unit name")
> Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/=
dts/mediatek/mt7986a.dtsi
> index 559990dcd1d1..3211905b6f86 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -428,16 +428,16 @@ pcie_intc: interrupt-controller {
>                         };
>                 };
>
> -               pcie_phy: t-phy {
> +               pcie_phy: t-phy@11c00000 {
>                         compatible =3D "mediatek,mt7986-tphy",
>                                      "mediatek,generic-tphy-v2";
> -                       ranges;
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       ranges =3D <0 0 0x11c00000 0x20000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
>                         status =3D "disabled";
>
> -                       pcie_port: pcie-phy@11c00000 {
> -                               reg =3D <0 0x11c00000 0 0x20000>;
> +                       pcie_port: pcie-phy@0 {
> +                               reg =3D <0 0x20000>;
>                                 clocks =3D <&clk40m>;
>                                 clock-names =3D "ref";
>                                 #phy-cells =3D <1>;
> --
> 2.50.1
>
>
