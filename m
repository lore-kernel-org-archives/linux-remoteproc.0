Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BD1DF27E;
	Wed,  2 Jul 2025 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456915; cv=none; b=WTubLiMxhjZfLh2iCIA2bKusr9elGOSzBdzNdj7FrYMmj1nuzJHnz/D8yQX3VTzKstnZoiLFqEngxZTTawMmmJpT9XjsZgLHAxCugEziBnvyM3XbEunV+lXhaM5RCOVKD87pLR5ly3/WqrT6m5vxPvHmwYfnfTCDQJjkOFj0T6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456915; c=relaxed/simple;
	bh=CyKuv2VY8buCSaYOnWagFd+yFFQVwFRKwJZQBwkUZu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6JNUoX9GPFmH2drYv932+TjBYYZH0tLGIdxbcCBUIHztNTonColtn1gB+gv8cUjrbixeqsG0DTQ64NeLkY7OIOPCEp7oPOm7ZlfNAmYKsIDBQy3TOzk6Vgkh9Bvrw3g+a0DDfd9SP7Bg72DtGM98fYsC6B3KkQBOljGi6FAAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fM3WOe9o; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM3WOe9o"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e0570a9b83so1308435ab.1;
        Wed, 02 Jul 2025 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751456913; x=1752061713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzPxoOt7/PDx3OAhuOXlHFSJAQjWmG/j7qKRio0DXig=;
        b=fM3WOe9o7wWAyQyu8w2WZpvb/2fgzJufmrc51LQMg2hokPE3SYXgiwSSQze45IJAN2
         B2QFuU/ZuFvF8lFQxK8foYxPnRcEJNdOotbCPyXArctUYNARW9Fr6qP7a37acmevyxCQ
         c6AvN36FCd8jmpHU7ljNIYfWvr69G95qSwZFfsVOjEZUEkp4Bjl4iOM2IzVAxyhZhUlU
         KRFiqkHYsUn9IBn96xupehuMQbbmWzcrPae1z4+fu0QzLgzwwVk5Gfy6YWDCNH07yd9J
         fYyIqVj7+MM38yF5MThXABXiK/KHtnNko6k4FhSHqDU4Jt95qS0Br7p+oRlBpUeqKGmu
         w1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456913; x=1752061713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzPxoOt7/PDx3OAhuOXlHFSJAQjWmG/j7qKRio0DXig=;
        b=cZrNXpy1CeViY6FmDc27IRdLfPL1VNbRBbyfDtqC98VwTKcx/Y1uTsOD6t9KFl9D06
         ZFSA0J6zs07/cTWe5ymubzf5tKu1EP+EQHUCbT31sJctEU/f8f+q7QQ5b1BOd94dP71E
         ngR/wjLelZlyjEuw/m+efA1C9gqLjCD8ufhUj5G64F3dzHKAyIdE3xm/stlIluS4FW8s
         NHtPrkihDlIl8VemGMiMitI2u5FLv8fOCAS5QxyKkCG7JDX/ImR5CZ3k51MMEHgXFc2h
         B4zlLNKAlYEXkZHhoP/yhZ/182x+HSk4KF82ZoCTWE5B0O8DVDZemXgNxHcEiFpYuThR
         b7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUdlMgl1a7OeGStgRFNbbg1QzaquKCvlCTnYMhK/G+fzxmfJ4b+15T5fZl/3FTaan29qVgxkKRryu4LRsOx3ASuwA==@vger.kernel.org, AJvYcCUiF/D5l9khjZLH6PBtdPnxH7CExkJ+FFKrsvl608GWWlS4FQ2VRZLlVoQyDBm1lGujHETh+ZQaZFDOV0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YydzMyVaRbBsmnVNXtiASk+AriJs7ndEpWmF9wSCMtHjjBOGug6
	Ra4Q2uIfjf37aDCrhPS/gwh68MK+O5MpNbYi7lYuZ7EEZPLnjSPRy2j30merIIGvp3I7YsQtTUB
	qT/8UbzRHS7ZNYMgEjYKknIt/OJOHOLH3QKDF
X-Gm-Gg: ASbGnctFt0g+77PopykKjXHtvL69k5ZIUTV1RZYZydzgssydEkcq3+z64RA2mEOKUqw
	1oV7/RABhcDfuU985mW02xbYDCQ2YEnmxGS/IIpeqa0QcejWaNIU9zhp4GruClvdHej8nYILHDR
	pBtsLqOvBPu8obZkqJMOxcKh2vk0I4PADW8NiWbOs2CU5qC5/u9VM+7A==
X-Google-Smtp-Source: AGHT+IEw1dzWm4QIwYZ3nobQC6Sl0JTwXZBOf8R8fgqREreP3zTUiwJZ1QMMnvhYh5RwfOmvgp90q36ljwFt6u6cKug=
X-Received: by 2002:a92:c244:0:b0:3dd:d155:94cb with SMTP id
 e9e14a558f8ab-3e0549795b6mr28666715ab.7.1751456912803; Wed, 02 Jul 2025
 04:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com> <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
 <aGP-ZVuhBdd1GPLe@p14s> <CAA+D8ANtw1xTg7OQOFoDeQcdp05Eo9Uo1t=MKcGjtkSYfJqBVw@mail.gmail.com>
In-Reply-To: <CAA+D8ANtw1xTg7OQOFoDeQcdp05Eo9Uo1t=MKcGjtkSYfJqBVw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Jul 2025 19:48:12 +0800
X-Gm-Features: Ac12FXxpIvbzeFcwinOMXn9TEBzcrnmh0tjz9irrB5pa_wug2azkcr5nRrXHUhc
Message-ID: <CAA+D8AP+RPJpY_=8WjSXoV_VB=9hP0NnFGjjUQHXcoDoz3fgfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:20=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Tue, Jul 1, 2025 at 11:27=E2=80=AFPM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> > > On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > > > Add call rproc_coredump_set_elf_info() to initialize the elf info=
 for
> > > > > coredump, otherwise coredump will report an error "ELF class is n=
ot set".
> > > > >
> > > > > Remove the DSP IRAM and DRAM segment in coredump list, because af=
ter
> > > > > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remotep=
roc/imx_dsp_rproc.c
> > > > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct =
imx_dsp_rproc *priv)
> > > > >               mem =3D rproc_mem_entry_init(dev, (void __force *)c=
pu_addr, (dma_addr_t)att->sa,
> > > > >                                          att->size, da, NULL, NUL=
L, "dsp_mem");
> > > > >
> > > > > -             if (mem)
> > > > > -                     rproc_coredump_add_segment(rproc, da, att->=
size);
> > > > > -             else
> > > > > +             if (!mem)
> > > >
> > > > Flag rproc->recovery_disabled is never set to true, meaning that si=
nce this
> > > > driver was introduced, some kind of recovery was available.
> > >
> > > Actually since this driver was introduced, the recovery can't work.
> > > We didn't test the recovery function before. sorry for the mistake.
> >
> > Let me see if I get this right:
> >
> > (1) Almost 5 years ago you sent me a driver with code you did not test.
>
> Driver was tested but missed the recovery/coredump function.
>
> > (2) It took all this time to realize and fix the problem.
>
> I just realized that the recovery/coredump is one of the functions suppor=
ted
> by remoteproc.
>
> > (3) I should trust that, this time, you have tested your code.
>
> recovery/coredump has been tested.

I am not sure if we must power off dsp in .stop() and power on dsp in .star=
t().
because I see such comments in remoteproc_core.c
        /* power up the remote processor */
        ret =3D rproc->ops->start(rproc);

        /* power off the remote processor */
        ret =3D rproc->ops->stop(rproc);

So I moved pm_runtime_get_sync() to .start() and pm_runtime_put_sync()
to .stop()
in this patchset.

previously we called pm_runtime_get_sync() in .prepare(),
pm_runtime_put_sync() in
.unprepare().
If we can keep the power on/off in .prepare()/.unprepare.  maybe we
can refine the
.load function which is to move .reset to .load(),  then we can reduce
the code change
and not need to change the coredump scope.

Before I test this idea I'd like to have your opinion about this.
Thanks.

Best regards
Shengjiu Wang
>
> Best regards
> Shengjiu Wang
>
> >
> > Did I understand all that correctly?
> >
> > >
> > > >
> > > > I worry that your work will introduce regression for other users.  =
Daniel and
> > > > Iuliana, once again have to ask you to look at this patchset.
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > > >                       return -ENOMEM;
> > > > >
> > > > >               rproc_add_carveout(rproc, mem);
> > > > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platf=
orm_device *pdev)
> > > > >               goto err_detach_domains;
> > > > >       }
> > > > >
> > > > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > > > > +
> > > > >       pm_runtime_enable(dev);
> > > > >
> > > > >       return 0;
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >
