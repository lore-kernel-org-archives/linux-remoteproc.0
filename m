Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8A0440C;
	Mon, 23 Sep 2024 00:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727051264; cv=none; b=CvyiQOyaNYiY99zuEeNlfVjtDBJMdwJtypyQ9VF6XVMwsR+WSWscDWxAZTwDKLdjrNHamR7KQ4HNaBg3tYP12qFElhDMp3XyBOtrzP2z2TZ7fAEJLJsoi+Z3J8dza6NMEUW3DQdjy9RrasY8Vqz5p+Fm673qOp7xNPTeTnkdq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727051264; c=relaxed/simple;
	bh=aL78BZDaoWZUZ1YJgTDX8gjk5xYnKqBAzqLQEEwvJsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tssG0QwVipr9Yvohf8upY1yLdgPvPTDiiRcG/4/R+PWQ4CTWjkMfV7neRZGaajy9dudIJu4skI65ylo//IBlsPq49nMDxZLEgSkb2bUFITWFiOMow3S6UhCKAbwhA2fuCbUhvOqISrLQPybcQ56CzShDHUIxs3JUfDzOCKzGImQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if1ExWLg; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if1ExWLg"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5dc93fa5639so1999266eaf.1;
        Sun, 22 Sep 2024 17:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727051262; x=1727656062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdY+MYWRg3TLdJXc8f3o+FqyhQCsEobdYFbNaMpFW1Y=;
        b=if1ExWLgJ5U4zjaryb4hLk1nY4hjufmy0KRJzUBJ3nzF/ATir79r+Z9+E0I4pyRZ3d
         J2GIBR4IE34CcsUgBm+jQ7RfPK9hvLtufRc/x1tSTZz5IcakSC2AsiVUQ3/Up3Et0b/X
         aPeZZ+HLfdUAhndop43GEZkkOkz3OZrq1uUhQJ3bO/ttQ9I+X6B+2GlwnuwULoSetjbU
         aufEzIXyI6eAsX7l0bV0wo/8NeLy6BGfkaZXB31pcHsbRF1ZegcEaoU3fVsP9oloX6QT
         wyuMXgHDjd1BGBDcJAG/V0/dOXc6MUItGzAwE0Ap+s4ma2nDLL83dco1XFkavIEUtUsD
         doYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727051262; x=1727656062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdY+MYWRg3TLdJXc8f3o+FqyhQCsEobdYFbNaMpFW1Y=;
        b=HFPWTRzEe6aKRDy0Zqb1/03qG1txYVjqozcVXGu3QMOMgUaxDuBHZPqz3Rat6j02FX
         Gbg+0Y5gF+UrwQwgRWED2O0KtExyCnArOPzj3i+6Ztsxe96lEcrUUOtEgLJ6fsLY6/0j
         7t6IDQevxF9SFmGiTpSJ3ZXJBmCDUOooCGjE4VjofZGjHDhc6SbwZ1EnF2QYAeWIxke4
         Nk7bTNdi7nb/m/KUryBJvqu/qjMASpuoZuaUBuqV+8xnqryQNypajhzcFrXINmSqK6Ed
         CBYwBDUVN9badklZAnWxeiazhn0yJFxMHy1CYG8ZailNEtZPSsvuWwOnlv5PKIsWJ32Q
         wW5g==
X-Forwarded-Encrypted: i=1; AJvYcCXODmnRXbNS5Ms37/aS7M1LL6uLfcxHFKJ1rgGL1oMBJX8cvegvoMwcCfoTL91x84oU9V7OExBS9ZjWKws=@vger.kernel.org, AJvYcCXwOKpZ+3LujHgPqO9eNCmPjG/4PSC2aAUB9m2IgZkS0umy8IimEJxal8intoBpBIuSCok6o7syI2XXVIgBGhBusg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4IlypRJL+8tiZqAM3PheK5mqI7rRJ8SKY4UXnGj9C4EBajHih
	5GyKkNCXAXno0b8+XXwUCJKRbPK3s3nBb0oiMFCqTI/t5SLo0Accsfstd0tLZZHWD7WeYxsu1ng
	e5RFbtWljk3o69qbjBOWWWON8/hQ=
X-Google-Smtp-Source: AGHT+IFhEqbijiM3PRdqqniVjygbihN9L9RupT1BgKcfwC59tyExYqeEJzHeFGNDEPAumd7dCXHUg7V80b3aW3Kr5Z0=
X-Received: by 2002:a05:6820:606:b0:5e1:e8c4:fb00 with SMTP id
 006d021491bc7-5e58ba91426mr4868164eaf.7.1727051261789; Sun, 22 Sep 2024
 17:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909203825.1666947-1-arnd@kernel.org>
In-Reply-To: <20240909203825.1666947-1-arnd@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 22 Sep 2024 19:27:29 -0500
Message-ID: <CABb+yY12GT6GmStDpoghwP4YL+UD+PAhTKTf1vuLjfiSpm65xw@mail.gmail.com>
Subject: Re: [PATCH] mailbox, remoteproc: omap2+: fix compile testing
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>, Martyn Welch <martyn.welch@collabora.com>, 
	Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 3:38=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Selecting CONFIG_OMAP2PLUS_MBOX while compile testing
> causes a build failure:
>
> WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
>   Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
>   Selected by [m]:
>   - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 || COMPIL=
E_TEST [=3Dy])
>
> Using 'select' to force-enable another subsystem is generally
> a mistake and causes problems such as this one, so change the
> three drivers that link against this driver to use 'depends on'
> instead, and ensure the driver itself can be compile tested
> regardless of the platform.
>
> When compile-testing without CONFIG_TI_SCI_PROTOCOL=3Dm, there
> is a chance for a link failure, so add a careful dependency
> on that.
>
> arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in functi=
on `k3_m4_rproc_probe':
> ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined reference=
 to `devm_ti_sci_get_by_phandle'
>
> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F =
subsystem")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mailbox/Kconfig        |  2 +-
>  drivers/mailbox/omap-mailbox.c |  2 +-
>  drivers/remoteproc/Kconfig     | 10 ++++------
>  3 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 4eed97295927..ecaf78beb934 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -73,7 +73,7 @@ config ARMADA_37XX_RWTM_MBOX
>
>  config OMAP2PLUS_MBOX
>         tristate "OMAP2+ Mailbox framework support"
> -       depends on ARCH_OMAP2PLUS || ARCH_K3
> +       depends on ARCH_OMAP2PLUS || ARCH_K3 || COMPILE_TEST
>         help
>           Mailbox implementation for OMAP family chips with hardware for
>           interprocessor communication involving DSP, IVA1.0 and IVA2 in
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbo=
x.c
> index 7a87424657a1..6797770474a5 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -603,7 +603,7 @@ static struct platform_driver omap_mbox_driver =3D {
>         .driver =3D {
>                 .name =3D "omap-mailbox",
>                 .pm =3D &omap_mbox_pm_ops,
> -               .of_match_table =3D of_match_ptr(omap_mailbox_of_match),
> +               .of_match_table =3D omap_mailbox_of_match,
>         },
>  };
>  module_platform_driver(omap_mbox_driver);
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 0f0862e20a93..62f8548fb46a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -330,8 +330,7 @@ config STM32_RPROC
>  config TI_K3_DSP_REMOTEPROC
>         tristate "TI K3 DSP remoteproc support"
>         depends on ARCH_K3
> -       select MAILBOX
> -       select OMAP2PLUS_MBOX
> +       depends on OMAP2PLUS_MBOX
>         help
>           Say m here to support TI's C66x and C71x DSP remote processor
>           subsystems on various TI K3 family of SoCs through the remote
> @@ -343,8 +342,8 @@ config TI_K3_DSP_REMOTEPROC
>  config TI_K3_M4_REMOTEPROC
>         tristate "TI K3 M4 remoteproc support"
>         depends on ARCH_K3 || COMPILE_TEST
> -       select MAILBOX
> -       select OMAP2PLUS_MBOX
> +       depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=3D=
n)
> +       depends on OMAP2PLUS_MBOX
>
TI_K3_M4_REMOTEPROC isn't in the mainline yet so this fragment doesn't
apply on my tree.
I can drop just this and apply the rest of the patch, otherwise the
patch may go via remoteproc.
Let me know.
Thanks
-Jassi
