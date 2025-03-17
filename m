Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A9517A30F;
	Mon, 17 Mar 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227085; cv=none; b=LAtVdVFj3CDCReVE45Wy2InKo+IiDlsXK/Sl8YDGE4YZ4FCdAq/sLK9bejuElT4meNpo5KSmR5j+QNactNIwZthvtjb7y4ngngnwwE78MEloO8glHV5LqRUik/f9ISiVRy5qv5bs4T+fHIys7/LwiJbcH19fWmw7PNt9xJXTc3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227085; c=relaxed/simple;
	bh=yMKzmgdAa1GrfN1P1367oG58K7sJ1GR+/2GwB7WGKUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYsPbjofdtxpjzh1kjY1fqXayKBBvHh2b2dwbLZo3SLxxVEwmttFqES8RI5ZD71kiKDdyPi9c9tt4JCOJSX50WbyFyYl3O0TkMC4+hQHrWsqdZ6AZ2OKi77H7c7ifTkXMaKg3X0dvT5eaqhSu183uASAVn+9MFgcrnT/swG9Vts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMTFTTf7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMTFTTf7"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224019ad9edso35539345ad.1;
        Mon, 17 Mar 2025 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742227083; x=1742831883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06QGEsbiDHTPlITpRCkSEygiFBtZganqjlJySZAtEPM=;
        b=SMTFTTf723AxXy4OSnMzTmpSgvMaXDGzYPg/1GVw/WNHcyjPGc373IXAAnmnqmM2FI
         XwRBMM1VT+/mF3NJJAJgwpFj9iaUPJZ9tMqzV4SDZG9OPd4F6EatvKBEJpMi1YY1+sNf
         M9Fykb0eveZdjggZ9IyGvTxRUO/YyVKpJVx8pQzN1ZBpfQzIDZVdlifEXiMlVPjoCMVG
         tXcj+iSnXfPCfjAmrNMrcOQ4iSzrQk6s+9lSJ3bH0xIGeK8zN3bnP+AD7MUdEdzu9eLX
         25fCr4wbZPBmgwUZozhaSF1xK2vBADLMSm4khNKAq9vaqrkDaU36x/VoCd6uR5bichte
         fArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227083; x=1742831883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06QGEsbiDHTPlITpRCkSEygiFBtZganqjlJySZAtEPM=;
        b=hSgzOS4Ob5Qsh5HLrKtrLplmztmXzXaS94w1GZQ/e2Nv0Lhy06rUKsl/BCjYDxh8Jf
         tQmiMZCoKUVuZFU8AUMwFryb8lZXVgt7fqxWibf8aBchOR3z6CeXD4q+Yi6H9gn+w58z
         pcx0H3b4vKFYMXsr4MaLdFz4v/dyRFF9KSPBScSFgy8L+fGtTZFTx8g4Vz7y22CUO1o5
         zsSlqots35qtDqnZEMBP54CUKDMu9UAS2LIitfQFDCUWzOZkwbvi/hf/+UGtFt3pYQ6/
         bUHNQeEAzHzyfTTbZOplPzJ2/VNX0Kxj2idHb04WWzbpoTb6AQLndCJSTOCjHrK215qi
         vAFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6yolh3/ky9VItXc8ggMgQTEKOXsIPQECdGUOR2dbQ/pLR9dvJ4qF40U/eeH6ldwnF4swHAI0aAuB@vger.kernel.org, AJvYcCWWMLJtMXm8gI9M/XaopvGQX5akCCPBcPi8hxq/q19smihIDWedTL6W3aYwNCO2aMbPMbGvEJQNoK3+6NK/@vger.kernel.org, AJvYcCXRpVjg4tWC1CdhmV9iGBUDl1DhLVife+XEHDT4yIBCDgxfQnlNJLP+DIH0ygrqfLM/lOhpopQzEFIXP5Op4muPlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLG0cSuCdCMH9sylCwGFk5HGTsjE7jvm48zpUKGzz1tdrf1j/w
	hMrRiR1KvJXTBITCyXv3UhJArycQYUztOcxyySTImDVIjIpyvXvl2ZtiN+zpu4JFRULA6/IsZhv
	eXHf3RZovybzOEepGY8bbW3Pip2A=
X-Gm-Gg: ASbGnctDIuEd6zeN1s/BCTc4X6REfLebFGb4DIBmHS++9U+1jfKenZScAM0Az9LyG5b
	HwQD2XJpNGAxV8NEtnaGTDGCCJ8m+cXwZitX8gI7NO7Cqr6vRjx1OPrBifPwNWGD0guEI87Mqi3
	nWU3dC5IGxMrXcA/TQK5G1jWkT5vU=
X-Google-Smtp-Source: AGHT+IG3Ayo9k0yRtjHNBCfqhmNJz3asFcvcSqQ3hdNGSq7kkzqBge1sZkHTYixEYa/8f6gTrblik9jUofUotL/jY/U=
X-Received: by 2002:a17:90b:17c5:b0:2fe:b735:87da with SMTP id
 98e67ed59e1d1-3019e7a3ce7mr409937a91.0.1742227082981; Mon, 17 Mar 2025
 08:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317133306.2003909-1-daniel.baluta@nxp.com>
 <20250317133306.2003909-3-daniel.baluta@nxp.com> <5873285.DvuYhMxLoT@steina-w>
In-Reply-To: <5873285.DvuYhMxLoT@steina-w>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 17 Mar 2025 17:58:07 +0200
X-Gm-Features: AQ5f1JrRqDM8p6JEGxBqM22DUaeaV1igcAM-i6by99ARfroWOHqb4YOLD6MREdU
Message-ID: <CAEnQRZCsCYbQU8uxpFeyLmji65VRoO0rckRcoyc3frd2_B_KqQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] arm64: dts: imx8mp: Add mu2 root clock
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: shawnguo@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, krzk+dt@kernel.org, 
	conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, frank.li@nxp.com, 
	aisheng.dong@nxp.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, 
	iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 5:30=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Montag, 17. M=C3=A4rz 2025, 14:33:03 CET schrieb Daniel Baluta:
> > Enable MU2 node and add mu2 root clock.
> > MU2 is used to communicate with DSP core.
> >
> > Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 3b725fe442d0..5b443fbeded8 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1253,7 +1253,7 @@ mu2: mailbox@30e60000 {
> >                               reg =3D <0x30e60000 0x10000>;
> >                               interrupts =3D <GIC_SPI 136 IRQ_TYPE_LEVE=
L_HIGH>;
> >                               #mbox-cells =3D <2>;
> > -                             status =3D "disabled";
>
> There is no need to enable MU2 if the DSP is disabled by default, no?

True, I can enable it only when needed. Will fix in next version.
