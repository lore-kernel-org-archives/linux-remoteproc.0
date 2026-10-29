Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793269492;
	b=1VMAKkut74QD3GBi8Mj/+C3Bq45rDegp43kRD/sDI5DRx2Z1xUulIWigoK/bcGESU1jn
	 0o7/ZIwvoxWPD+6a4uvS4kUW8y3YQByNMMNnh7VV6TGhRk/mCIYHsd4EvV6bhjaBR/eb1
	 yMZV7fJtDDppkpH7AIa2WAs33e9VMHb1VBRA0FXwyg7IApYGy7W6qJFNq/a+UMUdqvoR7
	 PB04T9i3g0tj9vIwozC5aVorfNYF1JcMBJBYYlDAXOj6i7ndUGQHqZBIlXyyyuQDQM9xk
	 3b7V/8i6I6G+bZRSViuuxra2Q637Ft1MaygNHwSZRheTQMkZna+h3wZWMzt4E8KhWwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LtN6pjzt4ArMd6Bjtncz+tOPZGOxhZCqUIEwdaQxyKY=;
	b=DjsY+NmXFbYb8jstjAwJUPyIRl4S7moJrb+Q2yvbLBvDfRFOdw1PqAaS0JPnkxdOR+zl
	 d6rx1Ubi/mNHCISZgH3XYnjrJl6gmxxRc5cLjgonAugLuzSeR5GcuKCP7Ji+IpDv8OjLl
	 GIXL855rSZTxaSRQ9hkHLa3h2BqlWH/AQlovvmKoRUYka+srXpZZ9BE0Haf7ZZZT4ouC8
	 MDAl+u351XbY1cV2/Oq3VRPC0IbF/GXWmgP5ulKMOOWiKWBVdjQ9oq7NIIyBGLguvcFA3
	 4iKcduc0N0fR5id7zPstcBRuxyd8TNF7ylh0n0BiJV+tY1oXXJsoaCZrL8axtoQtefA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zXOJSrc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A21606A31D
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2026 10:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A21606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zXOJSrc
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1068922b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2026 03:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793269490; cv=none;
        d=google.com; s=arc-20260327;
        b=aMTQSK0FlRen1LJ1qAzZkorxA6qKWfqZK5MlalnAZ1dheYAiWB6f6XIMJQchf0Mv+w
         8YLkis+6NWF/CKVhzYKvSuSv7DJer2R8iVaXroYYwVM17RtKd82iSIqMH2PePuaVxzPj
         2NKtikElgRjJX7RAzRllj96sXC03Y/IjqiE0r//9MCF9R3OJtgZ/gC7d8F5XSeUfTDI/
         KzGRJJhsRn6wOHhZ8c7lR1yNKtFk1Afpa3j08FIy2EKj8lWs8r8qNOE3CZFf56PV5m24
         0WNasmGBzP5n7H1kxLXgJv3Z/opXS1cxqgoHMY2MEdyD9k/ZWcn0OJO/Hz02h/VlWMoB
         El6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LtN6pjzt4ArMd6Bjtncz+tOPZGOxhZCqUIEwdaQxyKY=;
        fh=SDo8ffcL5drPjm8EaZYhGLboIT3B6prNuvlWI/pr834=;
        b=cKYXlvcNouXTa8ZSHl84ESzDFRy54XLnMDce4aMJzIgbb5z2WdUstDWCTHnKLX1qvo
         YnIQTlYdONSJrA3G2yw9Ym8RxXabiyShRfOUVSu9eOQQwqb/SKatUAoUNzmxdNSoEv+P
         MH5J8qv4CNrvbQ2N4kyIeU4k4zwqsMEBsN3eCAa2wqsC7m92TXJInTBeDo1VLRJ++g+G
         19rNTArHIV+V8MMc84vcuHJ1D6fGl2bOk6t7oxnRtqBKd0tneBTpV6mRmrlQuhYmALs3
         vF4O8UZ89/CE/rPPPEbCKKA6F3w61j1Yh4zLPul79Q5+cQXxF0lhRyT+HtX1GoakOfGS
         QJhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269490; x=1793874290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtN6pjzt4ArMd6Bjtncz+tOPZGOxhZCqUIEwdaQxyKY=;
        b=0zXOJSrcKQC7ryGeuSuK/NAU5qArcB9AWAlRD0U6B1C+wwJqwAc4aNmtqb7HqfR8Zl
         G9yphwQOFTPtDkYfShUGz9dhp/dV85LKk2NX3Hkmb/VPv7HKPjP7H+ovo7uDSipavEdo
         GDsGrx1I8Bio8cX+Rps8b+GRuWnO7DPTe64JsmGH6pWI7M6vb7sGLHLoHgV4Su54w5Dy
         TAeMNs/waZBzcJIK45LOG82tAJwXmW/sDuWSB33KnkrHLZhbgb0ZPJtxvEDC7BaCOdL2
         PaA6V3axolQj+0TZ1E1CUXXtDpxpOJ/qmXKZdcDG5bbTI1RFfouyOPnEMWAsrZEpmA0T
         U5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269490; x=1793874290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtN6pjzt4ArMd6Bjtncz+tOPZGOxhZCqUIEwdaQxyKY=;
        b=1aWoLUvlFzN4gUOSFFTuP6MkjSzeTbSzlflK8u2ZP2qM7Q1VI0V+X7opZbUrB3prRV
         1PPoSPF5C0/JoZ9emWlzOn7lbBOLi/mLtOvmK/0la5okY2KLo0XIbqcgHhGEakNehsai
         EOXrd/hkNkvkKqxe5K6WJPdq5zGx9BDpAApco+A9XZ4kVmCtQ6IGjuaqfhSbOlCYu7+5
         /FciXZn/y6I8mBny0pCMsNMpU5ROEf7l/ZRZp0IaCNv2RZ3J8Jic3tmfxsIsLcyCGqCP
         OCDLIjWBM9KoIU7GJdli59vGQmZ/xPyhzsD5Bd6q5wUntaci2xuMPcikQB7C/lTvYfhu
         lRdQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5pq9qgJr66A/5+NHaPAJwiJ4xLT+jPGVEnuKEEp82I8L1rk6YgGLNWWCjPlgJb2E+aQWTuMR8yYZwsx3uAioe@vger.kernel.org
X-Gm-Message-State: AFq9FYK/KVxaIysPTJBDGXDMAXiC3unkXxH9Q7BSNv94X2Sq+AATwJSL
	pRtH1F1Gb5evPl1kAZetTWxEixd8KtZZZ/UmUwiea+uoXxE1Px2YH4BdMXVwbyD4aei5mKQqwzD
	x3tX3KWmsOFx4k9Cqx2HkLcaC65M8MA4=
X-Gm-Gg: AYBFou0Dzcl+imcP+aMNldu0vrhzTrfLpPwGsykRqvbDbA6qFDcU+bby6YvTrlyM5hN
	lU6bSipMuwfm4VHZbhTYp9XT7l3W2xrcLGwevJeq4e2cez6tnAhfH6In7BOVU7Fluqld0nRyOwE
	UBKWxBCpd0Y9dTEhvIq3Zxh2Z3HlL1LacuZWeGiVorvL5lKRrBtfaFvSNOMWV5nquezqT59rwvO
	EyruMbRjle0oN/vC18f+Q60DSSMHD9TGzvhYJpnQGLD0BcXYSDU0GTQuq5eJbYbKwDn6fnAqN4U
	b8fwSuvgDCPVSfrgasQJyeMFzy2Ok1ymG9CU8D7dZ/iQ+hNPfqVm6n0dbjDhsGfaXrZilj4VkEw
	XkruYrIankJQ9XbLquosBhQv2luPGjqUc0GdN1Q==
X-Received: by 2002:a05:6a21:39a:b0:3e1:3858:1dd0 with SMTP id
 adf61e73a8af0-3e902397234mr4611369637.42.1793269489895; Thu, 29 Oct 2026
 03:24:49 -0700 (PDT)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014103241.3847-1-sid9.karanam@gmail.com> <20261014103241.3847-3-sid9.karanam@gmail.com>
 <d18e3659-e001-4f44-92ce-c7e3c1660263@ti.com>
In-Reply-To: <d18e3659-e001-4f44-92ce-c7e3c1660263@ti.com>
From: Sidd <sid9.karanam@gmail.com>
Date: Thu, 29 Oct 2026 15:54:38 +0530
X-Gm-Features: AclHuK_OPUu7MN1JsB8UsBTd9Ni6keH73aBrVwGspuPVoZssCCoe4f0WLYPFGw4
Message-ID: <CABM86px_9=4sHAqCm6wEhRsaT7zwxyitN6ewmjQa7ODzqk-qtg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You can put this changelog in diffstat. We may not need this info in
> commit message.

I have mentioned what v1 was about and the changes this brings as
Andrew told me to do so (I had unfortunately replied only to him so I
think other members were not able to view that, so he recommended that
I mention that in the cover letter).

> Since a RFC is posted, you can drop this part of the text and just
> mention we could switch to pm runtime calls in the future.

Sure thing.

> Here and everywhere else, can you add an empty line before return
> statement? No hard and fast rule, but this has been followed
> throughout the existing TI remoteproc drivers.

No problem, I'll fix those issues.

Thanks,
Siddharth

On Thu, Oct 29, 2026 at 2:03=E2=80=AFPM Padhi, Beleswar <b-padhi@ti.com> wr=
ote:
>
> Hi Siddharth,
>
> On 10/14/2026 4:02 PM, Siddharth Karanam wrote:
> > The previous version of the patch had a new header ti_sci_dev.h,
> > that mirrors ti_sci_proc.h in terms of the struct decl and
> > its helper function structure, with the goal of abstracting
> > all ti_sci_handle's members like ti_sci_dev_ops from being
> > invoked directly in the driver code.
> >
> > Upon discussing in the original patch thread, it seemed
> > better to combine ti_sci_proc.h and ti_sci_dev.h's structs
> > and merge all their helpers into a single header. That is
> > what ti_sci_ctrl.h aims to do: It has the union of tsd
> > (ti_sci_dev) and tsp (ti_sci_proc) and both their helper
> > functions are prefixed with ti_sci_ctrl_dev and
> > ti_sci_ctrl_proc respectively.
>
>
> You can put this changelog in diffstat. We may not need this info in
> commit message.
>
> >
> > The goal of the patch is to maintain a single source
> > of origin for all ti_sci_dev/proc_ops call sites. Any stray calls
> > to dev_ops/proc_ops function pointer members in driver code should
> > eventually be abstracted through this header.
> >
> > In the future we can try to abstract tsd's dev_ops even further
> > through pm_runtime, but there are some roadblocks that
>
>
> Since a RFC is posted, you can drop this part of the text and just
> mention we could switch to pm runtime calls in the future.
>
> > I am unaware of, so that warranties a different patch.
> >
> > Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
> > ---
> >   drivers/remoteproc/ti_k3_common.c         |  17 +--
> >   drivers/remoteproc/ti_k3_common.h         |   6 +-
> >   drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
> >   drivers/remoteproc/ti_k3_m4_remoteproc.c  |  24 ++-
> >   drivers/remoteproc/ti_k3_r5_remoteproc.c  |  58 +++----
> >   drivers/remoteproc/ti_sci_ctrl.h          | 177 +++++++++++++++++++++=
+
> >   drivers/remoteproc/ti_sci_dev.h           |  82 ----------
> >   drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
> >   8 files changed, 231 insertions(+), 289 deletions(-)
> >   create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
> >   delete mode 100644 drivers/remoteproc/ti_sci_dev.h
> >   delete mode 100644 drivers/remoteproc/ti_sci_proc.h
> >
> > diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_=
k3_common.c
> > index befa9a9bea3a..f778ae545bde 100644
> > --- a/drivers/remoteproc/ti_k3_common.c
> > +++ b/drivers/remoteproc/ti_k3_common.c
> > @@ -32,8 +32,7 @@
> >
> >   #include "omap_remoteproc.h"
> >   #include "remoteproc_internal.h"
> > -#include "ti_sci_dev.h"
> > -#include "ti_sci_proc.h"
> > +#include "ti_sci_ctrl.h"
> >   #include "ti_k3_common.h"
> >
> >   /**
> > @@ -121,7 +120,7 @@ int k3_rproc_reset(struct k3_rproc *kproc)
> >               if (ret)
> >                       dev_err(dev, "local-reset assert failed (%pe)\n",=
 ERR_PTR(ret));
> >       } else {
> > -             ret =3D ti_sci_dev_put_device(kproc->tsd);
> > +             ret =3D ti_sci_ctrl_dev_put_device(kproc->tsc);
> >               if (ret)
> >                       dev_err(dev, "module-reset assert failed (%pe)\n"=
, ERR_PTR(ret));
> >       }
> > @@ -140,11 +139,11 @@ int k3_rproc_release(struct k3_rproc *kproc)
> >               ret =3D reset_control_deassert(kproc->reset);
> >               if (ret) {
> >                       dev_err(dev, "local-reset deassert failed, (%pe)\=
n", ERR_PTR(ret));
> > -                     if (ti_sci_dev_put_device(kproc->tsd))
> > +                     if (ti_sci_ctrl_dev_put_device(kproc->tsc))
> >                               dev_warn(dev, "module-reset assert back f=
ailed\n");
> >               }
> >       } else {
> > -             ret =3D ti_sci_dev_get_device(kproc->tsd);
> > +             ret =3D ti_sci_ctrl_dev_get_device(kproc->tsc);
> >               if (ret)
> >                       dev_err(dev, "module-reset deassert failed (%pe)\=
n", ERR_PTR(ret));
> >       }
> > @@ -221,7 +220,7 @@ int k3_rproc_prepare(struct rproc *rproc)
> >               }
> >       }
> >
> > -     ret =3D ti_sci_dev_get_device(kproc->tsd);
> > +     ret =3D ti_sci_ctrl_dev_get_device(kproc->tsc);
> >       if (ret) {
> >               dev_err(dev, "could not deassert module-reset for interna=
l RAM loading\n");
> >               return ret;
> > @@ -250,7 +249,7 @@ int k3_rproc_unprepare(struct rproc *rproc)
> >       if (rproc->state =3D=3D RPROC_DETACHED)
> >               return 0;
> >
> > -     ret =3D ti_sci_dev_put_device(kproc->tsd);
> > +     ret =3D ti_sci_ctrl_dev_put_device(kproc->tsc);
> >       if (ret) {
> >               dev_err(dev, "module-reset assert failed\n");
> >               return ret;
> > @@ -528,9 +527,9 @@ EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
> >
> >   void k3_release_tsp(void *data)
>
>
> Function needs to be renamed.
>
> >   {
> > -     struct ti_sci_proc *tsp =3D data;
> > +     struct ti_sci_ctrl *tsc =3D data;
> >
> > -     ti_sci_proc_release(tsp);
> > +     ti_sci_ctrl_proc_release(tsc);
> >   }
> >   EXPORT_SYMBOL_GPL(k3_release_tsp);
> >
> > diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_=
k3_common.h
> > index 7ba0903ebe0a..f4b9bb0fa0f0 100644
> > --- a/drivers/remoteproc/ti_k3_common.h
> > +++ b/drivers/remoteproc/ti_k3_common.h
> > @@ -71,8 +71,7 @@ struct k3_rproc_dev_data {
> >    * @num_rmems: number of reserved memory regions
> >    * @reset: reset control handle
> >    * @data: pointer to DSP-specific device data
> > - * @tsp: TI-SCI processor control handle
> > - * @tsd: TI-SCI device control handle
> > + * @tsc: TI-SCI control handle
> >    * @ti_sci: TI-SCI handle
> >    * @mbox: mailbox channel handle
> >    * @client: mailbox client to request the mailbox channel
> > @@ -87,8 +86,7 @@ struct k3_rproc {
> >       int num_rmems;
> >       struct reset_control *reset;
> >       const struct k3_rproc_dev_data *data;
> > -     struct ti_sci_proc *tsp;
> > -     struct ti_sci_dev *tsd;
> > +     struct ti_sci_ctrl *tsc;
> >       const struct ti_sci_handle *ti_sci;
> >       struct mbox_chan *mbox;
> >       struct mbox_client client;
> > diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remote=
proc/ti_k3_dsp_remoteproc.c
> > index b6042fe7bae7..6cbf21c82e85 100644
> > --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > @@ -19,8 +19,7 @@
> >
> >   #include "omap_remoteproc.h"
> >   #include "remoteproc_internal.h"
> > -#include "ti_sci_dev.h"
> > -#include "ti_sci_proc.h"
> > +#include "ti_sci_ctrl.h"
> >   #include "ti_k3_common.h"
> >
> >   /*
> > @@ -45,7 +44,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
> >       }
> >
> >       dev_dbg(dev, "booting DSP core using boot addr =3D 0x%x\n", boot_=
addr);
> > -     ret =3D ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
> > +     ret =3D ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0);
> >       if (ret)
> >               return ret;
> >
> > @@ -115,22 +114,17 @@ static int k3_dsp_rproc_probe(struct platform_dev=
ice *pdev)
> >               return dev_err_probe(dev, PTR_ERR(kproc->reset),
> >                                    "failed to get reset\n");
> >
> > -     kproc->tsp =3D ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
> > -     if (IS_ERR(kproc->tsp))
> > -             return dev_err_probe(dev, PTR_ERR(kproc->tsp),
> > -                                  "failed to construct ti-sci proc con=
trol\n");
> > +     kproc->tsc =3D ti_sci_ctrl_of_get(dev, kproc->ti_sci);
> > +     if (IS_ERR(kproc->tsc))
> > +             return dev_err_probe(dev, PTR_ERR(kproc->tsc),
> > +                                  "failed to get construct ti-sci cont=
rol\n");
> >
> > -     kproc->tsd =3D ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> > -     if (IS_ERR(kproc->tsd))
> > -             return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> > -                                  "failed to construct ti-sci dev cont=
rol\n");
> > -
> > -     ret =3D ti_sci_proc_request(kproc->tsp);
> > +     ret =3D ti_sci_ctrl_proc_request(kproc->tsc);
> >       if (ret < 0) {
> > -             dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
> > +             dev_err_probe(dev, ret, "ti_sci_ctrl_proc_request failed\=
n");
> >               return ret;
> >       }
> > -     ret =3D devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp)=
;
> > +     ret =3D devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsc)=
;
> >       if (ret)
> >               return ret;
> >
> > @@ -142,7 +136,7 @@ static int k3_dsp_rproc_probe(struct platform_devic=
e *pdev)
> >       if (ret)
> >               return dev_err_probe(dev, ret, "reserved memory init fail=
ed\n");
> >
> > -     ret =3D ti_sci_dev_is_on(kproc->tsd, NULL, &p_state);
> > +     ret =3D ti_sci_ctrl_dev_is_on(kproc->tsc, NULL, &p_state);
> >       if (ret)
> >               return dev_err_probe(dev, ret, "failed to get initial sta=
te, mode cannot be determined\n");
> >
> > diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remotep=
roc/ti_k3_m4_remoteproc.c
> > index ddf8cb9974ca..9c789a92d083 100644
> > --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > @@ -18,8 +18,7 @@
> >
> >   #include "omap_remoteproc.h"
> >   #include "remoteproc_internal.h"
> > -#include "ti_sci_dev.h"
> > -#include "ti_sci_proc.h"
> > +#include "ti_sci_ctrl.h"
> >   #include "ti_k3_common.h"
> >
> >   static const struct rproc_ops k3_m4_rproc_ops =3D {
> > @@ -75,20 +74,15 @@ static int k3_m4_rproc_probe(struct platform_device=
 *pdev)
> >       if (IS_ERR(kproc->reset))
> >               return dev_err_probe(dev, PTR_ERR(kproc->reset), "failed =
to get reset\n");
> >
> > -     kproc->tsp =3D ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
> > -     if (IS_ERR(kproc->tsp))
> > -             return dev_err_probe(dev, PTR_ERR(kproc->tsp),
> > -                                  "failed to construct ti-sci proc con=
trol\n");
> > +     kproc->tsc =3D ti_sci_ctrl_of_get(dev, kproc->ti_sci);
> > +     if (IS_ERR(kproc->tsc))
> > +             return dev_err_probe(dev, PTR_ERR(kproc->tsc),
> > +                                  "failed to construct ti-sci control\=
n");
> >
> > -     kproc->tsd =3D ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
> > -     if (IS_ERR(kproc->tsd))
> > -             return dev_err_probe(dev, PTR_ERR(kproc->tsd),
> > -                                  "failed to construct ti-sci dev cont=
rol\n");
> > -
> > -     ret =3D ti_sci_proc_request(kproc->tsp);
> > +     ret =3D ti_sci_ctrl_proc_request(kproc->tsc);
> >       if (ret < 0)
> > -             return dev_err_probe(dev, ret, "ti_sci_proc_request faile=
d\n");
> > -     ret =3D devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp)=
;
> > +             return dev_err_probe(dev, ret, "ti_sci_ctrl_proc_request =
failed\n");
> > +     ret =3D devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsc)=
;
> >       if (ret)
> >               return ret;
> >
> > @@ -100,7 +94,7 @@ static int k3_m4_rproc_probe(struct platform_device =
*pdev)
> >       if (ret)
> >               return dev_err_probe(dev, ret, "reserved memory init fail=
ed\n");
> >
> > -     ret =3D ti_sci_dev_is_on(kproc->tsd, &r_state, &p_state);
> > +     ret =3D ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &p_state);
> >       if (ret)
> >               return dev_err_probe(dev, ret,
> >                                    "failed to get initial state, mode c=
annot be determined\n");
> > diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remotep=
roc/ti_k3_r5_remoteproc.c
> > index a387848ac400..caeeb18581d0 100644
> > --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > @@ -25,8 +25,7 @@
> >
> >   #include "omap_remoteproc.h"
> >   #include "remoteproc_internal.h"
> > -#include "ti_sci_dev.h"
> > -#include "ti_sci_proc.h"
> > +#include "ti_sci_ctrl.h"
> >   #include "ti_k3_common.h"
> >
> >   /* This address can either be for ATCM or BTCM with the other at addr=
ess 0x0 */
> > @@ -141,7 +140,7 @@ static int k3_r5_split_reset(struct k3_rproc *kproc=
)
> >               return ret;
> >       }
> >
> > -     ret =3D ti_sci_dev_put_device(kproc->tsd);
> > +     ret =3D ti_sci_ctrl_dev_put_device(kproc->tsc);
> >       if (ret) {
> >               dev_err(kproc->dev, "module-reset assert failed, ret =3D =
%d\n",
> >                       ret);
> > @@ -156,7 +155,7 @@ static int k3_r5_split_release(struct k3_rproc *kpr=
oc)
> >   {
> >       int ret;
> >
> > -     ret =3D ti_sci_dev_get_device(kproc->tsd);
> > +     ret =3D ti_sci_ctrl_dev_get_device(kproc->tsc);
> >       if (ret) {
> >               dev_err(kproc->dev, "module-reset deassert failed, ret =
=3D %d\n",
> >                       ret);
> > @@ -167,7 +166,7 @@ static int k3_r5_split_release(struct k3_rproc *kpr=
oc)
> >       if (ret) {
> >               dev_err(kproc->dev, "local-reset deassert failed, ret =3D=
 %d\n",
> >                       ret);
> > -             if (ti_sci_dev_put_device(kproc->tsd))
> > +             if (ti_sci_ctrl_dev_put_device(kproc->tsc))
> >                       dev_warn(kproc->dev, "module-reset assert back fa=
iled\n");
> >       }
> >
> > @@ -194,7 +193,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluste=
r *cluster)
> >       /* disable PSC modules on all applicable cores */
> >       list_for_each_entry(core, &cluster->cores, elem) {
> >               kproc =3D core->kproc;
> > -             ret =3D ti_sci_dev_put_device(kproc->tsd);
> > +             ret =3D ti_sci_ctrl_dev_put_device(kproc->tsc);
> >               if (ret) {
> >                       dev_err(core->dev, "module-reset assert failed, r=
et =3D %d\n",
> >                               ret);
> > @@ -207,7 +206,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluste=
r *cluster)
> >   unroll_module_reset:
> >       list_for_each_entry_continue_reverse(core, &cluster->cores, elem)=
 {
> >               kproc =3D core->kproc;
> > -             if (ti_sci_dev_put_device(kproc->tsd))
> > +             if (ti_sci_ctrl_dev_put_device(kproc->tsc))
> >                       dev_warn(core->dev, "module-reset assert back fai=
led\n");
> >       }
> >       core =3D list_last_entry(&cluster->cores, struct k3_r5_core, elem=
);
> > @@ -229,7 +228,7 @@ static int k3_r5_lockstep_release(struct k3_r5_clus=
ter *cluster)
> >       /* enable PSC modules on all applicable cores */
> >       list_for_each_entry_reverse(core, &cluster->cores, elem) {
> >               kproc =3D core->kproc;
> > -             ret =3D ti_sci_dev_get_device(kproc->tsd);
> > +             ret =3D ti_sci_ctrl_dev_get_device(kproc->tsc);
> >               if (ret) {
> >                       dev_err(core->dev, "module-reset deassert failed,=
 ret =3D %d\n",
> >                               ret);
> > @@ -259,7 +258,7 @@ static int k3_r5_lockstep_release(struct k3_r5_clus=
ter *cluster)
> >   unroll_module_reset:
> >       list_for_each_entry_from(core, &cluster->cores, elem) {
> >               kproc =3D core->kproc;
> > -             if (ti_sci_dev_put_device(kproc->tsd))
> > +             if (ti_sci_ctrl_dev_put_device(kproc->tsc))
> >                       dev_warn(core->dev, "module-reset assert back fai=
led\n");
> >       }
> >
> > @@ -268,13 +267,13 @@ static int k3_r5_lockstep_release(struct k3_r5_cl=
uster *cluster)
> >
> >   static inline int k3_r5_core_halt(struct k3_rproc *kproc)
> >   {
> > -     return ti_sci_proc_set_control(kproc->tsp,
> > +     return ti_sci_ctrl_proc_set_control(kproc->tsc,
> >                                      PROC_BOOT_CTRL_FLAG_R5_CORE_HALT, =
0);
> >   }
> >
> >   static inline int k3_r5_core_run(struct k3_rproc *kproc)
> >   {
> > -     return ti_sci_proc_set_control(kproc->tsp,
> > +     return ti_sci_ctrl_proc_set_control(kproc->tsc,
> >                                      0, PROC_BOOT_CTRL_FLAG_R5_CORE_HAL=
T);
> >   }
> >
> > @@ -328,7 +327,7 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
> >               }
> >       }
> >
> > -     ret =3D ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl=
, &stat);
> > +     ret =3D ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg, =
&ctrl, &stat);
> >       if (ret < 0)
> >               return ret;
> >       mem_init_dis =3D !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
> > @@ -469,7 +468,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> >       dev_dbg(dev, "booting R5F core using boot addr =3D 0x%x\n", boot_=
addr);
> >
> >       /* boot vector need not be programmed for Core1 in LockStep mode =
*/
> > -     ret =3D ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
> > +     ret =3D ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0);
> >       if (ret)
> >               return ret;
> >
> > @@ -612,7 +611,7 @@ static const struct rproc_ops k3_r5_rproc_ops =3D {
> >    * by the System Processor.
> >    *
> >    * This function is used to pre-configure these settings for each R5F=
 core, and
> > - * the configuration is all done through various ti_sci_proc functions=
 that
> > + * the configuration is all done through various ti_sci_ctrl functions=
 that
> >    * communicate with the System Processor. The function also ensures t=
hat both
> >    * the cores are halted before the .prepare() step.
> >    *
> > @@ -654,7 +653,7 @@ static int k3_r5_rproc_configure(struct k3_rproc *k=
proc)
> >               core =3D kproc->priv;
> >       }
> >
> > -     ret =3D ti_sci_proc_get_status(core->kproc->tsp, &boot_vec, &cfg,=
 &ctrl,
> > +     ret =3D ti_sci_ctrl_proc_get_status(core->kproc->tsc, &boot_vec, =
&cfg, &ctrl,
> >                                    &stat);
>
>
> Here and everywhere else, fix the parantheses alignment:
>
> 258 +CHECK: Alignment should match open parenthesis
> 259 +#374: FILE: drivers/remoteproc/ti_k3_r5_remoteproc.c:652:
> 260 ++      ret =3D ti_sci_ctrl_proc_get_status(core->kproc->tsc,
> &boot_vec, &cfg, &ctrl,
> 261 +                                    &stat);
>
> >       if (ret < 0)
> >               return ret;
> > @@ -732,7 +731,7 @@ static int k3_r5_rproc_configure(struct k3_rproc *k=
proc)
> >                               clr_cfg &=3D ~PROC_BOOT_CFG_FLAG_R5_LOCKS=
TEP;
> >                               clr_cfg &=3D ~PROC_BOOT_CFG_FLAG_R5_TEINI=
T;
> >                       }
> > -                     ret =3D ti_sci_proc_set_config(temp->kproc->tsp, =
boot_vec,
> > +                     ret =3D ti_sci_ctrl_proc_set_config(temp->kproc->=
tsc, boot_vec,
> >                                                    set_cfg, clr_cfg);
> >                       if (ret)
> >                               goto out;
> > @@ -740,14 +739,14 @@ static int k3_r5_rproc_configure(struct k3_rproc =
*kproc)
> >
> >               set_cfg =3D PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
> >               clr_cfg =3D 0;
> > -             ret =3D ti_sci_proc_set_config(core->kproc->tsp, boot_vec=
,
> > +             ret =3D ti_sci_ctrl_proc_set_config(core->kproc->tsc, boo=
t_vec,
> >                                            set_cfg, clr_cfg);
> >       } else {
> >               ret =3D k3_r5_core_halt(core->kproc);
> >               if (ret)
> >                       goto out;
> >
> > -             ret =3D ti_sci_proc_set_config(core->kproc->tsp, boot_vec=
,
> > +             ret =3D ti_sci_ctrl_proc_set_config(core->kproc->tsc, boo=
t_vec,
> >                                            set_cfg, clr_cfg);
> >       }
> >
> > @@ -821,7 +820,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rpr=
oc *kproc)
> >
> >       core0 =3D list_first_entry(&cluster->cores, struct k3_r5_core, el=
em);
> >
> > -     ret =3D ti_sci_dev_is_on(kproc->tsd, &r_state, &c_state);
> > +     ret =3D ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &c_state);
> >       if (ret) {
> >               dev_err(cdev, "failed to get initial state, mode cannot b=
e determined, ret =3D %d\n",
> >                       ret);
> > @@ -845,7 +844,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rpr=
oc *kproc)
> >        */
> >       core->released_from_reset =3D c_state;
> >
> > -     ret =3D ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl=
,
> > +     ret =3D ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg, =
&ctrl,
> >                                    &stat);
> >       if (ret < 0) {
> >               dev_err(cdev, "failed to get initial processor status, re=
t =3D %d\n",
> > @@ -1065,17 +1064,10 @@ static int k3_r5_cluster_rproc_init(struct plat=
form_device *pdev)
> >                       goto out;
> >               }
> >
> > -             kproc->tsp =3D ti_sci_proc_of_get_tsp(cdev, kproc->ti_sci=
);
> > -             if (IS_ERR(kproc->tsp)) {
> > -                     ret =3D dev_err_probe(cdev, PTR_ERR(kproc->tsp),
> > -                                         "failed to construct ti-sci p=
roc control\n");
> > -                     goto out;
> > -             }
> > -
> > -             kproc->tsd =3D ti_sci_dev_of_get_tsd(cdev, kproc->ti_sci)=
;
> > -             if (IS_ERR(kproc->tsd)) {
> > -                     ret =3D dev_err_probe(cdev, PTR_ERR(kproc->tsd),
> > -                                         "failed to construct ti-sci d=
ev control\n");
> > +             kproc->tsc =3D ti_sci_ctrl_of_get(cdev, kproc->ti_sci);
> > +             if (IS_ERR(kproc->tsc)) {
> > +                     ret =3D dev_err_probe(cdev, PTR_ERR(kproc->tsc),
> > +                                         "failed to construct ti-sci c=
ontrol\n");
> >                       goto out;
> >               }
> >
> > @@ -1086,13 +1078,13 @@ static int k3_r5_cluster_rproc_init(struct plat=
form_device *pdev)
> >                       goto out;
> >               }
> >
> > -             ret =3D ti_sci_proc_request(kproc->tsp);
> > +             ret =3D ti_sci_ctrl_proc_request(kproc->tsc);
> >               if (ret < 0) {
> >                       dev_err(cdev, "ti_sci_proc_request failed, ret =
=3D %d\n", ret);
>
>
> s/ti_sci_proc_request/ti_sci_ctrl_proc_request
>
> >                       goto out;
> >               }
> >
> > -             ret =3D devm_add_action_or_reset(cdev, k3_release_tsp, kp=
roc->tsp);
> > +             ret =3D devm_add_action_or_reset(cdev, k3_release_tsp, kp=
roc->tsc);
> >               if (ret)
> >                       goto out;
> >       }
> > diff --git a/drivers/remoteproc/ti_sci_ctrl.h b/drivers/remoteproc/ti_s=
ci_ctrl.h
> > new file mode 100644
> > index 000000000000..76aee8c5317a
> > --- /dev/null
> > +++ b/drivers/remoteproc/ti_sci_ctrl.h
> > @@ -0,0 +1,177 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Texas Instruments TI-SCI Processor Controller Helper Functions
>
>
> Processor and Device
>
> > + *
> > + * Copyright (C) 2018-2026 Texas Instruments Incorporated - https://ww=
w.ti.com/
> > + *   Suman Anna <s-anna@ti.com>
> > + */
> > +
> > +#ifndef REMOTEPROC_TI_SCI_CTRL_H
> > +#define REMOTEPROC_TI_SCI_CTRL_H
> > +
> > +#include <linux/of.h>
> > +#include <linux/soc/ti/ti_sci_protocol.h>
> > +
> > +/**
> > + * struct ti_sci_ctrl - structure representing a remoteproc control cl=
ient
> > + * @sci: cached TI-SCI protocol handle
> > + * @dev: cached client device pointer
> > + * @dev_ops: cached TI-SCI device ops
> > + * @proc_ops: cached TI-SCI proc ops
> > + * @dev_id: TI-SCI device id for the consumer remoteproc device
> > + * @proc_id: processor id for the consumer remoteproc device
> > + * @host_id: host id to pass the control over for this consumer remote=
proc
> > + *        device
> > + */
> > +struct ti_sci_ctrl {
> > +     const struct ti_sci_handle *sci;
> > +     struct device *dev;
> > +     const struct ti_sci_dev_ops *dev_ops;
> > +     const struct ti_sci_proc_ops *proc_ops;
> > +     u32 dev_id;
> > +     u8 proc_id;
> > +     u8 host_id;
> > +};
> > +
> > +static inline
> > +struct ti_sci_ctrl *ti_sci_ctrl_of_get(struct device *dev,
> > +                                    const struct ti_sci_handle *sci)
> > +{
> > +     struct ti_sci_ctrl *tsc;
> > +     u32 proc_ids[2];
> > +     int ret;
> > +
> > +     tsc =3D devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
> > +     if (!tsc)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     ret =3D of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
> > +                                &tsc->dev_id);
> > +     if (ret < 0)
> > +             return ERR_PTR(ret);
> > +
> > +     ret =3D of_property_read_u32_array(dev_of_node(dev), "ti,sci-proc=
-ids",
> > +                                      proc_ids, 2);
> > +     if (ret < 0)
> > +             return ERR_PTR(ret);
> > +
> > +     tsc->dev =3D dev;
> > +     tsc->sci =3D sci;
> > +     tsc->dev_ops =3D &sci->ops.dev_ops;
> > +     tsc->proc_ops =3D &sci->ops.proc_ops;
> > +     tsc->proc_id =3D proc_ids[0];
> > +     tsc->host_id =3D proc_ids[1];
> > +
> > +     return tsc;
> > +}
> > +
> > +/* Power-management helper functions */
> > +static inline int ti_sci_ctrl_dev_is_on(struct ti_sci_ctrl *tsc, bool =
*r_state,
> > +                                 bool *c_state)
> > +{
> > +     int ret;
> > +
> > +     ret =3D tsc->dev_ops->is_on(tsc->sci, tsc->dev_id, r_state, c_sta=
te);
> > +     if (ret)
> > +             dev_err(tsc->dev, "ti-sci device is_on failed: %d\n", ret=
);
> > +     return ret;
> > +}
> > +
> > +/* Request power on to rproc */
> > +static inline int ti_sci_ctrl_dev_get_device(struct ti_sci_ctrl *tsc)
> > +{
> > +     int ret =3D 0;
>
>
> Initialization not needed.
>
> > +
> > +     ret =3D tsc->dev_ops->get_device(tsc->sci, tsc->dev_id);
> > +     if (ret)
> > +             dev_err(tsc->dev, "ti-sci device get failed: %d\n", ret);
> > +     return ret;
> > +}
> > +
> > +/* Request power off to a rproc */
> > +static inline int ti_sci_ctrl_dev_put_device(struct ti_sci_ctrl *tsc)
> > +{
> > +     int ret =3D 0;
>
>
> Initialization not needed.
>
> > +
> > +     ret =3D tsc->dev_ops->put_device(tsc->sci, tsc->dev_id);
> > +     if (ret)
> > +             dev_err(tsc->dev, "ti-sci device put failed: %d\n", ret);
> > +     return ret;
> > +}
> > +
> > +/* Processor control helper functions */
> > +static inline int ti_sci_ctrl_proc_request(struct ti_sci_ctrl *tsc)
> > +{
> > +     int ret;
> > +
> > +     ret =3D tsc->proc_ops->request(tsc->sci, tsc->proc_id);
> > +     if (ret)
> > +             dev_err(tsc->dev, "ti-sci processor request failed: %d\n"=
,
> > +                     ret);
>
>
> Here and everywhere else, can you add an empty line before return
> statement? No hard and fast rule, but this has been followed
> throughout the existing TI remoteproc drivers.
>
> Thanks,
> Beleswar
>
> > +     return ret;
> > +}
> > +
> > +static inline int ti_sci_ctrl_proc_release(struct ti_sci_ctrl *tsc)
> > +{
> > +     int ret;
> > +
> > +     ret =3D tsc->proc_ops->release(tsc->sci, tsc->proc_id);
> > +     if (ret)
> > +             dev_err(tsc->dev, "ti-sci processor release failed: %d\n"=
,
> > +                     ret);
> > +     return ret;
> > +}
> > +
> > +static inline int ti_sci_ctrl_proc_handover(struct ti_sci_ctrl *tsc)
> > +{
> > +     int ret;
> > +
> > +     ret =3D tsc->proc_ops->handover(tsc->sci, tsc->proc_id, tsc->host=
_id);
> > +     if (ret)
> > +             dev_err(tsc->dev, "ti-sci processor handover of %d to %d =
failed: %d\n",
> > +                     tsc->proc_id, tsc->host_id, ret);
> > +     return ret;
> > +}
> > +
> > +static inline int ti_sci_ctrl_proc_set_config(struct ti_sci_ctrl *tsc,
> > +                                      u64 boot_vector,
> > +                                      u32 cfg_set, u32 cfg_clr)
> > +{
> > +     int ret;
> > +
> > +     ret =3D tsc->proc_ops->set_config(tsc->sci, tsc->proc_id, boot_ve=
ctor,
> > +                                     cfg_set, cfg_clr);
> > +     if (ret)
> > +             dev_err(tsc->dev, "ti-sci processor set_config failed: %d=
\n",
> > +                     ret);
> > +     return ret;
> > +}
> > +
> > +static inline int ti_sci_ctrl_proc_set_control(struct ti_sci_ctrl *tsc=
,
> > +                                       u32 ctrl_set, u32 ctrl_clr)
> > +{
> > +     int ret;
> > +
> > +     ret =3D tsc->proc_ops->set_control(tsc->sci, tsc->proc_id, ctrl_s=
et,
> > +                                      ctrl_clr);
> > +     if (ret)
> > +             dev_err(tsc->dev, "ti-sci processor set_control failed: %=
d\n",
> > +                     ret);
> > +     return ret;
> > +}
> > +
> > +static inline int ti_sci_ctrl_proc_get_status(struct ti_sci_ctrl *tsc,
> > +                                      u64 *boot_vector, u32 *cfg_flags=
,
> > +                                      u32 *ctrl_flags, u32 *status_fla=
gs)
> > +{
> > +     int ret;
> > +
> > +     ret =3D tsc->proc_ops->get_status(tsc->sci, tsc->proc_id, boot_ve=
ctor,
> > +                                     cfg_flags, ctrl_flags, status_fla=
gs);
> > +     if (ret)
> > +             dev_err(tsc->dev, "ti-sci processor get_status failed: %d=
\n",
> > +                     ret);
> > +     return ret;
> > +}
> > +
> > +#endif /* REMOTEPROC_TI_SCI_CTRL_H */
> > diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_sc=
i_dev.h
> > deleted file mode 100644
> > index 897998a97d7f..000000000000
> > --- a/drivers/remoteproc/ti_sci_dev.h
> > +++ /dev/null
> > @@ -1,82 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * Texas Instruments TI-SCI Device Controller Helper Functions
> > - *
> > - * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.=
com/
> > - */
> > -
> > -#ifndef REMOTEPROC_TI_SCI_DEV_H
> > -#define REMOTEPROC_TI_SCI_DEV_H
> > -
> > -#include <linux/soc/ti/ti_sci_protocol.h>
> > -#include <linux/pm_runtime.h>
> > -
> > -/**
> > - * struct ti_sci_dev - structure representing a device control client
> > - * @sci: cached TI-SCI protocol handle
> > - * @ops: cached TI-SCI device ops
> > - * @dev: cached client device pointer
> > - * @dev_id: TI-SCI device id for the consumer remoteproc device
> > - */
> > -struct ti_sci_dev {
> > -     const struct ti_sci_handle *sci;
> > -     const struct ti_sci_dev_ops *ops;
> > -     struct device *dev;
> > -     u32 dev_id;
> > -};
> > -
> > -static inline
> > -struct ti_sci_dev *ti_sci_dev_of_get_tsd(struct device *dev,
> > -                                      const struct ti_sci_handle *sci)
> > -{
> > -     struct ti_sci_dev *tsd;
> > -     int ret;
> > -
> > -     tsd =3D devm_kzalloc(dev, sizeof(*tsd), GFP_KERNEL);
> > -     if (!tsd)
> > -             return ERR_PTR(-ENOMEM);
> > -
> > -     ret =3D of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
> > -                                &tsd->dev_id);
> > -     if (ret < 0)
> > -             return ERR_PTR(ret);
> > -
> > -     tsd->dev =3D dev;
> > -     tsd->sci =3D sci;
> > -     tsd->ops =3D &sci->ops.dev_ops;
> > -
> > -     return tsd;
> > -}
> > -
> > -static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_sta=
te,
> > -                                bool *c_state)
> > -{
> > -     int ret;
> > -
> > -     ret =3D tsd->ops->is_on(tsd->sci, tsd->dev_id, r_state, c_state);
> > -     if (ret)
> > -             dev_err(tsd->dev, "ti-sci device is_on failed: %d\n", ret=
);
> > -     return ret;
> > -}
> > -
> > -static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
> > -{
> > -     int ret;
> > -
> > -     ret =3D tsd->ops->get_device(tsd->sci, tsd->dev_id);
> > -     if (ret)
> > -             dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret);
> > -     return ret;
> > -}
> > -
> > -static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
> > -{
> > -     int ret;
> > -
> > -     ret =3D tsd->ops->put_device(tsd->sci, tsd->dev_id);
> > -     if (ret)
> > -             dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret);
> > -     return ret;
> > -}
> > -
> > -#endif /* REMOTEPROC_TI_SCI_DEV_H */
> > diff --git a/drivers/remoteproc/ti_sci_proc.h b/drivers/remoteproc/ti_s=
ci_proc.h
> > deleted file mode 100644
> > index f3911ce75252..000000000000
> > --- a/drivers/remoteproc/ti_sci_proc.h
> > +++ /dev/null
> > @@ -1,130 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * Texas Instruments TI-SCI Processor Controller Helper Functions
> > - *
> > - * Copyright (C) 2018-2020 Texas Instruments Incorporated - https://ww=
w.ti.com/
> > - *   Suman Anna <s-anna@ti.com>
> > - */
> > -
> > -#ifndef REMOTEPROC_TI_SCI_PROC_H
> > -#define REMOTEPROC_TI_SCI_PROC_H
> > -
> > -#include <linux/soc/ti/ti_sci_protocol.h>
> > -
> > -/**
> > - * struct ti_sci_proc - structure representing a processor control cli=
ent
> > - * @sci: cached TI-SCI protocol handle
> > - * @ops: cached TI-SCI proc ops
> > - * @dev: cached client device pointer
> > - * @proc_id: processor id for the consumer remoteproc device
> > - * @host_id: host id to pass the control over for this consumer remote=
proc
> > - *        device
> > - */
> > -struct ti_sci_proc {
> > -     const struct ti_sci_handle *sci;
> > -     const struct ti_sci_proc_ops *ops;
> > -     struct device *dev;
> > -     u8 proc_id;
> > -     u8 host_id;
> > -};
> > -
> > -static inline
> > -struct ti_sci_proc *ti_sci_proc_of_get_tsp(struct device *dev,
> > -                                        const struct ti_sci_handle *sc=
i)
> > -{
> > -     struct ti_sci_proc *tsp;
> > -     u32 temp[2];
> > -     int ret;
> > -
> > -     ret =3D of_property_read_u32_array(dev_of_node(dev), "ti,sci-proc=
-ids",
> > -                                      temp, 2);
> > -     if (ret < 0)
> > -             return ERR_PTR(ret);
> > -
> > -     tsp =3D devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
> > -     if (!tsp)
> > -             return ERR_PTR(-ENOMEM);
> > -
> > -     tsp->dev =3D dev;
> > -     tsp->sci =3D sci;
> > -     tsp->ops =3D &sci->ops.proc_ops;
> > -     tsp->proc_id =3D temp[0];
> > -     tsp->host_id =3D temp[1];
> > -
> > -     return tsp;
> > -}
> > -
> > -static inline int ti_sci_proc_request(struct ti_sci_proc *tsp)
> > -{
> > -     int ret;
> > -
> > -     ret =3D tsp->ops->request(tsp->sci, tsp->proc_id);
> > -     if (ret)
> > -             dev_err(tsp->dev, "ti-sci processor request failed: %d\n"=
,
> > -                     ret);
> > -     return ret;
> > -}
> > -
> > -static inline int ti_sci_proc_release(struct ti_sci_proc *tsp)
> > -{
> > -     int ret;
> > -
> > -     ret =3D tsp->ops->release(tsp->sci, tsp->proc_id);
> > -     if (ret)
> > -             dev_err(tsp->dev, "ti-sci processor release failed: %d\n"=
,
> > -                     ret);
> > -     return ret;
> > -}
> > -
> > -static inline int ti_sci_proc_handover(struct ti_sci_proc *tsp)
> > -{
> > -     int ret;
> > -
> > -     ret =3D tsp->ops->handover(tsp->sci, tsp->proc_id, tsp->host_id);
> > -     if (ret)
> > -             dev_err(tsp->dev, "ti-sci processor handover of %d to %d =
failed: %d\n",
> > -                     tsp->proc_id, tsp->host_id, ret);
> > -     return ret;
> > -}
> > -
> > -static inline int ti_sci_proc_set_config(struct ti_sci_proc *tsp,
> > -                                      u64 boot_vector,
> > -                                      u32 cfg_set, u32 cfg_clr)
> > -{
> > -     int ret;
> > -
> > -     ret =3D tsp->ops->set_config(tsp->sci, tsp->proc_id, boot_vector,
> > -                                cfg_set, cfg_clr);
> > -     if (ret)
> > -             dev_err(tsp->dev, "ti-sci processor set_config failed: %d=
\n",
> > -                     ret);
> > -     return ret;
> > -}
> > -
> > -static inline int ti_sci_proc_set_control(struct ti_sci_proc *tsp,
> > -                                       u32 ctrl_set, u32 ctrl_clr)
> > -{
> > -     int ret;
> > -
> > -     ret =3D tsp->ops->set_control(tsp->sci, tsp->proc_id, ctrl_set, c=
trl_clr);
> > -     if (ret)
> > -             dev_err(tsp->dev, "ti-sci processor set_control failed: %=
d\n",
> > -                     ret);
> > -     return ret;
> > -}
> > -
> > -static inline int ti_sci_proc_get_status(struct ti_sci_proc *tsp,
> > -                                      u64 *boot_vector, u32 *cfg_flags=
,
> > -                                      u32 *ctrl_flags, u32 *status_fla=
gs)
> > -{
> > -     int ret;
> > -
> > -     ret =3D tsp->ops->get_status(tsp->sci, tsp->proc_id, boot_vector,
> > -                                cfg_flags, ctrl_flags, status_flags);
> > -     if (ret)
> > -             dev_err(tsp->dev, "ti-sci processor get_status failed: %d=
\n",
> > -                     ret);
> > -     return ret;
> > -}
> > -
> > -#endif /* REMOTEPROC_TI_SCI_PROC_H */
