Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E6E1BCA0B
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Aug 2024 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723819890; cv=none; b=cNCzSlzylHFb8eg9X30vIht70EEt1s9wHu4y84UOIy0mx9Y9ndsh4DKn4mz2f+kyReFUcT8UnBnTfZooFrDAkz75iie6tXPMh+iEhqHr2xQl3OVY6Ix8yIIuQ7B1sWN8NBqw9lgGLLgfi8v24xRnC427l8k6eS7FrOE5jZOnwy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723819890; c=relaxed/simple;
	bh=jyUGdhrTULZrS+9zkU2sOUI+gmKfwKfiCoRCVeWvTTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAzTq32Y9dgS6LK1wtASwRWgLmyjDPf0JxxD233X0JCV8jw6F/jVLx0O5ja4+fPU+L9vXjjMPoNGGvdlH+P7H1sp3/+kqXkULby0TIoz+HFvhapAhFhUdEv2VUwpy/jlWwUXs72osY/bHqpNsagarEtXybjjzBTiez8dw9AUNwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f0NsqmR8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f0NsqmR8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fdd6d81812so21329225ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Aug 2024 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723819888; x=1724424688; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vi9DTEaNngBIJgilvaS4bFwRiZJnLAe82n9Td5urRpE=;
        b=f0NsqmR8sNtFIIz+iHGPzsqJ2c6k0qIOl35En/7j/PCLXuu05QlOb6BQffy8VnfzJu
         M8AdHdg2dxYq1cFzPGnc4Esng/mXzhnWe/qS5Oj7K1O0xqrEW+caLvcsmCJQc/1fKxR3
         /ucmx8Reth2CfeXwLN+43Hknb925c0zmyxrTICEvIN1EejGXp3z1fw92n7coJa7X8hp9
         XrWw+xDOIEc3s0I1+GQwOC1biyg1WTVOOzLc3Ca+dEgABSsIHEoBGqQjTGNC6PZWVSsz
         ZwaXvaSHsz5HX97HzNYUZ2j0wkdbgKkcFzMi4GebLxyFxuJt+/++k3FZe7rqKyXjNWSz
         EKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723819888; x=1724424688;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi9DTEaNngBIJgilvaS4bFwRiZJnLAe82n9Td5urRpE=;
        b=EOYMJX5GhBwcO9zT2pZoapiWox6pFmTFe1raS7vJ5HTnpspAENmRYEjROd2uuv39z0
         bOBPn0gJ/8wsJH17X6stfOVVJNm70Lv51cjmIm9YKQomo7my5WUifXqkbFADPwXJl4co
         rA/fVIPNWScuH91NTV4nMeTrsvWmfLDRFU0lTszHUbnDBTaW69J1tQEkK5HcIqfCg83f
         MigrjxL7NDQXxojOQ0mIl9RmZbOM6KZcSy2Q0UxtcsV9NtwLrvkpCcVhu8PaI5vYWOz3
         NdEh9+/I9TriwdDAxupj3ub0hH0RwV/MsMKT0TY47dIhEwKWnp3lD07FrbInhMihl5Tl
         CAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl0G095HwGjXF7n6bqM+5oeip7EJT3L3KffP/SnJzcOF0dG+rP4z+ub5pml6aw88Jf/BAiOat+MLG5dkaiXGFo@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZC1eZeAWTyZoFanL2MbPbkHqqcmVXAdKUlJXItd7g6H4gnFB
	oiYnuYtmn2bQLDYOYJLbrETpE9AOw4XUs+uV9zQKVf+kNVsX4r6bh2gedkXrYv+ha6Ng/N4sHV3
	q
X-Google-Smtp-Source: AGHT+IF2gieWmbM13dSbOj8NS0LTGa6f3bTQe8OSxzV2qX88ELtOmHe1zAy7hVSZfKm784j8Gc07og==
X-Received: by 2002:a17:903:4288:b0:201:e65b:500b with SMTP id d9443c01a7336-2020404cdf2mr30458175ad.63.1723819887861;
        Fri, 16 Aug 2024 07:51:27 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b343:9a6:583a:ddcd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f031979asm26610285ad.81.2024.08.16.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 07:51:27 -0700 (PDT)
Date: Fri, 16 Aug 2024 08:51:25 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	s-anna@ti.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] remoteproc: k3-r5: Acquire mailbox handle during
 probe routine
Message-ID: <Zr9nbWnADDB+ZOlg@p14s>
References: <20240808074127.2688131-1-b-padhi@ti.com>
 <20240808074127.2688131-3-b-padhi@ti.com>
 <ZrzSxdxt64UkgVS3@p14s>
 <d0fea480-1682-48ec-99dd-73deaff99d7d@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0fea480-1682-48ec-99dd-73deaff99d7d@ti.com>

On Fri, Aug 16, 2024 at 01:23:59PM +0530, Beleswar Prasad Padhi wrote:
> Hi Mathieu,
> 
> On 14-08-2024 21:22, Mathieu Poirier wrote:
> > Hi Beleswar, On Thu, Aug 08, 2024 at 01: 11: 26PM +0530, Beleswar Padhi
> > wrote: > Acquire the mailbox handle during device probe and do not
> > release handle > in stop/detach routine or error paths. This removes the
> > redundant > requests for
> > ZjQcmQRYFpfptBannerStart
> > Report Suspicious
> > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!vldnVV7DH2eSIoaksHjpMPogloWUPfAcp2-dEVbMoE1YA3kGFXdJXGAJUKJm$>
> > 
> > ZjQcmQRYFpfptBannerEnd
> > Hi Beleswar,
> > 
> > On Thu, Aug 08, 2024 at 01:11:26PM +0530, Beleswar Padhi wrote:
> > > Acquire the mailbox handle during device probe and do not release handle
> > > in stop/detach routine or error paths. This removes the redundant
> > > requests for mbox handle later during rproc start/attach. This also
> > > allows to defer remoteproc driver's probe if mailbox is not probed yet.
> > > > Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> > > ---
> > >  drivers/remoteproc/ti_k3_r5_remoteproc.c | 78 +++++++++---------------
> > >  1 file changed, 30 insertions(+), 48 deletions(-)
> > > > diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > > index 57067308b3c0..8a63a9360c0f 100644
> > > --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > > +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > > @@ -194,6 +194,10 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
> > >  	const char *name = kproc->rproc->name;
> > >  	u32 msg = omap_mbox_message(data);
> > >  > +	/* Do not forward message from a detached core */
> > > +	if (kproc->rproc->state == RPROC_DETACHED)
> > > +		return;
> > > +
> > >  	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
> > >  >  	switch (msg) {
> > > @@ -229,6 +233,10 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
> > >  	mbox_msg_t msg = (mbox_msg_t)vqid;
> > >  	int ret;
> > >  > +	/* Do not forward message to a detached core */
> > > +	if (kproc->rproc->state == RPROC_DETACHED)
> > > +		return;
> > > +
> > >  	/* send the index of the triggered virtqueue in the mailbox payload */
> > >  	ret = mbox_send_message(kproc->mbox, (void *)msg);
> > >  	if (ret < 0)
> > > @@ -399,12 +407,9 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
> > >  	client->knows_txdone = false;
> > >  >  	kproc->mbox = mbox_request_channel(client, 0);
> > > -	if (IS_ERR(kproc->mbox)) {
> > > -		ret = -EBUSY;
> > > -		dev_err(dev, "mbox_request_channel failed: %ld\n",
> > > -			PTR_ERR(kproc->mbox));
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(kproc->mbox))
> > > +		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> > > +				     "mbox_request_channel failed\n");
> > >  >  	/*
> > >  	 * Ping the remote processor, this is only for sanity-sake for now;
> > > @@ -552,10 +557,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> > >  	u32 boot_addr;
> > >  	int ret;
> > >  > -	ret = k3_r5_rproc_request_mbox(rproc);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > >  	boot_addr = rproc->bootaddr;
> > >  	/* TODO: add boot_addr sanity checking */
> > >  	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
> > > @@ -564,7 +565,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> > >  	core = kproc->core;
> > >  	ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
> > >  	if (ret)
> > > -		goto put_mbox;
> > > +		return ret;
> > >  >  	/* unhalt/run all applicable cores */
> > >  	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
> > > @@ -580,13 +581,12 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> > >  		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
> > >  			dev_err(dev, "%s: can not start core 1 before core 0\n",
> > >  				__func__);
> > > -			ret = -EPERM;
> > > -			goto put_mbox;
> > > +			return -EPERM;
> > >  		}
> > >  >  		ret = k3_r5_core_run(core);
> > >  		if (ret)
> > > -			goto put_mbox;
> > > +			return ret;
> > >  	}
> > >  >  	return 0;
> > > @@ -596,8 +596,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> > >  		if (k3_r5_core_halt(core))
> > >  			dev_warn(core->dev, "core halt back failed\n");
> > >  	}
> > > -put_mbox:
> > > -	mbox_free_channel(kproc->mbox);
> > >  	return ret;
> > >  }
> > >  > @@ -658,8 +656,6 @@ static int k3_r5_rproc_stop(struct rproc
> > *rproc)
> > >  			goto out;
> > >  	}
> > >  > -	mbox_free_channel(kproc->mbox);
> > > -
> > >  	return 0;
> > >  >  unroll_core_halt:
> > > @@ -674,42 +670,22 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
> > >  /*
> > >   * Attach to a running R5F remote processor (IPC-only mode)
> > >   *
> > > - * The R5F attach callback only needs to request the mailbox, the remote
> > > - * processor is already booted, so there is no need to issue any TI-SCI
> > > - * commands to boot the R5F cores in IPC-only mode. This callback is invoked
> > > - * only in IPC-only mode.
> > > + * The R5F attach callback is a NOP. The remote processor is already booted, and
> > > + * all required resources have been acquired during probe routine, so there is
> > > + * no need to issue any TI-SCI commands to boot the R5F cores in IPC-only mode.
> > > + * This callback is invoked only in IPC-only mode and exists because
> > > + * rproc_validate() checks for its existence.
> > 
> > Excellent documentation.
> 
> 
> Thanks!
> 
> > 
> > >   */
> > > -static int k3_r5_rproc_attach(struct rproc *rproc)
> > > -{
> > > -	struct k3_r5_rproc *kproc = rproc->priv;
> > > -	struct device *dev = kproc->dev;
> > > -	int ret;
> > > -
> > > -	ret = k3_r5_rproc_request_mbox(rproc);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	dev_info(dev, "R5F core initialized in IPC-only mode\n");
> > > -	return 0;
> > > -}
> > > +static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
> > >  >  /*
> > >   * Detach from a running R5F remote processor (IPC-only mode)
> > >   *
> > > - * The R5F detach callback performs the opposite operation to attach callback
> > > - * and only needs to release the mailbox, the R5F cores are not stopped and
> > > - * will be left in booted state in IPC-only mode. This callback is invoked
> > > - * only in IPC-only mode.
> > > + * The R5F detach callback is a NOP. The R5F cores are not stopped and will be
> > > + * left in booted state in IPC-only mode. This callback is invoked only in
> > > + * IPC-only mode and exists for sanity sake.
> > 
> > I would add the part about detach() being a NOP to attach() above...
> > 
> > >   */
> > > -static int k3_r5_rproc_detach(struct rproc *rproc)
> > > -{
> > > -	struct k3_r5_rproc *kproc = rproc->priv;
> > > -	struct device *dev = kproc->dev;
> > > -
> > > -	mbox_free_channel(kproc->mbox);
> > > -	dev_info(dev, "R5F core deinitialized in IPC-only mode\n");
> > > -	return 0;
> > > -}
> > > +static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
> > 
> > ... and just remove this.
> 
> 
> Thanks for the comments. But dropping k3_r5_rproc_detach() would mean we
> would get -EINVAL[1] while trying to detach the core from sysfs[0]. Is it
> expected?
>

You are correct.  I have applied your patch.

> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/remoteproc_sysfs.c#n202
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/remoteproc_core.c#n1752
> 
> > 
> > Otherwise this patch looks good.
> > 
> > >  >  /*
> > >   * This function implements the .get_loaded_rsc_table() callback and is used
> > > @@ -1278,6 +1254,10 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
> > >  		kproc->rproc = rproc;
> > >  		core->rproc = rproc;
> > >  > +		ret = k3_r5_rproc_request_mbox(rproc);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > >  		ret = k3_r5_rproc_configure_mode(kproc);
> > >  		if (ret < 0)
> > >  			goto out;
> > > @@ -1392,6 +1372,8 @@ static void k3_r5_cluster_rproc_exit(void *data)
> > >  			}
> > >  		}
> > >  > +		mbox_free_channel(kproc->mbox);
> > > +
> > >  		rproc_del(rproc);
> > >  >  		k3_r5_reserved_mem_exit(kproc);
> > > -- > 2.34.1
> > >
