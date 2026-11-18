Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795020803;
	b=axBWoPiIpLz7Kx1ubZwqekgOwqeRWs7b5gMrbz2Yz/Z00bNvpH7QAWMdT1IEg5CT4yW4
	 9jov+46hUsaGi0PWkmo0tn1yvbwZuaHcQ7T6U01eEsAzZB0IEZHmrHJQspzFV7nSX9H9q
	 W3ybMzjAXd/9XMyjAr5M7qBlTmPTzGrfQnGXOCQ535WYIaV5A/PE8EOHzCghmPlomRNzQ
	 IxwxhqbJ8Q623utNSo1QT+RdomKMsWD/Y3NupD52+4ZELBnipfRZQOMElsjYlSrZlO1E3
	 v0NPtrtUlrMakut42oazxmPCwHTaYcql/nwUH891MFzRAf4LeQV0/X9ih+/SUW9v3wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020803;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=s49vQAT48BxIZLfMkEXtnKafHZS3S30w7qy4wPSK4ME=;
	b=otBlGrxOS/gRXGeZO7Qtc7Ysr+MvpzjuOjexvYq/mpVQ5rgsQxAXJpI0PK/u8YF5pXcf
	 HyA0iKMGZr9SPSbWuTG9LR9MiihGLg9P6HR6zKPVKqfNNRwVZQtnAAIhTXE95LeNqnBcH
	 fpz8tYhnU8ww3OO6ZkYXZKC8uMVcNDG97PhDPFr2YvOQSPwusxO3amcRz1+LyiX4r6Olb
	 G05gYaBMWfkdLx8+9f6HQgwzG8OmebCdxcoz4fnE4h2ac7EwZ9oAIieSdYRJidwtG23tO
	 Tm7l2RFkdeZxuCNhMFucgAmGcT6myxx4q18fyU+jDlaZZKItIOIA7rtMtGZflxCWrBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=A6intZbK;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=UEg0TeVF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.1
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7866606A330;
	Wed, 18 Nov 2026 16:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7866606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=A6intZbK;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=UEg0TeVF
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1795020802;
	 b=tK+jGjDrYzZwiUDkabbFkJxUkT19sThE29n4ddG+6MEzgEMAuLhRDKbpq7Xu03Fbpv5FtqUEUu
	  N898+aY1C5ibVRLLjkXu5pqmJw/GkI1NmivuOr5CAW6p/ZHEZ4R4NesAVmFPw9psxMleOMGCdG
	  X7dqiHHUi8heFVjTGd+rZZH2ygmdq9zTmil65UL0zGOrL/DastFbdB3aUd3a95BQWzJyorLMWa
	  BF3kofbPF94zI652cZz6y4NxL7Xm5umVP/VIrOxNVendpKwTemyPCWRJ2UbuAojEQiGXKfooEO
	  /rytFYOk6KJSN0beegJ4cQ4EX5JS4xH1Z7m67UjAoPElZQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1795020802;
	bh=hq59j9MIUVaImvVcxyR40iCL7QyC1S8ejdHje+eHY8Q=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=jnljhki0zbVbLYA+ygjnK2eKPsOboC4EkQSodJvM7/CnwU9RtZGVCVBeg+wjcXre2yuL7Bfplw
	  RSjxb2LKGPJNEUYkTk+pcytcxWIhbF+iYUzTo1+CTc65vobOcp9tslOGXFuAbrDWm29RTpChAB
	  5GpFv8fVn4Y4ZLBJVSrNSBNFE19evtzFSXLkphWCOHimg4xk73cxzO/CrxBKFmz1nTjuScS57c
	  GHxTiNASfdb1z9SpYTAJGocPTPfITe853E38FCBmvL2q3k7TNQXH8xv3SvLCI3EMpewAhIyekr
	  igPVztPi7gJ0wV4rPyBh7Shj/eodcyp3D9hAW1phziO+WQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=s49vQAT48BxIZLfMkEXtnKafHZS3S30w7qy4wPSK4ME=; b=A6intZbKqfhOk/eTaNcvmTqTXy
	WT+K4LV2B6SdAxAAFHTs8Jcj3KBVCwt7IIE6XAtgHkDA1LdMYdXxIkA7UG5wiwxkOw1QKS3A/T6KC
	/K5DNYaoocoRVcnadRatYXhe2CTVgqPQ9UG/eBJci2rBm9TaXFEndbGVadwW/s1gRdA8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTiuO-00000000cKu-26Ro;
	Wed, 18 Nov 2026 16:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=s49vQAT48BxIZLfMkEXtnKafHZS3S30w7qy4wPSK4ME=; b=UEg0TeVF31O2xVuW3Qw4fUKuWq
	22O0c+RoE43yXb2K1fcEGcj4yLs39qyWMdbnThi3UjcTjDy9fjjzecG0xypXBoVvkqR0gQywrnrpy
	7aRCBZeCKAMrhgnP2KZqp4EmLuTXsa4adOHWK4o1SFGw482Eo5u6z+Uo4965hkzS3Fmw=;
Received: from [95.251.96.187] (port=64594 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTiu4-00000000OYn-0kDy;
	Wed, 18 Nov 2026 16:53:00 +0000
Date: Wed, 18 Nov 2026 17:52:58 +0100
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
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <av3XR-APUl0ENo_n@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
 <avs6XQpoQmY_MNYx@p14s>
 <avzQI6R9LubGP7-d@bywater>
 <av3HVh5jlMsyaiq7@p14s>
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
In-Reply-To: <av3HVh5jlMsyaiq7@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 6539a5dfb74856654e00ae33859689f8
X-AntiAbuse: ID - 6539a5dfb74856654e00ae33859689f8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTiuO-00000000cKu-26Ro-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Wed, Nov 18, 2026 at 09:42:14AM -0600, Mathieu Poirier wrote:
> On Tue, Nov 17, 2026 at 11:18:03PM +0100, Francesco Valla wrote:
> > On Mon, Nov 16, 2026 at 11:16:13AM -0600, Mathieu Poirier wrote:
> > > On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> > > > Depending on the driver originating them, data buffers used for virtio
> > > > communication can either:
> > > > 
> > > >   - already be allocated from the coherent memory area that is
> > > >     accessible by the remote processor; this is the case of
> > > >     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
> > > >   - be allocated from generic kmem, and thus not necessarily accessible
> > > >     directly by the remote processor.
> > > > 
> > > > In the second case, the DMA APIs can be exploited to obtain a
> > > > functional communication, since they will take care of cache maintenance
> > > > and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> > > > feature flag can be used for this purpose: with it set, the virtio
> > > > framework will use the aforementioned DMA APIs to map and unmap buffers.
> > > > 
> > > > Bounce buffering will be transparently used in two cases:
> > > > 
> > > >   - if the buffer address supplied by the virtio driver is not suitable
> > > >     for DMA transfers, or
> > > >   - if the reserved memory associated to the vdev is a
> > > >     restricted-dma-pool; in this case, *all* buffers will be bounced to
> > > >     and from this pool.
> > > > 
> > > > With this support in place, any kind of virtio device can be supported
> > > > through the remoteproc-virtio transport, at least from a data exchange
> > > > standpoint.
> > > > 
> > > > Note that remote processors behind an IOMMU need da == pa for the memory
> > > > region(s) the buffers are allocated from.
> > > 
> > > I'm not sure to understand the da == pa requirement - can you expand more on
> > > that?
> > > 
> > 
> > Yes! With a caveat: the IOMMU usage by the remoteproc framework and how
> > it can integrate with this work is the main reason this is an RFC, as
> > stated in the cover letter, because I'm not sure I understand all of it.
> > See for example the dma-to-da conversion in [1] or the comment in [2].
> >
> 
> The remoteproc subsystem was written a _very_ long time ago and the context of
> some artefacts, such as [1] and [2], is long lost.
>  
> > That said: all the IOMMU setup that is done today by the remoteproc core
> > is linked to the *remoteproc* device, not to the rproc_vdev (i.e., the
> > device backing the virtio device). For that reason, the DMA subsystem
> > should not be able to know that setup even exists, in particular while
> > performing swiotlb operations. Hence, the requirement to have a 1:1
> > mapping between da (i.e., the address the device uses) and pa (the
> > physical memory map).
> 
> I would like to reserve the current remoteproc IOMMU design for handling legacy
> rproc-virtio devices, i.e rpmsg and serial, and only use the modern
> virtio/swiotlb API to handle authentic rproc-virtio devices.
>

Agreed. I'll come up with a proposal there. In the mean time I found a
multi-core system *with* an IOMMU that I can use for further testing in
that area.

> Based on what I see here [3], I think above sentence:
> 
> "Note that remote processors behind an IOMMU need da == pa for the memory..."
> 
> should be replaced with:
> 
> "Note that remote processors not behind an IOMMU need da == pa for the memory..."
> 
> [3]. https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L703 
> 
> > 
> > > > 
> > > > Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> > > > they are explicitly excluded.
> > > > 
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > > index f1b362158a9c..1496659ddff9 100644
> > > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > > @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > > >  	 * All non-remoteproc-specific virtio devices are assumed to be
> > > >  	 * compliant with virtio specifications 1.x; there is no other method
> > > >  	 * to transmit this capability from the remote processor to the host.
> > > > +	 *
> > > > +	 * Virtio devices that are specific for remoteproc usage take care on
> > > > +	 * their own to allocate memory from the device's coherent pool; use
> > > > +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
> > > >  	 */
> > > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > > -		features |= (1ULL << VIRTIO_F_VERSION_1);
> > > > +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> > > > +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > > >  
> > > >  	return features;
> > > >  }
> > > > @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > > >  	features = vdev->features;
> > > >  
> > > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > > -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> > > > +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> > > > +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > > >  
> > > >  	if (WARN_ON((u32)vdev->features != features))
> > > >  		return -EINVAL;
> > > > 
> > > > -- 
> > > > 2.56.0
> > > > 
> > > 
> > 
> > Thank you!
> > 
> > Reagrds,
> > Francesco
> > 
> > [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L716
> > [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L461
> > 
>

Regards,
Francesco

