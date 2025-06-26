Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C231509AB;
	Thu, 26 Jun 2025 01:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750901540; cv=none; b=cuXC5E7YgYy8dFYpH/UvRQc0rcSLMSbzPfPm60rzj8Z1ZaoxaFpGD37AcYWJxHGz0X8HRcVA3lGEXjCDsgiVdIOd62cekVs9fT7Tje/JVp9k+PVMaw0cMY6TOure08KPxE8ZRT/RT5bTfdOeAB7bdomi4WsatASLAMHBPYKByi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750901540; c=relaxed/simple;
	bh=RRk0bVfv69b98hbgb34JA+coRJKQ/hyCvbMrpI7vj40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fEQUACNFMaGFOTZm0ksoTZd+lFXFb52TnkWQBF/m8resbwjzwv0559YuYRVUzyTj1Nvul7j5WmQwDtFSomaX93p3Lbgd0nCTnQmBw/Z0gjYDD6b7j3gDOEMC+bmhDDrfpozJxxNbURfMp7OYsIcS2lh5q6iik9RLxFrdzWvxdi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPRmyr8+; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPRmyr8+"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3df2d111fefso4018995ab.1;
        Wed, 25 Jun 2025 18:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750901538; x=1751506338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2EwLg93SXSSQVXZxXCP07cbUPvvbYIPUncv9vbnwSI=;
        b=nPRmyr8+H35IzYOHx6UgbkZ7Tiv7ikvmMlq4YxzitAu2J3KZRJCJDpscCs7FKfGLWO
         E2MiYUw4IqScIlFyrohE9mD9NVlddzBvlIxN1WVE203TNy50D868aKGWoVHxUNSiAw8f
         lb2pGo7NgGkFTXit5SFUPL2DVTjKY7gpZ+dCNcPiEKc+/+8Em1pBKl1h6fzfHAe35czN
         mIsagbQFm6pYOoF92FGgjQjePy7q6oshcowrv7GyW1Pp9hla/paVunwaJSvsexQZ4b+S
         Jk9Z3YMH6N8h4oXk2PSRV8wGbEobd7LT2x8+w76nnhFTPR2HTM3L2PE3zhLI2nAr74ba
         lC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750901538; x=1751506338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2EwLg93SXSSQVXZxXCP07cbUPvvbYIPUncv9vbnwSI=;
        b=BklhBnZia1MbFGWr4njGBkWR6gdWVmgp9Fux86bw3x+QjSTpwVfBj59kHbm+73zHOT
         Ji+WrGoPH5U2t70RSpmecO78r/FagYJkvs0rnAtWwPv1mD42hWUnwBk62Ykp0gt6/BKE
         bcjNLuw2MboX257I8MT2ECe9BLEmMP078iPFIrnQS/r+X/N9LhQt2QMNyuru75mRmuXK
         V1ePXgkuxuMMwf3qVgjpIqd86zWdG6z+MEpQU4skw+ssQl9rgYEx5IRCA/wi7x/j3/U+
         SPQ32nHMkufjqMyNWHnVCfAxrOqhYSyM2Uw3VOMRlSUOpUSIh3Fczvq77rkKj2L1Dv68
         keZw==
X-Forwarded-Encrypted: i=1; AJvYcCWlpAch0hwREOLEsE+PwjITwbda4cWI7TYGDjxpxza/Z+WNRMWFNxI8AnynZc9l4qvi9wGr3EssUR3ma3I=@vger.kernel.org, AJvYcCXp8mtnbvhmBNorHjeBYFOEpQOhm6CcyEamO71x6WssCgcQzygChPGv0rLKQ9gORur6bkeGtyn2k+yAiyde4kIrXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIb0Qa9KJ9PpsAWiGNyHkZ4VtHJLT/aEeuuCYn5lIyNuA0u5fT
	Vu9OU5eqol6vT5HaUTA6hMsa5Li7rbYoKvBtnS30EK5z/3ujNOqI1gGRD+lEymUauDdpI5qRA0g
	ASeH0KmArzj8c/l5KjEM97z8F2ZpwbbQ0Cb5B
X-Gm-Gg: ASbGncvn2SKtb4cLcswthQwz/c1Tm3EbhBkiMSD/SyVGdkV6UH5naOXdR28yyQKUOVl
	D1+Xb+bfaAde9pB+p7u891TWIzsEhD4DRjYLJNCjaoxhqe92KTU7arB+t6LflrAShMXwPrPlsJ3
	UMNOXC/tt7dnjiRMyXBmxY5IOZi6L/U+j+BuraDdWZHaE=
X-Google-Smtp-Source: AGHT+IHz+VsrRavqFHcBYE4ToM940Svxo+zF/Y7cUyGrx0/zEzml+SYXAqKOyb1f1Bo8G4+cR0SQBG/7tugWWFi/fUA=
X-Received: by 2002:a05:6e02:250f:b0:3df:43d1:6a58 with SMTP id
 e9e14a558f8ab-3df43d16cadmr1016265ab.20.1750901537921; Wed, 25 Jun 2025
 18:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com> <aFltBpXuEXVZ5gKn@p14s>
 <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com> <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
In-Reply-To: <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 26 Jun 2025 09:32:06 +0800
X-Gm-Features: Ac12FXxhWHni_zYrB3Bk_G8eq5XhUuxIqHIxn2dIntxFypfP4zKffU6DWcZMA_E
Message-ID: <CAA+D8AM47P7xw2Ppgcr9d=DB2eSkQg6uQ_F22Te_=HFuMCNXxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 10:39=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, 24 Jun 2025 at 21:25, Shengjiu Wang <shengjiu.wang@gmail.com> wro=
te:
> >
> > On Mon, Jun 23, 2025 at 11:11=E2=80=AFPM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > Good day,
> > >
> > > On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > > > when recovery is triggered, rproc_stop() is called first then
> > > > rproc_start(), but there is no rproc_unprepare_device() and
> > > > rproc_prepare_device() in the flow.
> > > >
> > > > So power enablement needs to be moved from prepare callback to star=
t
> > > > callback, power disablement needs to be moved from unprepare callba=
ck
> > > > to stop callback, loading elf function also needs to be moved to st=
art
> > > > callback, the load callback only store the firmware handler.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++--------=
----
> > > >  1 file changed, 36 insertions(+), 22 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remotepro=
c/imx_dsp_rproc.c
> > > > index 5ee622bf5352..9b9cddb224b0 100644
> > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> > > >   * @ipc_handle: System Control Unit ipc handle
> > > >   * @rproc_work: work for processing virtio interrupts
> > > >   * @pm_comp: completion primitive to sync for suspend response
> > > > + * @firmware: firmware handler
> > > >   * @flags: control flags
> > > >   */
> > > >  struct imx_dsp_rproc {
> > > > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> > > >       struct imx_sc_ipc                       *ipc_handle;
> > > >       struct work_struct                      rproc_work;
> > > >       struct completion                       pm_comp;
> > > > +     const struct firmware                   *firmware;
> > > >       u32                                     flags;
> > > >  };
> > > >
> > > > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc=
_att_imx8ulp[] =3D {
> > > >
> > > >  /* Initialize the mailboxes between cores, if exists */
> > > >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, co=
nst struct firmware *fw);
> > > >
> > > >  /* Reset function for DSP on i.MX8MP */
> > > >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > > > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *r=
proc)
> > > >       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> > > >       const struct imx_rproc_dcfg *dcfg =3D dsp_dcfg->dcfg;
> > > >       struct device *dev =3D rproc->dev.parent;
> > > > +     struct rproc_mem_entry *carveout;
> > > >       int ret;
> > > >
> > > > +     pm_runtime_get_sync(dev);
> > > > +
> > > > +     /*
> > > > +      * Clear buffers after pm rumtime for internal ocram is not
> > > > +      * accessible if power and clock are not enabled.
> > > > +      */
> > > > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > +             if (carveout->va)
> > > > +                     memset(carveout->va, 0, carveout->len);
> > > > +     }
> > > > +
> > > > +     ret =3D imx_dsp_rproc_elf_load_segments(rproc, priv->firmware=
);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > >       switch (dcfg->method) {
> > > >       case IMX_RPROC_MMIO:
> > > >               ret =3D regmap_update_bits(priv->regmap,
> > > > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rpr=
oc)
> > > >
> > > >       if (rproc->state =3D=3D RPROC_CRASHED) {
> > > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > > +             pm_runtime_put_sync(dev);
> > >
> > > From this patch I understand that for a recovery to be successful, th=
e
> > > remote processor _has_ to go through a hard reset.  But here the PM r=
untime API
> > > is used, meaning the remote processor won't be switched off if anothe=
r device in
> > > the same power domain still neeeds power.  If that is the case, the s=
olution in
> > > tihs patch won't work.
> >
> > Thanks for reviewing.
> > With the case you mentioned, there is software reset to make the
> > recovery process work.
>
>
> Are you talking about a manual software reset of some other mechanism?
>
> If manual software reset, the recovery may or may not work and we
> simply don't know when that might be.  If it's another mechanism, then
> that mechanism should be used in all cases.  Either way, I don't see
> how we can move forward with this patch.

Not manual software reset,  in this driver we registered .reset() function.
it has been called at imx_dsp_runtime_resume(),  I paste the function below=
.

And I have tested the case you mentioned, the recovery works.

/* pm runtime functions */
static int imx_dsp_runtime_resume(struct device *dev)
{
        struct rproc *rproc =3D dev_get_drvdata(dev);
        struct imx_dsp_rproc *priv =3D rproc->priv;
        const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
        int ret;

        /*
         * There is power domain attached with mailbox, if setup mailbox
         * in probe(), then the power of mailbox is always enabled,
         * the power can't be saved.
         * So move setup of mailbox to runtime resume.
         */
        ret =3D imx_dsp_rproc_mbox_init(priv);
        if (ret) {
                dev_err(dev, "failed on imx_dsp_rproc_mbox_init\n");
                return ret;
        }

        ret =3D clk_bulk_prepare_enable(DSP_RPROC_CLK_MAX, priv->clks);
        if (ret) {
                dev_err(dev, "failed on clk_bulk_prepare_enable\n");
                return ret;
        }

        /* Reset DSP if needed */
        if (dsp_dcfg->reset)
                dsp_dcfg->reset(priv);

        return 0;
}

>
> >
> >
> > best regards
> > Shengjiu Wang
> >
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > >               return 0;
> > > >       }
> > > >
> > > > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rpr=
oc)
> > > >       else
> > > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > >
> > > > +     pm_runtime_put_sync(dev);
> > > > +
> > > >       return ret;
> > > >  }
> > > >
> > > > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *=
rproc)
> > > >  {
> > > >       struct imx_dsp_rproc *priv =3D rproc->priv;
> > > >       struct device *dev =3D rproc->dev.parent;
> > > > -     struct rproc_mem_entry *carveout;
> > > >       int ret;
> > > >
> > > >       ret =3D imx_dsp_rproc_add_carveout(priv);
> > > > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc =
*rproc)
> > > >               return ret;
> > > >       }
> > > >
> > > > -     pm_runtime_get_sync(dev);
> > > > -
> > > > -     /*
> > > > -      * Clear buffers after pm rumtime for internal ocram is not
> > > > -      * accessible if power and clock are not enabled.
> > > > -      */
> > > > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > -             if (carveout->va)
> > > > -                     memset(carveout->va, 0, carveout->len);
> > > > -     }
> > > > -
> > > > -     return  0;
> > > > -}
> > > > -
> > > > -/* Unprepare function for rproc_ops */
> > > > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > > > -{
> > > > -     pm_runtime_put_sync(rproc->dev.parent);
> > > > -
> > > >       return  0;
> > > >  }
> > > >
> > > > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rp=
roc *rproc, const struct firmware *fw
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct fi=
rmware *fw)
> > > > +{
> > > > +     struct imx_dsp_rproc *priv =3D rproc->priv;
> > > > +
> > > > +     /*
> > > > +      * Just save the fw handler, the firmware loading will be aft=
er
> > > > +      * power enabled
> > > > +      */
> > > > +     priv->firmware =3D fw;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> > > >       .prepare        =3D imx_dsp_rproc_prepare,
> > > > -     .unprepare      =3D imx_dsp_rproc_unprepare,
> > > >       .start          =3D imx_dsp_rproc_start,
> > > >       .stop           =3D imx_dsp_rproc_stop,
> > > >       .kick           =3D imx_dsp_rproc_kick,
> > > > -     .load           =3D imx_dsp_rproc_elf_load_segments,
> > > > +     .load           =3D imx_dsp_rproc_load,
> > > >       .parse_fw       =3D imx_dsp_rproc_parse_fw,
> > > >       .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> > > >       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > > > --
> > > > 2.34.1
> > > >
> > >
