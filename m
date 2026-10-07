Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843424AF165;
	Wed,  7 Oct 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390885; cv=pass; b=QMoyzRCGiwC9Pf0XDBvpQIhZe4RKKx1zk+yXdsSSNqbc6kiZDDJ5+TKupsxWyxKl9yxao5lbmJAiOXIAKxIqe9UazQtc1Zgo0fMWrS3OixRZzqR+xrg2atuSWNzc+CeKHkoPmJl0cGJJEZTrgfCCpOZ9h0bNnEFqDDOvL8r+3nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390885; c=relaxed/simple;
	bh=zWZ8FsXv6P2pM5aRRcbjwFhBPvqExbHMMrdKWPrYp+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQwQdmaiEGfOoQd8S6TCexblB2RfR5djEWVWHOuG8zd7gVhNK/nNyq0PWGWNMpdsO1zakprUtiG1FFaZvYfNd+hZYXvb6rh6Rj8B8+jbqX2IOZSugYHegYjGScrvwsV60To38A9gBExETvoDYjJWREKem9VbGnyZSoad1vMVKjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=lUK2DFzZ; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=rGQH2Jt/; arc=pass smtp.client-ip=185.56.87.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="lUK2DFzZ";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="rGQH2Jt/"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-mzd6.prod.antispam.mailspamprotection.com; s=arckey; t=1791390883;
	 b=Lo/KVuZplQWcM9Yhx2ti3uPr41aycF4PdHXoVwCFot+1ZemFoHsBkPDc7lnEzIyAlGb4ZBQL9r
	  gQ3rszGA9wYnEZSu7JEeWSZqHcfiEZMxYjmjTzWGTCTgLX0jHbmJQd//CRQvKtXcYdLLCpnZXh
	  ecJhsrvUTd93ziJaw7fKlAfdLsNLTazeIY1a8D1syB/XHI5tGkbjkxtSPqYPGgML/pzj/snA/V
	  cyNv5nv6jQlUHFMak+0c5Nnlt8wcmlZbB/WKERs7GIPFH7VUBI6hJlx+Ndm0jSmih4/pAZloQM
	  o8Bczd+LpbKVdWi7KElKFKiSJExPXCZ25t1LWs6l8roKNA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-mzd6.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-mzd6.prod.antispam.mailspamprotection.com; s=arckey; t=1791390883;
	bh=zWZ8FsXv6P2pM5aRRcbjwFhBPvqExbHMMrdKWPrYp+w=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=BrO5ZiHp7Rau76si7nn5E3+aWdElxxDuCw9BRAU4Ah81eLORJpXeWolfHboBkzB+cLVN/IFnVt
	  w9DXuQPmY6ng3BruVF/CwFm0FGmWGvtxZx/eVS1PUtg5ZvOUkt8q/4lbCxajfJ5dtKbgFkQTCg
	  7XQptF/3GR9zqSqZyBYsD8yLAoX4UI2tY3wgAushW8+F2xxNfZb3F7/uJ4xJfoz9Zw8UOwIO3q
	  gn40XWXwZzGlTPVLW7VJT5yonSB2S1BBQdMCGRodIqeYYC+tPjTCPAHNIQa/rPnnwsxToCcDyO
	  IHNccEu/7kOa0FVPplQiScz4r0KbAjrhUMmRHIiG2LtivA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=tLwUzAmQhGSL3Ue4ZR+yc6YJqjUkv8c/LUizgFvUpEU=; b=lUK2DFzZ4QOrzCd0Em0wHo1JCZ
	UbVT59eM6O2EzMokczOIXMUZBrzxMXxYhvldh5ipSdEwpRp62S21+KTZcB147ItsT9IZOkQT4lPbA
	Xv/5XgxhEG8PfUkaAJiPeU/etvQ+Y6r4HvmmNzOOHBsONL6RuO4y10ceuCxp27V0T7Vo=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-mzd6.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xEUbD-00000008Nno-2cDf;
	Wed, 07 Oct 2026 16:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=tLwUzAmQhGSL3Ue4ZR+yc6YJqjUkv8c/LUizgFvUpEU=; b=rGQH2Jt/bpeF930y+rHYkN2zf8
	97TtVSvsaaG5aGcB4PZfyMk7r2RX3uiBz38jxRRTSPle16p8V/ICrwQiDPiognt0S2z0kAnDjDYyP
	KOckZczNOgULzyrqXvYBnhG1X2IVXykdOIdCVq4OfsXhbomC4NP/QV3KzGUgCqn84S2E=;
Received: from [79.14.200.104] (port=64271 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xEUau-00000000MYn-3hbM;
	Wed, 07 Oct 2026 16:34:17 +0000
Date: Wed, 7 Oct 2026 18:34:14 +0200
From: Francesco Valla <francesco@valla.it>
To: Rob Herring <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
Message-ID: <asZ0KdG7lloNwDfx@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s>
 <arLZj2DxBazf3wMd@bywater>
 <20261006183910.GA2890477-robh@kernel.org>
 <CANLsYkwhrqk0nQNFuP_5aMYQCLGsLrzm-z9YP+Fvv-C1Ug8trg@mail.gmail.com>
 <20261007134206.GB2792240-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007134206.GB2792240-robh@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 277590c51d18866cf78171bb6a57e18c
X-AntiAbuse: ID - 277590c51d18866cf78171bb6a57e18c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xEUbD-00000008Nno-2cDf-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-mzd6.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Rob,

On Wed, Oct 07, 2026 at 08:42:06AM -0500, Rob Herring wrote:
> On Tue, Oct 06, 2026 at 06:51:52PM -0600, Mathieu Poirier wrote:
> > On Tue, 6 Oct 2026 at 12:39, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Sep 22, 2026 at 09:44:20PM +0200, Francesco Valla wrote:
> > > > On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > > > > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > > > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > > > > these are discovered through a resource table parsed by the remoteproc
> > > > > > infrastructure at runtime, their description can be needed to probe
> > > > > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > > > > >
> > > > > > Each vdev is described by a dedicated "group" node, which then includes
> > > > > > a virtio-device node, which binding is already existent and used by
> > > > > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > > > > using its index inside the resource table as the reg property of the
> > > > > > node; this permits to have multiple instances of the same type of
> > > > > > device.
> > > > > >
> > > > > > The binding is intended to be generic and adopted by any remoteproc
> > > > > > provider.
> > > > > >
> > > > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > > > ---
> > > > > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > > > > >  1 file changed, 89 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..c4a0d84b1460
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > > > @@ -0,0 +1,89 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Virtio devices over remoteproc
> > > > > > +
> > > > > > +description: |
> > > > > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > > > > +  and its resource table. For some of them, a device tree node might be needed
> > > > > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > > > > +  providers.
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Francesco Valla <francesco@valla.it>
> > > > > > +
> > > > > > +properties:
> > > > > > +  virtio:
> > > > > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > > > > +
> > > > > > +    properties:
> > > > > > +      '#address-cells':
> > > > > > +        const: 1
> > > > > > +
> > > > > > +      '#size-cells':
> > > > > > +        const: 0
> > > > > > +
> > > > > > +    patternProperties:
> > > > > > +      "^vdev@[0-9a-f]+$":
> > > > > > +        type: object
> > > > > > +
> > > > > > +        properties:
> > > > > > +          reg:
> > > > > > +            description: Virtio device index inside the resource table.
> > >
> > 
> > There are 2 configurations we need to account for: (1) each device
> > located behind the remote processor gets its own set of virtqueues and
> > adheres to the virtio specifications.  This is the configuration
> > targeted by this thread.  The other configuration (2), discussed in
> > the other thread, involves virtio piggy-backed over RPMSG.  The hope
> > is to represent both configurations using the same bindings.  For (1),
> > virtio devices will be advertised in the resource table and for (2),
> > virtio devices will be announced via the existing remoteproc namespace
> > service.
> > 
> > > Who/what defines the resource table?
> > 
> > The resource table is part of the firmware image and is parsed by the
> > remoteproc core.  For (1), as presented in this set, "reg" links the
> > entry in the resource table with the device definition in the DT.  For
> > (2), the definition is also a device index, but said index is
> > communicated to the remoteproc core using a namespace announcement
> > rather than the resource table.
> > 
> > I hope to establish bindings for configuration (1) and merge that work
> > first.  Once that is done we can extend it to cover (2).
> 
> "Defined by firmware" is all I needed. Please make sure the binding 
> patches include this information or I'll forget and just ask again.
>

I'll include this detail in the next version of the bindings; I'm always
working on .rst documentation to add to the next version of the patchset.

> Rob

Regards,
Francesco

