Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D32C166F31;
	Thu, 19 Sep 2024 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726731607; cv=none; b=hSf3gwGA3/UyWkrOZIkm42JPwHA1l+y+GVfJ+po0CEUSltTTHehGxndbk1qKcHRmJ1PTVVpWTy24C8z2rnfQCZM16A7YsUMLqHIkhLEIdZiLltOH+n+Ab6EIBWpf52Te9QErEDuD0+jAzlfnVXGm5EGGcEEp9xLNDevhB8K6teo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726731607; c=relaxed/simple;
	bh=SKHiWuT9os4iwt/8Rac5rB767h2DJnB/vbFf5fmwPGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXelOo03sr6NacBhaF0v80KVRr5cskiSU5PgnkXt1xxr1VjIQFOgXko5PkyLXmWyDR9ArmtrwFH6bcTGSu1Sl7jVrEo4UB9l63htpH49H8EYsSexXXu/t4H6VR3c7D1GnTl853EOwBzDi+pvTkr5oogluy0lAQjEHQqzwV/C94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8fKW7ZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8fKW7ZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3113DC4CEC4;
	Thu, 19 Sep 2024 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726731607;
	bh=SKHiWuT9os4iwt/8Rac5rB767h2DJnB/vbFf5fmwPGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8fKW7ZTcay47pT/vW9S0y+4lE0fuNphqZeE6IY6af3wozhlOnLetyr4/nf7jP7Zy
	 TETUSuGjCDJI9V2aSBGrSLKgUtEdgTmovhu6BQGjhkIZSBOe7PubY2Pt+4my0tnPz3
	 n6G1KDycUbajtzn0Nk9jzpB/JN42orDcCQqv5ZLw2axJjYpaL2s1TURRZvP7WAWPjW
	 t7XS/y5z2RljkHluIhYezKh/Ns5ZMNXJHWDYWJatsGATCdcdLUUwDuCp4iTrPMJFEe
	 SL+Hqb6B9fwmgw/fgMyRq8sw36XZz4WHHZzTUUGCAeYqZXOTglrKA3/s+hvhKcTdWO
	 EkJDusAOtJy7A==
Date: Thu, 19 Sep 2024 08:40:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	peterlin@andestech.com, dminus@andestech.com, ycliang@andestech.com,
	jassisinghbrar@gmail.com, krzk+dt@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, conor+dt@kernel.org,
	conor.dooley@microchip.com
Subject: Re: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox driver
Message-ID: <20240919-useable-margarine-d6eefae9485c@squawk>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
 <b4acc0a7-b7da-4947-904d-8406aa5ba95b@sifive.com>
 <20240916-palpable-flock-7217424ed8db@spud>
 <20240918153558.GA1567736-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XW5QfXNOZ95nX152"
Content-Disposition: inline
In-Reply-To: <20240918153558.GA1567736-robh@kernel.org>


--XW5QfXNOZ95nX152
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 10:35:58AM -0500, Rob Herring wrote:
> On Mon, Sep 16, 2024 at 05:31:36PM +0100, Conor Dooley wrote:
> > On Thu, Sep 12, 2024 at 04:23:44PM -0500, Samuel Holland wrote:
> > > Hi Valentina,
> > >=20
> > > On 2024-09-12 12:00 PM, Valentina Fernandez wrote:
> > > > Add a dt-binding for the Microchip Inter-Processor Communication (I=
PC)
> > > > mailbox controller.
> > > >=20
> > > > Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@micro=
chip.com>
> > > > ---
> > > >  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++++++++++++=
++++
> > > >  1 file changed, 115 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mailbox/micro=
chip,sbi-ipc.yaml
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/mailbox/microchip,sb=
i-ipc.yaml b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.ya=
ml
> > > > new file mode 100644
> > > > index 000000000000..dc2cbd5eb28f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.y=
aml
> > > > @@ -0,0 +1,115 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mailbox/microchip,sbi-ipc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Microchip Inter-processor communication (IPC) mailbox contr=
oller
> > > > +
> > > > +maintainers:
> > > > +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> > > > +
> > > > +description:
> > > > +  The Microchip Inter-processor Communication (IPC) facilitates
> > > > +  message passing between processors using an interrupt signaling
> > > > +  mechanism.
> > > > +  This SBI interface is compatible with the Mi-V Inter-hart
> > > > +  Communication (IHC) IP.
> > > > +  The microchip,sbi-ipc compatible string is inteded for use by so=
ftware
> > > > +  running in supervisor privileged mode (s-mode). The SoC-specific
> > > > +  compatibles are inteded for use by the SBI implementation in mac=
hine
> > > > +  mode (m-mode).
> > >=20
> > > There is a lot of conditional logic in this binding for how small it =
is. Would
> > > it make sense to split this into two separate bindings? For example, =
with the
> > > current binding microchip,ihc-chan-disabled-mask is allowed for the S=
BI
> > > interface, but doesn't look like it belongs there.
> >=20
> > I dunno. Part of me says that because this is two compatibles for the
> > same piece of hardware (the choice depending on which programming model
> > you use) they should be documented together. The other part of me is of
> > the opinion that they effectively describe different things, given one
> > describes the hardware and the other describes a firmware interface that
> > may have any sort of hardware backing it.
> >=20
> > I suppose it's more of a problem for "us" (that being me/Rob/Krzysztof)
> > than for Valentina, and how to handle firmware interfaces to hardware
> > like this is one of the topics that's planned for Krzysztof's devicetree
> > BoF session at LPC.
>=20
> If how the client interacts with the device is fundamentally different,=
=20
> then I think different compatibles is fine.

It wasn't about different compatibles (which I think are non-debatable
here) it's whether or not the different compatibles should be in their
own binding files.

--XW5QfXNOZ95nX152
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuvVVgAKCRB4tDGHoIJi
0ogwAP9aQ00DhFSZtkfdD4M6IsRJi3SNUC6DmPJlEz0PltPCegD9FJcnmg8ZE6Dm
4HbBn/9l40PyHree8TdGYaQazOxWIwU=
=QgG+
-----END PGP SIGNATURE-----

--XW5QfXNOZ95nX152--
