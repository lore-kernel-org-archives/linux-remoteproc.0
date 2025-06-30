Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9607C2737FA
	for <linux-remoteproc@vger.kernel.org>; Mon, 30 Jun 2025 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302168; cv=none; b=qOFtQhaUh1IE/tSwbbhMpFbsKdUV0movjmrzLWc7FzxN5vM7kkaweAdr5Scq+p0WLdtgxij9qQFZU9uXdhLi2MhPXkPMl9Uwa6QfD04+aix4A2ChXr49N3Bz1ijDnuMKAvbJT/jUYDRqgEUCkGyFs3/+owwI9Lz0HYrXRo1ArYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302168; c=relaxed/simple;
	bh=CB8W9YdDXoMRpYtBPXwS8mBv1EkgZUyaw6oUVqj1T0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olojEtcmr+b/3g+9V4EVBPyqaeOtROnokdHPoewncyCEfeZ8L3PUftG+FxejKVEB/S20ejnEOEhB5XTu67Sw3Z/W3o1uLE/OPH7TEACQtdj7owkEPGW9WvpBoOp68RY29ZY8xf6oXbT2ASNnR7+Ia+N3DJjdLbkENtqSOvo3fac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMsNlk7y; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMsNlk7y"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31d8dd18cbso6072533a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Jun 2025 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302166; x=1751906966; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CklcrQeUs8WwKNH+qJpTOD4f2jR74kNkuDiWXQCcBT0=;
        b=pMsNlk7ySDp2J76a0Q5diM1wr2oYbq0LPpWoV/NT/SfTgZyZp5+Ol3JeoOiL0ki/ra
         p2ICpDA6JHF0uMumTDS4vEY2iXtKqqt4C5W58UPNbYq+0VACH7TKLqiG0yHUnr9J8C0i
         aBg8drTo6a9Qn8FcaRiSbNSh7BAqq9kMMQHpJF6HTmoCsOv/uQCy/AU5QXPRdwpQPWT4
         CgT33PweyO6/clwYlYYXzVRQN9aRPx86aI2V5jjVQ/ormofbJjBfbzEMtpng5JJt8Dg7
         stgb/drn18CTBAkCWFr2AnIfWZKXwBWKeEkkbZkNP6qA4WdjirFPz02+hbBtGHAEyrC7
         E8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302166; x=1751906966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CklcrQeUs8WwKNH+qJpTOD4f2jR74kNkuDiWXQCcBT0=;
        b=Ll+Oghf/zerqzg7VhX9w9kHVq73W1aeT0U1SXHADhR/LzGjmdAEL4NoYLqWgHb6Ks4
         5JY2YZiwSM3wTQISSRl7Ce1cVesBsN0oaul1uzQhOwMXu1m3DvK9Tw8VyB1jTwHP3DCr
         8KG/uPZ26odoSUtkDV58GazsgehnCGoy9IHjXL4aQoqQIAF2DtONBAH7k9hH8sD1zKha
         p866lUK6GI9v7v9Pvz+LCfeo3WhnJclSnAvuJmg3Mop0XZg116f0G+L/id2oO2v6CZF2
         r/7dABJM7j53s3ZnFKyUucBs2rLqmymR7pQxdcEwgpF21xc0bzkk2OjBsh5TOUdUrbFZ
         uGdg==
X-Forwarded-Encrypted: i=1; AJvYcCWR7BzhSBfa2J3ds3FGdiICAWnLv707ab8Zsx1IT1a+Bwo3fkd2jS8HHcecMhPnzUdzuiVtW/Eq2/L4FCZ35UX6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73Oqv/Kcn7Tv9bnxry0Hn5rLMq4Gj4YmiOdL5kC37SUIfMtZ2
	nunievpAEC4J1kiWdezgawB4SP+AEQsqNX4VXasl5A/Bv263XpxauVW606eKi3XjZDw=
X-Gm-Gg: ASbGncufNEscK7XaFyreaGyeWpf9aD8A4PVlUaPtvOm9XvaoedtiiJjZ8A8+iusYUac
	Kgav5CfZybAe4erBVeWvDovPv6fVrpftJdTSVnZtXZ2Bn5qBqcwq0zpsk26JodzuHlAmi9gOy49
	M2Z9IgvqFQtDgtg4itviXmdyZjRkuTxFPjMwlOYspF28E7bh4H4GmeV7044iA/8+jnBz4MaZh4L
	1wNtOCrxHhPe38so1qaWBHYm11xdmiC35HnJ2z7LIp6a4ucajdqwy9FPy8oT/D4ex//1rgtFLqS
	1flOLEVeOCcQ7kJ5xY8/rAoueMOgb6dHytU6PypGRtQ08HVjrtAwWZ0sQt7TOdOVow==
X-Google-Smtp-Source: AGHT+IFTE6nShnM90rUftHRk85Rnoc7393tM7h/AUEngoFniWlj5vPOii5Zn19qJP3R1A91L7OL2+g==
X-Received: by 2002:a05:6a21:33a4:b0:21f:7430:148a with SMTP id adf61e73a8af0-220a18343d9mr21381518637.28.1751302165795;
        Mon, 30 Jun 2025 09:49:25 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3274:25ba:45cc:d85d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef0f3sm9752245b3a.154.2025.06.30.09.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:49:25 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:49:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery
 process
Message-ID: <aGLAEvhyjrCbZoIf@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com>
 <aFltBpXuEXVZ5gKn@p14s>
 <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
 <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
 <CAA+D8AM47P7xw2Ppgcr9d=DB2eSkQg6uQ_F22Te_=HFuMCNXxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AM47P7xw2Ppgcr9d=DB2eSkQg6uQ_F22Te_=HFuMCNXxw@mail.gmail.com>

On Thu, Jun 26, 2025 at 09:32:06AM +0800, Shengjiu Wang wrote:
> On Wed, Jun 25, 2025 at 10:39 PM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, 24 Jun 2025 at 21:25, Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> > >
> > > On Mon, Jun 23, 2025 at 11:11 PM Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > Good day,
> > > >
> > > > On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > > > > when recovery is triggered, rproc_stop() is called first then
> > > > > rproc_start(), but there is no rproc_unprepare_device() and
> > > > > rproc_prepare_device() in the flow.
> > > > >
> > > > > So power enablement needs to be moved from prepare callback to start
> > > > > callback, power disablement needs to be moved from unprepare callback
> > > > > to stop callback, loading elf function also needs to be moved to start
> > > > > callback, the load callback only store the firmware handler.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++------------
> > > > >  1 file changed, 36 insertions(+), 22 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > index 5ee622bf5352..9b9cddb224b0 100644
> > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> > > > >   * @ipc_handle: System Control Unit ipc handle
> > > > >   * @rproc_work: work for processing virtio interrupts
> > > > >   * @pm_comp: completion primitive to sync for suspend response
> > > > > + * @firmware: firmware handler
> > > > >   * @flags: control flags
> > > > >   */
> > > > >  struct imx_dsp_rproc {
> > > > > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> > > > >       struct imx_sc_ipc                       *ipc_handle;
> > > > >       struct work_struct                      rproc_work;
> > > > >       struct completion                       pm_comp;
> > > > > +     const struct firmware                   *firmware;
> > > > >       u32                                     flags;
> > > > >  };
> > > > >
> > > > > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_att_imx8ulp[] = {
> > > > >
> > > > >  /* Initialize the mailboxes between cores, if exists */
> > > > >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> > > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
> > > > >
> > > > >  /* Reset function for DSP on i.MX8MP */
> > > > >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > > > > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
> > > > >       const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> > > > >       const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
> > > > >       struct device *dev = rproc->dev.parent;
> > > > > +     struct rproc_mem_entry *carveout;
> > > > >       int ret;
> > > > >
> > > > > +     pm_runtime_get_sync(dev);
> > > > > +
> > > > > +     /*
> > > > > +      * Clear buffers after pm rumtime for internal ocram is not
> > > > > +      * accessible if power and clock are not enabled.
> > > > > +      */
> > > > > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > > +             if (carveout->va)
> > > > > +                     memset(carveout->va, 0, carveout->len);
> > > > > +     }
> > > > > +
> > > > > +     ret = imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > >       switch (dcfg->method) {
> > > > >       case IMX_RPROC_MMIO:
> > > > >               ret = regmap_update_bits(priv->regmap,
> > > > > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> > > > >
> > > > >       if (rproc->state == RPROC_CRASHED) {
> > > > >               priv->flags &= ~REMOTE_IS_READY;
> > > > > +             pm_runtime_put_sync(dev);
> > > >
> > > > From this patch I understand that for a recovery to be successful, the
> > > > remote processor _has_ to go through a hard reset.  But here the PM runtime API
> > > > is used, meaning the remote processor won't be switched off if another device in
> > > > the same power domain still neeeds power.  If that is the case, the solution in
> > > > tihs patch won't work.
> > >
> > > Thanks for reviewing.
> > > With the case you mentioned, there is software reset to make the
> > > recovery process work.
> >
> >
> > Are you talking about a manual software reset of some other mechanism?
> >
> > If manual software reset, the recovery may or may not work and we
> > simply don't know when that might be.  If it's another mechanism, then
> > that mechanism should be used in all cases.  Either way, I don't see
> > how we can move forward with this patch.
> 
> Not manual software reset,  in this driver we registered .reset() function.
> it has been called at imx_dsp_runtime_resume(),  I paste the function below.
> 
> And I have tested the case you mentioned, the recovery works.
> 
> /* pm runtime functions */
> static int imx_dsp_runtime_resume(struct device *dev)
> {
>         struct rproc *rproc = dev_get_drvdata(dev);
>         struct imx_dsp_rproc *priv = rproc->priv;
>         const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>         int ret;
> 
>         /*
>          * There is power domain attached with mailbox, if setup mailbox
>          * in probe(), then the power of mailbox is always enabled,
>          * the power can't be saved.
>          * So move setup of mailbox to runtime resume.
>          */
>         ret = imx_dsp_rproc_mbox_init(priv);
>         if (ret) {
>                 dev_err(dev, "failed on imx_dsp_rproc_mbox_init\n");
>                 return ret;
>         }
> 
>         ret = clk_bulk_prepare_enable(DSP_RPROC_CLK_MAX, priv->clks);
>         if (ret) {
>                 dev_err(dev, "failed on clk_bulk_prepare_enable\n");
>                 return ret;
>         }
> 
>         /* Reset DSP if needed */
>         if (dsp_dcfg->reset)
>                 dsp_dcfg->reset(priv);
> 
>         return 0;
> }
>

Thanks for the clarification.  I would have been nice to have that kind of
explanation (not the copy paste of the imx_dsp_runtime_resume() function) in the
changelog.

That said, that is just one aspect of the things I find bizarre with this
patchset - see below.
 
> >
> > >
> > >
> > > best regards
> > > Shengjiu Wang
> > >
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > > >               return 0;
> > > > >       }
> > > > >
> > > > > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> > > > >       else
> > > > >               priv->flags &= ~REMOTE_IS_READY;
> > > > >
> > > > > +     pm_runtime_put_sync(dev);
> > > > > +
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
> > > > >  {
> > > > >       struct imx_dsp_rproc *priv = rproc->priv;
> > > > >       struct device *dev = rproc->dev.parent;
> > > > > -     struct rproc_mem_entry *carveout;
> > > > >       int ret;
> > > > >
> > > > >       ret = imx_dsp_rproc_add_carveout(priv);
> > > > > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
> > > > >               return ret;
> > > > >       }
> > > > >
> > > > > -     pm_runtime_get_sync(dev);
> > > > > -
> > > > > -     /*
> > > > > -      * Clear buffers after pm rumtime for internal ocram is not
> > > > > -      * accessible if power and clock are not enabled.
> > > > > -      */
> > > > > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > > -             if (carveout->va)
> > > > > -                     memset(carveout->va, 0, carveout->len);
> > > > > -     }
> > > > > -
> > > > > -     return  0;
> > > > > -}
> > > > > -
> > > > > -/* Unprepare function for rproc_ops */
> > > > > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > > > > -{
> > > > > -     pm_runtime_put_sync(rproc->dev.parent);
> > > > > -
> > > > >       return  0;
> > > > >  }
> > > > >
> > > > > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
> > > > > +{
> > > > > +     struct imx_dsp_rproc *priv = rproc->priv;
> > > > > +
> > > > > +     /*
> > > > > +      * Just save the fw handler, the firmware loading will be after
> > > > > +      * power enabled
> > > > > +      */
> > > > > +     priv->firmware = fw;
> > > > > +

Why is a new firwmare variable needed?  Why can't you just use rproc->firmware?

> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > >  static const struct rproc_ops imx_dsp_rproc_ops = {
> > > > >       .prepare        = imx_dsp_rproc_prepare,
> > > > > -     .unprepare      = imx_dsp_rproc_unprepare,
> > > > >       .start          = imx_dsp_rproc_start,
> > > > >       .stop           = imx_dsp_rproc_stop,
> > > > >       .kick           = imx_dsp_rproc_kick,
> > > > > -     .load           = imx_dsp_rproc_elf_load_segments,
> > > > > +     .load           = imx_dsp_rproc_load,
> > > > >       .parse_fw       = imx_dsp_rproc_parse_fw,
> > > > >       .handle_rsc     = imx_dsp_rproc_handle_rsc,
> > > > >       .find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >
