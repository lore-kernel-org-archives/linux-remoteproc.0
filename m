Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712365;
	b=Rh5H+8bO4Pw6NBPil1xoVtmp/QzunxvqrXCo8PeWdZ/HMaJuxTtX0WUREXWJktMnIc3R
	 FSlBX8E85Z251T+uKhcOE2ZEgUVrWDgVW5Dit4CxPtKZ8S/e/EvuFY4q2ZaEU0GvVF+w2
	 ZNIeYheQArypc0lj4cDuOoilcdUuDfewQyo5OOl3ogAmdeF7jHk7Ztpv6X8YkN4/Vv8B4
	 bgI0iBZuvJRKQeg750vaVRW+W3mKg1GOnUXHEdb3O2UF5S/gxLri/pig7Xcq4DVn3tInS
	 DhC1HfRsdu12MaAALZzZLsFuZLhEBEHbyezPq/Lf5EoUEheEfUgo+v2uZQaeL5EAdFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712365;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=Jq3lQfepJ94AqyPMdbvxSWp08SKSZvIh/ClUMKjqxQw=;
	b=Hpa1PYd6VZ0zHEVJjBU54sx2vZiaO72YPSBuLIx1Ey3Lpjyk0UJBnNmpk8zavKn4KocQ
	 i/rrjsB9cDRY2Nmb1WXVxpsJDAMsLWCeNteQKn5UgS9diG5TPiggHB+gAJEeaka6xtWWz
	 yBIWmeF9C2Najq5oShsRIi96FOTeer9MWK47EPSHYczVd1Lm6RexjsJkheLKM3+RVqOWh
	 KtKW5aAtGTe3E0q5xdTdS0ItEUkBA9Yer9DySb32LVyFT+cXNy0Q4Qav95vixxk6Usktl
	 lIxnippToLSUx9NLHNoDt/bY4dbhFB9xDFthCeEHmbaRg2nEsYdm1T3PqG9++2YqjYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=AsCGbnSB;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Gaxg5V0N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.1
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8B606A31E;
	Thu, 26 Nov 2026 16:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F8B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=AsCGbnSB;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Gaxg5V0N
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795712363;
	 b=P3UyvbZE/9kZeYqk4d5//ia/lUoKsavzcFhxtwuHPUftFBzUHdLFAg6HWFac3yaaVGEeI8b/65
	  Zu5Ch75O+XmRtQHcgXQj8CjcKa7SwTWu8OZMXiPFSPxW0AlvcGvikiza9lbA3zK7/UcjMrjGEK
	  Ed24b4LbsNbVRJgDOiuymwOnUuuOHVB4QMFs1QPunCce1Ngg26Ipgm+64OYmszysIOwiwi7wOm
	  rf3vaoDJf1FlLI3fcN0xdlt7JzMu+H29dZJOf7TsB4wapa19liVV0EGVSFm7VAth2iKPc49Ka0
	  iGIFv+IU4QfuvosVxCxxshvLeyUmeWOolSYzv0lYeqEg2w==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795712363;
	bh=0hAG/bw6u+RPngq+pfrPr/8ETRR5oCUWD+2LHzhlRkM=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=jDlsa70Y2UxXm4lG3ouIv2fPlsquiBhCjpWQBd9fz67IardVD/AIvQ4YmNsjfKsuXqAjZ19Oni
	  4hIw3YVaV8QRt2j91b3URhjfdxuntQwN224Pwp01ob/qjiNd5kSdbQyMTem9Ew2iZJ6OZqK0rB
	  m4/RaQLPMBYy5vPjqmMlUDL4LGCvb2GXTzGXO1eo3Xyhy/++yE2KnRkgj4w6mruby6W8otmxqg
	  M9y/TIOyIgiLznykr9eGtzDUySqrUT4J9z5r2x0Mam3UY6NBlTNZuQ/a+tcqY9D9v3GqC1z4vE
	  zMsD9ULC9Iv8pxc4MYxx5RK03c4EXbDN6ea2BuPQ6TIYuQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=Jq3lQfepJ94AqyPMdbvxSWp08SKSZvIh/ClUMKjqxQw=; b=AsCGbnSBUc4+GuZhnwkC0jKRO0
	4PLt0OF5SHAmod+eeEH+zflfz9oAZB4JOC0gul4IMckYXzz12PgVNPDINI2q7vQjLJnKvJatK7KyL
	Xq5T7FhCrrOLDt9pbGDJsTIWcKFhIJ1NFLc/D5I7mHYSp9KmOB0SwPUnC7ONo5kVaLkw=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xWcob-00000000GBa-11cN;
	Thu, 26 Nov 2026 16:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=Jq3lQfepJ94AqyPMdbvxSWp08SKSZvIh/ClUMKjqxQw=; b=Gaxg5V0NA/GknFwAjZOU0/Q8Ax
	3AxFKA/oZ/T/c0/j1RrkPEHWV0rKCRmTvhSQ2f0ArDF/J3PS2HiyRgXMwk7doiT//6W5WF1fbxMMb
	kN7TSo2gJ66LchjXxwmW9SXtUKrztngspFNpEMQmXhOBK6aaylSZf67m7xZyzWs9x2Vk=;
Received: from [79.28.115.6] (port=63542 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xWcoW-00000000EK1-1xeV;
	Thu, 26 Nov 2026 16:59:16 +0000
Date: Thu, 26 Nov 2026 17:59:14 +0100
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Joakim Zhang <joakim.zhang@cixtech.com>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] remoteproc: virtio: Drop rvdevs list and
 associated functions
Message-ID: <awhi3Kg6kdELdT0d@bywater>
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
 <20261114-remoteproc_pdev_decouple-v2-3-95235dd056aa@valla.it>
 <awhhVRBokzbdPJB2@p14s>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awhhVRBokzbdPJB2@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: eefa63d69c36ec019d91599d66a5a759
X-AntiAbuse: ID - eefa63d69c36ec019d91599d66a5a759
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xWcob-00000000GBa-11cN-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Thu, Nov 26, 2026 at 10:41:57AM -0600, Mathieu Poirier wrote:
> On Sat, Nov 14, 2026 at 09:06:35AM +0100, Francesco Valla wrote:
> > The rvdevs linked list is kept at rproc side to track the rproc_vdev
> > devices registered at runtime and de-register them during cleanup, but
> > the same information can be obtained from the driver core using
> > parent-child relationships coupled with driver name.
> > 
> > Drop the list and all associated functions and de-register the virtio
> > children of a remoteproc using device_for_each_child(), with the
> > following benefits:
> > 
> >  - increased separation between the core and virtio parts of remoteproc;
> >  - reduction in code and occupied memory;
> >  - the platform devices whose probe fail are now de-registered correctly
> >    during remoteproc cleanup.
> > 
> > A dedicated macro is used to register rproc-virtio platform devices to
> > avoid duplication (in code, not in memory) of the same string.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/remoteproc/remoteproc_core.c     | 34 ++++++++++++++++----------------
> >  drivers/remoteproc/remoteproc_internal.h |  4 ++--
> >  drivers/remoteproc/remoteproc_virtio.c   |  5 +----
> >  include/linux/remoteproc.h               |  6 +-----
> >  4 files changed, 21 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index d5fa9d23bd5c..296b955f415f 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -431,17 +431,6 @@ void rproc_free_vring(struct rproc_vring *rvring)
> >  	}
> >  }
> >  
> > -void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> > -{
> > -	if (rvdev && rproc)
> > -		list_add_tail(&rvdev->node, &rproc->rvdevs);
> > -}
> > -
> > -void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> > -{
> > -	if (rvdev)
> > -		list_del(&rvdev->node);
> > -}
> >  /**
> >   * rproc_handle_vdev() - handle a vdev fw resource
> >   * @rproc: the remote processor
> > @@ -513,7 +502,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >  	 * as device id, then we get duplication in sysfs, so need to use
> >  	 * PLATFORM_DEVID_AUTO to auto select device id.
> >  	 */
> > -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> > +	pdev = platform_device_register_data(dev, RPROC_VIRTIO_DRV_NAME,
> > +					     PLATFORM_DEVID_AUTO, &rvdev_data,
> >  					     sizeof(rvdev_data));
> >  	if (IS_ERR(pdev)) {
> >  		dev_err(dev, "failed to create rproc-virtio device\n");
> > @@ -1212,6 +1202,19 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
> >  	return 0;
> >  }
> >  
> > +static int rproc_unregister_vdev_pdev(struct device *dev, void *data)
> > +{
> > +	struct platform_device *pdev;
> > +
> > +	if (!dev_is_platform(dev))
> > +		return 0;
> 
> What other child of a remoteproc do you expect isn't a platform driver?
>

Some Qualcomm drivers *do* register children of a remoteproc that are not
platform devices; see for example qcom_add_smd_subdev() [1] in
drivers/remoteproc/qcom_common.c that defines smd->dev = &rproc->dev and
then uses that dev as parent of the new subdev's bare device in
qcom_smd_register_edge() [2].

> > +
> > +	pdev = to_platform_device(dev);
> > +	if (!strcmp(pdev->name, RPROC_VIRTIO_DRV_NAME))
> > +		platform_device_unregister(pdev);
> > +
> > +	return 0;
> > +}
> >  
> >  /**
> >   * rproc_resource_cleanup() - clean up and free all acquired resources
> > @@ -1224,7 +1227,6 @@ void rproc_resource_cleanup(struct rproc *rproc)
> >  {
> >  	struct rproc_mem_entry *entry, *tmp;
> >  	struct rproc_debug_trace *trace, *ttmp;
> > -	struct rproc_vdev *rvdev, *rvtmp;
> >  	struct device *dev = &rproc->dev;
> >  
> >  	/* clean up debugfs trace entries */
> > @@ -1258,9 +1260,8 @@ void rproc_resource_cleanup(struct rproc *rproc)
> >  		kfree(entry);
> >  	}
> >  
> > -	/* clean up remote vdev entries */
> > -	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
> > -		platform_device_unregister(rvdev->pdev);
> > +	/* unregister platform devices */
> > +	device_for_each_child(&rproc->dev, NULL, rproc_unregister_vdev_pdev);
> >  
> >  	rproc_coredump_cleanup(rproc);
> >  }
> > @@ -2521,7 +2522,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >  	INIT_LIST_HEAD(&rproc->carveouts);
> >  	INIT_LIST_HEAD(&rproc->mappings);
> >  	INIT_LIST_HEAD(&rproc->traces);
> > -	INIT_LIST_HEAD(&rproc->rvdevs);
> >  	INIT_LIST_HEAD(&rproc->subdevs);
> >  	INIT_LIST_HEAD(&rproc->dump_segments);
> >  
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index 3a742ef6ef60..d587a3301811 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -18,6 +18,8 @@
> >  #include <linux/io.h>
> >  #endif
> >  
> > +#define RPROC_VIRTIO_DRV_NAME	"rproc-virtio"
> > +
> >  struct rproc;
> >  
> >  struct rproc_debug_trace {
> > @@ -122,8 +124,6 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> >  						       const struct firmware *fw);
> >  struct rproc_mem_entry *
> >  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> > -void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
> > -void rproc_remove_rvdev(struct rproc_vdev *rvdev);
> >  
> >  #ifdef CONFIG_HAS_IOMEM
> >  static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index 6cfdab831185..403519e78ee3 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -549,8 +549,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
> >  			goto unwind_vring_allocations;
> >  	}
> >  
> > -	rproc_add_rvdev(rproc, rvdev);
> > -
> >  	rvdev->subdev.start = rproc_vdev_do_start;
> >  	rvdev->subdev.stop = rproc_vdev_do_stop;
> >  
> > @@ -588,7 +586,6 @@ static void rproc_virtio_remove(struct platform_device *pdev)
> >  	}
> >  
> >  	rproc_remove_subdev(rproc, &rvdev->subdev);
> > -	rproc_remove_rvdev(rvdev);
> >  
> >  	put_device(&rproc->dev);
> >  }
> > @@ -598,7 +595,7 @@ static struct platform_driver rproc_virtio_driver = {
> >  	.probe		= rproc_virtio_probe,
> >  	.remove		= rproc_virtio_remove,
> >  	.driver		= {
> > -		.name	= "rproc-virtio",
> > +		.name	= RPROC_VIRTIO_DRV_NAME,
> >  	},
> >  };
> >  builtin_platform_driver(rproc_virtio_driver);
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 00019b1895e6..77ea0e1067e0 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -228,8 +228,7 @@ enum rproc_features {
> >   * @carveouts: list of physically contiguous memory allocations
> >   * @mappings: list of iommu mappings we initiated, needed on shutdown
> >   * @bootaddr: address of first instruction to boot rproc with (optional)
> > - * @rvdevs: list of remote virtio devices
> > - * @vq_srcu: SRCU domain for the virtqueue callbacks of @rvdevs
> > + * @vq_srcu: SRCU domain for the virtqueue callbacks of the virtio devices
> >   * @subdevs: list of subdevices, to following the running state
> >   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
> >   * @index: index of this rproc device
> > @@ -275,7 +274,6 @@ struct rproc {
> >  	struct list_head carveouts;
> >  	struct list_head mappings;
> >  	u64 bootaddr;
> > -	struct list_head rvdevs;
> >  	struct srcu_struct vq_srcu;
> >  	struct list_head subdevs;
> >  	struct idr notifyids;
> > @@ -351,7 +349,6 @@ struct rproc_vring {
> >   * @subdev: handle for registering the vdev as a rproc subdevice
> >   * @pdev: remoteproc virtio platform device
> >   * @id: virtio device id (as in virtio_ids.h)
> > - * @node: list node
> >   * @rproc: the rproc handle
> >   * @vring: the vrings for this vdev
> >   * @rsc_offset: offset of the vdev's resource entry
> > @@ -362,7 +359,6 @@ struct rproc_vdev {
> >  	struct platform_device *pdev;
> >  
> >  	unsigned int id;
> > -	struct list_head node;
> >  	struct rproc *rproc;
> >  	struct rproc_vring vring[RVDEV_NUM_VRINGS];
> >  	u32 rsc_offset;
> > 
> > -- 
> > 2.56.0
> > 
>

Regards,
Francesco


[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/qcom_common.c#L351
[2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/rpmsg/qcom_smd.c#L1495

