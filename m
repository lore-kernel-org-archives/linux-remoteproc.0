Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955246;
	b=lBfVXeS/BPekO3WjCg1dpZxoupEKHpg5L1d0541wbRbBO2KymXXUbVlMX5YtmTXr5fi7
	 OUFXnBfinfWvnKVqihzKQ3TYwUveDX/0rNLxgxTEhnzgqQGL75dP+rEWuI3FpIsjXJW9H
	 UCLonnwCUNbS6kp9ow5ufodsEX4yksGYSYkl6LbYoZafmY/u+7DWnI8x1140UgxteV5MR
	 S1NKtBwVAq1pB4JJd2HGekbifRbQ7SV1tmDyugGWGt22YNZuJF/bU+9/S8ELnaDrQtwv+
	 /ZQCvU9vMvPb0aMViG57uNXC0obVGal757AWglvxnrbfvsYchZsVNJ6Sxdy7nY/DvqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955246;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=eSBePUX/8L/yuDs+AcrLFngnrbJOvj4lFPwfvEU18g0=;
	b=t3ZSEWjcrqUCM65oO02CftDwfBxnVK88UJP3wfuGMi0lszjGPeyCcoRe+dgrjyUIVoat
	 Dm6HTUGO9YJdCAeB7g7F5a/UsfpFXuNTryMSIGGZX5IdzT9E6x48I4fD3Ml8Yc2Rvof5T
	 qoVVnVTd9zE+o5GMyNvTdai5GGDg00zIi47nK8kLr9+9GV8RBvf+2nb0/dte0r45hYLLX
	 vyAHJqPEMZG70G5xXCsptMiVskf4gDmI2vKYj+RJ8DE3MOo2HgS05prcLbnlRQc+nt9Nc
	 XUooSJQzoABH8TIzx105HB1/M6cAswhZfjAxhGci1SAMKzyBtMZzgyk5SQWJeW1RKrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=yftRbZWE;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=oRU6ioQs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.13
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C5B606A31C;
	Tue, 17 Nov 2026 22:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C5B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=yftRbZWE;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=oRU6ioQs
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794955244;
	 b=sv543kqgqrsbgTes93hN78ZICes/ym0H6n0gqMjfW2K7wdd1PMxQ9Tsj5G+JmiLWWtENAHHml7
	  9CXHBjGGbla798+3Z/kXaRCGKNZop4dNPy7vx3O+DQrKA2HNztnDshQClFL0X2bf+qh4/ifTPJ
	  GNqizChZF1Wtfyc0dUVsO7CZPPfGHM6SBdQSFSxoe+f7gUSTWNATqDx3+XKO+CLH0kEUw2Gd1K
	  lPxdCu7IecyZnp9/yjbWzbiz1AgaSqewD0GSYYWgBSLPxcfljbZmKiC9UlG/Lp5sRAAewQzPN/
	  pL6myS+77MhETieBoaitL6PpIQ+cCIr3Sct++eSiYYoGhg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794955244;
	bh=Oj52gqXQzkstpHvNjVxr4EJNLgpIaRPOLoYHmJcIMiw=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=T26mx5p9S+BBAdTCM/IW8s6NI0gnG23v0CPjLim9WjCkLC7toMZy363yqkXKU1QM4vVPR4abLo
	  1orYZLvHT6qdl0uWWVRiYPdlI+ZvNdDWBODXqToHCM9Qp4cvlm4Oy4tsN4zXpiuq3w8/3IkRS1
	  r4gD8sO0vMRRS9xiLBBWZdj3iZDcNhC5pShyG10q+v7m3DC0qMfAa9VBlJXaRRKiSobVjU+ZeX
	  /63yIvrBbPyDiyvFXX7U67bE5LlB5CG2WkqxzGHwESg9yU00lim083UfDwlhHsP1o4DDoX73sv
	  UqsCuz/hy4aRcnmCiTeVyhacWqqzdmT5Et8i6xc2dzj/vQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=eSBePUX/8L/yuDs+AcrLFngnrbJOvj4lFPwfvEU18g0=; b=yftRbZWED6yfEDzdMb13YAMA5p
	Jx2868wjWcwegmWhdTdP5aB848i7LUOxWOh5xmAlZgJvmFrtyNq5MOjCcd76leVJP7SQxl6yL5kqv
	eBPor5MBhrnOX8h8cr1EErXGwt6i7y9WkcG6FaINnuGGJhWeyxdnAKa3Aaj3URFBpams=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRqv-00000001yhR-0ug4;
	Tue, 17 Nov 2026 22:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=eSBePUX/8L/yuDs+AcrLFngnrbJOvj4lFPwfvEU18g0=; b=oRU6ioQsb09tiiVkx3MrYnIBqp
	t8UJEbLDV53tq0tBoKw5jtuDw1Y9IKIignXaFAR7TfjnAV6IRpNbQ+0+hcCBL5aEs8kpVIp9bkKJr
	pV9jCCh48sBuVCYYqiesYPh1UQPAiOduUQl52mpRJtqWAvymeqaOtUfpJ4KYkZqkGQeo=;
Received: from [95.251.96.187] (port=60017 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRqa-00000000IA1-2MtI;
	Tue, 17 Nov 2026 22:40:16 +0000
Date: Tue, 17 Nov 2026 23:40:14 +0100
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
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
Message-ID: <avzVSG5rvoN0Z9OF@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
 <avyPa5rSx9rhf9yO@p14s>
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
In-Reply-To: <avyPa5rSx9rhf9yO@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 0fb2ced8f93e95509d3fead34b0e6fd6
X-AntiAbuse: ID - 0fb2ced8f93e95509d3fead34b0e6fd6
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTRqv-00000001yhR-0ug4-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Tue, Nov 17, 2026 at 11:31:23AM -0600, Mathieu Poirier wrote:
> On Mon, Nov 02, 2026 at 12:26:45AM +0100, Francesco Valla wrote:
> > Expand the section on virtio support over remoteproc with details on
> > memory allocation setup and constraints.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  Documentation/staging/remoteproc.rst | 99 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 98 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> > index c117b060e76c..4b42ed582fb4 100644
> > --- a/Documentation/staging/remoteproc.rst
> > +++ b/Documentation/staging/remoteproc.rst
> > @@ -354,7 +354,104 @@ it supports. A firmware may support any number of virtio devices, and
> >  of any type (a single remote processor can also easily support several
> >  rpmsg virtio devices this way, if desired).
> >  
> > +Memory carveouts
> > +----------------
> > +
> > +For a virtio device at position ``X`` among the RSC_VDEV resources declared by
> > +the resource table, the remoteproc framework will search for memory carveouts
> > +for:
> > +
> > +* all the vrings the specific virtio device requires (as ``vdevXvringY``);
> > +* the memory area to allocate communication buffers from (as ``vdevXbuffer``).
> > +
> > +The carveouts can be provided by the remote processor itself as RSC_CARVEOUT
> > +resources inside the resource table and/or supplied by the remoteproc driver
> > +and will be indexed by their name.
> 
> The remoteproce driver doesn't supply carvouts, it gets them from the device
> tree.
>

Right. I'll rephrase this statement.

> > +If a carveout with the same name is provided through both means, the one
> > +supplied by the remote processor should be marked as dynamically allocable,
> > +i.e., with the device address set to ``FW_RSC_ADDR_ANY`` (-1).
> > +
> 
> Right, as per my comment in the previous patch, carveouts at the virtio level
> should be distinct from those declared at the remote processor level.  Hopefully
> this will keep the remoteproc core simple and make it easy to differentiate
> between code paths that handle legacy and authentic rproc-virtio devices.
>

This statement is not related to carveout at virtio level - or at least
isn't in my mind, I'll try to explain a bit better.

Nowadays, even before this patch set, is possible to declare a carveout
(say: vdev0buffer) both inside the processor's resource table *and* in
devicetree. The remoteproc framework will take care to associate them,
but this will work only if the resource table uses FW_RSC_ADDR_ANY for
the da field (see [1]).

> > +If a ``vdevXvringY`` carveout is not provided, the remoteproc framework will
> > +try to allocate it using dma_alloc_coherent(), which will resort to allocate it
> > +either from the first ``restricted-dma-pool`` region associated to the virtio
> > +device's parent (i.e., the remote processor device), if present, or the global
> > +DMA pool.
> > +
> > +.. WARNING::
> > +
> > +    This fallback mechanism can result in a vring being allocated using a
> > +    ``vdevXbuffer`` area meant for another vdev, so a particular care shall be
> > +    adopted when defining the carveouts. In particular, ``restricted-dma-pool``
> > +    memory regions should be specified inside the virtio device's devicetree
> > +    nodes and not attached to the parent remote processor.
> > +
> > +If a ``vdevXbuffer`` carveout is not provided, the remoteproc framework will
> > +use the memory region declared by the virtio device's own devicetree node (see
> > +Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml), if any.
> > +Otherwise, it will try to replace it with the first memory region (of any type)
> > +associated to the virtio device's parent (i.e., the remote processor device);
> > +if no such memory region is present, it will be replaced with the global DMA
> > +pool.
> > +
> > +If both a ``vdevXbuffer`` carveout and a memory region inside the virtio
> > +device's devicetree node are present, the carveout takes precedence and the
> > +memory region is ignored.
> > +
> > +Declaring the memory region inside the virtio device's devicetree node is the
> > +preferred method for ``restricted-dma-pool`` regions, since listing them among
> > +the memory regions of the remote processor device would make the first of them
> > +the (forced) bounce buffer for the remote processor device itself as well.
> > +
> > +Buffer allocation
> > +-----------------
> > +
> > +There are different kinds of buffer allocation scenarios:
> > +
> > +* if the remote processor can access the whole DMA memory area of the host, no
> > +  special arrangement needs to be performed, since either the drivers (in case
> > +  of rpmsg and rproc-serial devices) or the DMA APIs (in case of any other
> > +  virtio device type) will take care of any necessary translation;
> > +* if the remote processor has limited access to the host memory space, for
> > +  example because of a different addressing scheme or for memory isolation
> > +  constraints, the memory reserved for buffer allocation shall be selected
> > +  depending on the virtio device type:
> > +
> > +  - for rpmsg and rproc-serial devices, a simple contiguous memory region
> > +    (e.g.: one declared in devicetree as ``shared-dma-pool``) is sufficient and
> > +    should be preferred, since it allows zero-copy message transmission between
> > +    the host and the remote processor;
> > +  - for any other virtio device type, a swiotlb-enabled memory region (e.g.:
> > +    one declared in devicetree as ``restricted-dma-pool``) is required, because
> > +    such devices need bounce buffering to work correctly.
> > +
> > +For virtio devices other than rpmsg and rproc-serial, the remoteproc framework
> > +offers the ``VIRTIO_F_ACCESS_PLATFORM`` feature, so the buffer addresses written
> > +in the vring descriptors are the DMA addresses returned by the DMA APIs for the
> > +virtio device. The virtio device inherits the DMA mask and the DMA range map
> > +(i.e., the translation described by the ``dma-ranges`` devicetree property) of
> > +the remote processor device, and is never attached to an IOMMU: these DMA
> > +addresses are therefore host physical addresses, translated only through the
> > +DMA range map. The remote processor must be able to access the buffers at
> > +these addresses.
> > +
> > +.. WARNING::
> > +
> > +    For remote processors that access memory through an IOMMU managed by the
> > +    remoteproc framework (i.e., with ``has_iommu`` set), the IOMMU domain only
> > +    contains the mappings created for the RSC_CARVEOUT and RSC_DEVMEM entries
> > +    of the resource table, at the device addresses they specify; no mapping is
> > +    created for the buffers of the virtio devices. Such remote processors are
> > +    supported only if all the memory that can hold virtio buffers (e.g., the
> > +    ``restricted-dma-pool`` region associated to the virtio device) is mapped
> > +    with its device address equal to its physical address, for example through
> > +    an RSC_DEVMEM entry. The same constraint applies to any fixed address
> > +    translation applied by the remote processor that is not described by the
> > +    DMA range map of the remote processor device.
> > +
> > +Allocation of virtio devices
> > +----------------------------
> > +
> >  Of course, RSC_VDEV resource entries are only good enough for static
> >  allocation of virtio devices. Dynamic allocations will also be made possible
> >  using the rpmsg bus (similar to how we already do dynamic allocations of
> > -rpmsg channels; read more about it in rpmsg.txt).
> > +rpmsg channels; read more about it in Documentation/staging/rpmsg.rst).
> > 
> > -- 
> > 2.56.0
> > 
>

Thank you!

Regards,
Francesco

[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L856

