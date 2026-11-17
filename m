Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954571;
	b=4qn20xeqiwigqmO5Kv6jv2qMya4ygK7LWseKAozvfYbVlTs3rf3m3TWFFYbl5NSpORm5
	 u6jFLOFK4+fA0FaYUOTIPHNM8HP/s/0YCvIHMYQpvzuZPNP3mjta5ofFKssiiHaR8UIg+
	 Tu4UtegX8rIkTKSfouNHCkXUJEojr9IjlJ/ctkViTDnKCLYJS4f0uocpTAYZo2+1f8AOR
	 C45tc5FUYAfCkOLDq0gsRN0snJznOPQCIibUY59opcsoUr67dAvbdi+e5nSIe7nCcsP39
	 b5WzTamIJ+DsxSoPyuZi5oySsz6eQ4A3FuHgIVrxmp19oBpacKF0EFjjFsm9tqkeQHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954571;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=fcKOX5BgdeCWTrMgvop5osx8Jnpc7y513+iC7bQ0GqU=;
	b=s0iGH6IglL57wxcchhvk9UZYprv95AJkOeqIQXHwHss+nXH5ItACGX54vs34vFbKawHg
	 9vPJo6GcVCc6kE7by5EFPTUiZ7F3jQ9ksqZdar+nHeXT/6LN5SuysFuor6sjNcvo9vzuy
	 Uqd9XSqq6/wxdXy4aSh5qezG7FAwWlMqrrbqYjl9bvwb2ZOQeqzPqjcFs+PQWC2cm+O9+
	 JNejc+ej/KVIgfq2pEuqzSEUdSsoXbVUTDk8toxvqoBeCcEK1pxk78bqrIC4ToyG4GB3S
	 gNU3wFlzR7GP+CLh8NI8UR6arIzvNlgnBL4NUSspb2FNsq3HdGl5Azymrh6Nv/E4ELQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=gNqU8JYQ;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=VA70hAVg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.10
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546C606A32A;
	Tue, 17 Nov 2026 22:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7546C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=gNqU8JYQ;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=VA70hAVg
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794954570;
	 b=Y1NKAY2VYLp7MFbAvqklwI0w2EXV0Zo7FVeGutEwyy3H+f53+D3Eol438QKHH8Kn5bLQlOqADh
	  UpU6RmvN8KvPuLMxbmtQzkkk077RY9OmXLK5y+nz0Ebh/KCc5jZ/qg7Q+catzIZyJDcX8L/ZGN
	  zFU88NWfjbUZEH+L1DrJKflSpE7yCISlMX3fVyYASBCtNmiOdNiAPznpNq4IZQTTCobnmLrZl0
	  7ZaEBx7HVuIRXqA1ss/ejdPM2V46O1JdumrALdAVlPTe8qVtCXEE/mhEooVGFXdbv+pO3R7Cn8
	  q0Jzozn6xNzDG2N77ERwuOhgz4HR7QJARd1Ajk76vY8xoA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794954570;
	bh=JybEQ1XC8V8D+6CWInMVitgFg0nkFA+o6+XWova7CQA=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=JjCel9AyEPTT0xDSsjEhsNHduT2P1lfkaYr6BWDicSHs2O5L9aHWuMRY2Ux5FMqq5XrLJatsF5
	  tZQCz3QMJZCX36/T073YbqIXWeSiR+1efxnRrrTRhW34xS37HFyH90a8c8YAnVz1kit3tRmz7l
	  2unveMg8FbpiC+pgLLqFG8gTOc2qhKeVvVsMh3Yv0nr9ZEFOW5g0QecEciFdkysYGHxDjox2M1
	  WLIn4dG4shLo5MyYDsqZFlJvrNlS31KDX8Ey/asBVqkkQ0PZmVXfMCxQqwNy/XuQkxr410oRB0
	  6k/UzKHnVOATLCWctgnKLBNVFaRqvKe0YZrR25UJri4pJw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=fcKOX5BgdeCWTrMgvop5osx8Jnpc7y513+iC7bQ0GqU=; b=gNqU8JYQP4iMowySLQGB7NJ0z2
	x4g0+sZXDpoAyCLeyxMxkPU3MG3A5R25dX2etoxWJ7jXkkbCysrC4HxLOPtM5bLAWWYiUEYajJgMA
	C343DoW0SaoVJIfBB9t7/uIWh1V/kwkUtQp43FbHtBEJr/Tx5YhvOiC67W4jcwtx0bJ4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRg2-00000001lk1-2Fn6;
	Tue, 17 Nov 2026 22:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=fcKOX5BgdeCWTrMgvop5osx8Jnpc7y513+iC7bQ0GqU=; b=VA70hAVgqtYloKsRwVllfLXOwA
	P4dA0J0hgPnRLPyImKO5uAy2wC81NSBYenoFjE8FseR4eeE3Mil6F4Ou+plu2FqJ2cZft7NeGCS2P
	0hYHipDjZ7hxyronma3HA+Bc9u6IWJUS5VEVSGmGwvkaA1eYOL3dV/NJfOi+hC4xGcEE=;
Received: from [95.251.96.187] (port=59373 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRfj-00000000BT1-2mJ9;
	Tue, 17 Nov 2026 22:29:03 +0000
Date: Tue, 17 Nov 2026 23:29:01 +0100
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
Message-ID: <avzS1DiNGmL1Pqmn@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
 <avyAtmxdbfEBbZ87@p14s>
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
In-Reply-To: <avyAtmxdbfEBbZ87@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 87e57997436788e4cd25b5e02b0e0eb9
X-AntiAbuse: ID - 87e57997436788e4cd25b5e02b0e0eb9
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTRg2-00000001lk1-2Fn6-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Tue, Nov 17, 2026 at 10:28:38AM -0600, Mathieu Poirier wrote:
> On Mon, Nov 02, 2026 at 12:26:44AM +0100, Francesco Valla wrote:
> > The virtio subsystem already supports a fwnode describing a vdev; search
> > for a specific node during vdev registration and supply it to the
> > rproc-virtio platform device that is being registered.
> > 
> > A memory-region specified inside that node is also used for the virtio
> > device if a carveout was not supplied for it through the parent device's
> > node.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
> >  drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
> >  2 files changed, 85 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index c946ecd980a5..e833853ae7f6 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> >  	if (rvdev)
> >  		list_del(&rvdev->node);
> >  }
> > +
> > +static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
> > +{
> > +	struct fwnode_handle *group, *child;
> > +	u32 reg;
> > +	int ret;
> > +
> > +	group = device_get_named_child_node(dev, "virtio");
> > +	if (!fwnode_device_is_available(group)) {
> > +		fwnode_handle_put(group);
> > +		return NULL;
> > +	}
> > +
> > +	fwnode_for_each_available_child_node(group, child) {
> > +		ret = fwnode_property_read_u32(child, "reg", &reg);
> > +		if (ret)
> > +			continue;
> > +
> > +		if (idx == reg)
> > +			break;
> > +	}
> > +
> > +	fwnode_handle_put(group);
> > +
> > +	return child;
> > +}
> > +
> >  /**
> >   * rproc_handle_vdev() - handle a vdev fw resource
> >   * @rproc: the remote processor
> > @@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >  	struct device *dev = &rproc->dev;
> >  	size_t rsc_size;
> >  	struct rproc_vdev_data rvdev_data;
> > +	struct platform_device_info pdev_info = {
> > +		.parent = dev,
> > +		.name = "rproc-virtio",
> > +		.id = PLATFORM_DEVID_AUTO,
> > +		.data = &rvdev_data,
> > +		.size_data = sizeof(rvdev_data),
> > +	};
> >  	struct platform_device *pdev;
> > +	struct fwnode_handle *fwnode;
> > +	int ret = 0;
> >  
> >  	/* make sure resource isn't truncated */
> >  	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> > @@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >  	rvdev_data.rsc_offset = offset;
> >  	rvdev_data.rsc = rsc;
> >  
> > +	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
> > +	pdev_info.fwnode = fwnode;
> > +
> >  	/*
> >  	 * When there is more than one remote processor, rproc->nb_vdev number is
> >  	 * same for each separate instances of "rproc". If rvdev_data.index is used
> >  	 * as device id, then we get duplication in sysfs, so need to use
> >  	 * PLATFORM_DEVID_AUTO to auto select device id.
> >  	 */
> > -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> > -					     sizeof(rvdev_data));
> > +	pdev = platform_device_register_full(&pdev_info);
> >  	if (IS_ERR(pdev)) {
> >  		dev_err(dev, "failed to create rproc-virtio device\n");
> > -		return PTR_ERR(pdev);
> > +		ret = PTR_ERR(pdev);
> >  	}
> >  
> > -	return 0;
> > +	fwnode_handle_put(fwnode);
> > +
> > +	return ret;
> >  }
> >
> >  /**
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index 1496659ddff9..950d65480be5 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -13,10 +13,12 @@
> >  #include <linux/dma-map-ops.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/export.h>
> > +#include <linux/of.h>
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/remoteproc.h>
> >  #include <linux/rsc_table.h>
> > +#include <linux/swiotlb.h>
> >  #include <linux/virtio.h>
> >  #include <linux/virtio_config.h>
> >  #include <linux/virtio_ids.h>
> > @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
> >  	put_device(&rvdev->pdev->dev);
> >  }
> >  
> > +/*
> > + * Attach the memory region declared inside the vdev's own devicetree node.
> > + *
> > + * A restricted-dma-pool region is attached by of_dma_configure() when the
> > + * platform device is probed, but it is released together with the virtio
> > + * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
> > + * when the remote processor is restarted during a crash recovery.
> > + * Any other kind of region (e.g., shared-dma-pool) is attached only here.
> > + */
> > +static int rproc_virtio_init_vdev_mem(struct device *dev)
> > +{
> > +	if (is_swiotlb_for_alloc(dev))
> > +		return 0;
> > +
> > +	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> > +}
> > +
> >  /**
> >   * rproc_add_virtio_dev() - register an rproc-induced virtio device
> >   * @rvdev: the remote vdev
> > @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >  	struct device *dev = &rvdev->pdev->dev;
> >  	struct virtio_device *vdev;
> >  	struct rproc_mem_entry *mem;
> > +	bool has_mem_region;
> >  	int ret;
> >  
> >  	if (rproc->ops->kick == NULL) {
> > @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >  		return -EINVAL;
> >  	}
> >  
> > +	has_mem_region = of_property_present(dev->of_node, "memory-region");
> > +
> >  	/* Try to find dedicated vdev buffer carveout */
> >  	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
> >  	if (mem) {
> >  		phys_addr_t pa;
> >  
> > +		if (has_mem_region) {
> > +			/*
> > +			 * The carveout takes precedence: drop the region that
> > +			 * of_dma_configure() might have attached at probe time.
> 
> I don't understand this part - why would someone configure vdevXbuffer with the
> same name at the rproc and rproc-virtio level?  This should be an error.
>

The carveout might come from the remote processor's resource table. I
was unsure on how to treat it (warning or error) - if you advise for
the second I'll go that route.

> > +			 */
> > +			dev_warn(dev,
> > +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> > +				 rvdev->index);
> > +			of_reserved_mem_device_release(dev);
> 
> Who would have called of_reserved_mem_device_init_by_XYZ()?  The remoteproc core
> or virtio core?  
> 
The of_dma_configure() call that is part of the platform DMA
configuration automatically associates to the device the first
restricted-dma-pool node referenced by memory-region; see [1].

This is actually beneficial to the proposed solution, but current
implementation requires this step to avoid leaking the association (this
will be required also in case of error, because of_dma_configure() is
called during the probe).

> > +		}
> > +
> >  		if (mem->of_resm_idx != -1) {
> >  			struct device_node *np = rproc->dev.parent->of_node;
> >  
> > @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >  				return ret;
> >  			}
> >  		}
> > +	} else if (has_mem_region) {
> > +		/* Use the memory region declared in the vdev's own node */
> > +		ret = rproc_virtio_init_vdev_mem(dev);
> > +		if (ret) {
> > +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> > +				ret);
> > +			return ret;
> > +		}
> 
> Mixing the initialisation of the legacy rproc-virtio and authentic rproc-virtio
> devices is very confusing.  I think there is value in splitting them, even if it
> entails some code duplication.
> 

Ok, I'll split them for V3.

> Thanks,
> Mathieu
> 
> >  	} else {
> >  		struct device_node *np = rproc->dev.parent->of_node;
> >  
> > 
> > -- 
> > 2.56.0
> > 
>

Thank you!

Regards,
Francesco


[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/of/device.c#L35

