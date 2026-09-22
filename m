Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8FC49BD82;
	Tue, 22 Sep 2026 19:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106295; cv=pass; b=uDBOTVtS2ncTPT/TP88yooEPXrb9EhdCotUKD8mc7zwYNbtEfGlCAlWzb/ri2iMLisbLtXMCqo4BcmfvpNx+pytN93bm1S19EQjCxuKVi5FuoQ388mHTkhAa8nEu+5nnJBtRA1Tui/ekEhoZS/WN7q2JwinH8OoeO14D9S9ehtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106295; c=relaxed/simple;
	bh=qOXrENOmvD3c0poDLwp4NolvBmbZT4OR8eyzCGaaZS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4usfrQl3DDZ/uOu0Z1iB5ENUelNXeDJJ/sM3LpNOcWq60p21Z0PvRZgsHEu1kE2kiC8uL/LjREvLvajy0fna+TkYnZpnan2mko7cYzjYettXxav9jBy/yX/jS3XWyuwrTGQWcFcjZa6IHC22DyiI1O3UqegQ4srgq1qR+NJZHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=MIfqPCkt; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=rmYcIKe1; arc=pass smtp.client-ip=185.56.87.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="MIfqPCkt";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="rmYcIKe1"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-9kw8.prod.antispam.mailspamprotection.com; s=arckey; t=1790106293;
	 b=TL6F+6n1Pc+riQySXgnTPJc4//Bj4fGA4rIY3pjwN1MHS7ZKMKgVhaPYZzr57ro4Maj2bkpbdG
	  NPHlXcQ4lTh4DRIYsg+Dz+VDLPtYXHgEDHaefDCnyngmjp5a9uRtxruK8zIFJ53E4HLpJbErjm
	  pljXxeqMudBvXtQVRQJO6rPePPYVVp2KOc7jSnmfiqNDEjAJY8q/Hpt7y3kYkHX0vNV4ltnkbZ
	  WBz84vZf5jpWdPHSRfnqKNbVtrUEeGyMvg5WNzEABwi5WS40aFG6jOoatOfampDIWkrI9VhP5m
	  Uwr4/0t44IH3dV1iz06F/9WmUpfKcl6WoTQFufwQY9CBog==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-9kw8.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-9kw8.prod.antispam.mailspamprotection.com; s=arckey; t=1790106293;
	bh=qOXrENOmvD3c0poDLwp4NolvBmbZT4OR8eyzCGaaZS8=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=PXRHr7lOMAUERXkqKNF7WBQuAJotyNi1pNNiCPBJKTtpIaQGEBjv88dihquuhVLKhRTqWS0koj
	  kuhy/wBCF9k/+8cxON+EFt/m6fFhZjC8ejAvCEHTWa8YspQ5Y01IY7jjf9FRoAUAs4FIB9rnS+
	  Ol8NVKo0Cd8zD5SURMuUq93dCwC1AaRT4ohFb1lCHYXB8VacwRceZWv2HYg1s7YMZUIFVm47p0
	  Fk+c7mw25GgXQ+mYk+dFNMIA9zTcCEs/FliokGbvh7cztLYJJMecodaIKLBSuLxKx2Di4qCHEa
	  GPZIMtXCNRoPFJl4TqNusx8ZA7SZij26WOSsgiTfjvkutA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=DWQfnp8zbk64+c1EQHIweK4Oi1mCcjaNI5dI4QLRVAk=; b=MIfqPCkt2QmOBgkPsnXVdJwR+h
	sfggHPRXZseU4Gkz9D9XSaaL2t49ZtomPC94jnelVMisQRJ/jSvWOzGremRLid+CWOLuNBm22wYFc
	K9n+4z2vfnsoiNJOdINdMlO1nMY7zveTbrxGooAyfouATRqKRw8Yq01hyVoW4HkpwWlY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-9kw8.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x96Pz-00000002ovM-3LXg;
	Tue, 22 Sep 2026 19:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=DWQfnp8zbk64+c1EQHIweK4Oi1mCcjaNI5dI4QLRVAk=; b=rmYcIKe1HfMMhU/P3OTu17bhSw
	6H/7sXovZu6EbKkWYT2OqOlOXqeJ6cDCDU9fLlM+3swg3mVL34qZF+TDEUKGxBzN44fRk3RuNeJ6K
	tmRsK8nIrsst1ZCw4FGr3KL7bfA5pSZtGuKcZusIF1+jkEVraGDF1oHKW9WCzXgWaNlg=;
Received: from [79.43.46.244] (port=60270 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x96Pe-00000000HKX-23nv;
	Tue, 22 Sep 2026 19:44:22 +0000
Date: Tue, 22 Sep 2026 21:44:20 +0200
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
Message-ID: <arLZj2DxBazf3wMd@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKhbxi3Snbt1_Mn@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 7442c616497a72c3de4b16ff53609997
X-AntiAbuse: ID - 7442c616497a72c3de4b16ff53609997
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x96Pz-00000002ovM-3LXg-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-9kw8.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > Add a new binding to describe remoteproc-provided virtio devices; while
> > these are discovered through a resource table parsed by the remoteproc
> > infrastructure at runtime, their description can be needed to probe
> > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > 
> > Each vdev is described by a dedicated "group" node, which then includes
> > a virtio-device node, which binding is already existent and used by
> > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > using its index inside the resource table as the reg property of the
> > node; this permits to have multiple instances of the same type of
> > device.
> > 
> > The binding is intended to be generic and adopted by any remoteproc
> > provider.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > new file mode 100644
> > index 000000000000..c4a0d84b1460
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Virtio devices over remoteproc
> > +
> > +description: |
> > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > +  and its resource table. For some of them, a device tree node might be needed
> > +  to describe remote undiscoverable hardware and/or connect consumers and
> > +  providers.
> > +
> > +maintainers:
> > +  - Francesco Valla <francesco@valla.it>
> > +
> > +properties:
> > +  virtio:
> > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^vdev@[0-9a-f]+$":
> > +        type: object
> > +
> > +        properties:
> > +          reg:
> > +            description: Virtio device index inside the resource table.
> > +            maxItems: 1
> > +
> > +        additionalProperties:
> > +          type: object
> > +          $ref: /schemas/virtio/virtio-device.yaml
> > +          maxItems: 1
> > +
> > +        required:
> > +          - reg
> > +
> > +    additionalProperties: false
> > +
> > +    required:
> > +      - '#address-cells'
> > +      - '#size-cells'
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    remoteproc-cm33 {
> > +      virtio {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          vdev@0 {
> > +              reg = <0>;
> > +
> 
> Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> provide their input on this.
>

AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
child nodes using the 'reg' property, not the node name. This I believe
is the preferred way of doing things.

> > +              gpio {
> > +                  compatible = "virtio,device29";
> > +
> > +                  gpio-controller;
> > +                  #gpio-cells = <2>;
> > +              };
> > +          };
> > +
> > +          vdev@1 {
> > +              reg = <1>;
> > +
> > +              i2c {
> > +                  compatible = "virtio,device22";
> > +
> > +                  #address-cells = <1>;
> > +                  #size-cells = <0>;
> > +
> > +                  eeprom@50 {
> > +                      compatible = "atmel,24c1025";
> > +                      reg = <0x50>;
> > +                  };
> 
> The previous patch introduced bindings for virtio SPI while the above two are
> for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
> everywhere.
>

This is because both GPIO and I2C bindings are already defined - even if
not used in the devicetree files part of the kernel tree.

Moving forward, I plan to submit at least the spi-virtio bindings as a
separate patch set, as they can be used independently of this one.

> > +              };
> > +          };
> > +      };
> > +    };
> > +...
> > 
> > -- 
> > 2.55.0
> >

Regards,
Francesco

