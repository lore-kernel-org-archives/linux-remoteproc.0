Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653DE168BD;
	Tue, 30 Sep 2025 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259073; cv=none; b=r1Q2bFXd12mi2vrJNS8QrgAcQ1LZIKmk9dJ2XwkG8rU6hTaRktfpuVs3EZg0uh2jHPNxgWPOBLx6GqJw5bBcktrriSdeEgYZHRn+ad1AdJe80nyzCpKffQSmbJ0iqMY+Tp78nhzVb/Itc1nkKSCgCRKmg94YaTIkunRpYo0Ezo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259073; c=relaxed/simple;
	bh=9bVp8kxtQwfBvNc0TU8eygqR9vHMmccEBPnRirmKR+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS5sovaZ5v14BsmqT+JxFDGTJCIz7+HXFRC6OKGePtEsCRIR2xhKdJwKL7D8dVQ8cqaCp2ph+UDk/TFF5RhPeEFZYr/9gAcZvD0tycMM4zDvfoXU8mHaKfIXooErl8yZ01kgZzkNRv6k7QMcYvd6J8i4zP3xEVkN14BPXDJ6rrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOA/xK7K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOA/xK7K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E5AC4CEF0;
	Tue, 30 Sep 2025 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759259073;
	bh=9bVp8kxtQwfBvNc0TU8eygqR9vHMmccEBPnRirmKR+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOA/xK7KBZ8v0V75Mej57U1x5cZ+4B9AteiPhmHWpO7gYz7EnKlNfIaU9IcrkF2u0
	 CFEP7naKm95hEkaa/Od6FwwCG29VBDiNbfJHdlcI1OHvU29Xn0hWIpUzR4zCHhT4sU
	 hDQG+chlxSeRhtmmhvnqxKpd9UO+pGUf0s02tMZ1yhtHYE9aaTe9j86d4m9qg7Zwqa
	 wcTsOIwBjPVD1W0HuUz09IkMjpSU3ROmGF9pHX7ztIirNEWS9Lmvld1bMqU67wTLEO
	 DZexBdTHmDj8VG0GaRwAmT8WwWqRkAhSKuLR86KRS2DuiK5oV1rK6gZCPZirliK18p
	 vopT1Ew3c7+EQ==
Date: Tue, 30 Sep 2025 20:04:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: support for brcmstb-hwspinlock
Message-ID: <20250930-showoff-herring-4b2a04611e9d@spud>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-3-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="82j1rXkJuErFh8c/"
Content-Disposition: inline
In-Reply-To: <20250929200628.3699525-3-kamal.dasu@broadcom.com>


--82j1rXkJuErFh8c/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 04:06:25PM -0400, Kamal Dasu wrote:
> Adding brcmstb-hwspinlock bindings.
>=20
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

You have two 1/3 patches in this series.

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

--82j1rXkJuErFh8c/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwpvAAKCRB4tDGHoIJi
0nvbAQDNsPnAKiThkxtWiJAtsGypV9tPJibzu9eiHKqUnBJXzAD/YBVHVcuOZX3E
1xUGN7jzCNFqkG5lwlNdSD7Ut3juLAc=
=hEEo
-----END PGP SIGNATURE-----

--82j1rXkJuErFh8c/--
