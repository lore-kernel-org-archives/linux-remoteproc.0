Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1D4189C2;
	Fri,  2 Oct 2026 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926457; cv=none; b=f0hmPwMOqyP9Q4NAduSH7fxdjtp4red0Fin4vTmtKYqsD0GKDaCVh7/lzhzWzteuonR59Qk7Uim2UOmQsC9+avWu1PuufeCCrpWRP8r7FFVHMbZaaGxQayagrfgstt8aWOBlsBNORHFZtDXkephiW+QCyzvdollOqChf4JIVx1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926457; c=relaxed/simple;
	bh=wHPJMvxCXUL7kh2YiGSSJKGGA4Kla42O4+XtKi3QZRQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7WWOZ5wJCTlDECP4FvSP9mp7N9N5FgvTigAq/BTz9MIMjmphe6IhNjQ2r6jveJHcr+nn2tIrdEVBA427TcPD17pL4E2w3BGGUM0MDHOJjuLrwBAOsiCQqwUk+4lNJRwkiaxcY+PPtjp8o20Opd6HIHDIDJ2X4Ip4/Gu/SuWIn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pizWrtD+; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pizWrtD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790926462; x=1822462462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wHPJMvxCXUL7kh2YiGSSJKGGA4Kla42O4+XtKi3QZRQ=;
  b=pizWrtD+G1lt2+gV2FSlSeZ4jKWrmxaW8l6I+BXP93kvqPOkxfwxTgO2
   FSb67D0aoM5Gp2GjP3Oj8l+FWaL/6e9r+N+3xKMFxu3RfepGIT1MtSnYQ
   SJwArs+aqxwz5pPrKQ0HCGK70gks78opAH1EKYnX0rxUdYRCsEwl4kN2S
   qe+FOFx/CVCVpGnw42dhuwVTz6Jq5VjsFru5hDFUC1lW1cU1w4v9HlaY1
   xVikA/mrIGHQ3HqeslYB1L38RLvpOKwNmyt/nwN24GXQoo2GAd0N7I+7q
   w9IIJitMohUs6VjdxyTIxaRmrL31Ao7iOzJm+qnI4puaQ4OOtiuBkyO7E
   A==;
X-CSE-ConnectionGUID: r7j903UGQAm9ZyzcfxLZYA==
X-CSE-MsgGUID: Ghtw/+SVRXmIT6lYQ9URDg==
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="asc'?scan'208";a="64483102"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:34:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 2 Oct 2026 00:34:14 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Oct 2026 00:34:11 -0700
Date: Fri, 2 Oct 2026 08:32:51 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
CC: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Bjorn Andersson
	<andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Andre Przywara <andre.przywara@arm.com>, Bastian
 Germann <bage@debian.org>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware
 spinlock
Message-ID: <20261002-matted-tux-5b4059bc305a@wendy>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
 <20260927132707.5f484946@posteo.net>
 <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930160541.040ccc0e@posteo.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sdponSZJtp17DGxT"
Content-Disposition: inline
In-Reply-To: <20260930160541.040ccc0e@posteo.net>

--sdponSZJtp17DGxT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 02:05:47PM +0000, Wilken Gottwalt wrote:
> On Wed, 30 Sep 2026 20:02:21 +0700
> Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:
>=20
> > Hi Wilken,
> >=20
> > > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinloc=
k" line to
> > > the driver in the sun6i_hwspinlock_ids struct, drop
> > > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and updat=
e the yaml
> > > file accordingly?
> >=20
> > Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
> > more at the naming. I'd like to keep the A31 fallback: it's the usual
> > pattern, other blocks in this dtsi do the same (timer, I2S, LED
> > controller), and Conor already acked the binding in 2/3. If Bjorn
> > prefers a driver entry instead, I'm fine to change it.
>=20
> Yeah, Conor was a bit quick to act here, such things happen often with pa=
tchsets
> made out of documentation/devicetrees and code. Though, the get clock and=
 resets
> patch is fine. The driver could use some modernization.

I dunno, was I too quick to act? The patched looked correct to me, since
it was using a fallback to a device that it appears to be compatible
with. Had the series done what you're suggesting, my review feedback
would have been to tell the Tien to add a fallback.

> > Bjorn, what do you think? Just stay with the "allwinner,sun6i-a31-hwspi=
nlock"
> > string or add all the possible combinations like
> > "allwinner,sun8i-h2-plus-hwspinlock" or "allwinner,sun8i-a83t-hwspinloc=
k".
> > I mean, it is just a naming game and there are 10+ SoCs supporting this
> > spinlock register file

All devices compatible with the a31 should use the a31 as a fallback.

>=20
> > > Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.
> >=20
> > That would be great. You don't need FreeRTOS for it: I tested with a
> > small Linux module that takes each lock and checks the status
> > register. I can clean it up for the single-core D1 and send it.
>=20
> Uhm, the Linux-only test doesn't work as a hwspinlock test, it misses the=
 entire
> point of the primitive. A hwspinlock arbitrates between two independent a=
gents,
> in this case, Linux running on the C906 core and FreeRTOS running on the =
HiFi
> DSP, both sharing the same memory bus and other hardware. If Linux is the=
 only
> one who ever takes the locks, it is simultaneously writer and reader of t=
he status
> register, so the test cannot fail even for a broken (or fake) implementat=
ion. That
> would basically test nothing at all, well, maybe it would be some kind of=
 bring-up
> test, but overall quite useless.
>=20
> greetings,
> Wilken

--sdponSZJtp17DGxT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar9eIwAKCRB4tDGHoIJi
0p10AP9/ioX41wO3u+Ep+AHx1ux3KGM/2eXkT+zQtRgHe+Ll6AEAqpqAiNT7fmis
SGhitgPYrUVaxNjBfdVhopPHpmJeHQs=
=nN6V
-----END PGP SIGNATURE-----

--sdponSZJtp17DGxT--
