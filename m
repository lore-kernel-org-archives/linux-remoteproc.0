Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFAF313281
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702379; cv=pass; b=EUCCQmiggu0v1jBxlaf1d7EIS/7ZvsKj4e9YNsWOynEBV1spKR6yBnosU90++YrZkrOiQjoXS27yAWgk5/ihgH1Yw8EjG4wvSiY5FLr/bDDXI718VOBXBqzTS3YijOOWI7n5ttkUHf8s3qgGDMQoUZZxyozQX0rKNwTgUXhneCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702379; c=relaxed/simple;
	bh=jP6B/+HWGupxxJrmj9WayxckdF/Nn9MjSYPmAAE2/5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzdZO9wFAANnB+YYDnwr7jtMCnvLuRRaCLmJ1yXg6EvDde025Xrbmm0+czoVe7k4F6/QAqGITobu/370s81ON5/PDtKQngIQc5ugz+albczZ8HJ9LVvatHfXsyCtM1GP0R5Tn5vvFfoujLW4saiiUNue3g7/haLQqXfGwZhVseI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdfEWwGk; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdfEWwGk"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1233bc1117fso1503231c88.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 07:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769702377; cv=none;
        d=google.com; s=arc-20240605;
        b=BZ2JuOu5VTW22i0JRHAYgGrwru2yF+GLZDOo9CHv/lBwynQ2EzTWKbIyDN/jDfzb4q
         bISXzmZMsHhY/C8OXHFnqzxdinQ9AunhBXebbSlViA+A7mpVJc06CZbqgqndyhPm8IH1
         LFN2z78tpv66Kctzf1YEnwcNB/6zKE9FBlHxK3hacR+lyvJL1VFd4+04PerW0n3cq6E9
         vMY0ggEXBhSuVKbbasZ44mFg6EDWxWvRHpEt7xAs/bTM+zh2y7SbokF1nOtnYIeGNgbO
         8KK+ylLB44EKUDIoeG6lAr3TBAAfJteVQbJKoeR3M3dV36XK+zkih/lAzjaZUc5vTJGL
         syNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=;
        fh=UhItXkx99rqogJB7l1obh4xmnIyivoAHIY/vB8PXjK4=;
        b=WHPmMIi80ERVCeNnpfz2Rrmz937eCouMwh5uinS/un15CwlusRcurBqbM5bmYtfJpP
         smIbW00A1cNMobI1JALnkyJp8ujGryInB3HjF7AdftPfAoB5veydAQvq8SCsGwj56Gal
         u5CvTrZEOmx1nl/28bfpWLYiCbcWJZaaRY9547qroeDrDujoK5jhzQojIYhjc8qI+9Jc
         xzbnE/sEnO/XWGCupoK3CJJPIKOZfe+0uYe9kZneZgMoBoEF2T+9SKaOTebWo/EJnMBa
         LtMdgLnXJEWXmFjitiFuFLabbozwZQ7IFds7s2DCPn37pbmBh4xsDkYlQETBt1BgY9ZG
         l+SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702377; x=1770307177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=;
        b=EdfEWwGkzAuOGOF5BJMUWNaOWgA1nMUTgFlBKcxPW53Vyh6Yh5T40lWEkrmox/G0SC
         kvyEoHaVxqsLoe9BrCa/IND4L3W+FWSpmeScWwvEW48ZvEobQGfwWE3017QD7SWHhpCE
         9gUXaYdv0LzqNmGqmB43zwoPFpsXPo6tHg3sWCB9dTYYzOFzuQzpVpAHN1AZiqqTjlkO
         hcNo8LraGf4LGcVOSxPCsYbpnqXkXL0vxEdb+KlyvNuEozDZ/yp2H1r+S+vgqLOI1P/H
         J3SPbWJm8gqpBU9qCWWm3Mo6F/H16G2ji0CWgruuIrKUD4taLSg0NqxKT3cNw9jzC5D6
         18Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702377; x=1770307177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mJvDD1VpYWneH4exWtlRRFpCw/yxXuXg63uajYfPqQ=;
        b=XGlqGvJbdUmDo2FFzLEK/y7GnvTAXhYhMIPhw2RutlauYqgnF0iPduHrzFuSLilKtZ
         Zkg06hqoPTTTvEdu+xWPSr0MknZnIoHFIw3G35+DNtvcUAzgZkxUAhiIbBkjuZgcKBS9
         bcRI3B6K4w8OP4TDLOIcGrce7LwOPSYkchHp7C7ADJTVm9c/hYilmYqqgVwaE/HWuxOd
         BZdh2w4A9BKU3GEd3zw4SCsMxntdLI1WZ2oqeH1IZVJy3Y+Zttr/Cy8WmQCGX71Fd5gv
         NoS4hu6xzuYc5WMHPXGPXEzfQCH20a4FIvCeUECJsiMUCc+MOQCLIFHlPuSdilqafp0Q
         VjZg==
X-Forwarded-Encrypted: i=1; AJvYcCWRONke2tJ092Iv23TCIkLZ50nT55Z5XkqbIzy6IxSeM8I1PAQ02Q40xu+ZDGavo62R2PfTOPpYjtau7DnnJSJ4@vger.kernel.org
X-Gm-Message-State: AOJu0YxQBPsrvHRzEl9gB5Yk3Wep78h2pyn2se8fB614H0rye7UxxPz+
	+AEBqY5lMnHtdJbRu/LSMRkoVgaJq4EIjhKAua0ohe+eoh6zSQXmvKYyePX9q1rYnRF6UXXNIa7
	TJKpi+LCE7IDcOyAEZkEqETfEzhdpAKw=
X-Gm-Gg: AZuq6aJKQpEPzgAeFeTiUYys/2Muq+HLfONyK49jrVvRRzqX5tTGv+p0UTtyPVCNBGM
	t+1dNXVk1q6NldwtuAD4b3fr0Px1szEsg0T52fE9MkbwjC/NKKB7C7d/dM7Ntyl9yzBbPgoielF
	2pwFFk04fXG7iCXXeXXFYFG7MK7+/1RwkRbJILcSVKUeFUOEhMMlswUKq36zzfgcXXWVx3mMlVs
	uwSfncIVnRsO4PaKbQm88yryFCQFZVnenIS+wF7k2T7B3WCtac3WM2LrmdvrNfrs6YS/r2/wRjo
	veHoAip/hlmCKpcN9bcjIPZVO49G972VEEyyeIH0H0tv20JaqLdU4uw45Y/XtY60hdU40SaWOL/
	bTELoks5dlOj/TQ==
X-Received: by 2002:a05:7022:128d:b0:11b:f271:835a with SMTP id
 a92af1059eb24-124b100d8camr2199762c88.3.1769702377004; Thu, 29 Jan 2026
 07:59:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
In-Reply-To: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Jan 2026 18:02:21 +0200
X-Gm-Features: AZwV_Qh0LikHrjwYELL0Qb32OlZcL13Rg7Wtaiv5oFtOG766mVjbDDliX8TbUzs
Message-ID: <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table detection
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Frank Li <frank.li@nxp.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 3:45=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> resource table even when the current firmware does not provide one.
>
> When the device tree contains a "rsc-table" entry, priv->rsc_table is
> non-NULL and denotes where a resource table would be located if one is
> present in memory. However, when the current firmware has no resource
> table, rproc->table_ptr is NULL. The function still returns
> priv->rsc_table, and the remoteproc core interprets this as a valid loade=
d
> resource table.
>
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() whe=
n
> there is no resource table for the current firmware (i.e. when
> rproc->table_ptr is NULL). This aligns the function's semantics with the
> remoteproc core: a loaded resource table is only reported when a valid
> table_ptr exists.
>
> With this change, starting firmware without a resource table no longer
> triggers a crash.
>
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for fi=
nd_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Changes looks good to  me >

> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rp=
roc, const struct firmware *
>  {
>         struct imx_rproc *priv =3D rproc->priv;
>
> +       /* No resource table in the firmware */
> +       if (!rproc->table_ptr)
> +               return NULL;

I wonder if we can make this change generic because it should happen
on other platforms also.

Maybe something like this:

remoteproc: core: Only copy loaded table when valid

Copy resource table in memory only when:
* the current loaded firmware provides one
AND
* there is an explicit request to have the rsc table copied in memory
via rsc-table

--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1281,7 +1281,7 @@ static int rproc_start(struct rproc *rproc,
const struct firmware *fw)
         * that any subsequent changes will be applied to the loaded versio=
n.
         */
        loaded_table =3D rproc_find_loaded_rsc_table(rproc, fw);
-       if (loaded_table) {
+       if (rproc->cached_table && loaded_table) {
                memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
                rproc->table_ptr =3D loaded_table;
        }
