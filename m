Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795020603;
	b=OfSon3lkJr5wfpMMawfhFt8kxMXDlnoUpfKD2pJpH2F0PN0eLYpK5AGkgR4HVygQluz3
	 0EmkWCbHONYzWV+3yb3sQdfBX38TA2Bq3IJEw1jPJsRHRK6Y7Gm/DEcrHuFMtuUCwIEmw
	 /Vzu9a660iECaOsnlSMVZ2vUbug6QZsd2PuVUCUVtoOC267OtfLwvEL+OqRLgG+O0glPB
	 BCVgO2LBXasuHfpmljg8YUCIJf1N9qvws8BVr5cPxxQ4OoWBPmsr6esXjRhlwcG9rWNdt
	 wtLnmWLzYTweneWFiIR+WqyzvrdxytCeRqFzpPO58V30/LMS1vveMyCy3yRYc3HEgdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020603;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=2uPA2P1zslLeIVOa70XvA0evtGpxjtPjWoywnGVn/F4=;
	b=S1ce4ptQdydjpUHNiW8yik1EdxJh8iO3Ahyf0L+85/kzFHoqvkJchmcMUL7630OlWFvv
	 RMylPpYP7P0fAj6sR47L2XCScFAUBGWWvCZNJLDcmxbYilGDZ8taU3qla0FV1Qy1qla7k
	 cc2TVYI/daa4fm+nsgtb5gaN2No+DBWcjuKGNgm9jsyu1m2O0O4rYwThC65tdU6qqyLka
	 dNGJL8DUTGapdgrVN+aU6sMuk/d7Yu3Tmvl7qXRyF0kwGPs0tUBEVTytKPpmXj32s+kdL
	 /uA9WGcAdF6MtuWVKAsZVzAFCil/y/Oh0MSte3jrJKZzY/Y35MBonIWJvqsLo2FYZGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=rFSCiOCO;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=gM18Xna2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F036606A31C;
	Wed, 18 Nov 2026 16:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F036606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=rFSCiOCO;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=gM18Xna2
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795020601;
	 b=A30l6mETSyZpE33NtgsdLo7EdD8K7KnP9yYB8NEiRTKm1SmwGSIutEN667i81jb7fOpe4kxguk
	  OmuahP1yhxjYoaipVWNHELRyrwgsmuwgjHe8FG5Otw0NzLMR/tdLYf8QZbKARz80/hmY0RS+p/
	  wPm71ok390RIusz7ghRLmFkyDLDkVvGDO+lpfNgzjwh4XG+/+zpc/ebHcnIU4IEkXdRSorOqgu
	  xFe0bLpHEFGvfIKXtK4gKwX2ZKlXX3mr8c8P+zOGWPRo4uouDsN28k9Ud+Tp58EgIQfatZt/xz
	  xYS0BloC8/lsDXuUCdgTYeEjNgK5/mP9ZyyyeW0R1e+PFA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795020601;
	bh=Gb4r+Pw57CuiAbJfXKIlWAJvWJKiFvHYFDez1//PX1I=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=PSXYA8QX4NESTpiOdhhgMEYcC+OOT8wEo+H1eAQeP8bHQdp7eaxVQ4zklgqjsiwhW56e4rrdMP
	  vG2uWLaiOtUdA71ipQkeLcfsx5vZz58DNHXAr0VVUIedAVtgNM43TGQGHgGbAk70KbhdLXL0RF
	  gREHkvJYlTl+JqnAwDMf9BQXEnE61D0j7M35GHAP3bLBIyidfZAGEXrESTUEapIrz7Yl5dwaaF
	  u236FWq96TsfkFE8PSZPuTIIg/lSnNntUA4saoo4gp4/xd5Fr8FzYIQXc66h2TQEhsHkb+pkIs
	  oFg6ZnYoNWICKJzSMx/tPSPT/fJ9E1ygNKgBRrr0nrcYlg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=2uPA2P1zslLeIVOa70XvA0evtGpxjtPjWoywnGVn/F4=; b=rFSCiOCOCsuYPlOvTfipUpr3/i
	Itr19fP0dwZ5AlzdJaM6j4Um9jUKhTlAPq2n8LNi3Vual8wyvI8mYjQnG19YvFNIOhGd3S/vH87aJ
	6FYjNjCVzDM24JNRq3N6Im2cORY0seuqnXxsGCXgdKmBddrLcyEdbj6KImiYWbgaT1YQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTir4-00000000oxN-1UVm;
	Wed, 18 Nov 2026 16:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=2uPA2P1zslLeIVOa70XvA0evtGpxjtPjWoywnGVn/F4=; b=gM18Xna2Uj2X83uizi6araxZZH
	m1rLkElSQywAMzKEJY0UxFTrnhQwBA9uwbY7Y0a3UNP5X5A2qxh+SAXJ5Fy27LcYbtEaDuWLz2ZiG
	0PZbwjarxKKRy1k/kOedspw7PVkh0uQ2FgEUyhq5dyXPj4UVu3xR5zbeDJRz+739G91g=;
Received: from [95.251.96.187] (port=60573 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTiqk-00000000MNz-2g4b;
	Wed, 18 Nov 2026 16:49:34 +0000
Date: Wed, 18 Nov 2026 17:49:32 +0100
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 07/11] remoteproc: assign fwnode during vdev
 registration
Message-ID: <av3WpUc3Dss790ji@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
 <avyAtmxdbfEBbZ87@p14s>
 <avzS1DiNGmL1Pqmn@bywater>
 <av3KSXqeGyazaMR9@p14s>
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
In-Reply-To: <av3KSXqeGyazaMR9@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 71c16d4262d7f5594f0ea3d0033e4cee
X-AntiAbuse: ID - 71c16d4262d7f5594f0ea3d0033e4cee
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTir4-00000000oxN-1UVm-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Wed, Nov 18, 2026 at 09:54:49AM -0600, Mathieu Poirier wrote:
> On Tue, Nov 17, 2026 at 11:29:01PM +0100, Francesco Valla wrote:
> > On Tue, Nov 17, 2026 at 10:28:38AM -0600, Mathieu Poirier wrote:
> > > On Mon, Nov 02, 2026 at 12:26:44AM +0100, Francesco Valla wrote:
> > > > The virtio subsystem already supports a fwnode describing a vdev; search
> > > > for a specific node during vdev registration and supply it to the
> > > > rproc-virtio platform device that is being registered.
> > > > 
> > > > A memory-region specified inside that node is also used for the virtio
> > > > device if a carveout was not supplied for it through the parent device's
> > > > node.
> > > > 
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
> > > >  drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
> > > >  2 files changed, 85 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > index c946ecd980a5..e833853ae7f6 100644
> > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > @@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> > > >  	if (rvdev)
> > > >  		list_del(&rvdev->node);
> > > >  }
> > > > +
> > > > +static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
> > > > +{
> > > > +	struct fwnode_handle *group, *child;
> > > > +	u32 reg;
> > > > +	int ret;
> > > > +
> > > > +	group = device_get_named_child_node(dev, "virtio");
> > > > +	if (!fwnode_device_is_available(group)) {
> > > > +		fwnode_handle_put(group);
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > > +	fwnode_for_each_available_child_node(group, child) {
> > > > +		ret = fwnode_property_read_u32(child, "reg", &reg);
> > > > +		if (ret)
> > > > +			continue;
> > > > +
> > > > +		if (idx == reg)
> > > > +			break;
> > > > +	}
> > > > +
> > > > +	fwnode_handle_put(group);
> > > > +
> > > > +	return child;
> > > > +}
> > > > +
> > > >  /**
> > > >   * rproc_handle_vdev() - handle a vdev fw resource
> > > >   * @rproc: the remote processor
> > > > @@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > >  	struct device *dev = &rproc->dev;
> > > >  	size_t rsc_size;
> > > >  	struct rproc_vdev_data rvdev_data;
> > > > +	struct platform_device_info pdev_info = {
> > > > +		.parent = dev,
> > > > +		.name = "rproc-virtio",
> > > > +		.id = PLATFORM_DEVID_AUTO,
> > > > +		.data = &rvdev_data,
> > > > +		.size_data = sizeof(rvdev_data),
> > > > +	};
> > > >  	struct platform_device *pdev;
> > > > +	struct fwnode_handle *fwnode;
> > > > +	int ret = 0;
> > > >  
> > > >  	/* make sure resource isn't truncated */
> > > >  	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> > > > @@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > >  	rvdev_data.rsc_offset = offset;
> > > >  	rvdev_data.rsc = rsc;
> > > >  
> > > > +	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
> > > > +	pdev_info.fwnode = fwnode;
> > > > +
> > > >  	/*
> > > >  	 * When there is more than one remote processor, rproc->nb_vdev number is
> > > >  	 * same for each separate instances of "rproc". If rvdev_data.index is used
> > > >  	 * as device id, then we get duplication in sysfs, so need to use
> > > >  	 * PLATFORM_DEVID_AUTO to auto select device id.
> > > >  	 */
> > > > -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> > > > -					     sizeof(rvdev_data));
> > > > +	pdev = platform_device_register_full(&pdev_info);
> > > >  	if (IS_ERR(pdev)) {
> > > >  		dev_err(dev, "failed to create rproc-virtio device\n");
> > > > -		return PTR_ERR(pdev);
> > > > +		ret = PTR_ERR(pdev);
> > > >  	}
> > > >  
> > > > -	return 0;
> > > > +	fwnode_handle_put(fwnode);
> > > > +
> > > > +	return ret;
> > > >  }
> > > >
> > > >  /**
> > > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > > index 1496659ddff9..950d65480be5 100644
> > > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > > @@ -13,10 +13,12 @@
> > > >  #include <linux/dma-map-ops.h>
> > > >  #include <linux/dma-mapping.h>
> > > >  #include <linux/export.h>
> > > > +#include <linux/of.h>
> > > >  #include <linux/of_reserved_mem.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/remoteproc.h>
> > > >  #include <linux/rsc_table.h>
> > > > +#include <linux/swiotlb.h>
> > > >  #include <linux/virtio.h>
> > > >  #include <linux/virtio_config.h>
> > > >  #include <linux/virtio_ids.h>
> > > > @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
> > > >  	put_device(&rvdev->pdev->dev);
> > > >  }
> > > >  
> > > > +/*
> > > > + * Attach the memory region declared inside the vdev's own devicetree node.
> > > > + *
> > > > + * A restricted-dma-pool region is attached by of_dma_configure() when the
> > > > + * platform device is probed, but it is released together with the virtio
> > > > + * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
> > > > + * when the remote processor is restarted during a crash recovery.
> > > > + * Any other kind of region (e.g., shared-dma-pool) is attached only here.
> > > > + */
> > > > +static int rproc_virtio_init_vdev_mem(struct device *dev)
> > > > +{
> > > > +	if (is_swiotlb_for_alloc(dev))
> > > > +		return 0;
> > > > +
> > > > +	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> > > > +}
> > > > +
> > > >  /**
> > > >   * rproc_add_virtio_dev() - register an rproc-induced virtio device
> > > >   * @rvdev: the remote vdev
> > > > @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > > >  	struct device *dev = &rvdev->pdev->dev;
> > > >  	struct virtio_device *vdev;
> > > >  	struct rproc_mem_entry *mem;
> > > > +	bool has_mem_region;
> > > >  	int ret;
> > > >  
> > > >  	if (rproc->ops->kick == NULL) {
> > > > @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > > >  		return -EINVAL;
> > > >  	}
> > > >  
> > > > +	has_mem_region = of_property_present(dev->of_node, "memory-region");
> > > > +
> > > >  	/* Try to find dedicated vdev buffer carveout */
> > > >  	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
> > > >  	if (mem) {
> > > >  		phys_addr_t pa;
> > > >  
> > > > +		if (has_mem_region) {
> > > > +			/*
> > > > +			 * The carveout takes precedence: drop the region that
> > > > +			 * of_dma_configure() might have attached at probe time.
> > > 
> > > I don't understand this part - why would someone configure vdevXbuffer with the
> > > same name at the rproc and rproc-virtio level?  This should be an error.
> > >
> > 
> > The carveout might come from the remote processor's resource table. I
> > was unsure on how to treat it (warning or error) - if you advise for
> > the second I'll go that route.
> > 
> 
> Ok, so this is also related to my for patch [5/11], i.e handling of authentic
> rproc-virtio device should follow modern practices.   
>

Ok.

> > > > +			 */
> > > > +			dev_warn(dev,
> > > > +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> > > > +				 rvdev->index);
> > > > +			of_reserved_mem_device_release(dev);
> > > 
> > > Who would have called of_reserved_mem_device_init_by_XYZ()?  The remoteproc core
> > > or virtio core?  
> > > 
> > The of_dma_configure() call that is part of the platform DMA
> > configuration automatically associates to the device the first
> > restricted-dma-pool node referenced by memory-region; see [1].
> > 
> > This is actually beneficial to the proposed solution, but current
> > implementation requires this step to avoid leaking the association (this
> > will be required also in case of error, because of_dma_configure() is
> > called during the probe).
> > 
> 
> Ok
> 
> > > > +		}
> > > > +
> > > >  		if (mem->of_resm_idx != -1) {
> > > >  			struct device_node *np = rproc->dev.parent->of_node;
> > > >  
> > > > @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > > >  				return ret;
> > > >  			}
> > > >  		}
> > > > +	} else if (has_mem_region) {
> > > > +		/* Use the memory region declared in the vdev's own node */
> > > > +		ret = rproc_virtio_init_vdev_mem(dev);
> > > > +		if (ret) {
> > > > +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> > > > +				ret);
> > > > +			return ret;
> > > > +		}
> > > 
> > > Mixing the initialisation of the legacy rproc-virtio and authentic rproc-virtio
> > > devices is very confusing.  I think there is value in splitting them, even if it
> > > entails some code duplication.
> > > 
> > 
> > Ok, I'll split them for V3.
> > 
> 
> Please move forward on that.  Since it will introduce a fair amount of churn, I
> will simply stop reviewing the current set and wait for V3.  You can remove the
> "RFC" tag, we are well past that now.
> 

Ok. That will take some days, though.

Thank you for the review you did so far!

Regards,
Francesco

