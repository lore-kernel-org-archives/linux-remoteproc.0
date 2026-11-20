Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795213786;
	b=MhKFM3K6dlbTR7/vaLHHbkLHUWEkTx1af+NB1exiTBrzCfHTH5Bjv3528/XdvefctRZn
	 nv9fuTpf6uvcVglHGhRkcpq6gXeyvpLQtAYalH+sQFiR76EnwfhKE8LrL7d05F7FyIbV/
	 in9zhvXeg03l/K3Nd9MSoDzanP7gMIrxdz0s80fys6wSsPmEYaOQM1u2gfG53yKP4jylI
	 GXh+5RtxP1fb+jb6dudqC8U3AMgy+MYDYjxA2U97MXqKN3O1TDYIhBsHXvQZaYTkqRHnS
	 Qt7F981/3W0J4FzURsKUtJs6tPocB9rg3BrTkf5wJlbIepAf68RUFgcb/2ppERCFa+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213786;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=nXLCbebK0ohY3VxsiL1yT6/kHgvyK8XmySVKFIznQEw=;
	b=Zl2MAaNvQWqO7561ZdcH23QdBYjt/au4zj24TktonSkBbAXuwvsgZz8oC/BCqNIGAlRK
	 X11AsrJ0/6DjGZOTb+EOCHpnYx15o+M/lM/enPgNICjYlpSoakHDINSbvryBKD+QF41V0
	 FCNa9dTDqYcWwNYMDtNTKVgv9kyKGX6AODGr/PWF5sk8JAgDnVIcu/9C8RfUhMxlYnkdg
	 of4r56pn4evX8pw2VZCTDxPIR9kuAMh1tW0EdEDI+jCvCbbty96wXoSv+6FOY7ZqHDJLg
	 TAB3aasGhKNXeuUUB22eQSMEE2H1Ar+xJ7Bs55v/KgFz3LestzD7fg4jTf50bH9GZxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=djYFGW1a;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=C1X6qCL3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.2
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F8606A683;
	Fri, 20 Nov 2026 22:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 587F8606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=djYFGW1a;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=C1X6qCL3
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1795213776;
	 b=CJE6/tbBP5aGMQx+dMcLzJtOtM+Ee4cgD62M7xSV6PduSpNoE5rQDAgukW0lPDk4Gwmc64VWQ/
	  X0IvmBaOGDlI3lxhOJHI4ykiAyIMtgL7SPJSUJenC5R/eDhQGl0A6n7J4FVzywDOQKMVapU3aF
	  Q20CUDDzbf1Lr+DBGn9XopL8hzqQM5PFyjjCD1cf2nkBxD5UffXBYxMaawf2/AS/+ZhK4AI/qJ
	  ptnlC+UyGvH4t+GvVil9V8Do8UkmWXLDO/uRHjTvBnXgQfu/aRMrdxbOZlNnO3GXDkWbLT1WTd
	  aols5Hj7Mu/hG7LdcRDCoyODLUcDb8dAo85a+OaWm+dgew==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1795213776;
	bh=h4/PvQGQBHA53Mqz73uEXZBw39vM18PWGic/0cLkT8k=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=Ihv/Bvqd5diDXjpl0K1ohlzCZoHAXL3wea6+LRDNXcQiSMCcvgN6zcGOPtclnWCUys9D+3smwy
	  wA7gPQRd7XZTr5Hze9UJ7k/GH5jLyjWOiBawE4DcNUpqckO/kGfDqs1Mpt0naFgDw5fD3vi5fG
	  yddscMQHKw8WXDenSyNLX2LHHTkA/Jdvu7ReBs+C+Ml4YZ/B9WHi8x0UbyfImMvzophe2imvfJ
	  Tt27Esj0eZrARmxj5/uOEp2RGhtcnqUClGZOuAUrdIJKQ5oq0WYIaq9hN7lu8qOlJXA/YUTI0k
	  q/2t67m+hV0E11YUXdhwJ2r69kNNzx4qcXPrHUsvMy3rAA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=nXLCbebK0ohY3VxsiL1yT6/kHgvyK8XmySVKFIznQEw=; b=djYFGW1awduiLSqM+f3CLQHgBt
	1AqPLF5D8pPZDwVew2dR+IlLF+eMZ3rOKHJVKFrcWsQegTFpwKBny9cCRvzTRgbuhpyEyMPSEylZ8
	4P8v5DXaC6f+l2uPpK3Q4xvU5CXcmQlc8ss8DHsqZVjrMDMU656PdXg0fOOBfjEN9s68=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xUX6m-0000000CnZo-1Bmn;
	Fri, 20 Nov 2026 22:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=nXLCbebK0ohY3VxsiL1yT6/kHgvyK8XmySVKFIznQEw=; b=C1X6qCL3A3fgiTfhuz3qSKEHAr
	+47YJOCk0RR0EYBf+MGCMr0gGCUnD895iGo4I8inNXGZa9vcVlSMxqnHcSC1AAvunuxvpCETOhWi3
	A9VFKrvhcssmcHf8Mr6LX1twGdJUpaWlfb06uBH7bC+1LF+c4b9MqJKiIWPhT4z8Amvs=;
Received: from [95.251.96.187] (port=59221 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xUX6d-00000000EpD-31vA;
	Fri, 20 Nov 2026 22:29:19 +0000
Date: Fri, 20 Nov 2026 23:29:18 +0100
From: Francesco Valla <francesco@valla.it>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	openamp-rp@lists.openampproject.org, Bjorn Andersson <andersson@kernel.org>, 
	Tanmay Shah <tanmay.shah@amd.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_rpmsg: fix config space alignment
Message-ID: <awDI4B8yYDB6h3H9@bywater>
References: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>
 <au4QVFyk7Zzc6y2u@p14s>
 <av8V18TntRP2U6hQ@p14s>
 <4c542301-a80d-4f14-8651-1307ac783794@foss.st.com>
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
In-Reply-To: <4c542301-a80d-4f14-8651-1307ac783794@foss.st.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 20e36c68bd39ff77a4240ac976858a1f
X-AntiAbuse: ID - 20e36c68bd39ff77a4240ac976858a1f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xUX6m-0000000CnZo-1Bmn-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Arnaud,

On Fri, Nov 20, 2026 at 06:50:47PM +0100, Arnaud POULIQUEN wrote:
> Hello,
> 
> Sorry it goes out of my radar.
> 
> On 11/19/26 16:29, Mathieu Poirier wrote:
> > [Adding openAMP mailing list]
> > 
> > Heads up OpenAMP people, I will merge this patch in a week.
> > 
> > Thanks,
> > Mathieu
> > 
> > On Fri, Nov 06, 2026 at 11:37:24AM -0600, Mathieu Poirier wrote:
> > > On Sun, Nov 01, 2026 at 02:54:03PM +0100, Francesco Valla wrote:
> > > > The comment for virtio_rpmsg_config says that this structure is
> > > > naturally aligned to 32 bits, and this is desirable by some
> > > > architectures that don't get along with unaligned accesses.
> > > > The content of the structure itself however isn't aligned, and the
> > > > __packed attribute prevent the compiler to add this alignment.
> > > > 
> > > > Fix this by adding a padding byte.
> > > > 
> > > > Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > > Hello,
> > > > 
> > > > unfortunately I missed this when the original patch set was sent, but I
> > > > think it's worth fixing (or at least discussing) this now before it
> > > > enters a stable kernel.
> > > > 
> > > > The same support in open-amp has already been merged [1], but maybe it
> > > > can be fixed before the next release there too?
> > > > 
> > > > Another, lower-impact solution would be to fix the comment, but that can
> > > > then led to issues on architectures that does not support unaligned
> > > > accesses (e.g.: AMR Cortex-M0).
> > > > 
> > > 
> > > Thanks for bringing this to my attention.  I agree with this patch.  I will give
> > > Arnaud a couple of weeks to reply to this email though.
> > > > Thank you
> > > > 
> > > > Francesco
> > > > 
> > > > [1] https://github.com/OpenAMP/open-amp/commit/744376f566c3ec7e06a7d093d785295b78aa486f
> > > > ---
> > > >   include/linux/rpmsg/virtio_rpmsg.h | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> > > > index 0872cbca4593..d24fedb63023 100644
> > > > --- a/include/linux/rpmsg/virtio_rpmsg.h
> > > > +++ b/include/linux/rpmsg/virtio_rpmsg.h
> > > > @@ -23,6 +23,7 @@
> > > >    *
> > > >    * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> > > >    * @size:	size of this structure in bytes.
> > > > + * @reserved:	padding, reserved for future usage.
> > > >    * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
> > > >    * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
> > > >    *
> > > > @@ -33,6 +34,7 @@
> > > >   struct virtio_rpmsg_config {
> > > >   	u8 version;
> > > >   	__virtio16 size;
> > > > +	u8 reserved;
> > > >   	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> > > >   	__virtio32 txbuf_size;
> > > >   	__virtio32 rxbuf_size;
> 
> 
> What about using a u16 for the version instead?
> Even if we never use the MSB of the field, it seems cleaner to me than
> adding a reserved field.
> Indeed, we can consider the config space header as containing the
> version and the size. The rest is version-dependent, including the
> reserved part.
> 

Between the two options, I prefer the u16 version, to keep the
version-dependent "payload" aligned to 32 bits. I'll send a V2 with this
modification.

Shall I send also the corresponding modification for open-amp, or you'll
take care of that?

> Regards,
> Arnaud
> 

Regards,
Francesco

