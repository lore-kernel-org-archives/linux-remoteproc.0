Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953913;
	b=4Ieeev+13r+4qjshTgPnLKIDP0lEm/CRsAsQ5Rc6NlNgS9XR3nRtCHfaMQChjF4vje4R
	 +ZtKU03+zQLW5pMMgtCu7tFiVtG9bboexD6ihm99nD2ayguau+pUMFIbiNYHmZ3832QCF
	 ZcIE44QbqniRmjrsvvV+G4owufHIlo4vwUNOPYJb/R2BmvHEkOhVIM3D1AH9D/49fZJeB
	 IMIA8cmz0hkV/nTxlBAcKEaqpmBKUP2RASmjCIXBgoTuAf94t/yleV/plpaPUmnw1dMQp
	 HIZXI4so8piSvqe26FFBPvJnR04fiugSU9mnhiC1D+NEaZdrNapVoM3aCQOR4EjFSng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953913;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=XDw9/M2MIm98kw8EzKXejlZaq6aMnfzsqjAxXtqrIdg=;
	b=mIhHVZ5A4ey4lE7Rw2e1dAcX3kb0gzwFSP+3iOH5QYA8zmM4KHyPF1v5GAL1rZfxEWU2
	 AZzdwvPeLj8n2EK333ZBLtqVmgrdzKp4x9KPHS5LX3zw4t8IFI7EHxOECn2CXW3myoH+g
	 kV3sT3r78jixwFZUwF0CxiN61uKxFUhabh/uYZ1SNvupqcUaFNgAUcD8VrgpxHNX8X4TZ
	 CQDM8Rq8Nnukb8NbQiWxcQXFUaGZiHefACIdmWYQsLYcFxzsTPwcjOmxumgU+cDK/nuSH
	 LK1h10/xA0Mcc4q/0lDRm2fJ2zZSZ9t+mPudlzS7r9ykUvf/B22N2C2Urv+nDcNT6og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b="bKP4okP/";
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b="J/o/wHZM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.2
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33968606A332;
	Tue, 17 Nov 2026 22:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33968606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=bKP4okP/;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=J/o/wHZM
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1794953911;
	 b=Li3llKHYVM0AQuEgaZm2AkrLh2k2aXr/orkI5e6itkudtqAtxY/iM4t8lvkwroCQLn8TIbyQba
	  NJqKAOC6c7L05a0+JWyuaJdcvHKKhhzIyh6DqXz87ea/I94gTdb1k81PV7HRGuexBfuEfd1vRg
	  j574NjwrdAai1jwTO1/y/4WpYGsmKuyOfhBE8XBM2OoZNlLVKHdoW+zjKVGtsLWmf54GRbCW7x
	  5NOsFoZ4+/zckqlLfix27zScMV07QFsj3Y7I/sTda0VJtNwRVfnfdInkc4pe59MzqJ8m3EMlGU
	  ctWRNIERmKckaV3zjOMpACX4+pJDCrjr8E/WW7Jqu+FwTQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1794953911;
	bh=lLTugMaSzlCBSdBDH2IIIB/bAhkr/et1oe9MmxV/meo=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=saMcKhLPiGmDaG/RWAAjitjdm61tSk5/kLTXTtXYQ0z512+0pYmi/ouL7Fld2izVfTl+G8EriD
	  YbSKF1kCJoUeNbNm8B9oAmIDARVRoJjUKDpQF0p3AQAG8an9zwcH62VaGIQ7OHjnWLKA0UKAi0
	  +ipjTH6T7FEkkzsfIvkcPLrERurhwNpvqE3dxRRXvbGcml04M0mCZrvJgCveNZh+A6Umik8CsS
	  G8gz7hi6ARUhqzb2SV6dQPD0jPDT5v24OzcQudBy43RdM4lvbZ2431/OJ7eHGgxRhjd8FOgelU
	  hgHUPcNWum5Y8ajCTGSEbr+M5xiryfRm9xjTetboPVmF1Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=XDw9/M2MIm98kw8EzKXejlZaq6aMnfzsqjAxXtqrIdg=; b=bKP4okP/B+NvcQ3GK/uETBTk8F
	maNUbDiW02l4Yw8a6oyxk2bWBDFW7NqNHdK3AcwYMb6r03hTQnYLgwGUjcoo6QPk4/86JRykoZN7O
	9ibUUrhGiPTxep1pQqR6jRIn1H7Pc36kZo7is0GWD5mEdRcI0wCezx9kGHO9VeYG92wA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRVQ-000000025CX-2vMB;
	Tue, 17 Nov 2026 22:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=XDw9/M2MIm98kw8EzKXejlZaq6aMnfzsqjAxXtqrIdg=; b=J/o/wHZMlZNHzlGj2v3qrP9lrF
	VBTkUAvJ0gtM++9cWsX0Yubj11+RtRGUwDNRkoZHjCrkf1RuoAIyHmo6uSXc/Cfe32dTtxBQLppcN
	BD5OKrVRmK2m4pzECQ/oF6ps0YLJ81c0iz7XtJHKuY1T70AbxRwXbjm+kE+TAWDyHMhs=;
Received: from [95.251.96.187] (port=64319 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRV7-000000005TO-1T4G;
	Tue, 17 Nov 2026 22:18:05 +0000
Date: Tue, 17 Nov 2026 23:18:03 +0100
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
Message-ID: <avzQI6R9LubGP7-d@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
 <avs6XQpoQmY_MNYx@p14s>
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
In-Reply-To: <avs6XQpoQmY_MNYx@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 99a90b9b46ed64441f07075404086196
X-AntiAbuse: ID - 99a90b9b46ed64441f07075404086196
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTRVQ-000000025CX-2vMB-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Mon, Nov 16, 2026 at 11:16:13AM -0600, Mathieu Poirier wrote:
> On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> > Depending on the driver originating them, data buffers used for virtio
> > communication can either:
> > 
> >   - already be allocated from the coherent memory area that is
> >     accessible by the remote processor; this is the case of
> >     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
> >   - be allocated from generic kmem, and thus not necessarily accessible
> >     directly by the remote processor.
> > 
> > In the second case, the DMA APIs can be exploited to obtain a
> > functional communication, since they will take care of cache maintenance
> > and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> > feature flag can be used for this purpose: with it set, the virtio
> > framework will use the aforementioned DMA APIs to map and unmap buffers.
> > 
> > Bounce buffering will be transparently used in two cases:
> > 
> >   - if the buffer address supplied by the virtio driver is not suitable
> >     for DMA transfers, or
> >   - if the reserved memory associated to the vdev is a
> >     restricted-dma-pool; in this case, *all* buffers will be bounced to
> >     and from this pool.
> > 
> > With this support in place, any kind of virtio device can be supported
> > through the remoteproc-virtio transport, at least from a data exchange
> > standpoint.
> > 
> > Note that remote processors behind an IOMMU need da == pa for the memory
> > region(s) the buffers are allocated from.
> 
> I'm not sure to understand the da == pa requirement - can you expand more on
> that?
> 

Yes! With a caveat: the IOMMU usage by the remoteproc framework and how
it can integrate with this work is the main reason this is an RFC, as
stated in the cover letter, because I'm not sure I understand all of it.
See for example the dma-to-da conversion in [1] or the comment in [2].

That said: all the IOMMU setup that is done today by the remoteproc core
is linked to the *remoteproc* device, not to the rproc_vdev (i.e., the
device backing the virtio device). For that reason, the DMA subsystem
should not be able to know that setup even exists, in particular while
performing swiotlb operations. Hence, the requirement to have a 1:1
mapping between da (i.e., the address the device uses) and pa (the
physical memory map).

> > 
> > Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> > they are explicitly excluded.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index f1b362158a9c..1496659ddff9 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> >  	 * All non-remoteproc-specific virtio devices are assumed to be
> >  	 * compliant with virtio specifications 1.x; there is no other method
> >  	 * to transmit this capability from the remote processor to the host.
> > +	 *
> > +	 * Virtio devices that are specific for remoteproc usage take care on
> > +	 * their own to allocate memory from the device's coherent pool; use
> > +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
> >  	 */
> >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > -		features |= (1ULL << VIRTIO_F_VERSION_1);
> > +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> > +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> >  
> >  	return features;
> >  }
> > @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> >  	features = vdev->features;
> >  
> >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> > +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> > +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> >  
> >  	if (WARN_ON((u32)vdev->features != features))
> >  		return -EINVAL;
> > 
> > -- 
> > 2.56.0
> > 
> 

Thank you!

Reagrds,
Francesco

[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L716
[2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L461

