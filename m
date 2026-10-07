Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB070313523
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 Oct 2026 00:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334327; cv=pass; b=mOGQTdudXHQuX7fJcvgUvWxN4htV74Y0RELbgKwKVZeGrRlvhxgCD8DDK15PIf5AySt+Wmd21ShlZOXqpi5HxJdX5/VXB0GBOw8zNoq4msxURlYUXNlPoDeY1NO/wOs3z6ODYHuMRq7Ra0wVka4dJPmilQxCT4D62zaTck/sgx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334327; c=relaxed/simple;
	bh=BX1JTxbJEXnqNqVkUffmNNj1V50eTcs9S7BDpSMKKPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwtRJRPTFkVTEUbC3VXvvympmIwzPfS6WdyH5KdNDrJC2wQ9WTWBH6l+DTcBwn7maMnRkhYdEq+VVZAvCAQE0ogWoNJ01YnD3MrKH4kve/742K6/Ppl31HDbdjToHlD7h7xocq/sNOmphjajAaWftC5JIMx9hbJGhPF7b2FiCuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C9rCBi2F; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C9rCBi2F"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6af9befd04cso4855291a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Oct 2026 17:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334324; cv=none;
        d=google.com; s=arc-20260327;
        b=aQqsZ5Zp5l3XiVCZZ5NOB3c2l5AXfsa6tzMuv7nfFviCxvWmxHqT5KmNVeKi7r/n5Y
         UYr32IRTwmohdv9uoPacYP57c44fgRS1hogLUWtP5C2oksdeWAo4v1w8jYHZcbBByCUG
         AaIMEkPnvbzH9eH80VeQFhVtUnx+Bo22hFw2HybG7LQraT+KiapDBQo14m+EqROZEQxi
         7xv696XnWIYuf8rGHewme3NRQ7JAy976iz5z3yQ1YjbSYWG6oQgBjSzNsh3+M5xD03Sj
         1vIdH+KL/ldQt7up2nbVAkhk8fmMljpp8ZmAqgSMc6P0IFGYkh4OAPyL0SW1+gMABDEn
         ZSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        fh=0VM83nahu0vUs0Q1Z2pEpFfRgDCdOVo+u/XgkBhrIM4=;
        b=HHCmf1C5E9pWdPkn10yiv6wfK+pper4Xf9n5NsRVoBV6VhezBIWAHWtlROr1Mmn3ro
         bdfDhuORVwFjy2no0tL99FeQ9nFhgIveQUzfv9AVx/tJwYowQ60VK/TeZpaG+ZNlUgH0
         qomAbtk5ZrEbG7ZulKp7rTaXjBmEhPZS33YgHdap65f1JyPDVZL9/KeCT1hKpcubHeTK
         C2zvLyFdQtdhIckevWKbZmx0LdMyN8jKIeyVhLUamWY4bTys9HoyIphM2dv8fYxIlInS
         PbJ5SY86bBbSh2UJmyo7XdxCVG+O0Ug37eGz9Svul+XTVmczde3pXag5KJ/DiQeFUO+H
         cukA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334324; x=1791939124; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=C9rCBi2FjKM1nrti3wmzLt8Fb6cPzqlGg6nKk/Og2aTzQk0tWLK/pCUQYdBuk0DAeP
         RoILmNW1xaVMpwOzvmHXM7oXbdcoxQSVEnJazsZMEd+kjJNHskW7bkhMtwwH4Z2Tj9bk
         BUBUBvKvhv1yo3UoUIRD39bDI1cN3zJyoJIfBjGCUIO0wRGZ81XxuEQvvsczuphHx8Zr
         eE7H12eS0gcxcNCsDBkQbfncxrmgQxKxfrhzzMCvLnp49Uy5e6XskT0G060yhEk+sgzV
         Or34qUjhr6eNdtb9HXqpe2Z+w3EfIRTBWVsjfBxdCcPtIod1x23I4BIlrrH6lZoy925F
         zCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334324; x=1791939124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=jKkRcCnVllfSqfhSZf+CY9pGAMXk1F4QnL5TZphK3R9ARnwoaQZyDsUDH8r09imbtt
         XHiFlhP9/q6+FAEFYpdyMkyCJtkOcDcU7f2mpwLz2rJV5ayIFOTgcajR8rBzCTFS3t/2
         lXQLxqaRoN2IFCfyD53p3CFD7JT+lb7A55DYQcsZH76YijZndjCLaOIu4W7BDQsokAag
         f50MgANBkM+XDwaSiMcnO8F2IzTiG3P3GvAATor+xVlX6Ufy2XtfvOXgay22ZYidfonq
         6lg5/3bI0Is6jQskt5RNR+/TtGZW724XcGwmCTAGVhXjr56zaEgmQyJTt/Id94gJrBz2
         +UEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMn5N5jMEz/FdYuZxCR7OZmqNhTr3G9Q1h4R75V7ZJsf/YHHQpDVTcw88p9TuC2Gj0EGSPn2qEw2/JD+ULybKo@vger.kernel.org
X-Gm-Message-State: AFq9FYLHR8GIsV6lrpr/mVLT7q2mFcxlEBC7hIkvI8Sf3uVbAGqgDxg2
	SJOdQ7jolbew1xRU//dbbfsKvIe7UZs5hZt/GdH0HbrYnUyl+0TN0ohCjP0TzKKfCQTzfjv7j8J
	OXnFKch0pKARTuer6eiw8hTvpFG/IQvpTUCqPH0gAjQ==
X-Gm-Gg: AYBFou31bnIOLKtKPMltSi+47fDJDSy7TV7l/iqtQLAd71OkzZqt0d66K9UowML6hoE
	HGAOJmPnNSVmWNZtxkY0BHyaMsANGCO//Fc6rJodatUAUiHe0j5ruo/JJ28yU5FKflfsI4kfzKS
	Dazkug/6mo56nBZiNP2bMUAF66Ip83oJsA1LWQAUIgh6ywzjp4TPZKnTsgPZ2LxQtcbknMnQGNP
	d/JSplC/LEG3jp6LCD+LgwFXBZHof3aZpOHRYxN3Eg6bpPGTvgImXYAXXYn2WwFibfQXDQxVDAv
	XLwofmeRYaKkh2BaWyY+PvajA+1sZg25wQ0dm5PWSG6Hwvz3p1m53g==
X-Received: by 2002:a05:6402:455a:b0:6ac:73f8:2e50 with SMTP id
 4fb4d7f45d1cf-6aff29b8a9dmr558035a12.43.1791334323774; Tue, 06 Oct 2026
 17:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater> <20261006183910.GA2890477-robh@kernel.org>
In-Reply-To: <20261006183910.GA2890477-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 18:51:52 -0600
X-Gm-Features: AclHuK8OpBmmKBzqQvP8CWwB7vUNA7khdkA2Xv5tnX4fcSWpzyBVTx2EHup08IU
Message-ID: <CANLsYkwhrqk0nQNFuP_5aMYQCLGsLrzm-z9YP+Fvv-C1Ug8trg@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Rob Herring <robh@kernel.org>
Cc: Francesco Valla <francesco@valla.it>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 12:39, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 22, 2026 at 09:44:20PM +0200, Francesco Valla wrote:
> > On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > > these are discovered through a resource table parsed by the remoteproc
> > > > infrastructure at runtime, their description can be needed to probe
> > > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > > >
> > > > Each vdev is described by a dedicated "group" node, which then includes
> > > > a virtio-device node, which binding is already existent and used by
> > > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > > using its index inside the resource table as the reg property of the
> > > > node; this permits to have multiple instances of the same type of
> > > > device.
> > > >
> > > > The binding is intended to be generic and adopted by any remoteproc
> > > > provider.
> > > >
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > > >  1 file changed, 89 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > new file mode 100644
> > > > index 000000000000..c4a0d84b1460
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > @@ -0,0 +1,89 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Virtio devices over remoteproc
> > > > +
> > > > +description: |
> > > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > > +  and its resource table. For some of them, a device tree node might be needed
> > > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > > +  providers.
> > > > +
> > > > +maintainers:
> > > > +  - Francesco Valla <francesco@valla.it>
> > > > +
> > > > +properties:
> > > > +  virtio:
> > > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > > +
> > > > +    properties:
> > > > +      '#address-cells':
> > > > +        const: 1
> > > > +
> > > > +      '#size-cells':
> > > > +        const: 0
> > > > +
> > > > +    patternProperties:
> > > > +      "^vdev@[0-9a-f]+$":
> > > > +        type: object
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            description: Virtio device index inside the resource table.
>

There are 2 configurations we need to account for: (1) each device
located behind the remote processor gets its own set of virtqueues and
adheres to the virtio specifications.  This is the configuration
targeted by this thread.  The other configuration (2), discussed in
the other thread, involves virtio piggy-backed over RPMSG.  The hope
is to represent both configurations using the same bindings.  For (1),
virtio devices will be advertised in the resource table and for (2),
virtio devices will be announced via the existing remoteproc namespace
service.

> Who/what defines the resource table?

The resource table is part of the firmware image and is parsed by the
remoteproc core.  For (1), as presented in this set, "reg" links the
entry in the resource table with the device definition in the DT.  For
(2), the definition is also a device index, but said index is
communicated to the remoteproc core using a namespace announcement
rather than the resource table.

I hope to establish bindings for configuration (1) and merge that work
first.  Once that is done we can extend it to cover (2).

>
> > > > +            maxItems: 1
> > > > +
> > > > +        additionalProperties:
> > > > +          type: object
> > > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > > +          maxItems: 1
> > > > +
> > > > +        required:
> > > > +          - reg
> > > > +
> > > > +    additionalProperties: false
>
> Preferred to put this before 'properties' in the indented cases. Easier
> to see what level it belongs to.
>
> > > > +
> > > > +    required:
> > > > +      - '#address-cells'
> > > > +      - '#size-cells'
> > > > +
> > > > +additionalProperties: true
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    remoteproc-cm33 {
> > > > +      virtio {
> > > > +          #address-cells = <1>;
> > > > +          #size-cells = <0>;
> > > > +
> > > > +          vdev@0 {
> > > > +              reg = <0>;
> > > > +
> > >
> > > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > > provide their input on this.
> > >
> >
> > AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> > child nodes using the 'reg' property, not the node name. This I believe
> > is the preferred way of doing things.
>
> It is either both unit-address and reg or neither. It's preferred to
> have them unless you are just making up numbers.
>
> Rob
