Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4F933A039;
	Sun, 15 Mar 2026 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773576004; cv=none; b=QNDs9blpOtluF1fuQc7W6TAhokLTwBAxRCfw0eQa4QRkvWoyJ4gWrArH7KKkGRGPm04DA//oCJOJb81hzOWXPdUDZlEAoXnxkQi+G86U6TnQS3ifhuDRNl7oXRSGVyO+kvM4ToR6Hq81LRckequRrI3vSS6NoJWSGdN4Al0oz9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773576004; c=relaxed/simple;
	bh=lxBUJrkmPutJFyxxYY70RzA9EEjz2HZtBHDF1SXNhSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvTROo7Q+7iVWbVnQmgFPMs7aNfcxH3LhNvIqEol1vtu5ikqzrwSyu6Efpq3Vp/qmVmO1C6arJSQeWHzIwqSEL3Fuu6dMXhGmRnOAw7SVRWjAa3ptdsLFL/IWPDz3B02+ZNdz0d3j4RlgsFfI21EHfYYJt95iPDAunSRcT+azJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKR+ab0T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKR+ab0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A802C4CEF7;
	Sun, 15 Mar 2026 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773576003;
	bh=lxBUJrkmPutJFyxxYY70RzA9EEjz2HZtBHDF1SXNhSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKR+ab0ToiqNTWHpKevrNoHmxXta5IWsylx4pb44fX5XqPvMbmQdoSi45r/SNZQHO
	 FiHWz1aW6F1/GRsXBMo5cQ+vVfHY31Cz9vhCcZOTHkM/2u03BGcEfZOQ4yolbi25hQ
	 C/8jisi6ZNiGM4sYsM2F9526x2p57/Bc/grnhD7or8acqDw04GHj60CD99qpf9eID2
	 t8bZAcPn/NIkG4RNO0y9dAxN9JVSVX51LFnAS2Zmvll6IAOjYN5mFVjcVRjadgUOTR
	 H4Z7aJuO1Wb8RYawDlPSgKkqdnZfpuv3ZNNJqGyss7IDeGNn4z/8zsWdOW5IEUJ3A0
	 bpn2/qreyo1Jw==
Date: Sun, 15 Mar 2026 11:59:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <20260315-rebel-catapult-fab5d4e77349@spud>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
 <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
 <20260313-quantum-modest-prawn-896bde@quoll>
 <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com>
 <849c07bd-2f8d-4982-b5cf-c336807ab8ed@kernel.org>
 <20260313-kettle-craftily-aa087e6b74db@spud>
 <DH2KR1W7CWZW.35FWVV4MNS0NE@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5s+wKzVm3gU0jb2w"
Content-Disposition: inline
In-Reply-To: <DH2KR1W7CWZW.35FWVV4MNS0NE@baylibre.com>


--5s+wKzVm3gU0jb2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 03:28:25PM +0100, Markus Schneider-Pargmann wrote:
> Hi,
>=20
> On Fri Mar 13, 2026 at 5:18 PM CET, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 04:49:14PM +0100, Krzysztof Kozlowski wrote:
> >> On 13/03/2026 14:38, Markus Schneider-Pargmann wrote:
> >> > Hi Krzysztof,
> >> >=20
> >> > On Fri Mar 13, 2026 at 2:13 PM CET, Krzysztof Kozlowski wrote:
> >> >> On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann=
 (TI) wrote:
> >> >>> If memory-region is used, require memory-region-names.
> >> >>
> >> >> Why?
> >> >=20
> >> > This was a suggestion/comment from Conor in the last version:
> >> >=20
> >> >     Is this really optional? Shouldn't it be made mandatory so that =
it is
> >> >     easy to tell the difference between the two configurations?
> >>=20
> >> Then write it in commit msg. You have entire commit msg to explain why
> >> you are doing things, instead of obvious what. We can read the diff.
> >>=20
> >> >=20
> >> > https://lore.kernel.org/all/20260303-hesitate-preoccupy-5e311cbd3e58=
@spud/
> >> >=20
> >> >>
> >> >> I don't understand also why this is a separate change, but maybe an=
swer
> >> >> to "Why are you doing it" would cover it as well.
> >> >=20
> >> > I made this a separate patch so the git tree never has any
> >> > binding/devicectree warnings for memory-region-names even in-between
> >> > patches. That's why I created these patches in this order:
> >> >=20
> >> > 1. Add the memory-region-names as an optional property.
> >> > 2. Add memory-region-names to all users of memory-region.
> >>=20
> >> So what is the point of this if it is optional? IOW, what does this
> >> commit achieve? Almost nothing.
> >>=20
> >> > 3. Make the property required if memory-region exists.
> >>=20
> >> but only required here? You need to organize your work in logical hunk=
s.
> >
> > My rationale for my original request was that the meaning of the second
> > memory region is modified by this series. Previously it was always
> > "firmware image sections", but now it can also be "IPC resources".
> > Nothing changed in terms of the number of memory regions (it was 2-8
> > before and 2-8 after), so without making memory-region-names mandatory,
> > there'd be no way to tell which of the two configurations are being
> > used.
> >
> > This patch should likely be squashed with the patch adding
> > memory-region-names, so that it is easily to provide an explanation for
> > what's going on.
>=20
> My goal was to not introduce any warnings in any of the patches.
>=20
> That is the reason why I only added the requirement for
> memory-region-names at the end, after adding memory-region-names to all
> users.
>=20
> The alternative patch order as you suggest is:
> 1. Introduce required memory-region-names
> 2. Add memory-region-names to all users
>=20
> After patch 1 there will be new warnings about memory-region-names
> missing for every user of r5f memory-region until patch 2 is applied. I
> can happily squash this patch into the patch introducing
> memory-region-names. I can also update the commit message to describe
> why I split the patches this way.
>=20
> Let me know what you prefer.

Personally, I don't think that transient warnings that won't appear in
linux-next (just in the individual trees) are worth splitting for, when
the split is artificial and goes counter to explaining the motivation.

--5s+wKzVm3gU0jb2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabafOQAKCRB4tDGHoIJi
0vmlAQDXTszQ/SaIi996hoyGcUzmvmQKd9smF0NlFNXUhneLxgD8D/pzwTGw2Npz
4bEHbuKvDetJcOngtdSmF0DE0DVTsg8=
=rQWI
-----END PGP SIGNATURE-----

--5s+wKzVm3gU0jb2w--
