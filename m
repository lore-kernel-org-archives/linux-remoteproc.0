Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD46145B16;
	Tue, 30 Sep 2025 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759260847; cv=none; b=BePM7KwS+wY5p7wmzTi6+uBSuYPmsT50Rwpb6cWEmfHQXL7g94EO4PVWA/NVk9Mn6Av5Udd39orGcdakbMSwfsGHURZ6Kw6vq3FqnNaP32mv7vrTLbjmJSgWiQaJdQNJQBcocI/O9ke2whJvzhnhdJB5aIaM0FQMt82aGfbvPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759260847; c=relaxed/simple;
	bh=AB3Cn/2WSkWkpQ+CwSIc9teOxb7tKtOz/f1rUMk3pcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOGNObI0OzCtiyraGTRydH63sNEgCehdO2tBx+5jzfXqW1t56zHHAacIO13jec3xL3T4nl4j6QSjNysYn7rgsJoD9gi8jcKCPUlzIcePNX59NTTIvWFAD9ZeROZDLDzlRGvqOByC/DheY8FlCvv2/xEzUTCUolVKIrkdefjYqq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8lFubbW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8lFubbW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863E4C4CEF0;
	Tue, 30 Sep 2025 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759260846;
	bh=AB3Cn/2WSkWkpQ+CwSIc9teOxb7tKtOz/f1rUMk3pcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8lFubbW2uWOomJHlf3qiQFsUVib7KkwN466zwBY7I2J9LcBqzR+AE3IoTrKJf3Ou
	 uoV4XEOsb97uHTWW/ujSLXmsci/NoRXc8qBgFUcoX8crQkgApt10Avc9ukN6uWNtlw
	 wVwhINIvmsclBbo+9B2IOqoAPmqjgTf9htMz7pC0jdeN4V7+XSPcDLFKfbDXF7IXr/
	 zuVBpm4odxIFIN6miWczAcm8m9bQ96WOY0uyqSQSWTDajwVLpr5Wv77iQ5aVCT5xyy
	 cGTbaqzx10IvI3de5J3BLl+UK1tpK9GqKWmhLjVZm6aAMib5vH0dxuQpxm149QDHOK
	 VPAnDVGK63ITg==
Date: Tue, 30 Sep 2025 20:34:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Message-ID: <20250930-manhole-buccaneer-c22c71586e01@spud>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
 <20250930-slapstick-volatile-60ad540f4b66@spud>
 <1bb0f2f9-d3fa-42af-aa55-e9f0771ed5be@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ONkA3jF2McKxioA"
Content-Disposition: inline
In-Reply-To: <1bb0f2f9-d3fa-42af-aa55-e9f0771ed5be@broadcom.com>


--7ONkA3jF2McKxioA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 12:09:01PM -0700, Florian Fainelli wrote:
> On 9/30/25 12:03, Conor Dooley wrote:
> > On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
> > > Adding brcmstb-hwspinlock bindings.
> > >=20
> > > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > > ---
> > >   .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 ++++++++++++++++=
+++
> > >   1 file changed, 36 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,br=
cmstb-hwspinlock.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hw=
spinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspi=
nlock.yaml
> > > new file mode 100644
> > > index 000000000000..f45399b4fe0b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinloc=
k.yaml
> > > @@ -0,0 +1,36 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.ya=
ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Broadcom settop Hardware Spinlock
> > > +
> > > +maintainers:
> > > +  - Kamal Dasu <kamal.dasu@broadcom.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: brcm,brcmstb-hwspinlock
> >=20
> > Is "brcmstb" actually the name of a single platform?
> > Looking at the "brcmstb" pci binding, it looks like there's a whole load
> > of different devices there and none use "brcmstb":
> >            - brcm,bcm2711-pcie # The Raspberry Pi 4
> >            - brcm,bcm2712-pcie # Raspberry Pi 5
> >            - brcm,bcm4908-pcie
> >            - brcm,bcm7211-pcie # Broadcom STB version of RPi4
> >            - brcm,bcm7216-pcie # Broadcom 7216 Arm
> >            - brcm,bcm7278-pcie # Broadcom 7278 Arm
> >            - brcm,bcm7425-pcie # Broadcom 7425 MIPs
> >            - brcm,bcm7435-pcie # Broadcom 7435 MIPs
> >            - brcm,bcm7445-pcie # Broadcom 7445 Arm
> >            - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5
> >=20
> > If "stb" means "set top box", it sounds like a catchall for disparate
> > devices, which isn't permitted.
>=20
> Unlike PCIe, the HW spinlock hardware has been stable across all Set-top =
box
> chips ever since it was added, which is why the catch all is IMHO adequate
> here.

I see. Now that I look more, there are other places where "stb" is used.
Sounds like "brcmstb" as generic fallback would probably be okay then.
Either way, the duplicate 1/3 patch needs to be sorted out.

--7ONkA3jF2McKxioA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwwqgAKCRB4tDGHoIJi
0uE8AP4mcav5juIgZKkbUSFyxSFX4BuQoKb9S9jqDChoCJwf+AEAkId6yQePlp+T
Q0DQHR+eHcnvaWXrdZvIeGiVlUXNRAY=
=ozXO
-----END PGP SIGNATURE-----

--7ONkA3jF2McKxioA--
