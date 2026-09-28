Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B534EB875;
	Mon, 28 Sep 2026 16:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614268; cv=none; b=kw7qp0ujbn0g0aq3/ACLDGtbqU9++Q+dDEDYPmez0G1tPRL02CjrsVfVz3mK29T53qkVlrSnJwCxFDoMrXseIMjKZ0flhNG3+bXv1Nca3mwkPTxKtI5zo14JX9+bn6bgmLJlRodt9OcyaKbwYlkyrP4p62rQAr7IZn501YPj3Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614268; c=relaxed/simple;
	bh=7qujMjalLm+fR9p2YtYH4uWTPdLVJMOUVJv4gYWrE8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOpZFGBqSjQ1AsAmrwBEXc6025vfBDSar0ujcaVV2QVgCl8wcRjEGP2P5A1qeBYqSYzDW4Jt11VdGnp+SMbuj1ajZlulJauRL2ZuR+oISCFL9E8JBlex4Lhj5RDCcL11jczqyJVU9zUUEKQ5KAsyOGYtFv13rdsWPDY7eUyLNwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVcc4nwt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVcc4nwt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD871F000FF;
	Mon, 28 Sep 2026 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790614266;
	bh=7qujMjalLm+fR9p2YtYH4uWTPdLVJMOUVJv4gYWrE8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OVcc4nwtk75SjYcZBGTZBLVBZdYzxJNk3wCeIOjJUcHdOzA28qnXyoMHtALghanJc
	 TZlDrvfBIx/0/Qf8U1OF70LV/xFJXyubsPVOUCk47JaN7BmzHZ/udeZiTlIBfJbiq5
	 89eTp4DvJ4j058sTLQZze5JLuGrGNMxnEMTdHG9APGrGkRl6n/R6+4HSoGzgc53LKA
	 GylfwUKKoCrjhjbidIsU30R8FN59svuN5tLUC9HVKyQt8miRZmQ0/BJPfD2s8hhiOk
	 fctHLUGySdovImS4cSVXTo3ugfeUy4I7mgHVRgWgvuaJXU1L4MuriR2MOJrh0Lu+Iu
	 aQsyONrMj0bDw==
Date: Mon, 28 Sep 2026 17:51:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add compatible for
 Allwinner D1
Message-ID: <20260928-reorder-laborious-73515b6ef657@spud>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MUxTtFBeNtxJvpZQ"
Content-Disposition: inline
In-Reply-To: <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>

--MUxTtFBeNtxJvpZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--MUxTtFBeNtxJvpZQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarqa9AAKCRB4tDGHoIJi
0lVQAP49KPJ6ClOf6NzSjcHl7OvrOuUz/0otTRx2Ry1qRLGnFgEAub8iEEd4aYlo
TYoCQmOGZ2i8zKTGaXDzcxb42/ym2Qo=
=Rij2
-----END PGP SIGNATURE-----

--MUxTtFBeNtxJvpZQ--
