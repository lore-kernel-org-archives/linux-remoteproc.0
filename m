Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4085542ED9
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Sep 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175414; cv=pass; b=kRkxWrgUijE8kGDycSnmMTwcv/BhQ04yjA/npRBxhbvCz5azCNRKRzUFKdhoDlRgXhhUg2CEodLLVocSSq1Kcm4/Tw8fQ/Myg+Y9oDX3+Pz1uNamGkTa6eWR+9+EiDO11dTL+3ITPCMtkigyPS3cyFOAKEXA6U7mUhGXZjcxipk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175414; c=relaxed/simple;
	bh=UyMSLBvW9tmyx5OoI5WsB7xjvglDq4V9P7yAbnK27AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swZMzAeVXl59d3s0Wbdw9R72DitE/61phgx+DYzHInQS6U9afLrlWGAUi0wJD3G88a9laQ12AARZvGnBl8nxvIWXCrKQafrcm8nDt9vfMnyHE38Djs4rYa81NirNOkw2D3htfZe0l+2SKkUxxF7eckh3SSt+UBSfWAlyhvzvmUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2MjLjcA; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2MjLjcA"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso1771623a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Sep 2026 07:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175410; cv=none;
        d=google.com; s=arc-20260327;
        b=QZTU5yjlpDVkRL6im9jub4zDJodoDNtdmdf4elIR4SD4Dor93r31wPQrtbZ8qwFEPH
         DPvcQXM8UMqmw887X/oRPvyQD87SGuRLjb2q54x/2iOrC/UC9RjkTUonAkR8FrOz2zgw
         AduslaP+1pwq1kDo0WWNeEajqWTkW50i74DGivydIHFQqHzHF+cLF7UT8ygLf0oumx06
         b8oFvrXj4ZdlIovnhCD9NHESDTY3jfYf0FKCjWsfpoMHK4GZfnlU/RdjIXRxMLBc6QsK
         tg18ZvgpaQg/y3+OPlLbxZeFZqhaCeCVA7ZN0pC0pgGCQy3WIh7K2voss5/FYFn5tjSY
         D6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        fh=zg4Zn6WaJHyP7xepF0V7Yn2fhuYEFXpYM0ARp9q2BDY=;
        b=hn6n1VRRiBD4SYgYQ8rsaopqI3pDbTU8729y/n9mUL0huTobTK6tguIj3Nni3SM3Cw
         HeZfFQB3o9TqxRpkbh/EfrHlkygMD6720oQ8CDct9hqieJrgcfRZXgMcy1SfNA7dk6+l
         j4per/Hnxjlx/O5LwIoXCGSkq4TRB8+1WxXgfXdV+hvCDN7mstTHNQYPiMcT5Z3oqnqr
         Jnu9uq7Zn3TgUDfw11BZBRbqd+dMWkhH8X/rIiSL6Me4Y/aymL2qYWTboi4PkiMpLny8
         KmwkjuZ+Vy7MMZ0ZcW3ZsnkWRrlHeIbzGOBnv4SY0R83h0jrlfifI/AK2nfirfe8lxin
         wMcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790175410; x=1790780210; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=s2MjLjcA0AyFc3tudZzDSVIPZNG8WBN3K04612i2meXScdWB5e1QBUPbP12oXgjFqM
         laDKeAQiAhUeTGKziVP/M5QBOaGNFWVZMZrENueMVwMu9CMuq7P2F4+VsKRadF7ih7H6
         hDIwGMWsDP2c4pbSiTHynclCQfWmlo04XWR99zgAFtUHpyAXFgorbbsa4iCr9c8JKOAB
         10X8OS4S6NDkDk2tapaIgoH9njFFq68xO9oKaubR5Cxh1IhH4YEHGYQMTZZqagVkZIgO
         xWDDvGoyeVL8E0GRvBPjrj31JmiwqZJ00PeeWZ59lLDAcaN/GFZmzOe+JcAChHGiFufs
         OYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175410; x=1790780210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=gIv3IFU/ASizRwJOv7HXhplTaspB19OcyYdTUV9zhLAOgXP81JZ66M+B26P2AU6e2S
         ezR+Y5CLh2wvFup8QvVCXMHE2zvRoxTyy1RBmSipyyFP4QmSSxlijaDTLXONuyLML9yU
         CI1OtMIBU1we0thMnq4G9D66c0OFhL8vpIobJz8JZYZFOIGryIUN/k/BrKcbhRWoKP+z
         BbgyV6AOrNPC7Z9+Zpicd2TDfl27myIfmWaN+0si6HMw9nRNndfQBlft859RqFMjcuRh
         BlAu4YU4hpPh8SaWLwAtwDcGWqKQ+iZJwSwLsdy8McixTTEotUM6+IaVROA0DPeW06Hy
         BgPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1S+CEabA7Hb7ycLKZjHhmaQ0M4Zpnc2sUWm9M+YPKXvALc9Hy8u6WxiIZeBdAlFRFzYbEbBM8c1WGoZU+cWQ+@vger.kernel.org
X-Gm-Message-State: AFuF++mX6XIkptO4riCjME84A+9qPv6LAAgN5kWKiCtTcqbcKl9V17kJ
	zXfLXKPTlYhCl3xyOS8Ploedz56FKB0MXglYFhuh9UCdK3A8KKKCmdbnKg1CdH4hdx2WKv4AV8N
	z2voG5qYXVz6CYPE1h0x6LyBqQbTPD0RwR6fPdxdyFw==
X-Gm-Gg: AYBFou2cvnWxlvZkZXX5tqxiIxsYiExcnXnQueyG+A950gGFpX3lyzpxNhiGICbTy7i
	ADWWylWW8Cuhpbbqno4rsxGYXTKAOhghyU4smsL9lmaifdaMwrxRxGvhlDFuc7bdBWdS2LqACg6
	/580owubLO6LVwMCunHqKz1RGI97gfBQVq+jVINubQvFNhXwQEkmfXDjfQ7s2y8PxaF4+H7mJ1d
	QeLqzbZ6XvOytYKghJ3W1/XxfLI3aT+oRgvpjCZaXh4LqKfGl+q8W2jCByhmbKXOXweX3xC1oSZ
	Cb1HwXVYazXVoRyRQsrQXh7Y+VEQDVDjAiNaTe2Q2yaei0jRhtJfttP0KZMp0lowVN418wS1j7b
	shU5weYRJkzU=
X-Received: by 2002:a05:6402:5514:b0:6aa:129a:1f70 with SMTP id
 4fb4d7f45d1cf-6aab3b647e8mr2420276a12.43.1790175409790; Wed, 23 Sep 2026
 07:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater>
In-Reply-To: <arLZj2DxBazf3wMd@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 23 Sep 2026 08:56:38 -0600
X-Gm-Features: AclHuK883D6T5DYJIUEwz22c4TjWkQLK7CcGTqdjz7jqNMirfKCdfrjOT14z4v4
Message-ID: <CANLsYkzC5DU8j_QJLkuUcV2tYb=G86L_G4yiBZTePKSqiRdd6w@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 13:44, Francesco Valla <francesco@valla.it> wrote:
>
> On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > these are discovered through a resource table parsed by the remoteproc
> > > infrastructure at runtime, their description can be needed to probe
> > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > >
> > > Each vdev is described by a dedicated "group" node, which then includes
> > > a virtio-device node, which binding is already existent and used by
> > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > using its index inside the resource table as the reg property of the
> > > node; this permits to have multiple instances of the same type of
> > > device.
> > >
> > > The binding is intended to be generic and adopted by any remoteproc
> > > provider.
> > >
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > new file mode 100644
> > > index 000000000000..c4a0d84b1460
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Virtio devices over remoteproc
> > > +
> > > +description: |
> > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > +  and its resource table. For some of them, a device tree node might be needed
> > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > +  providers.
> > > +
> > > +maintainers:
> > > +  - Francesco Valla <francesco@valla.it>
> > > +
> > > +properties:
> > > +  virtio:
> > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +    patternProperties:
> > > +      "^vdev@[0-9a-f]+$":
> > > +        type: object
> > > +
> > > +        properties:
> > > +          reg:
> > > +            description: Virtio device index inside the resource table.
> > > +            maxItems: 1
> > > +
> > > +        additionalProperties:
> > > +          type: object
> > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > +          maxItems: 1
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +    additionalProperties: false
> > > +
> > > +    required:
> > > +      - '#address-cells'
> > > +      - '#size-cells'
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    remoteproc-cm33 {
> > > +      virtio {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          vdev@0 {
> > > +              reg = <0>;
> > > +
> >
> > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > provide their input on this.
> >
>
> AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> child nodes using the 'reg' property, not the node name. This I believe
> is the preferred way of doing things.
>
> > > +              gpio {
> > > +                  compatible = "virtio,device29";
> > > +
> > > +                  gpio-controller;
> > > +                  #gpio-cells = <2>;
> > > +              };
> > > +          };
> > > +
> > > +          vdev@1 {
> > > +              reg = <1>;
> > > +
> > > +              i2c {
> > > +                  compatible = "virtio,device22";
> > > +
> > > +                  #address-cells = <1>;
> > > +                  #size-cells = <0>;
> > > +
> > > +                  eeprom@50 {
> > > +                      compatible = "atmel,24c1025";
> > > +                      reg = <0x50>;
> > > +                  };
> >
> > The previous patch introduced bindings for virtio SPI while the above two are
> > for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
> > everywhere.
> >
>
> This is because both GPIO and I2C bindings are already defined - even if
> not used in the devicetree files part of the kernel tree.
>
> Moving forward, I plan to submit at least the spi-virtio bindings as a
> separate patch set, as they can be used independently of this one.

I suggest you leave spi-virtio out of this patchset.  That way we can
concentrate on doing only one thing.

>
> > > +              };
> > > +          };
> > > +      };
> > > +    };
> > > +...
> > >
> > > --
> > > 2.55.0
> > >
>
> Regards,
> Francesco
>
