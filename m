Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472BB315793;
	Thu, 25 Jun 2026 22:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782427076; cv=pass; b=frFmsUUV4ckUE+iDLfmB26MM/WfFXrlKOXr4AkTgiopgJBdmCAijQ9Egya1oKwiiBThlz423axHkYzi7193aCNh+T1xPQyZ2V2ScMy4ZeA7ex/ckdGtGyvB4m1gC82mZ/KidKW9jNL0edNx1X6mvlY8do4CuyPCcdHyCR/i2BqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782427076; c=relaxed/simple;
	bh=oy90Ls9RGeif7Nm3qRIw6eo9xzUZte5Urz/gAqu0sqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAjNIVfxuGt6WnnrPTt/xEio9nbb4+mJyCugfyuiHf6xt/DplXNQ1D0t3f1nDWzysAKG13G649djxzg1lKR7hBvf2D0QMdGhcHJnyXQTCgNUmtVXLyYf2fPnM5IRaG+L4QyXM/HTYmVrEgcBlYSDTMezqnOd2xIetmKJWwbAhm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=BMZFwdmr; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=sy6dYJEI; arc=pass smtp.client-ip=185.56.87.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="BMZFwdmr";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="sy6dYJEI"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-44jl.prod.antispam.mailspamprotection.com; s=arckey; t=1782427074;
	 b=JYwF09DqImjSPOAslIKGKX1GeFrjG2pIe9lrgknhxxwI1UQXX+pb7N/zuAMcT9iMaoV5tcOHkP
	  Cr9GAvQxkxyDGWRTgauHix1EfUtfCtzy5+VrGaCUer67uwpYOwInYKz6284mV+kgEwVyoANuus
	  DaougOneQfGlPdW4k4s3g8k3vWuRn66DBe7SBaI3Ggrgt1bw4HiY154YBj8CidSKh5VSNm1xt0
	  dgLUe08yAIyTUKzkxwRk36ONV2KUFsI4i9mAlhmGMEt/5H0caRLMWYIHW9chhlTHtWZsDVXqRA
	  NUry5HpRzKJ4c6nq9LqfgX1CjKEunGLwF+FhqXQ/afEW2Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-44jl.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-44jl.prod.antispam.mailspamprotection.com; s=arckey; t=1782427074;
	bh=oy90Ls9RGeif7Nm3qRIw6eo9xzUZte5Urz/gAqu0sqE=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=M6tkF6zMVW5Xv6oUcIfFV+/Y2tdrFmb+O0NYa2q6Jl5ExCgxtp1cWJ7EA0wBg7sy13XfjD0jHH
	  xFFdcX6sqjM7IFsQhthZf1txSbQvw42XxoCwAAPH5IbpeWFtlaEDcGtq2PO53gzBvGFwkaMlgN
	  2EJoe+9lRWwVQ0aGSGR78hRArDlX1H7NVFGYWrR8AnTx6FEqg2P+s+zqsjGWIi6fY7zdoxURQ3
	  Ato2Io8wHSlwmbvddrkETTMUpLgMT7yq/WRY8jj8/sVWV60hPraU2UiyW6aADsKKO5zYEzAaHp
	  zdd6ypOH0rMbb4vFbKM9IeFvlKgVEJS6y7qdjkC8MBGTFw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=osspM9/HEljaPbt9WRG8kAN/wTmdpVguvxRe/wdoWlc=; b=BMZFwdmr8WCo3bzkRTckcIQl3X
	Wu5OvjqHfhGAcg/zdGBoO8Tcihf8dd9SLiQg0UzISRXjcpEf5A/O13Nu4Vfoq3+rQdmT3rYtseFIe
	27dCTDMnT/d5okeD83i78i8PlSDrhAQyHuEiJlXiuPMP9HJpdKEPNktCcubmmJz9tzLo=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-44jl.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1wcr5S-00000007dAi-1MxR;
	Thu, 25 Jun 2026 20:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=osspM9/HEljaPbt9WRG8kAN/wTmdpVguvxRe/wdoWlc=; b=sy6dYJEIhP8CznvS3gPIoyU0Jz
	nU3wCW8UX8i1IhOfiqCL+89HAK/PABWim39luwMVedrslb5yRjnifXLR1Gskgtn9iKObSTkx3ZFF9
	fBvMTMC9Q6qszvhB+Y5RY/2eSKXGFV1cUDL7bsXEvIvL7kxAo4NqGFYqKzBVkgkWHuxE=;
Received: from [87.14.44.248] (port=61072 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1wcr5L-00000000Ked-24H8;
	Thu, 25 Jun 2026 20:54:07 +0000
Date: Thu, 25 Jun 2026 22:54:05 +0200
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] remoteproc: virtio: support dynamic number of vrings
Message-ID: <aj2PQGRj4N_xWnyp@bywater>
References: <20260621-vring_flex-v1-1-c6c582fbe94b@valla.it>
 <ajwZ9EPnrYu2M6G-@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajwZ9EPnrYu2M6G-@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0d85d4c0d77fed4c3d6936bd8cf441cf
X-AntiAbuse: ID - 0d85d4c0d77fed4c3d6936bd8cf441cf
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wcr5S-00000007dAi-1MxR-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-44jl.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Mathieu,

On Wed, Jun 24, 2026 at 11:55:00AM -0600, Mathieu Poirier wrote:
> Hi Francesco,
> 
> On Sun, Jun 21, 2026 at 11:57:31PM +0200, Francesco Valla wrote:
> > The number of vrings for each vdev has been fixed to 2 since the
> > introduction of multi-vdev support [1]; this is completely fine for the
> > rpmsg usecase, but can conflict with other virtio devices (CAN for
> > example requires 3 virtqueues, entropy only 1, network a variable number
> > and so on).
> 
> I suppose the remoteproc subsystem is involved because these other virtio
> devices are behind a remote processor?  If so, how does virtio drivers for the
> devices get called?
> 

Yes, the idea is to have virtio devices provided by a remote processor.
I am investingating the possibility after several years of custom
solutions (especially for CAN buses, now covered by the recent virtio
CAN device), as well as a brief discussion on the possibility of using
virtio-gpu for screen sharing in mixed-criticality systems instead of
rpmsg-based solutions (like the one presented recently by TI [1]).

AFAIU, the resource table format used by the remoteproc framework was
designed to support any kind of virtio device, and in fact the
rproc-virtio driver is not restricting the device type to a subset of
allowed device IDs wehn calling register_virtio_device() [2].

In practice, only two virtio drivers are usable over the proc framework
today, them being rpmsg and virtio console, since they are the only two
that allocate their transfer buffers from the memory provided by the
rproc framework (using dma_alloc_coherent()) and then properly translate
the addresses used inside the scatter-gather lists used for vring
transfers [3] [4].

I am still unsure on how to tackle the other drivers - I have a PoC for
a modified virtio-rng driver, but other solutions are emerging, like the
hypervisorless virtio effort [5] and virtio-msg [6].

During this investigation, I stumbled on the limitation posed by the
fixed number of vrings and decided to send a patch for it.

> Otherwise I'm good with the code.
> 
> Thanks,
> Mathieu
> 

Thank you!

Reagrds,
Francesco

[1] https://cfp.embedded-recipes.org/media/er2026/submissions/PCYPJP/resources/rpmsg-kms-dispay-em_QToijxj.pdf
[2] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/remoteproc/remoteproc_virtio.c#L446
[3] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/rpmsg/virtio_rpmsg_bus.c#L864
[4] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/char/virtio_console.c#L426
[5] https://openamp.readthedocs.io/en/latest/hypervisorless_virtio_zcu102/README_hypervisorless_virtio.html
[6] https://lore.kernel.org/all/cover.1781514628.git.bertrand.marquis@arm.com/

> > 
> > Remove the static vring allocation, transforming it to a flex array that
> > is allocated at vdev probe time; for the existent usecases (i.e.: mainly
> > rpmsg) this leads to no functional change, except the additional memory
> > used for the counter associated to the new array.
> > 
> > The maximum number of virtqueues is limited to 256 due to the uint8_t
> > value used inside the resource table to indicate the number of vring to
> > allocate; for this reason, no additional plausibility check is performed
> > on the number of vrings indicated by the resource table.
> > 
> > As a side effect, this also fixes the single virtqueue usecase, which
> > was apparently supported also before but for which the remove action
> > caused an error (because the remove action was trying to unmap also the
> > second vring, which was in fact not mapped).
> > 
> > [1] https://lore.kernel.org/all/1330589497-4139-5-git-send-email-ohad@wizery.com/
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/remoteproc/remoteproc_core.c   |  7 -------
> >  drivers/remoteproc/remoteproc_virtio.c | 21 +++++++++++++--------
> >  include/linux/remoteproc.h             | 10 ++++------
> >  3 files changed, 17 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index f003be006b1b..88504d6eed93 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -473,7 +473,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >  {
> >  	struct fw_rsc_vdev *rsc = ptr;
> >  	struct device *dev = &rproc->dev;
> > -	struct rproc_vdev *rvdev;
> >  	size_t rsc_size;
> >  	struct rproc_vdev_data rvdev_data;
> >  	struct platform_device *pdev;
> > @@ -494,12 +493,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >  	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
> >  		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
> >  
> > -	/* we currently support only two vrings per rvdev */
> > -	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
> > -		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
> > -		return -EINVAL;
> > -	}
> > -
> >  	rvdev_data.id = rsc->id;
> >  	rvdev_data.index = rproc->nb_vdev++;
> >  	rvdev_data.rsc_offset = offset;
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index d5e9ff045a28..96f13f828b8e 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -115,8 +115,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
> >  	void *addr;
> >  	int num, size;
> >  
> > -	/* we're temporarily limited to two virtqueues per rvdev */
> > -	if (id >= ARRAY_SIZE(rvdev->vring))
> > +	if (id >= rvdev->num_vrings)
> >  		return ERR_PTR(-EINVAL);
> >  
> >  	if (!name)
> > @@ -503,17 +502,20 @@ static int rproc_virtio_probe(struct platform_device *pdev)
> >  	if (!rvdev_data)
> >  		return -EINVAL;
> >  
> > -	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
> > +	rsc = rvdev_data->rsc;
> > +
> > +	rvdev = kzalloc_flex(*rvdev, vring, rsc->num_of_vrings);
> >  	if (!rvdev)
> >  		return -ENOMEM;
> >  
> >  	rvdev->id = rvdev_data->id;
> >  	rvdev->rproc = rproc;
> >  	rvdev->index = rvdev_data->index;
> > +	rvdev->num_vrings = rsc->num_of_vrings;
> >  
> >  	ret = copy_dma_range_map(dev, rproc->dev.parent);
> >  	if (ret)
> > -		return ret;
> > +		goto free_rvdev;
> >  
> >  	/* Make device dma capable by inheriting from parent's capabilities */
> >  	set_dma_ops(dev, get_dma_ops(rproc->dev.parent));
> > @@ -527,13 +529,11 @@ static int rproc_virtio_probe(struct platform_device *pdev)
> >  	platform_set_drvdata(pdev, rvdev);
> >  	rvdev->pdev = pdev;
> >  
> > -	rsc = rvdev_data->rsc;
> > -
> >  	/* parse the vrings */
> >  	for (i = 0; i < rsc->num_of_vrings; i++) {
> >  		ret = rproc_parse_vring(rvdev, rsc, i);
> >  		if (ret)
> > -			return ret;
> > +			goto free_rvdev;
> >  	}
> >  
> >  	/* remember the resource offset*/
> > @@ -569,6 +569,9 @@ static int rproc_virtio_probe(struct platform_device *pdev)
> >  	for (i--; i >= 0; i--)
> >  		rproc_free_vring(&rvdev->vring[i]);
> >  
> > +free_rvdev:
> > +	kfree(rvdev);
> > +
> >  	return ret;
> >  }
> >  
> > @@ -579,7 +582,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
> >  	struct rproc_vring *rvring;
> >  	int id;
> >  
> > -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> > +	for (id = 0; id < rvdev->num_vrings; id++) {
> >  		rvring = &rvdev->vring[id];
> >  		rproc_free_vring(rvring);
> >  	}
> > @@ -588,6 +591,8 @@ static void rproc_virtio_remove(struct platform_device *pdev)
> >  	rproc_remove_rvdev(rvdev);
> >  
> >  	put_device(&rproc->dev);
> > +
> > +	kfree(rvdev);
> >  }
> >  
> >  /* Platform driver */
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 7c1546d48008..222e1a56cebc 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -339,10 +339,6 @@ struct rproc_subdev {
> >  	void (*unprepare)(struct rproc_subdev *subdev);
> >  };
> >  
> > -/* we currently support only two vrings per rvdev */
> > -
> > -#define RVDEV_NUM_VRINGS 2
> > -
> >  /**
> >   * struct rproc_vring - remoteproc vring state
> >   * @va:	virtual address
> > @@ -370,9 +366,10 @@ struct rproc_vring {
> >   * @id: virtio device id (as in virtio_ids.h)
> >   * @node: list node
> >   * @rproc: the rproc handle
> > - * @vring: the vrings for this vdev
> >   * @rsc_offset: offset of the vdev's resource entry
> >   * @index: vdev position versus other vdev declared in resource table
> > + * @num_vrings: the number of vrings for this vdev
> > + * @vring: the vrings for this vdev
> >   */
> >  struct rproc_vdev {
> >  
> > @@ -382,9 +379,10 @@ struct rproc_vdev {
> >  	unsigned int id;
> >  	struct list_head node;
> >  	struct rproc *rproc;
> > -	struct rproc_vring vring[RVDEV_NUM_VRINGS];
> >  	u32 rsc_offset;
> >  	u32 index;
> > +	unsigned int num_vrings;
> > +	struct rproc_vring vring[] __counted_by(num_vrings);
> >  };
> >  
> >  struct rproc *rproc_get_by_phandle(phandle phandle);
> > 
> > ---
> > base-commit: ef0c9f75a19532d7675384708fc8621e10850104
> > change-id: 20260618-vring_flex-b4d23d1974ba
> > 
> > Best regards,
> > --  
> > Francesco Valla <francesco@valla.it>
> > 
