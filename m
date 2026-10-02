Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D34477F7;
	Fri,  2 Oct 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930319; cv=none; b=Y4LguGHDgxsFebU4zENHlDWvFbTL1F23r27yvJUk4ufSypX7FRxp+1UvELdlQjsesaiFb2ByuEH7wT3Kau2D+ie/sohJvSvY8HOKW+vxhqKffG6OBobyBgK86M129Dq2NpemrwRV/tmpHAi7GLX+P1l80HsYn2tRZvsnkQA3gyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930319; c=relaxed/simple;
	bh=m2cFnAtT5MsA9ZPOO80aU+rmS5QfQRGlkAlnRNZL7ec=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAkH31uUTJdePRpDyHoBX3+PHkcbJpaV2eoDQbPb9LEomRNVsL0nfHvWylLhGNNSS9NSFHO1mTXrQI+RpetPFNuP8KCOOKA33zQcZrSbjkQo782XQy4GG1jahJ2K4r8Sf8xDG7CYdOUV3sia03dkzkdrcIfyipdf2UlehN1nnm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=qP9zagmK; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="qP9zagmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790930323; x=1822466323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m2cFnAtT5MsA9ZPOO80aU+rmS5QfQRGlkAlnRNZL7ec=;
  b=qP9zagmKCSQ2QI4VBq2p3nVl0xC19hMxXxAOhrxHH9g4X7da8r9IC9wh
   i2oks5cWkJR7sks7dGpN9SAohyXQdkkdtEu4XrL+nd0tYwpKbMk1DrYy1
   NPyDW1/1y0AWMZry2s4RqaW7r1oA7sDzB9eU5VLiv38//dBZwOCdP3z2G
   DSeOVppiI1nX7Jf6fzSl5od0HiWxcUkDQfmnVThTmgV+vaka08SPpcAJM
   bt4xFwslQEEHbJfkNqaDU2UpHIp2xisbxp0COnygEwkoPd31anHEdQqy0
   r8hiEY1J94thCFFuah4V40oOstv+VpZCzrpvT+lTVUdE320TBiOvneaEl
   A==;
X-CSE-ConnectionGUID: IGBhx96nQiGuf1zNHIDITA==
X-CSE-MsgGUID: zO5TVFTHSu2pS70GJ2FXCw==
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="asc'?scan'208";a="64775344"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Oct 2026 01:38:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 2 Oct 2026 01:38:36 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Oct 2026 01:38:32 -0700
Date: Fri, 2 Oct 2026 09:37:12 +0100
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
Message-ID: <20261002-backroom-surcharge-ac224e920d44@wendy>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
 <20260927132707.5f484946@posteo.net>
 <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930160541.040ccc0e@posteo.net>
 <20261002-matted-tux-5b4059bc305a@wendy>
 <20261002094816.64349979@posteo.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DZ11gBOYyAJHJUPX"
Content-Disposition: inline
In-Reply-To: <20261002094816.64349979@posteo.net>

--DZ11gBOYyAJHJUPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 07:48:21AM +0000, Wilken Gottwalt wrote:
> On Fri, 2 Oct 2026 08:32:51 +0100
> Conor Dooley <conor.dooley@microchip.com> wrote:
>=20
> > On Wed, Sep 30, 2026 at 02:05:47PM +0000, Wilken Gottwalt wrote:
> > > On Wed, 30 Sep 2026 20:02:21 +0700
> > > Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:
> > >=20
> > > > Hi Wilken,
> > > >=20
> > > > > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspi=
nlock" line to
> > > > > the driver in the sun6i_hwspinlock_ids struct, drop
> > > > > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and u=
pdate the yaml
> > > > > file accordingly?
> > > >=20
> > > > Thanks for looking at it. Bjorn hasn't replied yet, so I looked a b=
it
> > > > more at the naming. I'd like to keep the A31 fallback: it's the usu=
al
> > > > pattern, other blocks in this dtsi do the same (timer, I2S, LED
> > > > controller), and Conor already acked the binding in 2/3. If Bjorn
> > > > prefers a driver entry instead, I'm fine to change it.
> > >=20
> > > Yeah, Conor was a bit quick to act here, such things happen often wit=
h patchsets
> > > made out of documentation/devicetrees and code. Though, the get clock=
 and resets
> > > patch is fine. The driver could use some modernization.
> >=20
> > I dunno, was I too quick to act? The patched looked correct to me, since
> > it was using a fallback to a device that it appears to be compatible
> > with. Had the series done what you're suggesting, my review feedback
> > would have been to tell the Tien to add a fallback.
>=20
> I'm just not sure how to actually do it right, because so many SoCs inclu=
de that
> feature.

If devices share a programming model with existing devices or have a
programming model that's a functional superset of existing devices (so a
new optional feature etc) they should use the existing device as a
fallback compatible.

> That is why I asked how you would do it having more insight as a
> subsystem maintainer.


> It just looks incomplete to me. In the past I actually
> verified it working with H2, H2+ and H3, none of them being
> "allwinner,sun6i-a31-hwspinlock".

Then probably there should be a patch adding all of these to the enum
alongside the new d1 compatible.

Cheers,
Conor.

--DZ11gBOYyAJHJUPX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar9tOAAKCRB4tDGHoIJi
0iytAP4kiIuP9DCdaR3lgIGUSddG4JYzELBic1ApDlqgZ/SNEQD/RKVu9GbrGwDd
rnTBgqaVMmHVFVBx47bm5hVDIO0d+wc=
=9vte
-----END PGP SIGNATURE-----

--DZ11gBOYyAJHJUPX--
