Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05115A85B;
	Mon, 16 Sep 2024 16:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726504302; cv=none; b=TjG8mIWOBVl4Rmcy+AYVbuK84iJU/N0OQr/EVycNLgfeNLHiy+zlC2bm0hwPp3UbVyVZSRkRo1K6LzWTh3NH1OZ75/OMuf1Idue0IWdoNobFj1K2J3pLQtU5/Hgr8nv+ZWZ+4PmAD++0QxD6cP09kyUVQ9E6DCIuqh+SmFHqa+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726504302; c=relaxed/simple;
	bh=X5QfU2rzHg9l/1rfQLNcB2Asfzdw0epoJK8jDZNDbLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lal15kY62QRQEUj2q6kr4n2AUHhQAg2CbA1Kz6DdkplYo1t0IO9DKtTTeT4t+GwpHirTLN7xyCHJ4rLr9wKlaHdXvRGdOZGlL6DUs9rF/vByogl2OT3aiCwKVnIB0FsquKj81QLMhJz1QztHcEmZ26xGoIV4df+UEVN/iS+50RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1huLqFO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1huLqFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9F2C4CECD;
	Mon, 16 Sep 2024 16:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726504302;
	bh=X5QfU2rzHg9l/1rfQLNcB2Asfzdw0epoJK8jDZNDbLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1huLqFO0+uNB1sPNuRAxDeJH/X/qeVFqVeZ922/iETFxUZCnXrPVSy2QMKI1kaPt
	 2s4ErwNi64IOQHVX5rl4UNXR1VGGGyrT1FlFI4nhO2VSSeS6/dN0pBLo5SGWpunWBW
	 DVVS3H9QxjPEgcuF1RgJFWhgTD50VofJ1SJ6K4XNU5wsqQcRwih9+vDcjk/wA7mjFI
	 ONeC1TZ+syYN/YtyLAGpJZ5pquUJwlu7PKq+P+JDh6kXF3cmc3ulL1s9/OW5dIlzw/
	 yHVaHbfwmVhbBIq+QOxWW0570DSQY/pjEv9AAsLNfnS+Ioh9tLHiETGGjG9aN17EsM
	 d1YzDSodYGvBw==
Date: Mon, 16 Sep 2024 17:31:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	peterlin@andestech.com, dminus@andestech.com, ycliang@andestech.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	andersson@kernel.org, mathieu.poirier@linaro.org,
	conor+dt@kernel.org, conor.dooley@microchip.com
Subject: Re: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox driver
Message-ID: <20240916-palpable-flock-7217424ed8db@spud>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
 <b4acc0a7-b7da-4947-904d-8406aa5ba95b@sifive.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aaSee8dqcxsNdd7N"
Content-Disposition: inline
In-Reply-To: <b4acc0a7-b7da-4947-904d-8406aa5ba95b@sifive.com>


--aaSee8dqcxsNdd7N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 04:23:44PM -0500, Samuel Holland wrote:
> Hi Valentina,
>=20
> On 2024-09-12 12:00 PM, Valentina Fernandez wrote:
> > Add a dt-binding for the Microchip Inter-Processor Communication (IPC)
> > mailbox controller.
> >=20
> > Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip=
=2Ecom>
> > ---
> >  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++++++++++++++++
> >  1 file changed, 115 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip=
,sbi-ipc.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/mailbox/microchip,sbi-ip=
c.yaml b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> > new file mode 100644
> > index 000000000000..dc2cbd5eb28f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mailbox/microchip,sbi-ipc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip Inter-processor communication (IPC) mailbox controller
> > +
> > +maintainers:
> > +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> > +
> > +description:
> > +  The Microchip Inter-processor Communication (IPC) facilitates
> > +  message passing between processors using an interrupt signaling
> > +  mechanism.
> > +  This SBI interface is compatible with the Mi-V Inter-hart
> > +  Communication (IHC) IP.
> > +  The microchip,sbi-ipc compatible string is inteded for use by softwa=
re
> > +  running in supervisor privileged mode (s-mode). The SoC-specific
> > +  compatibles are inteded for use by the SBI implementation in machine
> > +  mode (m-mode).
>=20
> There is a lot of conditional logic in this binding for how small it is. =
Would
> it make sense to split this into two separate bindings? For example, with=
 the
> current binding microchip,ihc-chan-disabled-mask is allowed for the SBI
> interface, but doesn't look like it belongs there.

I dunno. Part of me says that because this is two compatibles for the
same piece of hardware (the choice depending on which programming model
you use) they should be documented together. The other part of me is of
the opinion that they effectively describe different things, given one
describes the hardware and the other describes a firmware interface that
may have any sort of hardware backing it.

I suppose it's more of a problem for "us" (that being me/Rob/Krzysztof)
than for Valentina, and how to handle firmware interfaces to hardware
like this is one of the topics that's planned for Krzysztof's devicetree
BoF session at LPC.

Cheers,
Conor.

--aaSee8dqcxsNdd7N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuhdaAAKCRB4tDGHoIJi
0nRJAP91xLSt5kah9UNw5BnKnaUkZ3+3+J6Hr8pnxUC12htrSgD/cf+syLKzOuLp
9r72vLZW17OTlRN+qE+FOPIrAyTZCwk=
=s7P9
-----END PGP SIGNATURE-----

--aaSee8dqcxsNdd7N--
