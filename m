Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8227E542EC1;
	Thu, 24 Sep 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271324; cv=none; b=WvTy4oRjKHQPrYbQ+2+axCrim8EWC2PVuQUVy/lcEPiBor+e3igRnw8hFEaiRN4pWBcpOb+eXtwPEWNc9/sIPL4ZujZf/BQf4h6pqBLezM5LLgDKJjeC9Kvuy1DaU1CycwgG4qfn6FG8w1N5clc2eesKdIe5KlxETrsx/Ueg9+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271324; c=relaxed/simple;
	bh=FyRJz4YMDl6mBag9t5YIg0D7B1oafB2JS5XVdDQ/FJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRFPz+9IGzH5+hIhCf4DAZjLq9M0hZXgFXRwc71lm67ZBnZFxq+S83ivuk1Fc/7AfucfuI0EsFcFCFGi/9CHao/fRWxmJc9oWy1nakZW5R504cu02JnCWozlf08NPk/eyMsGv7heop/k+H91RVIflbAODTrdlDQMI04cIHoQXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVyqtnTF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVyqtnTF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4951F000FF;
	Thu, 24 Sep 2026 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790271322;
	bh=iB1GdzP+8thSPMeWIKodQA64CDM1Tul3nzGc9hJIyLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QVyqtnTFgJ1OrhUvXnt/50bN1+ev4REPE0V4chjSMh13CZFHvUBTT5udqrxIr2sY8
	 sNsv0BtIkH9cZoYfmEQBe27Tw126iuARvLFcEaSAxrphRluLxrjP0IpR+8suOdUhG4
	 8zo9ZasonLhEGey91Jt/Kpdk9ZWULkRnFoGb1mAVxQqSDhfg0+xoxxDMgastegnav2
	 8P5nj0/wHesA9muawmp952KPVhNTLUVVwKy4MVje607sHePwR3KTIqg1rex39+j12h
	 XLNUl3glZOsmG195yNaJ/gypajXXCZ+DWILZHIMOm6Tbx+vL6HFyMbOlyimvHankhJ
	 f9VNlg0LCsRgA==
Date: Thu, 24 Sep 2026 18:35:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20260924-bonding-chill-81ae9424c06d@spud>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C56Zomom5CajsRz1"
Content-Disposition: inline
In-Reply-To: <20260923184255.299034-3-shenwei.wang@oss.nxp.com>

--C56Zomom5CajsRz1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
>=20
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
>=20
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
>=20
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
>=20
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 46 ++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..41eb2e149942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic RPMSG GPIO Controller
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote pr=
ocessor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the p=
acket
> +  structure and communication flow between Linux and the remote firmware=
=2E Those
> +  controllers are managed via this transport protocol. For more details =
of the
> +  protocol, check the document below.
> +  Documentation/driver-api/gpio/gpio-rpmsg.rst
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio

Is this even used? Your dts patch doesn't have it.

> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio

Sounds like, if linux are the arbiters of what this protocol is,
"linux," should be used as a vendor prefix.

> +
> +  reg:
> +    description:
> +      The reg property represents the index of the GPIO controllers. Sin=
ce
> +      the driver manages controllers on a remote system, this index tells
> +      the remote system which controller to operate.
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.y=
aml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..5c82255b92a5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -88,6 +88,29 @@ properties:
>        This property is to specify the resource id of the remote processo=
r in SoC
>        which supports SCFW
> =20
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Represents the RPMSG bus between Linux and the remote system. Cont=
ains
> +      a group of RPMSG devices running on the bus.
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^gpio@[0-9a-f]+$":
> +        type: object
> +        $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +        unevaluatedProperties: false
> +
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +
>  required:
>    - compatible
> =20
> @@ -150,5 +173,28 @@ examples:
>                  &mu 3 1>;
>        memory-region =3D <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, =
<&rsc_table>;
>        syscon =3D <&src>;
> +
> +      rpmsg {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        gpio@0 {
> +          compatible =3D "rpmsg-gpio";
> +          reg =3D <0>;
> +          gpio-controller;
> +          #gpio-cells =3D <2>;
> +          #interrupt-cells =3D <2>;
> +          interrupt-controller;
> +        };
> +
> +        gpio@1 {
> +          compatible =3D "rpmsg-gpio";
> +          reg =3D <1>;
> +          gpio-controller;
> +          #gpio-cells =3D <2>;
> +          #interrupt-cells =3D <2>;
> +          interrupt-controller;
> +        };
> +      };
>      };
>  ...
> --=20
> 2.43.0
>=20

--C56Zomom5CajsRz1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVfUwAKCRB4tDGHoIJi
0i0GAP97j+i7FWor0B5kx0k5Y61hsIbG5rpgbILtHtQonkqb+gD+Jw/HBv1cg7JV
KEqTudUMhBrAYU4Cx+DsgAN/vYAzRgU=
=ljte
-----END PGP SIGNATURE-----

--C56Zomom5CajsRz1--
