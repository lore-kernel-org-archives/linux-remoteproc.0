Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F228453498
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751422; cv=none; b=sJB2DLapjK7SsMVWED+S/s68B5awMR3xMAumLfLUB2ol47AYAmHxhgbGXaOkouPhNdqFb116Fj1hNT/6zgGvUgQJ2qk2uGZqdAqawX8WeMNc8vQ4BUmoEc0KER2tC9L3iGbywBTATbNqWGD1HG4DLLDrjQ4hOlDERSjnlXGGDVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751422; c=relaxed/simple;
	bh=TrFQtQEp+bE6O/CFdbgivT5heIeRCPa1pLQCKyjbYlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPe8WjA/BedNoYWxDx+ySnt0mlbYUsmoIUcCkqkJQBVlGWYBq0tkIgZfg5K/3QpMJUk+TVXDW7tImf5tWgBUOoIj5P8mYlK2taXVD7NLHOo+vW2WHb0uHTHrNOfZ9iiXj/SoEKnO2p2BGqll1PCvYfsvKDuOgI4RFg8Ut43C934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNiYo+As; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNiYo+As"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c95a0c0aa2so24932225ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782751418; x=1783356218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qtZBVd8yePFKbqBw2Sj49p+P306FRw4PXhxNd+NXf2U=;
        b=CNiYo+AshtfKiAcDtR65MDqdfm+PmKCyJH6NNU0KaUB4gqdC1+HFYK+fAaSQeiYG0v
         qPM+n1IJxuqvxbElujxEcQSDIRPXynWeDBoonykYBblZFxoy12OZd+V7k7NiHGKNzKfz
         4T5xjjLJKqJipvAsbnQnOxcRzcHNb7812H4z+WM3yA+da2g+t1qbFKapzoN0U6Kth1ok
         C8kcYURIzXyx/pl2ONEuYQzQPQ3BN+RJz5VXZLgBARBR81aXbXJbDoJjlz/fSoNjC8+5
         UQXykXCoz9nyxF0gfjYoHfcY0IXKGY6vf/S7uBCzH9RUM8Ksc0ZpgbyZvr4qQWXpUYw2
         nlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751418; x=1783356218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtZBVd8yePFKbqBw2Sj49p+P306FRw4PXhxNd+NXf2U=;
        b=n6vCQYyl2/8GMawaTnpk9ybNZXEEu/LQkYg0SKxBS/8u8zxvTr9CZackYpZbxHAtb5
         2kOa5ZfVA4Wc9AZL3WZF07kEcUhLwsqFeLlnnsaFuRJDMeQXnYXudAw91OxpQViURfHC
         x3m1tzfc1tFX51eWlKSBmmcXGZwFxWabkB6hjpfBHJ36X5e933qiIgFf3bRt6qH42pYc
         ZrqbCUDZ4hu+d5IQ8DssnLvTnSEg28Q32L6LH68MUwoBt/fRVEDIN6dSdZCZ7yWOASZB
         PnINnPA07mvKGJd/HKpCU8t1T+M/rwpydVSTuOXzsd3xTgvmAHmowkYE0c//172g1FDg
         iFRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbWfRYv2+kUmeywxvrFFC+RTO8YluHbVAMWANK+tFVbXhNaUBQWNAFP4X6mjiSgQNTz9aqx5hBxa6FBGEIoau1@vger.kernel.org
X-Gm-Message-State: AOJu0YxTusrW3EIb65h9i0x8o0oXcoMx1GRqWomhlxImdrdh3ILDTR/5
	vAeawAVDJ/A2BYBUszFFlII/f8F6iwGLuXbZLhywD7nVmQ5oi3Vh+wiVWxaPWXXL/HQ=
X-Gm-Gg: AfdE7ckZaMDj51Oc8cLyKiac7wZdNUZd7kbay6buNS5AlvAxdNc2nVXHtd7/3sSwGLb
	N2pQVam8SfApA+3kkj2lyzRiX497uUrYvgRLxXXH9J/XHqUEVs4mZybLzTlb6zeFdxjkpkze0e8
	Xixo/13aWYDwzASCy4u9lMFoOWVaXEO34h9aCDkK7q/Ea2KChZE/PvHRE8XZDW3OdcqpJSTjWx6
	zzSCbnNZPdNIug2Hie8QmcVwL0bjW3jGVZ48B3RFhfTfsBD8jOmB6QURsmac8NGIe3PvCwDbM3c
	WMFKFTSCSIntf79dhaWeMGO7QnGqWXgc2LJi1W6csKCpgyQUHSCwfp9tWKwbAlg+oKDr0Ufu5rP
	4cjJIzP9bDU2U/tZsrfs2z8Ez7ZjuiLf4g0WXO5VD15JfcEThOId5gFGKFbKKaeF3ftQxarESUB
	iOdTLj7g9NeunmeGXK
X-Received: by 2002:a17:902:ce8c:b0:2c9:c46b:129b with SMTP id d9443c01a7336-2ca2d5288fdmr1527855ad.5.1782751418355;
        Mon, 29 Jun 2026 09:43:38 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:aa83:261a:68a7:9974])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b8e62a18sm47420495ad.22.2026.06.29.09.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:43:37 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:43:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] remoteproc: virtio: support dynamic number of vrings
Message-ID: <akKgtwY5iGo0xsPD@p14s>
References: <20260621-vring_flex-v1-1-c6c582fbe94b@valla.it>
 <ajwZ9EPnrYu2M6G-@p14s>
 <aj2PQGRj4N_xWnyp@bywater>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aj2PQGRj4N_xWnyp@bywater>

On Thu, Jun 25, 2026 at 10:54:05PM +0200, Francesco Valla wrote:
> Hi Mathieu,
> 
> On Wed, Jun 24, 2026 at 11:55:00AM -0600, Mathieu Poirier wrote:
> > Hi Francesco,
> > 
> > On Sun, Jun 21, 2026 at 11:57:31PM +0200, Francesco Valla wrote:
> > > The number of vrings for each vdev has been fixed to 2 since the
> > > introduction of multi-vdev support [1]; this is completely fine for the
> > > rpmsg usecase, but can conflict with other virtio devices (CAN for
> > > example requires 3 virtqueues, entropy only 1, network a variable number
> > > and so on).
> > 
> > I suppose the remoteproc subsystem is involved because these other virtio
> > devices are behind a remote processor?  If so, how does virtio drivers for the
> > devices get called?
> > 
> 
> Yes, the idea is to have virtio devices provided by a remote processor.
> I am investingating the possibility after several years of custom
> solutions (especially for CAN buses, now covered by the recent virtio
> CAN device), as well as a brief discussion on the possibility of using
> virtio-gpu for screen sharing in mixed-criticality systems instead of
> rpmsg-based solutions (like the one presented recently by TI [1]).
> 
> AFAIU, the resource table format used by the remoteproc framework was
> designed to support any kind of virtio device, and in fact the
> rproc-virtio driver is not restricting the device type to a subset of
> allowed device IDs wehn calling register_virtio_device() [2].
> 
> In practice, only two virtio drivers are usable over the proc framework
> today, them being rpmsg and virtio console, since they are the only two
> that allocate their transfer buffers from the memory provided by the
> rproc framework (using dma_alloc_coherent()) and then properly translate
> the addresses used inside the scatter-gather lists used for vring
> transfers [3] [4].
> 
> I am still unsure on how to tackle the other drivers - I have a PoC for
> a modified virtio-rng driver, but other solutions are emerging, like the
> hypervisorless virtio effort [5] and virtio-msg [6].
>

My goal in asking for more details was to see if you had done your research on
this topic - and you have.  
 
> During this investigation, I stumbled on the limitation posed by the
> fixed number of vrings and decided to send a patch for it.
> 

Please resend this patch as part of the patchset that provides support for (one)
of the devices you are interested in and we'll take it from there.

> > Otherwise I'm good with the code.
> > 
> > Thanks,
> > Mathieu
> > 
> 
> Thank you!
> 
> Reagrds,
> Francesco
> 
> [1] https://cfp.embedded-recipes.org/media/er2026/submissions/PCYPJP/resources/rpmsg-kms-dispay-em_QToijxj.pdf
> [2] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/remoteproc/remoteproc_virtio.c#L446
> [3] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/rpmsg/virtio_rpmsg_bus.c#L864
> [4] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/char/virtio_console.c#L426
> [5] https://openamp.readthedocs.io/en/latest/hypervisorless_virtio_zcu102/README_hypervisorless_virtio.html
> [6] https://lore.kernel.org/all/cover.1781514628.git.bertrand.marquis@arm.com/
> 
> > > 
> > > Remove the static vring allocation, transforming it to a flex array that
> > > is allocated at vdev probe time; for the existent usecases (i.e.: mainly
> > > rpmsg) this leads to no functional change, except the additional memory
> > > used for the counter associated to the new array.
> > > 
> > > The maximum number of virtqueues is limited to 256 due to the uint8_t
> > > value used inside the resource table to indicate the number of vring to
> > > allocate; for this reason, no additional plausibility check is performed
> > > on the number of vrings indicated by the resource table.
> > > 
> > > As a side effect, this also fixes the single virtqueue usecase, which
> > > was apparently supported also before but for which the remove action
> > > caused an error (because the remove action was trying to unmap also the
> > > second vring, which was in fact not mapped).
> > > 
> > > [1] https://lore.kernel.org/all/1330589497-4139-5-git-send-email-ohad@wizery.com/
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c   |  7 -------
> > >  drivers/remoteproc/remoteproc_virtio.c | 21 +++++++++++++--------
> > >  include/linux/remoteproc.h             | 10 ++++------
> > >  3 files changed, 17 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index f003be006b1b..88504d6eed93 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -473,7 +473,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  {
> > >  	struct fw_rsc_vdev *rsc = ptr;
> > >  	struct device *dev = &rproc->dev;
> > > -	struct rproc_vdev *rvdev;
> > >  	size_t rsc_size;
> > >  	struct rproc_vdev_data rvdev_data;
> > >  	struct platform_device *pdev;
> > > @@ -494,12 +493,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
> > >  		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
> > >  
> > > -	/* we currently support only two vrings per rvdev */
> > > -	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
> > > -		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
> > > -		return -EINVAL;
> > > -	}
> > > -
> > >  	rvdev_data.id = rsc->id;
> > >  	rvdev_data.index = rproc->nb_vdev++;
> > >  	rvdev_data.rsc_offset = offset;
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index d5e9ff045a28..96f13f828b8e 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -115,8 +115,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
> > >  	void *addr;
> > >  	int num, size;
> > >  
> > > -	/* we're temporarily limited to two virtqueues per rvdev */
> > > -	if (id >= ARRAY_SIZE(rvdev->vring))
> > > +	if (id >= rvdev->num_vrings)
> > >  		return ERR_PTR(-EINVAL);
> > >  
> > >  	if (!name)
> > > @@ -503,17 +502,20 @@ static int rproc_virtio_probe(struct platform_device *pdev)
> > >  	if (!rvdev_data)
> > >  		return -EINVAL;
> > >  
> > > -	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
> > > +	rsc = rvdev_data->rsc;
> > > +
> > > +	rvdev = kzalloc_flex(*rvdev, vring, rsc->num_of_vrings);
> > >  	if (!rvdev)
> > >  		return -ENOMEM;
> > >  
> > >  	rvdev->id = rvdev_data->id;
> > >  	rvdev->rproc = rproc;
> > >  	rvdev->index = rvdev_data->index;
> > > +	rvdev->num_vrings = rsc->num_of_vrings;
> > >  
> > >  	ret = copy_dma_range_map(dev, rproc->dev.parent);
> > >  	if (ret)
> > > -		return ret;
> > > +		goto free_rvdev;
> > >  
> > >  	/* Make device dma capable by inheriting from parent's capabilities */
> > >  	set_dma_ops(dev, get_dma_ops(rproc->dev.parent));
> > > @@ -527,13 +529,11 @@ static int rproc_virtio_probe(struct platform_device *pdev)
> > >  	platform_set_drvdata(pdev, rvdev);
> > >  	rvdev->pdev = pdev;
> > >  
> > > -	rsc = rvdev_data->rsc;
> > > -
> > >  	/* parse the vrings */
> > >  	for (i = 0; i < rsc->num_of_vrings; i++) {
> > >  		ret = rproc_parse_vring(rvdev, rsc, i);
> > >  		if (ret)
> > > -			return ret;
> > > +			goto free_rvdev;
> > >  	}
> > >  
> > >  	/* remember the resource offset*/
> > > @@ -569,6 +569,9 @@ static int rproc_virtio_probe(struct platform_device *pdev)
> > >  	for (i--; i >= 0; i--)
> > >  		rproc_free_vring(&rvdev->vring[i]);
> > >  
> > > +free_rvdev:
> > > +	kfree(rvdev);
> > > +
> > >  	return ret;
> > >  }
> > >  
> > > @@ -579,7 +582,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
> > >  	struct rproc_vring *rvring;
> > >  	int id;
> > >  
> > > -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> > > +	for (id = 0; id < rvdev->num_vrings; id++) {
> > >  		rvring = &rvdev->vring[id];
> > >  		rproc_free_vring(rvring);
> > >  	}
> > > @@ -588,6 +591,8 @@ static void rproc_virtio_remove(struct platform_device *pdev)
> > >  	rproc_remove_rvdev(rvdev);
> > >  
> > >  	put_device(&rproc->dev);
> > > +
> > > +	kfree(rvdev);
> > >  }
> > >  
> > >  /* Platform driver */
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 7c1546d48008..222e1a56cebc 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -339,10 +339,6 @@ struct rproc_subdev {
> > >  	void (*unprepare)(struct rproc_subdev *subdev);
> > >  };
> > >  
> > > -/* we currently support only two vrings per rvdev */
> > > -
> > > -#define RVDEV_NUM_VRINGS 2
> > > -
> > >  /**
> > >   * struct rproc_vring - remoteproc vring state
> > >   * @va:	virtual address
> > > @@ -370,9 +366,10 @@ struct rproc_vring {
> > >   * @id: virtio device id (as in virtio_ids.h)
> > >   * @node: list node
> > >   * @rproc: the rproc handle
> > > - * @vring: the vrings for this vdev
> > >   * @rsc_offset: offset of the vdev's resource entry
> > >   * @index: vdev position versus other vdev declared in resource table
> > > + * @num_vrings: the number of vrings for this vdev
> > > + * @vring: the vrings for this vdev
> > >   */
> > >  struct rproc_vdev {
> > >  
> > > @@ -382,9 +379,10 @@ struct rproc_vdev {
> > >  	unsigned int id;
> > >  	struct list_head node;
> > >  	struct rproc *rproc;
> > > -	struct rproc_vring vring[RVDEV_NUM_VRINGS];
> > >  	u32 rsc_offset;
> > >  	u32 index;
> > > +	unsigned int num_vrings;
> > > +	struct rproc_vring vring[] __counted_by(num_vrings);
> > >  };
> > >  
> > >  struct rproc *rproc_get_by_phandle(phandle phandle);
> > > 
> > > ---
> > > base-commit: ef0c9f75a19532d7675384708fc8621e10850104
> > > change-id: 20260618-vring_flex-b4d23d1974ba
> > > 
> > > Best regards,
> > > --  
> > > Francesco Valla <francesco@valla.it>
> > > 
