Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319883090F5;
	Fri, 13 Mar 2026 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418695; cv=none; b=TpY1nVZaJ9H0A1joWI3YQCAasut+wtqD9SU4n/pDrW8Ql55pmZw8RsHX8z+P16Ro2QW+S8rf4ql0LW4LFO+y1VPcit6UTIQNxqVA6nTsrPn1sPfm+pY2GLW7Chm3O4qFrCavbOehc+YX18hgA+q+Q0xWZEcD6EABMWUZuuZBELk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418695; c=relaxed/simple;
	bh=DC+UEd/KI0YueqES/DOoc2TWM1McbdHSNf/ARGnWnP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRRll8g4d7b4ooocWak0dvNHvIrPveG1quwjg/+Gnm8v4pvJ3cyJoX3uIKHKxVkZ19Zw2WGpb4rGEza0wvYP9AALBHJmaN2jytemGlBmxw2kgVVThiZ9spH4hivb6ChY2vBCLfRklLp1cB/1fGdg8Mm0YNgJmR73nuAfsaKiFB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esXLqrPZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esXLqrPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5F0C19421;
	Fri, 13 Mar 2026 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773418694;
	bh=DC+UEd/KI0YueqES/DOoc2TWM1McbdHSNf/ARGnWnP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esXLqrPZEgnaeJFTNY9Jw1IN9FtaoM11rf9C6TazhCA1o2M6dSiJxJnu+3/AoJchh
	 dcPcCG/esTVwNSu+CpeJucD5r7ffatVtfO+/B0A38K9fm9ERTsoOxelYFCUeceUmn/
	 3JAJKb3d+BaFxOm3mTgZy/BRJdB2JZnff7/vQzfLteJrQIlCscPe3FhhVu66bJF2wA
	 B14rcgeXVgu4OlletHHhBvM7A/oKikZFVy5Yi8SpBkv99obGrBINP5IclYPNjhp8IC
	 7fT/l8qzhCTo0erndc9x4C01mgFe3utVmf8u0+No1BujsPuko6xuE0IgwPwYLAdPUX
	 CSWWoIFMwoq6w==
Date: Fri, 13 Mar 2026 16:18:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
Message-ID: <20260313-kettle-craftily-aa087e6b74db@spud>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
 <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
 <20260313-quantum-modest-prawn-896bde@quoll>
 <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com>
 <849c07bd-2f8d-4982-b5cf-c336807ab8ed@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QKsxWvC+3M79r6rP"
Content-Disposition: inline
In-Reply-To: <849c07bd-2f8d-4982-b5cf-c336807ab8ed@kernel.org>


--QKsxWvC+3M79r6rP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:49:14PM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2026 14:38, Markus Schneider-Pargmann wrote:
> > Hi Krzysztof,
> >=20
> > On Fri Mar 13, 2026 at 2:13 PM CET, Krzysztof Kozlowski wrote:
> >> On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann (T=
I) wrote:
> >>> If memory-region is used, require memory-region-names.
> >>
> >> Why?
> >=20
> > This was a suggestion/comment from Conor in the last version:
> >=20
> >     Is this really optional? Shouldn't it be made mandatory so that it =
is
> >     easy to tell the difference between the two configurations?
>=20
> Then write it in commit msg. You have entire commit msg to explain why
> you are doing things, instead of obvious what. We can read the diff.
>=20
> >=20
> > https://lore.kernel.org/all/20260303-hesitate-preoccupy-5e311cbd3e58@sp=
ud/
> >=20
> >>
> >> I don't understand also why this is a separate change, but maybe answer
> >> to "Why are you doing it" would cover it as well.
> >=20
> > I made this a separate patch so the git tree never has any
> > binding/devicectree warnings for memory-region-names even in-between
> > patches. That's why I created these patches in this order:
> >=20
> > 1. Add the memory-region-names as an optional property.
> > 2. Add memory-region-names to all users of memory-region.
>=20
> So what is the point of this if it is optional? IOW, what does this
> commit achieve? Almost nothing.
>=20
> > 3. Make the property required if memory-region exists.
>=20
> but only required here? You need to organize your work in logical hunks.

My rationale for my original request was that the meaning of the second
memory region is modified by this series. Previously it was always
"firmware image sections", but now it can also be "IPC resources".
Nothing changed in terms of the number of memory regions (it was 2-8
before and 2-8 after), so without making memory-region-names mandatory,
there'd be no way to tell which of the two configurations are being
used.

This patch should likely be squashed with the patch adding
memory-region-names, so that it is easily to provide an explanation for
what's going on.

--QKsxWvC+3M79r6rP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabQ4vQAKCRB4tDGHoIJi
0igaAP0UYLmk5KqJjFuU9cgYHnh5gnSjSdw9RHHs+PKivKTAIAD+KgB8taDRXwSw
6jx+etbSB1NieXYbkeCwEgKVHr7J6AE=
=mzlP
-----END PGP SIGNATURE-----

--QKsxWvC+3M79r6rP--
