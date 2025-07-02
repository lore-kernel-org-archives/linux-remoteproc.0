Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4A1DF977;
	Wed,  2 Jul 2025 07:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440858; cv=none; b=GoioimNnYCBrNYp9SgJ126F7/zw/9JNs8zBxOY4C8/BsEWZROAQOa7GrWYZRtCe6nrwHm0VI4dEd98GA+OYtRn7PGR6qnoE3c0JiVNWG+QCgs8zDC/ftuHguJ4KDEb7ZpKZwajnd3/pUo0+qKd+W/htY8hiydsxKKA4aik2n9qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440858; c=relaxed/simple;
	bh=MdYtqvofNcs1ler6sTIPSc9X1xjblJnNld2TD7UDg+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cF0bkFvbZI9ksGw19XPDobst0KOE8hlI1nPQHsFscdY+gu0t/BaTV+cJx8gwLNtCQU+JpiY5zu7yOPG5rhkdnAo0zxNUjMkPvgEmTelUoUf0ei3qIru4KsQ3/qUsGZ2SineJim41GVm2VM3JxIKCojSIo4DfT5LKWI2KnlghN3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtHTyF5u; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtHTyF5u"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso23152435ab.2;
        Wed, 02 Jul 2025 00:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751440856; x=1752045656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlKXcUS3jg408kymTooqcQurJM+0HaAxwssjdjwXTBw=;
        b=EtHTyF5uSJFGEZ+doROPga/ykdR/WDHGnU6te+sgSUp5gF64J5jXlaVwh0AUf/V4QT
         rr0G5r8ZypMkLiMBqgYpswznRk3MWBc7z7Tn9Lf7xwjd9YNliVS3Q1XoCSlu1QyussMx
         oLGEL0+eDR1EX/KaeJHSG9zHFGCtF43wJ1d3C10qryQEbrLEKU90gxI7ClyG0fmsWMJM
         hYRJ76JJfcbrL/rYt4RXQF8yk0icOg444JUcRLY282UMXLQa2o64RjWUG/2qNV+lirSj
         cJEcXHI87oykajU7sqiElY/h2yp0OoDCoCjvuY1sgqITkth6tClFBd1xsb7C0dh+3tXb
         Jmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440856; x=1752045656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlKXcUS3jg408kymTooqcQurJM+0HaAxwssjdjwXTBw=;
        b=B+hqNkzqG8AO0hVOf022ey7Jv2JP9ofu39BW0FJrmi46EeHTa0P4OMYnLT8ngYZHmW
         MeYncQHVRPBSJIDbB9wgnFjW9PSvEXrSC3YFtxx2upZ5r2kmcNkAmZJ88wo6e8TmtUI8
         +dnznVWseVy4MIzFlevV1/qqGYo0FzfmPHgd3omhm0ndHVcJG6CRz6/7zwp4PKi/qPly
         dtfaSgBuqqM4fmXbV3QYMdeCZ3q0Zuv+e8huKZIsOcY2JqlSHANaSuutDWKhVBh8jMI5
         J8B6pDzK8LmrazvKSZ5wM/ei47XtmbjHmp16EQ77R7mOefe30UNsQrtZhSS2Cdalnlsf
         BcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyqJjdh4gb5Bfl4QcA70F3P0lIVSmzudTe+XbUsqlC2ZC/+NrAjzOItE0VmqzafOB8dYOCRv9Ag/wp3gRl+9tXrg==@vger.kernel.org, AJvYcCWRkQ/XXBPhpP9a479DY5KSWnONArlpbzxVPe9Ay7IIVIIRIb4eJLoPnYDdJDkVDLp1wOPXRk9j/yahLpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YydvZZrQ7fqhLtBYwCMSdeTsJHxRves/zRZIDYaPoTM5NKEjsaq
	oA5HTvrRWA5MaQD0m5vjigCXPsewpAq8jYdmXl1ItivsKvNY7qJJT4hrn9R4QmXoSWEsv1AQima
	SRfwNP++EhgE82UAXhk7ib9S+GSle5SA=
X-Gm-Gg: ASbGnctYrXwUXeD33IzI6/4Fl8xvEBLJLx55lx7B8Tn9nSjiz9n5TmrGJNcfEj2uRJp
	ql/lYXavgBvDPJO+MKXLYNe8uGX85uYgsKgWo+OjILQRDoQYhK6qnpX+Mutpv2R7WRwhxzU6Opj
	V237Cvw6s16JX9jza+yC/VS9cSs2t1OkXYMJnPq0KYETI=
X-Google-Smtp-Source: AGHT+IFHgMa8Mngls2xpKyZO5bXtEpSnlalV27UKMs8KgtahvMNmHCQIvV4/VqDTKCW7KQqdACPzThHXTAdqppHtWsk=
X-Received: by 2002:a05:6e02:1a61:b0:3e0:4f30:c951 with SMTP id
 e9e14a558f8ab-3e0549c655bmr22307415ab.14.1751440855622; Wed, 02 Jul 2025
 00:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com> <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com> <aGP-ZVuhBdd1GPLe@p14s>
In-Reply-To: <aGP-ZVuhBdd1GPLe@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Jul 2025 15:20:34 +0800
X-Gm-Features: Ac12FXxqvi6u6raIhWimY1G1UCrc7Xt2DJUxgPMKdt9-02GjFtqtqI7XWKxLVQE
Message-ID: <CAA+D8ANtw1xTg7OQOFoDeQcdp05Eo9Uo1t=MKcGjtkSYfJqBVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 11:27=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> > On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > > Add call rproc_coredump_set_elf_info() to initialize the elf info f=
or
> > > > coredump, otherwise coredump will report an error "ELF class is not=
 set".
> > > >
> > > > Remove the DSP IRAM and DRAM segment in coredump list, because afte=
r
> > > > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remotepro=
c/imx_dsp_rproc.c
> > > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct im=
x_dsp_rproc *priv)
> > > >               mem =3D rproc_mem_entry_init(dev, (void __force *)cpu=
_addr, (dma_addr_t)att->sa,
> > > >                                          att->size, da, NULL, NULL,=
 "dsp_mem");
> > > >
> > > > -             if (mem)
> > > > -                     rproc_coredump_add_segment(rproc, da, att->si=
ze);
> > > > -             else
> > > > +             if (!mem)
> > >
> > > Flag rproc->recovery_disabled is never set to true, meaning that sinc=
e this
> > > driver was introduced, some kind of recovery was available.
> >
> > Actually since this driver was introduced, the recovery can't work.
> > We didn't test the recovery function before. sorry for the mistake.
>
> Let me see if I get this right:
>
> (1) Almost 5 years ago you sent me a driver with code you did not test.

Driver was tested but missed the recovery/coredump function.

> (2) It took all this time to realize and fix the problem.

I just realized that the recovery/coredump is one of the functions supporte=
d
by remoteproc.

> (3) I should trust that, this time, you have tested your code.

recovery/coredump has been tested.

Best regards
Shengjiu Wang

>
> Did I understand all that correctly?
>
> >
> > >
> > > I worry that your work will introduce regression for other users.  Da=
niel and
> > > Iuliana, once again have to ask you to look at this patchset.
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > >                       return -ENOMEM;
> > > >
> > > >               rproc_add_carveout(rproc, mem);
> > > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platfor=
m_device *pdev)
> > > >               goto err_detach_domains;
> > > >       }
> > > >
> > > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > > > +
> > > >       pm_runtime_enable(dev);
> > > >
> > > >       return 0;
> > > > --
> > > > 2.34.1
> > > >
> > >
