Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4844308F1D;
	Fri,  1 May 2026 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650555; cv=none; b=m0KiUl129g3J6cm2V0Ex4SV/OWNii32RxfXuJgeKBYXxinbm1SMohNbGhrp+27d7scPjXG9cqiIvqAW+hT2d5i330crdIPEpVkqStfPc2dU8rkmQa8BiMhZ0bHPPWtCaWE/E9cuK57i4qzvxrEOl2DJMfM5y2JXzVpfTWaHpQXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650555; c=relaxed/simple;
	bh=kEBptyWNUcQXhlahaz6HoRE5/fku/pmWiKKe01rKllU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdgCPtkazjOgpbFTLmdbe5YdUrbXJu66/euJG3GntY76FNed5s8hDjvjN8ZWOFUFFvLD1B5DROqYhRpKgQ/WthsXlr0Ly3MB4hCjzHB6xUdQsSfSJPDwB/CbinnV8G/viRfxSYq+2VTNLzLtEGD6UP4RuKY+RmcPXeifSn4hK8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tel3gBT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tel3gBT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B8AC2BCB4;
	Fri,  1 May 2026 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777650554;
	bh=kEBptyWNUcQXhlahaz6HoRE5/fku/pmWiKKe01rKllU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tel3gBT4JSk0jv3KMGWE7mVrkHtzK2MKnzUrBGYWelV/7gOOjIDUF+BEESuuGQymP
	 tL88eDhiFN3uLgtvxxg/sVOMP7if3SLODr36cwQzC6bYutQ9U6BPcLD+MLPBrukVrv
	 zvw1O/MSHZuB1qVRlHOAUwJTRVreiDJ7To8TVtrKcAP42LrUxu3w7wyfMJFVFW3Q7d
	 HFvERFzvdMuyblmh5NuMIxAdxi1FpYxfaTKeWqksHpXUlqQAcIaL2v3DgEzk/JtPa5
	 1Xn1W6/duJDZnHnUAygtsLK4wEK/m3fdKDpbZ9fEIfXCiqfiYxDEC3A/kjKZM4OIzh
	 YxJM9aZYZnsvw==
Date: Fri, 1 May 2026 16:49:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	ben.levinsky@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: xlnx: add firmware-name
 property
Message-ID: <20260501-strudel-sample-ded4d3ebf58b@spud>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iQ7bHvBbkiCwQUvk"
Content-Disposition: inline
In-Reply-To: <20260501143707.1591110-2-tanmay.shah@amd.com>


--iQ7bHvBbkiCwQUvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 07:37:06AM -0700, Tanmay Shah wrote:
> The firmware-name property indicates which firmware to load on RPU
> during the Linux boot time. It is possible to stop the RPU after boot
> and load different firmware and start RPU.

The file supports 3 devices, do they all support loading firmware like
this?

>=20
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5f=
ss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.ya=
ml
> index ee63c03949c9..ae63c3e39ced 100644
> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> @@ -135,6 +135,10 @@ patternProperties:
>            - description: vring1
>          additionalItems: true
> =20
> +      firmware-name:
> +        maxItems: 1
> +        description: default firmware to load
> +
>      required:
>        - compatible
>        - reg
> --=20
> 2.34.1
>=20

--iQ7bHvBbkiCwQUvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafTLcgAKCRB4tDGHoIJi
0mgxAQCSN4vfXjReAU+odS32cFAbDxJepqbnJA6xsu0KLX7ffQD/RYD82fvE6AdC
JHdDzDSRHvKGzsddkWaMtCbu/yMIQwQ=
=536k
-----END PGP SIGNATURE-----

--iQ7bHvBbkiCwQUvk--
