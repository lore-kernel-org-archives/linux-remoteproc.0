Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC219E96A;
	Wed, 25 Jun 2025 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821943; cv=none; b=tHAk9bsAoEQOLi280QWQUxGbgK9JPZzdhV22r78CBfQXoncUPQCjCfyg6Zt/2HkpwF16pGb8I3hgyE7gLPlnrl9JrzCyjFMMcBNMX9z9aaqtkpNXHq1Xkeh4SQrK4Ida0xREVp7FkmXmFI9bzwv+1ITz4/wf3FHoAHyuepMdaiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821943; c=relaxed/simple;
	bh=4NMFst5bZwlMKW8tHUP/911zQnFY6nUDVvYvEJtmNmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoystGgPIAnpguSFS6IUzg7vdkGCN7PVBEg3/vClcySSlnQTSOjTZVeFx+mf/b17SM47147b3YFWI/gTr1T8/9dOtLZ/xUsclZFzBJa3k/uwLrTenpafhU8vdlv6gIVdBzq/0mpTOFzOKU74hL6MLo8D+p+XC5FnuUimo7KNR0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALLiYJNR; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALLiYJNR"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3df2ccbb895so9553715ab.3;
        Tue, 24 Jun 2025 20:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821941; x=1751426741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5Idd7bAuzOnb9JUX43u5xXxkP4Sj/WJFUVcPFMjRpA=;
        b=ALLiYJNRTj9ix71ma9TNnzxfyPLdRXjggRpbQ2aBwhlyJIbjYtJnsF+Mk96NIIKMKV
         jnoovPInGrf8kKXeymu8co5/BBftaU2xzjw+nkBhs7sLmiXV76VL3QYIubLd9PDPgQzo
         XZFkl05Ng/ImwVzT5RLxGG2ZlFB0EoyIJHqW0FNOd5XXeo7A+7b7y7X0QAMLCGBz8b07
         pO1PLwraR69E/t6p3ZXTnoBE2aDxulp44l+LLmdFUuOqe3GKy5jxj5nLpQlsUFiY+lwC
         P2lUDPpIYoBHVVHJ/Kmka63B21EFay6QCEudHHqk2+CoDdwPCOE78LtBf/i8JSmtHwvn
         Mzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821941; x=1751426741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5Idd7bAuzOnb9JUX43u5xXxkP4Sj/WJFUVcPFMjRpA=;
        b=tKhdOnl2UJqFm0RU/HnZGzzXGH2OItD8hxgib9OGu9nK9EEqBWsDumLQTdiBgoK8sj
         pWh+cI5CCDedrvbXbStrDFPlpvtZl7zCS2kE3YgwVWpAXHlq53NkItdK0CRm04MwZ1Nh
         ocEYZeNKY+J9NrzMWpHlmTogpcu1wobVsAff3kcEYB4rYltaNAIVKFGJGdjKb7hz/Gw1
         sweZqEoJ6cwD+ep87STes7LvEF5Ilao5Gvyas3RbvQxrAf1Vgd5TKlFOf426at/Qx3vq
         ecLOe5+oU0nFfzuKgCn+I3iKU5qj/Tdur3cER4weqo4kYr5zAQB7dNQUI+6K891s56Xf
         VB8A==
X-Forwarded-Encrypted: i=1; AJvYcCVrLtJMaNQVLY0uArGbLS3+rn3mEVcQTGHFMYLK8lHlnxS+vvvQroPke+xoDUSr43aqdYXolTASmxmyIcc=@vger.kernel.org, AJvYcCWF4pw7MFTeqL3pe3kKKOedaNZdKfCte2lIv91vU9BvdnnS6NOZr8DfOOyEzFZGfKtd8sTGTIjIAugNzjHZ+sMDDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqIeo+PWF7LSmvjE94aCIbFbwW0mjUYJMifDuOyRRmoeZXXTD8
	aja1pEcJl1wnZPDGW/SaX/oGAfn+smOo2+lNBo05FlvwNac0a7Bf9Dr4xec/4T+JhNEc4BQ8Z43
	z+8tKBeluAkWQZ8cKtMlxGRswfhsjhiQ=
X-Gm-Gg: ASbGnctltp38+kx1AVW2lIj0OC2s5U1jTBnQfHkOjzcqiA57faSJtgkCkf8sXCVbXy7
	7QPCwUDfhBzPUCd5A6XdnlrcpE5x5re/0P5h5qupQzmQATXSduOuJa1W8WUm6NZw4qmNvw41ANs
	z+Y2snVxY2vx3Tt90uuZ8hNhvogIn92N//IYOr89fIDNNpXWAm8V0N1g==
X-Google-Smtp-Source: AGHT+IGTb/5LGPPf3L0DL//MOyob2CFyZfg/IHtK/wNWTQnMHIKm1ENWEeAPJPDEIqD049xw5eck28OJqJkG6TTW8sI=
X-Received: by 2002:a05:6e02:1c09:b0:3dc:8075:ccd3 with SMTP id
 e9e14a558f8ab-3df3294954dmr17771145ab.9.1750821941152; Tue, 24 Jun 2025
 20:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com> <aFltBpXuEXVZ5gKn@p14s>
In-Reply-To: <aFltBpXuEXVZ5gKn@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Jun 2025 11:25:29 +0800
X-Gm-Features: Ac12FXzRQJouDdZDx5KrobO9xlf8zpg91IyZbOOnLAWOvOD5rocTnkVsx4AQ2xM
Message-ID: <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:11=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good day,
>
> On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > when recovery is triggered, rproc_stop() is called first then
> > rproc_start(), but there is no rproc_unprepare_device() and
> > rproc_prepare_device() in the flow.
> >
> > So power enablement needs to be moved from prepare callback to start
> > callback, power disablement needs to be moved from unprepare callback
> > to stop callback, loading elf function also needs to be moved to start
> > callback, the load callback only store the firmware handler.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++------------
> >  1 file changed, 36 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 5ee622bf5352..9b9cddb224b0 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> >   * @ipc_handle: System Control Unit ipc handle
> >   * @rproc_work: work for processing virtio interrupts
> >   * @pm_comp: completion primitive to sync for suspend response
> > + * @firmware: firmware handler
> >   * @flags: control flags
> >   */
> >  struct imx_dsp_rproc {
> > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> >       struct imx_sc_ipc                       *ipc_handle;
> >       struct work_struct                      rproc_work;
> >       struct completion                       pm_comp;
> > +     const struct firmware                   *firmware;
> >       u32                                     flags;
> >  };
> >
> > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_att=
_imx8ulp[] =3D {
> >
> >  /* Initialize the mailboxes between cores, if exists */
> >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const =
struct firmware *fw);
> >
> >  /* Reset function for DSP on i.MX8MP */
> >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rproc=
)
> >       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> >       const struct imx_rproc_dcfg *dcfg =3D dsp_dcfg->dcfg;
> >       struct device *dev =3D rproc->dev.parent;
> > +     struct rproc_mem_entry *carveout;
> >       int ret;
> >
> > +     pm_runtime_get_sync(dev);
> > +
> > +     /*
> > +      * Clear buffers after pm rumtime for internal ocram is not
> > +      * accessible if power and clock are not enabled.
> > +      */
> > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > +             if (carveout->va)
> > +                     memset(carveout->va, 0, carveout->len);
> > +     }
> > +
> > +     ret =3D imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
> > +     if (ret)
> > +             return ret;
> > +
> >       switch (dcfg->method) {
> >       case IMX_RPROC_MMIO:
> >               ret =3D regmap_update_bits(priv->regmap,
> > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> >
> >       if (rproc->state =3D=3D RPROC_CRASHED) {
> >               priv->flags &=3D ~REMOTE_IS_READY;
> > +             pm_runtime_put_sync(dev);
>
> From this patch I understand that for a recovery to be successful, the
> remote processor _has_ to go through a hard reset.  But here the PM runti=
me API
> is used, meaning the remote processor won't be switched off if another de=
vice in
> the same power domain still neeeds power.  If that is the case, the solut=
ion in
> tihs patch won't work.

Thanks for reviewing.
With the case you mentioned, there is software reset to make the
recovery process work.

best regards
Shengjiu Wang

>
> Thanks,
> Mathieu
>
> >               return 0;
> >       }
> >
> > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> >       else
> >               priv->flags &=3D ~REMOTE_IS_READY;
> >
> > +     pm_runtime_put_sync(dev);
> > +
> >       return ret;
> >  }
> >
> > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpro=
c)
> >  {
> >       struct imx_dsp_rproc *priv =3D rproc->priv;
> >       struct device *dev =3D rproc->dev.parent;
> > -     struct rproc_mem_entry *carveout;
> >       int ret;
> >
> >       ret =3D imx_dsp_rproc_add_carveout(priv);
> > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpr=
oc)
> >               return ret;
> >       }
> >
> > -     pm_runtime_get_sync(dev);
> > -
> > -     /*
> > -      * Clear buffers after pm rumtime for internal ocram is not
> > -      * accessible if power and clock are not enabled.
> > -      */
> > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > -             if (carveout->va)
> > -                     memset(carveout->va, 0, carveout->len);
> > -     }
> > -
> > -     return  0;
> > -}
> > -
> > -/* Unprepare function for rproc_ops */
> > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > -{
> > -     pm_runtime_put_sync(rproc->dev.parent);
> > -
> >       return  0;
> >  }
> >
> > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rproc =
*rproc, const struct firmware *fw
> >       return 0;
> >  }
> >
> > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmwa=
re *fw)
> > +{
> > +     struct imx_dsp_rproc *priv =3D rproc->priv;
> > +
> > +     /*
> > +      * Just save the fw handler, the firmware loading will be after
> > +      * power enabled
> > +      */
> > +     priv->firmware =3D fw;
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> >       .prepare        =3D imx_dsp_rproc_prepare,
> > -     .unprepare      =3D imx_dsp_rproc_unprepare,
> >       .start          =3D imx_dsp_rproc_start,
> >       .stop           =3D imx_dsp_rproc_stop,
> >       .kick           =3D imx_dsp_rproc_kick,
> > -     .load           =3D imx_dsp_rproc_elf_load_segments,
> > +     .load           =3D imx_dsp_rproc_load,
> >       .parse_fw       =3D imx_dsp_rproc_parse_fw,
> >       .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> >       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > --
> > 2.34.1
> >
>
