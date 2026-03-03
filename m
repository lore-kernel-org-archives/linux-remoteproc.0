Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE2342F56E;
	Tue,  3 Mar 2026 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772562723; cv=none; b=fxa7bTP6Pu3fW3hyV1s34Xom0zNY851XNOaa/VRe6EBOUQ+WuAENSAUmuyDDNmQSmjDvDKIFpxOALgbspH+UWBT/42Fllw/HOThFgvoDb4ydJIOgQ37Tb3eHVz4PjA/sKH+mem2uIYd+XXuQKYL3wpfuV6kXWM/6ur7p0AU7WeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772562723; c=relaxed/simple;
	bh=ZmKyMq4ADrasqI2lkdiyTeu8Psuh11dcPps98qA+PnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4RB0lShxLe+umze0CZp5gdj5vRVp5YCjoL+rNSOQZhhqGT9HSJm1pDcPKhNy8dM9XwlZM6/7/YsJGGv2qlaH6CiQHV4MfYKaWlfc4ftUQwyYk3P1r3BdK9q/FdhD4xSwxQOh67pdVLR1TcQ7ZWqpEVoF5Ils7C4dnqG1jmqkWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZ0lxt0I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZ0lxt0I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2016EC116C6;
	Tue,  3 Mar 2026 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772562723;
	bh=ZmKyMq4ADrasqI2lkdiyTeu8Psuh11dcPps98qA+PnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZ0lxt0IdSLzMJeYGLMIB+LL1sGB1g/curyOSbGkTc0wqGWVLT9HnlkfVBet1fUe+
	 pH0ap0VnfOA31koxcOrdROMOO/xNQuDPz3Tm+X012HOteaMTx3TM37td3DUH6ma/sL
	 l7JogpGP97gJuYZauST3U7mUfqlCi6iFPqPfAK/XyIVciE8ec0PVgrVMt+c53uONA1
	 vecDR9H1Wild5mYXeWzxZ2ueSzSXoCtvLjsjiWD0/0cqNveIl4CpewehyRrsN+18A2
	 k5LCJcH4ThpXouhZGMyOB/Wy5oUOMZZ7KxBwSsmV62x2J6Exrt1/Y4ZNPR3qX+KBQb
	 JtlAfuW8Atong==
Date: Tue, 3 Mar 2026 18:31:56 +0000
From: Conor Dooley <conor@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
Message-ID: <20260303-hesitate-preoccupy-5e311cbd3e58@spud>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
 <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+OYMOED35FJFDZBl"
Content-Disposition: inline
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com>


--+OYMOED35FJFDZBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 04:13:00PM +0100, Markus Schneider-Pargmann (TI) wr=
ote:
> Add names to the memory-region-names for easier idenfitication of memory
> regions.
>=20
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc=
=2Eyaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> index 6aadc61e20f9f4c27f5b9c87ab2025a02776c5de..76ef23afe8c9f7f155dfec7fc=
abc7c60b8b286c6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> @@ -182,6 +182,25 @@ patternProperties:
>            - description: DM RM/PM trace and firmware code/data
>          additionalItems: true
> =20
> +      memory-region-names:
> +        description: |
> +          Optional names for the memory regions specified in the memory-=
region

Is this really optional? Shouldn't it be made mandatory so that it is
easy to tell the difference between the two configurations?

> +          property.
> +        oneOf:
> +          - description: Basic configuration with DMA and firmware regio=
ns
> +            items:
> +              - const: dma
> +              - const: firmware
> +
> +          - description: Extended LPM configuration with split memory re=
gions
> +            items:
> +              - const: dma
> +              - const: ipc
> +              - const: lpm-stub
> +              - const: lpm-metadata
> +              - const: lpm-context
> +              - const: dm-firmware
> +
>  # Optional properties:
>  # --------------------
>  # The following properties are optional properties for each of the R5F c=
ores:
>=20
> --=20
> 2.51.0
>=20

--+OYMOED35FJFDZBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaacpHAAKCRB4tDGHoIJi
0laKAP9oKTEoRXXenJkKNLBcMNLjx8QsUPsIZlj0xLTizBp/aAEAx9MnW55ZypwO
bQwbGKTP/kAouMyKyaoH3YXIeX1e8wQ=
=ZpAf
-----END PGP SIGNATURE-----

--+OYMOED35FJFDZBl--
