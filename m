Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4FE2BDC02;
	Fri, 18 Jul 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836280; cv=none; b=tpQUqkm6PljuyYeIkf+pLE3XJyqOWIxqU2+Zyit6wM7GPI4J0NVJPRttk1hlSytw6VtbZuDcbEbwOLDUVVy+kXmSTOUZ6NmrQUSt06CevI9y0F00QPkBu0X/M4qTaKhzIqOAQzp374qFeYOoJEU9Jt7gYdPw70MksfYDLzdgtqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836280; c=relaxed/simple;
	bh=n56fvNCbZYpjA+6v2NlTwoRSF0+TcObwWezUlSX3UEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAmDIlU6aaFTkAzRiPrXND+U0lzC11vORBU6kUuFFXd3mi5fYWTF+ixyN1rjgEPa8BKdmzL4gw5m7nzqPCBUgbO/F3MHge+GDG2+WTtcZpZ3+OKL+k6Ioih1Q5lcTA9P9rur4Y0Mw9bFME2GDGsvGrYWfAhF4ut5+jngo6qsVQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqzGjynK; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqzGjynK"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1385837a12.1;
        Fri, 18 Jul 2025 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752836279; x=1753441079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crJfUyaZFUd3zm6f6eWNF5fFGcJayPgP/WBKMvt7miw=;
        b=CqzGjynKdOKP+xXfcfqluy4WqJdDcA3qbEMbVzJ3s5Up90FnrmS7VCT4fjY2uHgy6J
         YUPAcbFSjbgunpbDFuUA+Y/BESXI/3/gQQQ1/3t5pDzC1HLkf0b41G0ZSX8A7kt79wjJ
         jjDLIdp/nha45tlM0lcQHY43CYi+eT68+xO2v+pXje2w634vauptOUkYXt7FszFXA6IO
         2ybP9Nzwd9ZzKxUntBzHG6c85acA+YpsNK4Y7Ui+aQSEIKAMIaxSiiDs8/GlQCFX0NAn
         KAc9jq9bnyLvn90rl7B0xnDxswpU0ByMtqK+P+ss/2SAkWEizQV1Jly2TxBbwfYOsiQd
         Sjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752836279; x=1753441079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crJfUyaZFUd3zm6f6eWNF5fFGcJayPgP/WBKMvt7miw=;
        b=ONf8OBY3wgDFB23gR/lHZrm9L4m+ZllNXuJGEJCGDfYz6ddI40BWJC+aRPryMFD+8D
         Phx24IUAyFAyPtIZdTqKBV0Vn90+sX2Eot5NGMiiiuCFlYe79z3sLteJp4Ha08AzuB+i
         bdfeld77UyslPAVliP5zdsFfFamVJHaJrORTwlZpmt3x60RTW5os9YV05gdCTjtANfKu
         Ey727gOSIVqaepg+8+uJXJacYgdcebpwaiLvGFmzsCiNnR10qPGHRS3ZHsBkX8kFyuRG
         wAj72XLNeCAPIWI8tuBSFyW/0jc36SgSyPVfHb6sbVCYJj2wppW9mXy71IADREm8xiNy
         sqVw==
X-Forwarded-Encrypted: i=1; AJvYcCV1KgAtMq/4Wemmg08J4eIquEpM6U378hq+1Xw7gLlQksm5G+rHlqRn1hd5gLX3F3mcJwPQKrl8OHk5lmCJkenV9A==@vger.kernel.org, AJvYcCVDbqXknISNJ5HC3LWQAmSlv4fQMDX9c3uFCHgkiDNBxYe3z9O22gKJPmOApKKyXaQWp2oaVRScHsvv8IA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBbjAcEfADWekC4HQIcWiw9nAcrLYQNZgngOdfQkgAXcAd/KT
	fP1az9BrprpsS45wK3sB/0K/JnFARBIYxqOHzxs7jk+mwe/7uoULGbijdtTHinOUcz68/Njt7Wk
	jzzwAXNFcgPbcVaiC4RwmipL6s+E+b2KZuXXe
X-Gm-Gg: ASbGncsWmyUkT+NGIhLVkntW0cjsqBAaVAff7kbNsJJWKOkVZofl7GuF0sJS6WHXw09
	EtA/nCnre4MoYRQzS2Kxz5TR2Auq9XM4mrLS0Vfm0Z2meuXaQowDoeicz0Iol5b5+Igp5zzvXs3
	Vx0J/EafLmLPJpcsHVxP1JkuhzD/uXdfeVSzu+f1UyCOYvEVNPGFiZIsH96LHqizkp+JmZNfdVB
	YCN
X-Google-Smtp-Source: AGHT+IG3K+OJchpvRdKs3tFgBFIPgoho17ujC5cDtqCUPyeRXXDSSMCfEs84NE1rrM2vaVhaZ1ZL/UjRgJAtRS/XdRE=
X-Received: by 2002:a17:90b:57c7:b0:311:eb85:96df with SMTP id
 98e67ed59e1d1-31c9e75b966mr17155358a91.17.1752836278553; Fri, 18 Jul 2025
 03:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com> <20250704052529.1040602-2-shengjiu.wang@nxp.com>
In-Reply-To: <20250704052529.1040602-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 18 Jul 2025 14:00:03 +0300
X-Gm-Features: Ac12FXyvAM2zuSZO19tjGTn3I8j6ZBYP1ezDycsLSWPMXkx77mmnhd_OLQ_GFhA
Message-ID: <CAEnQRZDeXrhHaU-tiAizXL3cNK-6rpbACx9QGNVpV8GBEKAPYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 8:29=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> When recovery is triggered, rproc_stop() is called first then
> rproc_start(), but there is no rproc_unprepare_device() and
> rproc_prepare_device() in the flow. As the software reset is needed
> before DSP starts, so move software reset from imx_dsp_runtime_resume()
> to .load() to make the recovery work. And make sure memory is cleared
> before loading firmware.

Hello Shengjiu,

Commit mostly looking good but the key point when writing a commit
is to explain why the commit is needed and less about what the
commit does (this should be obvious from the source code).


So, I would start with the context and that is:

Following commit: 6eed169c7fefd9cdbbccb5ba7a98470cc0c09c63
    remoteproc: imx_rproc: Enable attach recovery for i.MX8QM/QXP

enabled FW recovery, but is broken because <and here explain the reason tha=
t
you mostly described in the original commit>.

Then at the end add the Fixes tag.

Also, allow me on more day on Monday to test this patch.

Thanks,
Daniel.

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_=
dsp_rproc.c
> index 5ee622bf5352..ba764fc55686 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  {
>         struct imx_dsp_rproc *priv =3D rproc->priv;
>         struct device *dev =3D rproc->dev.parent;
> -       struct rproc_mem_entry *carveout;
>         int ret;
>
>         ret =3D imx_dsp_rproc_add_carveout(priv);
> @@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc=
)
>
>         pm_runtime_get_sync(dev);
>
> -       /*
> -        * Clear buffers after pm rumtime for internal ocram is not
> -        * accessible if power and clock are not enabled.
> -        */
> -       list_for_each_entry(carveout, &rproc->carveouts, node) {
> -               if (carveout->va)
> -                       memset(carveout->va, 0, carveout->len);
> -       }
> -
>         return  0;
>  }
>
> @@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc *r=
proc, const struct firmware *fw
>         return 0;
>  }
>
> +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware=
 *fw)
> +{
> +       struct imx_dsp_rproc *priv =3D rproc->priv;
> +       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> +       struct rproc_mem_entry *carveout;
> +       int ret;
> +
> +       /* Reset DSP if needed */
> +       if (dsp_dcfg->reset)
> +               dsp_dcfg->reset(priv);
> +       /*
> +        * Clear buffers after pm rumtime for internal ocram is not
> +        * accessible if power and clock are not enabled.
> +        */
> +       list_for_each_entry(carveout, &rproc->carveouts, node) {
> +               if (carveout->va)
> +                       memset(carveout->va, 0, carveout->len);
> +       }
> +
> +       ret =3D imx_dsp_rproc_elf_load_segments(rproc, fw);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
>  static const struct rproc_ops imx_dsp_rproc_ops =3D {
>         .prepare        =3D imx_dsp_rproc_prepare,
>         .unprepare      =3D imx_dsp_rproc_unprepare,
>         .start          =3D imx_dsp_rproc_start,
>         .stop           =3D imx_dsp_rproc_stop,
>         .kick           =3D imx_dsp_rproc_kick,
> -       .load           =3D imx_dsp_rproc_elf_load_segments,
> +       .load           =3D imx_dsp_rproc_load,
>         .parse_fw       =3D imx_dsp_rproc_parse_fw,
>         .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
>         .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> @@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *de=
v)
>  {
>         struct rproc *rproc =3D dev_get_drvdata(dev);
>         struct imx_dsp_rproc *priv =3D rproc->priv;
> -       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
>         int ret;
>
>         /*
> @@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device *d=
ev)
>                 return ret;
>         }
>
> -       /* Reset DSP if needed */
> -       if (dsp_dcfg->reset)
> -               dsp_dcfg->reset(priv);
> -
>         return 0;
>  }
>
> --
> 2.34.1
>
>
