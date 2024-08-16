Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1703E12C460;
	Fri, 16 Aug 2024 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794860; cv=none; b=VP3ipTQj9HRShOPpC4drDrp4Mdwyha3+HM7z5Ko/P3yLxxrZmQ9pbyN7RdtoyFEFIi7lpB+pAEylgMo+URZNMFRxTxHzq4v9cQCyVUEzTae39ckklb+OCDFGeo9f9Ki06vpX2DzcO4zNJX3Jh2nLOitihExlY6u2Me/E1vH3APY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794860; c=relaxed/simple;
	bh=bhryEJoTl5GL1UD0luwSHefebQdolxnc4qJmQ/14J2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZOCXF37cjusnSRY4oM1xkjGzUy7Mt7AEhEGhpHHr4MFBa0IOB6JMf24g52c972SB5wTdtRRyxUAa/fNWLmaGxlxM2Nf+Zp0mjl25GaL0GwIFuHeehqgRqOnirrKKVPBvnRzHsMWqbjNCTiA3DtEvNlz7Ey9t8uWfmHwzJz888wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=v+8L5RTS; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v+8L5RTS"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47G7sDvC052102;
	Fri, 16 Aug 2024 02:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723794853;
	bh=Ik/ZdRimZKjsbKzIm3/uG54pWJF/rEJY10bDBLHSQc4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=v+8L5RTS5POTalqW46O70vH7fwkYOwzAu0FHOYFeB0lQ1fWgr8FnS9FJjWO3ZUH0Z
	 5htHbNpWp7xfTSbb2msMr9yyw8KGoD2/LpXXZQEb35oM6MMh38yOoy/DTQJpPJnSGQ
	 VoMvDs1PjR+2wFVt9NCwo9mvQFas0vY/Figlr8WQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47G7sDUp105958
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Aug 2024 02:54:13 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Aug 2024 02:54:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Aug 2024 02:54:04 -0500
Received: from [10.249.130.61] ([10.249.130.61])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47G7s0hv100175;
	Fri, 16 Aug 2024 02:54:01 -0500
Message-ID: <d0fea480-1682-48ec-99dd-73deaff99d7d@ti.com>
Date: Fri, 16 Aug 2024 13:23:59 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] remoteproc: k3-r5: Acquire mailbox handle during
 probe routine
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <s-anna@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240808074127.2688131-1-b-padhi@ti.com>
 <20240808074127.2688131-3-b-padhi@ti.com> <ZrzSxdxt64UkgVS3@p14s>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <ZrzSxdxt64UkgVS3@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Mathieu,

On 14-08-2024 21:22, Mathieu Poirier wrote:
> Hi Beleswar, On Thu, Aug 08, 2024 at 01: 11: 26PM +0530, Beleswar 
> Padhi wrote: > Acquire the mailbox handle during device probe and do 
> not release handle > in stop/detach routine or error paths. This 
> removes the redundant > requests for
> ZjQcmQRYFpfptBannerStart
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!vldnVV7DH2eSIoaksHjpMPogloWUPfAcp2-dEVbMoE1YA3kGFXdJXGAJUKJm$> 
>
> ZjQcmQRYFpfptBannerEnd
> Hi Beleswar,
>
> On Thu, Aug 08, 2024 at 01:11:26PM +0530, Beleswar Padhi wrote:
> > Acquire the mailbox handle during device probe and do not release handle
> > in stop/detach routine or error paths. This removes the redundant
> > requests for mbox handle later during rproc start/attach. This also
> > allows to defer remoteproc driver's probe if mailbox is not probed yet.
> > 
> > Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> > ---
> >  drivers/remoteproc/ti_k3_r5_remoteproc.c | 78 +++++++++---------------
> >  1 file changed, 30 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > index 57067308b3c0..8a63a9360c0f 100644
> > --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> > @@ -194,6 +194,10 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
> >  	const char *name = kproc->rproc->name;
> >  	u32 msg = omap_mbox_message(data);
> >  
> > +	/* Do not forward message from a detached core */
> > +	if (kproc->rproc->state == RPROC_DETACHED)
> > +		return;
> > +
> >  	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
> >  
> >  	switch (msg) {
> > @@ -229,6 +233,10 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
> >  	mbox_msg_t msg = (mbox_msg_t)vqid;
> >  	int ret;
> >  
> > +	/* Do not forward message to a detached core */
> > +	if (kproc->rproc->state == RPROC_DETACHED)
> > +		return;
> > +
> >  	/* send the index of the triggered virtqueue in the mailbox payload */
> >  	ret = mbox_send_message(kproc->mbox, (void *)msg);
> >  	if (ret < 0)
> > @@ -399,12 +407,9 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
> >  	client->knows_txdone = false;
> >  
> >  	kproc->mbox = mbox_request_channel(client, 0);
> > -	if (IS_ERR(kproc->mbox)) {
> > -		ret = -EBUSY;
> > -		dev_err(dev, "mbox_request_channel failed: %ld\n",
> > -			PTR_ERR(kproc->mbox));
> > -		return ret;
> > -	}
> > +	if (IS_ERR(kproc->mbox))
> > +		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> > +				     "mbox_request_channel failed\n");
> >  
> >  	/*
> >  	 * Ping the remote processor, this is only for sanity-sake for now;
> > @@ -552,10 +557,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> >  	u32 boot_addr;
> >  	int ret;
> >  
> > -	ret = k3_r5_rproc_request_mbox(rproc);
> > -	if (ret)
> > -		return ret;
> > -
> >  	boot_addr = rproc->bootaddr;
> >  	/* TODO: add boot_addr sanity checking */
> >  	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
> > @@ -564,7 +565,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> >  	core = kproc->core;
> >  	ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
> >  	if (ret)
> > -		goto put_mbox;
> > +		return ret;
> >  
> >  	/* unhalt/run all applicable cores */
> >  	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
> > @@ -580,13 +581,12 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> >  		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
> >  			dev_err(dev, "%s: can not start core 1 before core 0\n",
> >  				__func__);
> > -			ret = -EPERM;
> > -			goto put_mbox;
> > +			return -EPERM;
> >  		}
> >  
> >  		ret = k3_r5_core_run(core);
> >  		if (ret)
> > -			goto put_mbox;
> > +			return ret;
> >  	}
> >  
> >  	return 0;
> > @@ -596,8 +596,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
> >  		if (k3_r5_core_halt(core))
> >  			dev_warn(core->dev, "core halt back failed\n");
> >  	}
> > -put_mbox:
> > -	mbox_free_channel(kproc->mbox);
> >  	return ret;
> >  }
> >  
> > @@ -658,8 +656,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
> >  			goto out;
> >  	}
> >  
> > -	mbox_free_channel(kproc->mbox);
> > -
> >  	return 0;
> >  
> >  unroll_core_halt:
> > @@ -674,42 +670,22 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
> >  /*
> >   * Attach to a running R5F remote processor (IPC-only mode)
> >   *
> > - * The R5F attach callback only needs to request the mailbox, the remote
> > - * processor is already booted, so there is no need to issue any TI-SCI
> > - * commands to boot the R5F cores in IPC-only mode. This callback is invoked
> > - * only in IPC-only mode.
> > + * The R5F attach callback is a NOP. The remote processor is already booted, and
> > + * all required resources have been acquired during probe routine, so there is
> > + * no need to issue any TI-SCI commands to boot the R5F cores in IPC-only mode.
> > + * This callback is invoked only in IPC-only mode and exists because
> > + * rproc_validate() checks for its existence.
>
> Excellent documentation.


Thanks!

>
> >   */
> > -static int k3_r5_rproc_attach(struct rproc *rproc)
> > -{
> > -	struct k3_r5_rproc *kproc = rproc->priv;
> > -	struct device *dev = kproc->dev;
> > -	int ret;
> > -
> > -	ret = k3_r5_rproc_request_mbox(rproc);
> > -	if (ret)
> > -		return ret;
> > -
> > -	dev_info(dev, "R5F core initialized in IPC-only mode\n");
> > -	return 0;
> > -}
> > +static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
> >  
> >  /*
> >   * Detach from a running R5F remote processor (IPC-only mode)
> >   *
> > - * The R5F detach callback performs the opposite operation to attach callback
> > - * and only needs to release the mailbox, the R5F cores are not stopped and
> > - * will be left in booted state in IPC-only mode. This callback is invoked
> > - * only in IPC-only mode.
> > + * The R5F detach callback is a NOP. The R5F cores are not stopped and will be
> > + * left in booted state in IPC-only mode. This callback is invoked only in
> > + * IPC-only mode and exists for sanity sake.
>
> I would add the part about detach() being a NOP to attach() above...
>
> >   */
> > -static int k3_r5_rproc_detach(struct rproc *rproc)
> > -{
> > -	struct k3_r5_rproc *kproc = rproc->priv;
> > -	struct device *dev = kproc->dev;
> > -
> > -	mbox_free_channel(kproc->mbox);
> > -	dev_info(dev, "R5F core deinitialized in IPC-only mode\n");
> > -	return 0;
> > -}
> > +static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
>
> ... and just remove this.


Thanks for the comments. But dropping k3_r5_rproc_detach() would mean we 
would get -EINVAL[1] while trying to detach the core from sysfs[0]. Is 
it expected?

[0]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/remoteproc_sysfs.c#n202
[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/remoteproc_core.c#n1752

>
> Otherwise this patch looks good.
>
> >  
> >  /*
> >   * This function implements the .get_loaded_rsc_table() callback and is used
> > @@ -1278,6 +1254,10 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
> >  		kproc->rproc = rproc;
> >  		core->rproc = rproc;
> >  
> > +		ret = k3_r5_rproc_request_mbox(rproc);
> > +		if (ret)
> > +			return ret;
> > +
> >  		ret = k3_r5_rproc_configure_mode(kproc);
> >  		if (ret < 0)
> >  			goto out;
> > @@ -1392,6 +1372,8 @@ static void k3_r5_cluster_rproc_exit(void *data)
> >  			}
> >  		}
> >  
> > +		mbox_free_channel(kproc->mbox);
> > +
> >  		rproc_del(rproc);
> >  
> >  		k3_r5_reserved_mem_exit(kproc);
> > -- 
> > 2.34.1
> > 
