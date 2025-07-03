Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBCC2D63F1;
	Thu,  3 Jul 2025 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534722; cv=none; b=pigAitL8/Pp5hYX/58PQEkI+5bspuTbrK97rM6mmr2Tr00keMrLcd87EDwVuMBjVtdsY0wOJb0YShy0tzN1UUtIrkLVaC3nQn1LB5zbSBkonjrqukplEBze8Y6WVSREYwBUBUO95+3IRVspzpV0BBmOUd9aiYHF77E/jYu98De4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534722; c=relaxed/simple;
	bh=v4IoJlg76CmSJ2VtEhP56ipvSCV4NseNd45qWFEYnJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uq5HTKHsU/by26RorqIpb5sQB22O/9pY+ItCLy6ekuG+sl7mbCV0wQFcE2DSxIi4YZHcr0RwfK4yeoXXP26+K0hZlf/e1Sw43LcTUnkXJP2Dj8oLGtRbxWktR5ksLEMmBFK5kscxyJGUDB6P2S7esGnk6J4Rs7wmq1zNlqyIDII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJaPsRMT; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJaPsRMT"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3de18fde9cfso29868315ab.3;
        Thu, 03 Jul 2025 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751534720; x=1752139520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQxlXjimiWOLNlkmt82ETYNH1B4xm8nZuHa4F1eDm+Q=;
        b=eJaPsRMT0uTq8esNVgrKEFZZoE9PPYN4LsYcvdHEbxsY1UKC+zD6Gm27+16YGzJyRI
         t51RLhbr4R8tlXcFg74o1FyABxgC8caIMir4hOF/IdqRmRRJi88TPkXctDUpMiteDp98
         h1PFmRq6vWEMPyCZrqhwXLF9FhFHy98et+KuzNAbiQBKKcz+jWthKYgXv2Tat2tS5unp
         MxSRhj4ascUGepXAWemmXr0nGAFo+CxN6/QszrWIFdHzDZJ0TU4JDByTBK+acO9QHmHc
         5SU0n6KM576nIw+0dR/LLmNftOf4IjwHdwI7ZrmKYiFtek3b6Uvf1BxkQgK9rGZT9kKF
         t3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534720; x=1752139520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQxlXjimiWOLNlkmt82ETYNH1B4xm8nZuHa4F1eDm+Q=;
        b=QSJ4huXyTIs+gM5WTMJVM/LitVSao/BezJd4eagJlFQvF4ckqq5rHZtaXcecNEi5vF
         y7YkzRYH7R/ybOJt2RY+uLRiZMShDJniSmGEeNzRdUUGwiiq88K3R7grMtFChfs3cZPL
         u4wmuqkRY5khAhyDz9Pgxi3Rn2s38ucqXIpem7r1oeRxSdBAm1MSzKcRqv6FjGQn40kV
         PYWrPjzddDQrnaaeej0MLFnDdvB52qdCFg1/6no5Ac3rbbFrEOmdA8WRXDs/xbElDYvj
         05CzHZsGIRFTwesfS1cAJzyNyvfGR7vvKO+hMNgv+0iV7UU9TH3qvYmkmFHYJRKecCxw
         xvfw==
X-Forwarded-Encrypted: i=1; AJvYcCU4VlaVQ7DpwuXUvgHIvGsZRa8ZP2O0CaHb5aI9jUKkXCAlyb5OBRvDh7k9eqrU412iS1+f+x3nMxGr+Z8LhKZseA==@vger.kernel.org, AJvYcCVuQM3p5jvTjYQze5Q/07sZzovVhllipdi2UIsIAAObR5BfzybzaQ7uCm9lcwovegdFRyhDFYxqYVwfDLo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5S0KxrcGlyKmURYqXgaVAkXnWqBDPuKj+6I1gAKvwNVYVR0n
	dvtP6hjrLpLFrHSsUCkDtOSp2L3S36FnODhSI/J0z8kPuZDZ2Yuli7plW4rakUVnsQ3TDnH6IZ4
	0AgXFQSBTvVVLoWmdJk8SLO2V2Y9Fmaz4GA==
X-Gm-Gg: ASbGncvwMm+fjXr/OW3G5NNE2IvvTyIb7+13cDOTgDpw3wn14GF3XyK+s8cHSpv92XL
	Auf++QPCyf9FKh8ZBG/ghYbLiUeimiOGpyqcPidDCbDd2yx1gXVi9HOJ0yMA4y53dH8r/emWqdY
	8EWwDnw/kaeTzvB/p6DEuX9Q4y85BVEOzGwEhAs+FnGqM=
X-Google-Smtp-Source: AGHT+IExz9aStPQQU5jTE1Po0AQPZakEiqsbSsJKe7wO8kX4S2jJmJUZEYtD2nu7s7tlGuCMRGGTZawMXfUO2V+vIVY=
X-Received: by 2002:a05:6e02:2183:b0:3df:4024:9402 with SMTP id
 e9e14a558f8ab-3e05494a935mr73959465ab.8.1751534720124; Thu, 03 Jul 2025
 02:25:20 -0700 (PDT)
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
 <CAA+D8AP+RPJpY_=8WjSXoV_VB=9hP0NnFGjjUQHXcoDoz3fgfA@mail.gmail.com>
In-Reply-To: <CAA+D8AP+RPJpY_=8WjSXoV_VB=9hP0NnFGjjUQHXcoDoz3fgfA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 3 Jul 2025 17:24:57 +0800
X-Gm-Features: Ac12FXwGsyCT-FrKcuI-KzJt0SyzwBQ-E9tIqBn9TSAoTP3Lnf3fS8E6YzQ5JhE
Message-ID: <CAA+D8ANdfOr=iyJQqE9_k+JUCRin2KXOVf9zL6BVxRrV0REvqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:48=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Wed, Jul 2, 2025 at 3:20=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
> >
> > On Tue, Jul 1, 2025 at 11:27=E2=80=AFPM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> > > > On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
> > > > <mathieu.poirier@linaro.org> wrote:
> > > > >
> > > > > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > > > > Add call rproc_coredump_set_elf_info() to initialize the elf in=
fo for
> > > > > > coredump, otherwise coredump will report an error "ELF class is=
 not set".
> > > > > >
> > > > > > Remove the DSP IRAM and DRAM segment in coredump list, because =
after
> > > > > > stop, DSP power is disabled, the IRAM and DRAM can't be accesse=
d.
> > > > > >
> > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remot=
eproc/imx_dsp_rproc.c
> > > > > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struc=
t imx_dsp_rproc *priv)
> > > > > >               mem =3D rproc_mem_entry_init(dev, (void __force *=
)cpu_addr, (dma_addr_t)att->sa,
> > > > > >                                          att->size, da, NULL, N=
ULL, "dsp_mem");
> > > > > >
> > > > > > -             if (mem)
> > > > > > -                     rproc_coredump_add_segment(rproc, da, att=
->size);
> > > > > > -             else
> > > > > > +             if (!mem)
> > > > >
> > > > > Flag rproc->recovery_disabled is never set to true, meaning that =
since this
> > > > > driver was introduced, some kind of recovery was available.
> > > >
> > > > Actually since this driver was introduced, the recovery can't work.
> > > > We didn't test the recovery function before. sorry for the mistake.
> > >
> > > Let me see if I get this right:
> > >
> > > (1) Almost 5 years ago you sent me a driver with code you did not tes=
t.
> >
> > Driver was tested but missed the recovery/coredump function.
> >
> > > (2) It took all this time to realize and fix the problem.
> >
> > I just realized that the recovery/coredump is one of the functions supp=
orted
> > by remoteproc.
> >
> > > (3) I should trust that, this time, you have tested your code.
> >
> > recovery/coredump has been tested.
>
> I am not sure if we must power off dsp in .stop() and power on dsp in .st=
art().
> because I see such comments in remoteproc_core.c
>         /* power up the remote processor */
>         ret =3D rproc->ops->start(rproc);
>
>         /* power off the remote processor */
>         ret =3D rproc->ops->stop(rproc);
>
> So I moved pm_runtime_get_sync() to .start() and pm_runtime_put_sync()
> to .stop()
> in this patchset.
>
> previously we called pm_runtime_get_sync() in .prepare(),
> pm_runtime_put_sync() in
> .unprepare().
> If we can keep the power on/off in .prepare()/.unprepare.  maybe we
> can refine the
> .load function which is to move .reset to .load(),  then we can reduce
> the code change
> and not need to change the coredump scope.
>
> Before I test this idea I'd like to have your opinion about this.
> Thanks.

Today I tested this method, it looks good, the code change is smaller.
I will send v2 for reviewing.
Thanks.

>
> Best regards
> Shengjiu Wang
> >
> > Best regards
> > Shengjiu Wang
> >
> > >
> > > Did I understand all that correctly?
> > >
> > > >
> > > > >
> > > > > I worry that your work will introduce regression for other users.=
  Daniel and
> > > > > Iuliana, once again have to ask you to look at this patchset.
> > > > >
> > > > > Thanks,
> > > > > Mathieu
> > > > >
> > > > > >                       return -ENOMEM;
> > > > > >
> > > > > >               rproc_add_carveout(rproc, mem);
> > > > > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct pla=
tform_device *pdev)
> > > > > >               goto err_detach_domains;
> > > > > >       }
> > > > > >
> > > > > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA)=
;
> > > > > > +
> > > > > >       pm_runtime_enable(dev);
> > > > > >
> > > > > >       return 0;
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > >
