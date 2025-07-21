Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573A19924D;
	Mon, 21 Jul 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753088902; cv=none; b=g2dUhH1PsknSfs/X3dnBwJ31wVAQzh/JP/pxrKyOQdBvccVHjNIYv2DD5TjJqTI3tty1Uo3E6hBje9NkFYyTFT87r5pg55n0NJ5hagpsxdtVg0FFb1iFpyedrV1f+vCivvQ/G5tWO54inaGkjvl8DuOSRb4l6DFqF4UvAV+3wlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753088902; c=relaxed/simple;
	bh=OgsguQcDxU4ROzAr8FLZ3Ayjk8vUdVmKWdH6eZ50VUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qx/KLuwzKh3Oi9F/OjtPW7YTQo2VD/1LxAZYuoL3oujDTN0VA0p01RtbzfsmuWm8MLTizm6EtIeoMCHYO6j9xoiAx8SC882cMIeycG16uiTWdPEiBLSYf4pVdhkIy/WBoXh/C96EXSnp+8Ll9kZhUVvgsK6wdT9jvtn0OEASLck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E74DsPHT; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E74DsPHT"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e28be470f1so18856575ab.0;
        Mon, 21 Jul 2025 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753088900; x=1753693700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fP2qdhjigbAmBeoHDgFhVXmJAdHPCBK9T5wak81mhb8=;
        b=E74DsPHTnQlM6PbA1/qHwPhmd/1OcibH6buT1s09Hd6mnkgpw+407GXHd8F7S4mHsu
         AKf962Dl6MmPN7JFRWXicRmja15bA4myptZhlcVOhQ+FNW0VtS+f5GATZTFP6alvT6AU
         xJFpDBDpA1N672ulAM8U6fHW2/evEVODyNTnTLIFXMf88tE8j+bVd3j0lXVPMPoBvRwL
         kne9uoz3AOSTYEAClWFm4W9jolE5kuw+8jMIt2mFe5BYKCd/IWIYWkkptNaCSe07Ucjb
         F/uvY4NJG04UnQujKwJAEYQdq37zHWTX2ar4c7eqHp8VVX0GfaRbFTGZjbXhqg6n37J+
         D5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753088900; x=1753693700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fP2qdhjigbAmBeoHDgFhVXmJAdHPCBK9T5wak81mhb8=;
        b=K1ME8IfvRauvFj/HN9egLJlZeB2hPXZw43CYCQQsGA602/t/Ws4vfK3xUCRmrLeKth
         i232/GhncT9jGw93r6FVKOzNiHjnSusxnAHDz+/N9N80ZvxVOQsXsR/RNafwzF1A0r8G
         o4hbmoZOhTeYBeOWANEsKA+hJnhn+Iu7eOb9gUm7n3ZcpTGBXFQduXCwbw+ngKENQ3hb
         kuFnUtNUo6ywhUMVmcHvHJ3ajfeoANvM1zASpT/Q7fG44QZd/nOB8KJDPzTWuH1FO0p8
         7KAIJjX7cemtxJ9ke2NufnA3HzX5evLpl+fkuR6J7zo76KgSB6u26rJi2j5f8up5york
         i6kg==
X-Forwarded-Encrypted: i=1; AJvYcCUGD/3YSQkvhNryUuLqmaUiY98jVXCGUK3n64Czc2sqR5eZwQ/EoiaQjHCd3VyDcbnrCTQJ01CtKGQEsLY=@vger.kernel.org, AJvYcCVX5fzFsJQVZW17ORFu9fOVYEIvrTcVaJWnW3+kNbn3vB2nAhvxEVqG4cT+PMgqhrfIqIwsXqSRFCwhG595JFY86A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfsp7ARXbqquuVgSZofXDaiKCW6AhWXgpsWBRU94YjGf8UWuGQ
	T7lYWqkQ4I0P8sZpBi1BqzmBLvexOmJdYWdOqqEHMseZcGNFtWY2SbxNWN2I+bpd4+4oBSvYMue
	3mZ1Y3wh2zixm9zwYotC31ZdjX9B9DXQ=
X-Gm-Gg: ASbGncuAhCHEnI2CdOBfwDryHYnr0KoXEbtizncYZjt8EZyu1IL1uFm3kpPKohzP395
	BextIE8pM0LwOusZAXDJE82Zn6x6xg3JEMbmOF5bK9esx8UBSYXSLBD8nojBVRmE0cC4hcsNJiT
	eaOlfOVGV8ZEeur4Kl6jEoyoOYgMfJ7o2TPcy1fveTF1lg8cwCxxUGTOCLbd1UV0SIRRxDoC5Nt
	t7qYqE=
X-Google-Smtp-Source: AGHT+IF18j1rx0DNGpmrwGS5dReQiw1r4g3RlvoyFjCSL132gx55Rm/6nV7uh+iqAAGP1WIjgLw0qylp3KDR5ZpttP4=
X-Received: by 2002:a05:6e02:164d:b0:3e2:84aa:f473 with SMTP id
 e9e14a558f8ab-3e28bd601a8mr140906605ab.1.1753088899813; Mon, 21 Jul 2025
 02:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-2-shengjiu.wang@nxp.com> <CAEnQRZDeXrhHaU-tiAizXL3cNK-6rpbACx9QGNVpV8GBEKAPYQ@mail.gmail.com>
In-Reply-To: <CAEnQRZDeXrhHaU-tiAizXL3cNK-6rpbACx9QGNVpV8GBEKAPYQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 17:08:03 +0800
X-Gm-Features: Ac12FXzQmStbQ2f20k4GC_7DKq8-KQmdC6HQD5O_YE8Y5hNo-EjvRf34-Q_a6Ww
Message-ID: <CAA+D8AOzxf2J5GwzH0MZps3r3_qRYBsp+s40L8uVL6v_cGhz5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, mathieu.poirier@linaro.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2025 at 7:24=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Fri, Jul 4, 2025 at 8:29=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
> >
> > When recovery is triggered, rproc_stop() is called first then
> > rproc_start(), but there is no rproc_unprepare_device() and
> > rproc_prepare_device() in the flow. As the software reset is needed
> > before DSP starts, so move software reset from imx_dsp_runtime_resume()
> > to .load() to make the recovery work. And make sure memory is cleared
> > before loading firmware.
>
> Hello Shengjiu,
>
> Commit mostly looking good but the key point when writing a commit
> is to explain why the commit is needed and less about what the
> commit does (this should be obvious from the source code).
>
>
> So, I would start with the context and that is:
>
> Following commit: 6eed169c7fefd9cdbbccb5ba7a98470cc0c09c63
>     remoteproc: imx_rproc: Enable attach recovery for i.MX8QM/QXP
>
> enabled FW recovery, but is broken because <and here explain the reason t=
hat
> you mostly described in the original commit>.
>
> Then at the end add the Fixes tag.

Thanks for comments, will update in next version.

Best regards
Shengjiu Wang
>
> Also, allow me on more day on Monday to test this patch.
>
> Thanks,
> Daniel.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
> >  1 file changed, 27 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 5ee622bf5352..ba764fc55686 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpro=
c)
> >  {
> >         struct imx_dsp_rproc *priv =3D rproc->priv;
> >         struct device *dev =3D rproc->dev.parent;
> > -       struct rproc_mem_entry *carveout;
> >         int ret;
> >
> >         ret =3D imx_dsp_rproc_add_carveout(priv);
> > @@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpr=
oc)
> >
> >         pm_runtime_get_sync(dev);
> >
> > -       /*
> > -        * Clear buffers after pm rumtime for internal ocram is not
> > -        * accessible if power and clock are not enabled.
> > -        */
> > -       list_for_each_entry(carveout, &rproc->carveouts, node) {
> > -               if (carveout->va)
> > -                       memset(carveout->va, 0, carveout->len);
> > -       }
> > -
> >         return  0;
> >  }
> >
> > @@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc =
*rproc, const struct firmware *fw
> >         return 0;
> >  }
> >
> > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmwa=
re *fw)
> > +{
> > +       struct imx_dsp_rproc *priv =3D rproc->priv;
> > +       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> > +       struct rproc_mem_entry *carveout;
> > +       int ret;
> > +
> > +       /* Reset DSP if needed */
> > +       if (dsp_dcfg->reset)
> > +               dsp_dcfg->reset(priv);
> > +       /*
> > +        * Clear buffers after pm rumtime for internal ocram is not
> > +        * accessible if power and clock are not enabled.
> > +        */
> > +       list_for_each_entry(carveout, &rproc->carveouts, node) {
> > +               if (carveout->va)
> > +                       memset(carveout->va, 0, carveout->len);
> > +       }
> > +
> > +       ret =3D imx_dsp_rproc_elf_load_segments(rproc, fw);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> >         .prepare        =3D imx_dsp_rproc_prepare,
> >         .unprepare      =3D imx_dsp_rproc_unprepare,
> >         .start          =3D imx_dsp_rproc_start,
> >         .stop           =3D imx_dsp_rproc_stop,
> >         .kick           =3D imx_dsp_rproc_kick,
> > -       .load           =3D imx_dsp_rproc_elf_load_segments,
> > +       .load           =3D imx_dsp_rproc_load,
> >         .parse_fw       =3D imx_dsp_rproc_parse_fw,
> >         .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> >         .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > @@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *=
dev)
> >  {
> >         struct rproc *rproc =3D dev_get_drvdata(dev);
> >         struct imx_dsp_rproc *priv =3D rproc->priv;
> > -       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> >         int ret;
> >
> >         /*
> > @@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device =
*dev)
> >                 return ret;
> >         }
> >
> > -       /* Reset DSP if needed */
> > -       if (dsp_dcfg->reset)
> > -               dsp_dcfg->reset(priv);
> > -
> >         return 0;
> >  }
> >
> > --
> > 2.34.1
> >
> >
>
