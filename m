Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A1E4A8FEC
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636917; cv=none; b=DA2XlvqfWmqc/VWrun20GU8NsTiiiQ2J2UAlie1pZ1L/Re+XkfjDFRXvGnbzEJ69H43DPN2JC7+imZU2QHBHgg5bkarN9VJU2cJZYxD2HutJvqgune1AAIfZN0RATG4WvpeXYz2AtWK9YXI0ETK1poD9Ha1I4MA21qyAoU/dw8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636917; c=relaxed/simple;
	bh=PbNeOpHyT5IouC5bkY58dTpb/EK5Mw7xbZDeLKa1RIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC2CqWIUGwPuJ1KCVCyW8gAkrAI9RQlnZQkeY4Ip/cMUlSCNdgDjUmYJFgdRI/z/G1AXDpcQae5d/nSvzfggHKsoVG15zI975dHr7/X1uG/KJ+ROE0+nwnlQhkFlaxIdBiSyuO1RHI6H9QYB3cYBBkQ8FOoNmWFtWDwKlDJwBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gRFM9sHF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gRFM9sHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PbNe
	OpHyT5IouC5bkY58dTpb/EK5Mw7xbZDeLKa1RIA=; b=gRFM9sHFB6vvBwoyN8SD
	hReVsLjCEk/85CP+Ioau4AtIzTtXVv5zbMvIxp3YEe+wK9vPJrs09kNGtUv2XNdn
	Xqf9hw0R3TGtGrgqNVf943MpZvy4PsV0lXFLe2JllyzrRhNQxo51vBjhKOCdPqMz
	z/TV9GsqHfnVlzhRkhUff3Ck8DTqwVZpECvSeJwWuIy2KK06g/PYWzjHy7ETSfpS
	D/oMndhJznC2gMJvS6FWHDzGxuaEa+OT+SXt1heJxX+zHKLEl38pzi1bnY7GQZd+
	X0g5XJxo8Wtpmr1UddE17N29l7f7JgqS1sAIi03m3WwYQFzxgAdoRS6+Q4FNZ2ky
	rg==
Received: (qmail 1936302 invoked from network); 17 Sep 2026 11:21:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 11:21:52 +0200
X-UD-Smtp-Session: l3s3148p1@svd1UKpbwqUujnsL
Date: Thu, 17 Sep 2026 11:21:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
Message-ID: <aquxMAA5oPStd2Eu@ninjato>
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
 <aqsMzXQ__BsWXUqH@shikoro>
 <CAMuHMdXBHeRj2tjjqc82MKCm+Tpm4KakrvGwn4q5T7mkTOmrXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pwBXeAy3FapsKEbP"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXBHeRj2tjjqc82MKCm+Tpm4KakrvGwn4q5T7mkTOmrXQ@mail.gmail.com>

--pwBXeAy3FapsKEbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Do you mean xa_find_after() may loop forever?
> >
> > Ehrm, it's been a while, I need to look this up. Which means the comment
> > is not explanationary enough :/
>=20
> Yeah, I'd expect xa_find_after() to do exactly what you want...

So, the reason is that xa_find_after() only upadtes ppos if something is
found. If nothing is found, it will in deed loop forever staying on the
same ppos. Will update the comment.

> > I get the idea, but haven't found a nice word yet. "Busy" could be
> > interpreted as "lock taken". I'll think some more about it.
>=20
> "used", "bound", "unavailable", "occupied", "reserved", "in_use", "inuse"=
, ...

After sleeping over it, I will simply go with "free/used".


--pwBXeAy3FapsKEbP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqrsTAACgkQFA3kzBSg
KbZv2Q//b7RzLd98y4gI3ZMrrPrQR7iOmWXm2S8kNQVAT3AvXHQoa0rv/o1yF4NN
Jsn8+AObRyrJ0nrkFL00ZYO2KYSEoJI2E/MPJ9xv/8wO6R0c5Hqd3ralF1igePk5
mBoFJ8XrNkpXuJjtFhIuZacX0IazS+w5BLEDMlW5MVyJUOUcZUXZ6rZEnfrX8EVK
VlxBCWjiOHQhyBTnOMq+JhPEl7KkvQRKopegQZJwqw8ugU0R0uudT225BF+ebR1S
4kQJda35SD6uuU8e56WET1VRE8qKXmhdPu1/3kHMiJ1zd4aG3hc9Pp8hoDbt64L/
MOOXedF5u9lmZfmuJIJDiGGfUyA1VCCS3lBEXcIaT1rYvHVQDZn1o63TFmjZN3uZ
K2T2hAvhJkanC67hoza39gmfYMzVefdRTZnvnKAiBJnk/i8jNuRBZeRHxRr5u2gJ
nq/nYFXbZp9UldW7HiKThF6BOdF2Cp5mU2taSSlZ0E7DhRaWeCnFa5kQQ4uZExKp
2+EZiP77BwGvD/yF0XK34AoC8cp2i9fNWinWTu3FdcZEks7rIpwCeNahfdaSfIuy
2NU94Z4QrN2HcBsGcSqTJ1Dw/mwOn6I/tA8jEUS7gXOFxLqyEmvAsB5f7e8j0xt7
l3xQJ7l41MpwxcT1EVHsbqUKEIZTOeNhH9Rl1YveaaNiKV1yrU0=
=K7LL
-----END PGP SIGNATURE-----

--pwBXeAy3FapsKEbP--
