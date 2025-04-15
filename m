Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C72405F2;
	Tue, 15 Apr 2025 07:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702729; cv=none; b=l/m+N7hZ2TymF9BIVkvxpJHGwFaV3UrPDEKpYnZumyTMasqv7pvLE7cIHsmn+ycl+kWrqV25yCod6RGyWMu3hyLOKek3KsiRBJ61W5kFZp2OQuVQsJs5hQCELvfuuVcQCUGR3wvIK6thJ6sR5TKgvpF6AmN062AERnXRCerLv1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702729; c=relaxed/simple;
	bh=jEhRmyM7xjK7MwkhrtbB2WCd9TBaFxjOFcI9QJeE3qQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXkhXqTwMJ3RJB89Zagfs+H+onbF6DC2OXT1VvdhZiObGImDEFOFHhSrAIZtt3Jb8KswB0OynkZY7zfNg6u4KQrnzx6Se123QmWhDgfe0slS+BH2xrNBpEpsdAF7bTlZxyQmBEwdUDJnGSDSlCIbK7JdYpAoVdqNMoLLdEQfer8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHFVEcDj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHFVEcDj"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-afc857702d1so4593382a12.3;
        Tue, 15 Apr 2025 00:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744702727; x=1745307527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvzVunjooJkOd76fbmWLggolhiDrqhzGzGsPDBPnwNY=;
        b=lHFVEcDjZR1YV4awp/XyHMNNsXiHjlQIQulgVO2g1LYONEDQCbfo/TemfBScX6VtY9
         1PLajpq5vcF06rcJSVqD2nB1CAPebpzkgbjAPXIFXnEM8+yCM60VsDJSiHB1Cu9WHIas
         Sgl7ngEPlj++2B9xn6EGcUOimGGm86Ye7ksJa7cI6p/JTIOySr16eJOtnoiSVgZA4FXm
         ZR3aRPdW9P7H72YZyG+fMddoNMIX3VvxuDGuyJFqwpC19GMc9TROFaSLKerH4dUllUbq
         LwVJYcsSL+D2XpTFR2jH5bpjSj2nO/YHXYumxqpKQ3yLo74jT2gfhtYUF1Z1yKgRX2cd
         joTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702727; x=1745307527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvzVunjooJkOd76fbmWLggolhiDrqhzGzGsPDBPnwNY=;
        b=h7gM78vmGLmTPy/XE+ZQ9Gdfc6hSeD9ZPNu9BpLd5raX74L+F19HeQJmC2gvLjT+mt
         RwFAxEOjwyJ34/nOJ/1XjzKdnvk6dQYnJ2MRsnP+G5zTM4/NTU4cv48OwsINTnY9xXDa
         RxFarDqGDPmkMLwZAvTNiGyROGc3dDwS6qlaNc32+dSy/wlSGvysvdzOpluylPaxwec6
         nPcvdMREszoH90xPGqUsdTvzHjYjV6UV+xA2X6oOnV+oswNWyxmM9p+lDPOkHOKCMPfo
         CerqwmDv46IcYX7g/qkT+xfo3285PdmY0TuBdJtyCKa15wuaOYwx6dC2/Y8mjBtcfpye
         AZCg==
X-Forwarded-Encrypted: i=1; AJvYcCWg/I6cpEPzt4GUYE7XfxnTS9sir//3FuwJKstdmDqGAFhSvqeUa/Fi0mSzqMpbw3+1I6zCFDDCr8yLG7Vh@vger.kernel.org, AJvYcCXZf7F3/+WJl71rmcBjo7tUfPfjo0CHDmrT+jW69F3PxLHbf/43G0pC0bjn0ikb9/HB+zbJSW9J+1ZC@vger.kernel.org, AJvYcCXer2pDcqVPhKP1Be73YidYjKVhEjZVF0GtHRlWVRcpjSTAWuWiJIUbXs53TK/7lmdl8dBuvL3rmtt6nxPBiMq+ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25pglqucyx8M5/IZC33wHarRAaZVkkxV3jbUjpJc9bfU36k/+
	MekFq6UqlVJLiZ4CWNtbTMG0x5BM6tMgtjc4CsGxkbh2XnCHRiDWx+cdx52cp7XNu+FsPmD6DPo
	13GuH7qh9g2vQM/0Umu1IIO33jDVDnNVprp77OQ==
X-Gm-Gg: ASbGncvVIR2sIMy/QwVIB4mzSxnixy4+Ty26DZWx1mA2i+1e2Ds80tfKkWNSxtIz1dD
	qyY2uE9MNwoemhtWrzfRXICI4Z2kRhiGb2OWnH3ddkwO6L8jp/eUeV7UrSXjMJs1eH3dcqQTiNm
	9zK/WEdlatCcpyypVIIw==
X-Google-Smtp-Source: AGHT+IEaQw1fMF+aLm6pFlRnZGVkYepFCANlU8kbPs9GBkc7bc76oOvq8qIgGhVqNudolyAIqZhr3iUCEwZKISUsLJM=
X-Received: by 2002:a17:90b:524f:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-3082367f7b5mr25807985a91.33.1744702727316; Tue, 15 Apr 2025
 00:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 10:40:32 +0300
X-Gm-Features: ATxdqUHIjcegsRqkaCNjdC-btbkENgkxvRanbyOKxKHVbD_D9EvsKEww42I_CYM
Message-ID: <CAEnQRZBFoZuiFJtzs0wCjrHJro3c=fWshRogNBnfGmkeyh-LtA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Configure imx8mp dsp node for rproc usage
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	frank.li@nxp.com, aisheng.dong@nxp.com, laurentiu.mihalcea@nxp.com, 
	shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, 
	mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Gentle ping.


On Thu, Mar 20, 2025 at 2:08=E2=80=AFPM Daniel Baluta <daniel.baluta@nxp.co=
m> wrote:
>
> DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
> enable various applications:
>         - rproc/rpmsg framework, used to load for example Zephyr samples
>         - Sound Open Firmware, used to enable various audio processing
>           pipelines.
>
> Current dsp node was configured with SOF in mind but it doesn't work
> well with imx8mp-evk dts. SOF controls audio IPs from firmware side
> while imx8mp-evk.dts preffers to control audio IPs from Linux side.
>
> So, configure 'dsp' node to be used with rproc scenario and later will
> add a separate dts or an overlay to configure the node for SOF.
>
> This patch series configures and enables dsp node to be used with rproc.
>
> Changes since v6:
>         - addressed Alexander Stein comments
>         - enable mu2 separately in patch 5/5
>         - put "status" always as the last in node definition
>
> Changes since v5:
>        - do not enable mu2 node by default
>        - fix dt_bindings errors
>
> Changes since v4:
> (https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precisio=
n-Tower-5810/T/)=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7
>        - after comments received on v4, we implemented the run/stall
>          bits using reset controller API (changes merged ->
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/2025031108581=
2.1296243-1-daniel.baluta@nxp.com/)
>         - drop patches related to DSP run/stall/reset via syscon
>        - picked up patch related to using run_stall via reset
>          controller API.
>
>
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Use resets property
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: Enable DSP node for remoteproc usage
>
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 14 +++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
>  2 files changed, 29 insertions(+), 7 deletions(-)
>
> --
> 2.43.0
>
