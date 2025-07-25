Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD3814E2F2
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444246; cv=none; b=B9LeNjoATTlymXsbgfexu648ZjsKgctzSsBLfPMAKDgvsCXL9yCX8pEDCMb3Xbu8fRErJa4weVszO3FW07Df8PbVYhu2FkzIYxCGqMS18k8H9jhjZUG6bMsb8Zns8s0KtdhcgkPgomGt2yT2VRYer7p54cbuL86J1hblqXIvnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444246; c=relaxed/simple;
	bh=AyRroNoAAfZMLYMuOWzL5KFUvjXMr31GJOyZqB2g5AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmeDoDCGlri2lWpSZbLXZgKWYfUmalyJ9c0ca1D2rKVpdCFfYsUv/bDstDtfrUvA4fnuw0qcu4QNch4jqUNsMQWWLqP4oX1FR7x6bJgYzSDkLiPv0i3gm8Ku8LVIKiJGLfbINF5ErbBnXjLLsv24OSBik2EXb3ox7C7893n9F7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C/3xN2FG; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C/3xN2FG"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31e41cfa631so2298601a91.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444243; x=1754049043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=C/3xN2FGAlTnOmxhKVRtaRPsay2jPXxhrAZp4e1I07//xcqnKgyq3icp13sxJYEMHX
         OwJtYSorSxbvBQ4MUnZllP8bphB1uudxJ8+ri5uRYXeYQn6KdmZDMDwaAHjWSUdUlsgr
         XzWHrTWz/CsXqeRE+RZmbTQD6DmUT6+Y8En3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444243; x=1754049043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t63BOHgVickClQUeVRs7VclE4TnB0fFJ8koSEGsWT2s=;
        b=WQChaEZ+2cuMkzS5SYEqIcAX8la3FasbFTTg9SrGE1hhtt2r/uvBCpwyC8Tvs2qKOL
         ksYRGSEkP8jS1iXSO5S58HutHtk0Yodn57xReE3NTQDj2nQjP/j0rYSkTzRMTRoDK+Xj
         BVnrvShhLfbnzjBpNdcju1Z54+IU+AMV9MNqD/dByJZVWzfcP4Ts+PW/VgmlM3VH0+fY
         qE1l7IkdiE6mMRHu2boeO41ed5BSj5S5FklYEP5iAE3qpkrMuqSC0CTj840OQJGE4Cg2
         RDs+fbKhAaiXZW/92YHUFkgz8FTOh6wrhFhRmWIFbzP8PHfunbiC4vpNuvwR9wA4RSDQ
         N8+A==
X-Forwarded-Encrypted: i=1; AJvYcCWsciwADFzNZ1rf0VGa4hZMFadmZTJpuwADLx3W8mEfzJ9oQz4dO8UsPH67G8YHsUun7SP/X3nf2FtHVl3Ei37B@vger.kernel.org
X-Gm-Message-State: AOJu0YyLfPPAuypFXhqGHVxc5CvV+KlCFduE3TNdlD3Qz2UJMrfcAXzz
	6LizuJ2aDaxDuhZZXPJ6fdcC65+D/TD3lLmQ3/awbMDnr1UMErF0r+BcKin1yN3Rn8jjKNQlVGx
	hUb4=
X-Gm-Gg: ASbGncshaHTYhyXS1RHuerH6pq0UQm8NrRCESHZSlxsJex5yCPOvyjK5j8L5/3dQPwY
	5s7Vc6F2mulRo6tWX91qrA/lBCir7cTa7m09KRdlbpVMuDKfT4pNe8Z8WQMzk7z1gmHWm26c0/t
	eoYlTTBRNTCmDwCYgwZ3W8mmeZFbimHG4qbQZceJ9RJTJ7WsYVxyx52vBF0e0xRLIN+Gl8XUOR1
	DHcGRDzEd0dVH7QJN9R0qNrUeor+IdzEZwZJJrd3Jk3dy7xfE2kx5S+JjegsvTgZ1xrwiSq3drn
	8fg5c0g2/Mvaq8AbXUExgf0M69/4OivjZjOnw6dx19QzGFNod3kpVU5QcPXB2rKY3MBMjhl6gli
	IlTKo3bh382Ci2WZgve8+FmeZcVRrwdL0LwNDE4jd42FbYXw8OpkF8zImXR6U0A==
X-Google-Smtp-Source: AGHT+IGcNOh7bawRPeRU0fiI+giHiCN2/SnvclaMiY7H4OSCwzTLXgQsPBdh5fa8UE8esvwN4cUOVA==
X-Received: by 2002:a17:90b:3d4e:b0:311:ff18:b83e with SMTP id 98e67ed59e1d1-31e77857876mr2619632a91.9.1753444243461;
        Fri, 25 Jul 2025 04:50:43 -0700 (PDT)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66250725sm3391627a91.2.2025.07.25.04.50.43
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:50:43 -0700 (PDT)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748e378ba4fso2611301b3a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jul 2025 04:50:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRz341/7JkVKpOpAZiLyg2Cd6/xtTKViedggRj/KSb2zI0RDRGsxMXrVhgNHAzONBqUtNU5GI3rKgSIG77by/y@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4fa3fa71860mr256656137.9.1753440125688; Fri, 25 Jul 2025
 03:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-27-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:41:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
X-Gm-Features: Ac12FXwspafB6XO0s33DaaDCIfXTapXC0TbPbPDsXvwxpmO6Wfy_iIb8kWhO-Rk
Message-ID: <CAC=S1ni_6YRK0RWheKZJDgCknaZzPsde0J4dFdmkNhY7HMMD+w@mail.gmail.com>
Subject: Re: [PATCH 26/38] arm64: dts: mediatek: acelink-ew-7886cax: Remove
 unnecessary cells in spi-nand
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
> There is no need to specify #address-cells and #size-cells in a
> node that has only one non-addressable subnode, and this is the
> case of the flash@0 node in this devicetree, as it has only one
> "partitions" subnode.
>
> Remove those to suppress an avoid_unnecessary_addr_size warning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts =
b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> index 08b3b0827436..30805a610262 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
> @@ -98,8 +98,6 @@ &spi0 {
>         flash@0 {
>                 compatible =3D "spi-nand";
>                 reg =3D <0>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <1>;
>                 spi-max-frequency =3D <52000000>;
>                 spi-rx-bus-width =3D <4>;
>                 spi-tx-bus-width =3D <4>;
> --
> 2.50.1
>
>
