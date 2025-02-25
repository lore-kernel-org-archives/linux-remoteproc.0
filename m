Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380DE25EF8A;
	Tue, 25 Feb 2025 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490824; cv=none; b=OpUnYkcCwYfeiMST7mr0AAwwFKaNKvaF0M+qVHxYJaEWk9d0r041ueGDELbaznRj3U1JYMgKl2wSh9PBaYV1u/MpngLa7goBs1g08lG+ntsa8txhrTsw27K7w8ayxE5wV3TxaBslb4bB89k8r0BOuTbFKebs1YIIy7CCjrQk9do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490824; c=relaxed/simple;
	bh=ZHfwPlIcEqwwyokGZO5UWjLSpzt2Pib8HNJGFAPJi3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJl6hefw3ufbAB7oj5end05MdhcTy0dQENBNUUIZQen9eyOSbKbWCoh5BlIPFzSwe09hxtsdNQEUG6jSjmNrsEhteB4Ea+R+Zg0feAEiRWoZkxIY636gKzfRQkla/C/BQVdBElnmAy/p9WXrVgJbmT7Q7ae7DsJSAcVFiJG2cv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gr2KeRKs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gr2KeRKs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220c92c857aso94659335ad.0;
        Tue, 25 Feb 2025 05:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490822; x=1741095622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btIzpaiXBm39xMpzgFyr6PPx6n79OgifTZ30SVyZSrU=;
        b=gr2KeRKspfEAm9ZC9v0SaxGrUAibKYMYD4TdjYbIBtZ4h0oIBT3qLvKvbFd+FgY9KQ
         yaex0aNCSYKV2KE1NHTf/ITW5by8g0ggTY6GbBb3/V2AL6O5+v3TW04TcwRWAb8IAPzN
         fE9toXEsl6lXarLtpe2slrerEh/OXt9+MK/sIQeFpt+nqEAabmrJDSEvVofEOUVrLwTQ
         dHfMKqDh1inD+t/l1iUEH95XW+tUgEFKy9t55V2wUgJbzeewvVvHUroFY+GucgzhgxbA
         Ny/xuiY1oF4cyOH58wPIEXE3xF0GeE+ksKCkwWaoyDM/+kP6RrSx2BNvaGiuqd6l45/C
         rzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490822; x=1741095622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btIzpaiXBm39xMpzgFyr6PPx6n79OgifTZ30SVyZSrU=;
        b=Wp/RnX44uH4Er75gPQnVBIoI8fYuFhDCA2XIHg3nULbTcNPPPpt29TucIILL1jo3oS
         d8FAQ5Z6UyyW0KGGzoL+FYQKWd3vFG0ZDS0tvNHkFzkYWtQO3hK7avmFb5F8SYT7OLvs
         emexeJ9ETiHBvNgGLOFtpx15BX4SSrZfhJrSOMIAKCCEd4TNsusK5838wh62PqH/Ew0c
         7oslPzueX6hONtwXHxzC+pOL6vhVA1OW9WnZBrxk6WEIr/kv/NnDvCV40na2OS1b3T0q
         LhyXKbyITnEl9Xr3SsEaTeSDnDj53J/82LCXcUgqpn23fhAcrcgyZSIkvEbf911he3/h
         YB5A==
X-Forwarded-Encrypted: i=1; AJvYcCUktf77P8IIR+4TS6RhriIwCIMWHTDZ7aJFFtn1WWfWZtG/Q8yGnrofC+WtUIfuR6nprGYGrTSHn+G7@vger.kernel.org, AJvYcCWVoZAQtZHENVVmTRE+oJWhuGPOiiXpHEhNA4EFVUcaE/47d5SIjW3dRYt1mdynrtNSjhFIc4RsIKB/qp4sq3akNA==@vger.kernel.org, AJvYcCWtxSFP6dc+9pjWLrqjLrGFWRgRHz6Y+hJQKNX3lID8Hm0c8RPID4++wBFuL2DzdW7h7GXMQz4mcR7ySobP@vger.kernel.org
X-Gm-Message-State: AOJu0YyTUs9mBqXjn40R+9bCvJGrzlGvPqDIB6aYqr/zOMxzTykMDChD
	pVbVxSJUu4aFU4geztwQ9mEHU+oHdyi1o/QJ/UBtY3YxO9Q2UCc4PtOA4WGOD3EkdIgpa1er5Qa
	5ca6egYwiotsIzYo2VO1wJbBxLhU=
X-Gm-Gg: ASbGnct/KsFrMkHe9Vr+9Le0b/8MZ3oT4WQYQUq63ONic2eWCrnD4017fdUHDC00ufZ
	zr4CXhc7EWW2TsDNeyKmeENfWjH1VAPobFY55F1fzrZ2wpyMuCXlQ4fXzDkrWO3I3msyDdf0NKs
	kB/hPx
X-Google-Smtp-Source: AGHT+IEqvx+vLUoWU+bH7g7MTRR7upTwyq8plc/LIRpW15G1pS1TD1Y8exEPj6fQZzzsjKBHvHSHg/l/PmukuoidDeo=
X-Received: by 2002:a17:902:d4cf:b0:21f:6546:9adc with SMTP id
 d9443c01a7336-2218c3f4333mr351935475ad.13.1740490822321; Tue, 25 Feb 2025
 05:40:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
 <20250225102005.408773-3-daniel.baluta@nxp.com> <78e60d723c27b7fa0f03bc6a74f6ad37d6508734.camel@pengutronix.de>
In-Reply-To: <78e60d723c27b7fa0f03bc6a74f6ad37d6508734.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Feb 2025 15:41:58 +0200
X-Gm-Features: AWEUYZkKeH8Ee9X0dKf1ks0eIJRo2-c4LR6sVRs9-5VD4M6vPScOpUqA3j5lyUI
Message-ID: <CAEnQRZBL+r2-CRDszK54SD_8E9=1QRKRj3_YDHsM7YetKMcs_w@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	shawnguo@kernel.org, mathieu.poirier@linaro.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Philipp,

Thanks for your comments!

> The DAP core reset is mentioned in the commit message. Why is it
> missing here? After reading the discussion in [1], I'd expect both the
> stall and the (core) reset signal to be documented, something like:

There is no reset controller driver for DAP area yet. We manipulate
the bits directly by
remapping the DAP address space inside remoteproc driver.

See for example: drivers/remoteproc/imx_dsp_rproc.c

/* Reset function for DSP on i.MX8MP */
static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
{
=C2=BB       void __iomem *dap =3D ioremap_wc(IMX8M_DAP_DEBUG,
IMX8M_DAP_DEBUG_SIZE);
=C2=BB       int pwrctl;

=C2=BB       /* Put DSP into reset and stall */
=C2=BB       pwrctl =3D readl(dap + IMX8M_DAP_PWRCTL);
=C2=BB       pwrctl |=3D IMX8M_PWRCTL_CORERESET;
=C2=BB       writel(pwrctl, dap + IMX8M_DAP_PWRCTL);


If we agree that this is the right way to go, the next step would be
to create a new reset
controller driver for DAP area.

I want to keep this as a follow up patch in order to not compilate
this patch series even more.

<snip>

> >        memory-region =3D <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> >                        <&dsp_vdev0vring1>, <&dsp_reserved>;
> > -      fsl,dsp-ctrl =3D <&audio_blk_ctrl>;
>
> Is there nothing else in this range that will have to be controlled by
> the DSP driver in the future, such as the IMPWIRE register or the
> XOCDMODE[OCDHALTONRESET] bit?

We are internally running SOF for couple of years now and we didn't
need any of these bits.
