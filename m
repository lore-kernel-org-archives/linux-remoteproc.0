Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793683206;
	b=06M3L8X1cL/7RHv3/bhH947l9U+Wi+bRXVRqx8hV5oxAGEOGANCfmQOP+2WExh1dvYwx
	 Zh8PTdA6GcLZZtVa6WwSDVNigo0gXUzAWUoBrl/2SVekXpEugKyiyUOotQrhXLPSED4l1
	 umXE2YaegMqaKTvQZq2cp3hXzppF6rK2FLR5UvtazH57k+GD9DS0delIyCnvdFhfR/mxH
	 2+SDt8ztc/qAdgkhx1gdONPn7m5pCawX0CDoPOmngpGZ6IoLKgt5aD+BqGAEeFWiYqz6n
	 /8ZUMnKSncX8BS8wrTZL69J0obFNVSJBhvuOgS27XScJ0srx2WIAmOk/szybtmz920w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
	b=0n3hhn6MHSYpRF9lw1lWgS0vYsZbp1DzH2WQg1rQu1tnC6wErfpWmQGJeG0uzJNEjBTY
	 t4FjtQLw2SeOViO4ocJiM2+utej4M6bco4RTjhy934DwkHaPrcSJyJl6PZDddxuE1tMEv
	 L1qi5Egz3DV8nPcS9dE/5OukAns530g2uTQOHx70sOQWh/fYZCNuiwskQ/S4jHAZtezTj
	 GYh0A9aKrSc0G5SiV1uMf3FrNVoKEMyhqyDiaZupMdj78libry8K0k0TWUoaS+0NvXfMM
	 OxHLbfWwL7SNaPhXFpXRUIekJglgvQLCe0Gq5+NQ3bOkiLmOQ/8JXnSbsBY/DGHkHVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3IzuS6K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8445B606A324
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Nov 2026 05:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8445B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3IzuS6K
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c45551fa84eso546765466b.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2026 21:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793683205; cv=none;
        d=google.com; s=arc-20260327;
        b=TSzJIkM4WLFA7VqF2hJk2sFuNwKrZk4OMHlCK3RQjRUD5QIGp//UvjkvIU30+hjqkb
         mmZd5VidS7quyyk2aflKVp2/mu2UNe/fla8Z0RWIPqr75O1WWCUMXe+0KeyMeLaHnOrQ
         OPHSUUuKDzBJ0z4nBEBz7DeRb+R+ALtO4Ph36pK4eQu8u8n6vyGuk5wbMUn4psXncy9l
         3FZegCvJaLZZRwtY7SoEG89X/s8gnpJsdzzUMRa4JV6K0KpK5dGfPLkTzuTiGSOGd//q
         CsFY6YrI1qEJUkbfTAZAzkS40j3ToGWLfnFgTCq11KFZV4W2I8/zfN8ECpBEfjsFaz45
         Uifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        fh=qoVRZ4QAKfXoI+0jz8a5XO95hzU8q2gbfFZj66wjcxA=;
        b=aWqWsYUmx2boZQhhM2ATnnUXfYWqtjsiW9e8+lg5dZbvFHAx29LvydgYSjgqKJUWD2
         YquO/SHiPiqn5sthuWAxY4wDOuiYoY0T6iknrItGRMON97SA9mCCV/pCl1PBTCJxzmn0
         Jtu4T3u3JPFajVWtU8nI/itKsRZ2pJehIL038m1fWxx7ysxx1hK8PS7KNK8hB7gToMn1
         TsRlV3D4uvdAqe3eEW01AMaCXgcSE8hQeIii8IlDjC8HNFmnfrRTqNOzaYbUax/ESiBP
         TddqTjSnug9UcB71BPr2P43izmeARgjOfxd8UxnFO0z0nh2P+ppMc9H/S4zjTgycgcku
         yLzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793683205; x=1794288005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=M3IzuS6KCu7o7iNdl6VPiSqbL231YdHzMgGAGeXFG8t6cpxlvypNiaYepyn4x2q7lW
         8kz4Bd0tu+pUrZibEHgqYesViY87g9GQqCSLj9th/snQ896c3FaJUifwQaSeDR7Pa8xI
         1aI6T/YUi2gSYRbgsFpqRl6qZWUmyXcRe/ewVN7NymUF+2Ecv5CfCjPxXr9nzYCuJyr5
         Mu9rOsv9QNU0vog1DRT+tsGJQWJTZ0aeutV9xLpYyJTgV6H80RBA7V3WgEtmtlIJadgF
         zyOvk8b3soep59A6arPrSJn5O0RxtLkPGfHbgH3i97i586HN2pdDJ9ZuhsQF9DGPzUTG
         FePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683205; x=1794288005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=zYedMBqC2ShKnY4zFniBSqckXubAYu530B0ZIZLNobN1AU4q4O97QTOb6A8/P1qOlA
         sU7zLa/KZ04zZTvfE8cogAtLmL9B2PSUxXo+S66XS/BEr854dzOgGB/e70CitsV6KmnQ
         rJqC4qHTUxD8CuY98mU+yhID1wgbj2l/t48vF58wiOvXebnz7JJGJNtuEajG5k2X8ctm
         vaJKsMk8ZmOHeaKhzNM4Xxh8bbYFDWMCgdlOvKhTcSqLEkgrqbj0RdM9JPuMz9PVMBO6
         /FYInvfP72Aj16u4w3u4Ub4u/EtrpnBbzFFuvFk68w9TsUAM+OfbQI4G2BRt7T8bennh
         SwcQ==
X-Forwarded-Encrypted: i=1; AKwUvByW4Prv/ckQoSDZW3bDqRgGbI1akte18L+liqN9v8O+66llyNOnaD1Ixrf47QJXUam2IGABBFi8HrzhYFPAUaWR@vger.kernel.org
X-Gm-Message-State: APuU4Z92au5B/QMleX63PU1rOJey0oE3TcSLuOQG6EmDuBKXC/tnzPaM
	InAdpXnVVvNnWY2dJ5BdgOnPhiFVf3OuQk35/mbMCltBFHH3hUhKDWt1vNT4/bVH2VcQhjzli0B
	4bPUxD/q5IVdP6O4nXuQYScGI3Y5JFA4=
X-Gm-Gg: AYBFou3/sU+cmlHf+CGoUFYBgtU4abwpRMDaRX+QDHTVgGbqoJiyoCgUl3YsnEjg8GL
	ZF+RFpdydTB0o4FDiWaG4iORXf/1frJ+MChY6YDWZERK7YyKXp/EQyBQkG6NjYWx6jl2rBlmXoC
	DgIdCa8uFHvQGWMsWRPuyhUU1nfXobGnPYclbtcwemrwqEbLmkL3lmpzIWHMtOQKP38WoSg5I8c
	Bm2sBlELhRY39wNpnDDHlSAwkHLzHXRFc1eczgzQsEKHos5pp4ao5Ajtp0gMAbec4QcktvLEGdV
	01BTVldffnvjesFOKYZ/NAGhcPhgRpui8eGHE1H3GvAhlFiZ1CKIRSsws0g9L8nzeOLTNJoEcRu
	IoyBRou4C8htbmmFHz4r7w77bQy93IOU9kovxSknzhkBtxdTe9MYw7UnX2o4=
X-Received: by 2002:a17:907:1b27:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c4ca7ac00e2mr960824566b.48.1793683204767; Mon, 02 Nov 2026
 21:20:04 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
 <20261029073257.84594-2-shengjiu.wang@oss.nxp.com> <20261102-tough-brawny-rooster-a3d3cd@quoll>
In-Reply-To: <20261102-tough-brawny-rooster-a3d3cd@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 3 Nov 2026 13:19:37 +0800
X-Gm-Features: AclHuK9QcK19DBzWKX6U7B2jdmB2traqMfPAukSvaMhLFGEyPx_6lzhivdpXnb0
Message-ID: <CAA+D8AP+=qDya3JDPTn0WYTG6xvoc=ORqkTF5FNWvArgd3DB6A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Oct 29, 2026 at 03:32:54PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HIFI4 DSP provides an additional debug reset control that can be
> > used by the debug interface.  This patch adds the `dbgreset` entry to
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94
>
> > the `reset-names` property and expands the `resets` array to allow up t=
o
> > three entries (runstall, softreset, dbgreset) by setting `maxItems: 3`.
>
> No need to repeat the diff. And if explaining more, say something
> useful.
>
Thanks for the comments,  I will update the commit message in the next vers=
ion.

Best regards
Shengjiu Wang
