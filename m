Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822BB282E1;
	Tue, 30 Sep 2025 19:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259023; cv=none; b=tG8/lzYqVcvOTTw5Yh0gjSmz06dM44MOb44rDhcJ/2aNBwhjt9r2K932kMv+tmgizX3rII1FiR6o45AXsUJ7ZfjcLdMhGCZDLMREIoJjIOJ+VuqdrkI0Z2OlO0yCJ2kJwmHLYVWJMICAuvHxqh2t4Wd3w+1irioMkNE+Pd/Clvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259023; c=relaxed/simple;
	bh=AZxrLp8OOgE9Fe/5yxu0UAM2BjE+WoXMpwylLndNoAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiezSNRp8FO/HHafzWUw0vzl7ZQVMfYhJzI+AV85gsF4/YWHFP5AZke1RHksRNSKHTAz7nPLFU2LrBTOwRUJyTlcV9g1Ri9wh6YhxOFvOA/IYVOtdULbHdk8uT8kWVO5XXnXB8G8TSbzgNCbbSAhg3w9kwShkk4kc4lDJJKVzSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b11055aY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b11055aY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76E7C4CEF0;
	Tue, 30 Sep 2025 19:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759259023;
	bh=AZxrLp8OOgE9Fe/5yxu0UAM2BjE+WoXMpwylLndNoAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b11055aY0q7tL4OtPHKpm0Z90OeLlEWWY7RX5CphbCoLo55xB7BcJXhqc5SCJZ2k0
	 oOE+mBzvIt1JlQKTFch2VWr4pC7j9nKJv/XTryttWLkMnWcmrKE/zX8KXThMDD0jFl
	 C0uyxFKTtO0Z0/6W7StwaeTZ4jcu8p/HUQ3Oh7zN1Ya8flrIjRp3YQUMTHm+K3YgUH
	 7UDjC/biQ7okaPMbcFuUr+YACkTdSWmd9U9ntt35RI96uyLEvnC+4PXP4TnTUpQY85
	 XcSSNqE+u1HtPUrMfBUJBIyWScXyebAaJoqYdGr3ZAg33uRekTFUcVfpBJUd4h5XGT
	 tqatpK10Cs50w==
Date: Tue, 30 Sep 2025 20:03:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwlock:  Adding brcmstb-hwspinlock
 support
Message-ID: <20250930-slapstick-volatile-60ad540f4b66@spud>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qr7aKkWVgBLL5FHz"
Content-Disposition: inline
In-Reply-To: <20250929200628.3699525-2-kamal.dasu@broadcom.com>


--qr7aKkWVgBLL5FHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
> Adding brcmstb-hwspinlock bindings.
>=20
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb=
-hwspinlock.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspin=
lock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinloc=
k.yaml
> new file mode 100644
> index 000000000000..f45399b4fe0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.ya=
ml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom settop Hardware Spinlock
> +
> +maintainers:
> +  - Kamal Dasu <kamal.dasu@broadcom.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,brcmstb-hwspinlock

Is "brcmstb" actually the name of a single platform?
Looking at the "brcmstb" pci binding, it looks like there's a whole load
of different devices there and none use "brcmstb":
          - brcm,bcm2711-pcie # The Raspberry Pi 4
          - brcm,bcm2712-pcie # Raspberry Pi 5
          - brcm,bcm4908-pcie
          - brcm,bcm7211-pcie # Broadcom STB version of RPi4
          - brcm,bcm7216-pcie # Broadcom 7216 Arm
          - brcm,bcm7278-pcie # Broadcom 7278 Arm
          - brcm,bcm7425-pcie # Broadcom 7425 MIPs
          - brcm,bcm7435-pcie # Broadcom 7435 MIPs
          - brcm,bcm7445-pcie # Broadcom 7445 Arm
          - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5

If "stb" means "set top box", it sounds like a catchall for disparate
devices, which isn't permitted.

> +
> +  "#hwlock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#hwlock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwlock@8404038 {
> +        compatible =3D "brcm,brcmstb-hwspinlock";
> +        reg =3D <0x8404038 0x40>;
> +        #hwlock-cells =3D <1>;
> +    };
> +
> --=20
> 2.34.1
>=20

--qr7aKkWVgBLL5FHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwpigAKCRB4tDGHoIJi
0lbfAP95Hy2SdaNddoRFW3UDtB0xETS9YJ5HfnHUfOk5ef6lnAEA88VM90cdi5qa
/Ia7LkDYM2dUVq5+okzLrEoJCOtAHQs=
=WU4C
-----END PGP SIGNATURE-----

--qr7aKkWVgBLL5FHz--
