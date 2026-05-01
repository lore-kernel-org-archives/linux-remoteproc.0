Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113232494FE;
	Fri,  1 May 2026 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777653836; cv=none; b=AzwzdwK9KzrUNg+Hat9B5P+9VClcxr0c04c6chVPcfQ17yf/ufzut5Z6SrwupgcAyDK4SmuHvRoPzcY8ue02/un85ekpwEwWnlLjz/KM9NPXvKbG+ZazTRPi6WavnQIMIkHPgqxxdDVmSLJa7MhQF25ZTBDP878Kq/LYSg2DvIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777653836; c=relaxed/simple;
	bh=U2lycOerJ/sm2zydY2disN/3JhUOXzAUCe1IvGJdC00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWSX2/XD2g+9T2s5+Kv9+V/VtMf63QlKf6umT2tXwEsrrWJKLc3xZcRs21Ms7kpEDT3hQ8pFEUcIxWymYVRghoggi+YT5R0AsmJHt0xPj93kxE1yXkdyt+cIq11m1GCB/m+1UvxoHV0Mj1juhyElrQorNXa2+4l9AJQlWu/uc+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkfzXn3K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkfzXn3K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E368C2BCB4;
	Fri,  1 May 2026 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777653834;
	bh=U2lycOerJ/sm2zydY2disN/3JhUOXzAUCe1IvGJdC00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkfzXn3KrD3zRfFWHiwnGyiFmCnSMUasHmkgI7oV4m8pS9RSBxSd4I+gzB9JYSu8v
	 BiG2Zlcvey8LcGfbWWyIF7V6F6TeUcPZy3+DYiZSKWOqvnIEB+3AOLXk5zRwtnl1RR
	 Jcj7ECNt14fTqN7oFVAme52SWRU4ze/lCkV/bIzQhVsPFWCgcylIM9U45T697u2fWk
	 9hSABQkNtKofsGBsynDfm3cEhCJ/k7gEA3NwxpS4QPuT4R2rM7OYqqQd0ywpeONZdY
	 1kKs9gCTe1EeS1qIhK2OzXP4uXLm/nQooA8u8a+MgGZ4/IaDuTgMWxI+oCzPay9Q3m
	 a3ScL+Np72P/A==
Date: Fri, 1 May 2026 17:43:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	ben.levinsky@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: xlnx: add firmware-name
 property
Message-ID: <20260501-june-uncross-91d166e644d5@spud>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oCmpv8hoY+L52ogM"
Content-Disposition: inline
In-Reply-To: <20260501143707.1591110-2-tanmay.shah@amd.com>


--oCmpv8hoY+L52ogM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 07:37:06AM -0700, Tanmay Shah wrote:
> The firmware-name property indicates which firmware to load on RPU
> during the Linux boot time. It is possible to stop the RPU after boot
> and load different firmware and start RPU.
>=20
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--oCmpv8hoY+L52ogM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafTYRgAKCRB4tDGHoIJi
0s5kAP9p5IgY0q5+juGj+kyjqTZeSkLP2IBaBL6ptoV5UK6P9gD+P2Pn3a3BF0mL
GKNr1ytcz0hNvwVWxR+fF7knLUBGxwA=
=OYDX
-----END PGP SIGNATURE-----

--oCmpv8hoY+L52ogM--
