Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09AF36B910
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636121; cv=none; b=mDGmlsuMTI+3mH1XbwTIHXPNCedss3Z2D7ON83UizJs3oAWS1IbNufxUjZJoZZ8BVKR4bKpyka8rT5ZIdb2TV6kFn/A9YyChGOKscbTPkWlWV4kuHGzqEUd8Xw0WN1CHCfeddorTLdJjuOPb/KM5uBLzVFT3ZY+UJJgKvbgYwfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636121; c=relaxed/simple;
	bh=RqcwEE9Xx/564lN1a6EvV2mReIrkeBU5Ko+5a7oBOjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiKn0OIG/Q+1ppVuVnGrw0ZkBSNdWjHV+f95Id5JqTZe32D8g1mVEdjs/dcaT3ysBbXNJsPAbB7HgIldazbgKDF1ROlTr57ev7Qx4QyUc9ZoC3geshJFqFJaXEJi/A5CsgP6pd+Hw9UOBeGQH6VcOhKf4Y00xUQ3+AS1XPg9Q5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=f+suIXbN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="f+suIXbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Rqcw
	EE9Xx/564lN1a6EvV2mReIrkeBU5Ko+5a7oBOjk=; b=f+suIXbNAdvhsPSEGync
	0NvYXoYNTdl2S20CFq6fFDbYf1zm+I7dkqyEiE3RVswil/5o4ET8V7hjyJvsGN7X
	TNz/S08KlPsKeuNeU3lU6wCZoztI2LdqPAUxaSxGICa8YzGAU8H+o0uKOvA+b1ri
	vGc7IkR/7YKBn69nYTyam5f0oWUdv/VilWWNpFGdVjz46YVNkb5Nty9dAcQAnZrR
	WibkfUyq9dWWv7c06jxs/pT3y5O/QU1+yoiBIqWw86qWTYftx8BM3KgoVlK1IoKp
	JnlR9xXqJunrdo/z/Djfs+R6re+CRTVkWoECoqvCr2E7Z3oPGP+aPjeoauxgZ29/
	mA==
Received: (qmail 1931465 invoked from network); 17 Sep 2026 11:08:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 11:08:35 +0200
X-UD-Smtp-Session: l3s3148p1@M0n0IKpbRKEujnsL
Date: Thu, 17 Sep 2026 11:08:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
Message-ID: <aquuDy2Lspr4j7wn@ninjato>
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
 <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com>
 <aqsMWn11lSgnNuVR@shikoro>
 <CAMuHMdXzyn2-bkky_wEC=5DdNFYo+QSroP3gEdmuZ6bhqQC0vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvva/6AwbSPr5Tlo"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXzyn2-bkky_wEC=5DdNFYo+QSroP3gEdmuZ6bhqQC0vA@mail.gmail.com>

--cvva/6AwbSPr5Tlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I don't think just booting on a system with a single spinlock
> counts as a full Tested-by for such a complex conversion.

Your choice. There would be, however, enough chances to break the
conversion so that even a single lock would not work ;)


--cvva/6AwbSPr5Tlo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqrrg8ACgkQFA3kzBSg
KbZT/w/+OidAC6L3kb0fjd35PJutmUSkCaURTj1pRS6aNpAWF/dj0JA1V3Ub7coe
5aVL96nGKyXUFPgztqsl0t+Vf5tlFIjmO+yTF9InlHRoS/Cd9keD124gaAM0v0oF
TbX7xhHsbpvqO7QZvj/CDabiMGQVk3SappWnpuOQZOUno9XYN/GSjuT4S+58WoJv
s5DKh+4PwBsKqIgB3TlSeLVHdLxcVdOW8M0LJEq6c+9dWarJn0C1jhEEMHcYXf87
sGcoW+vHoxJolaDlW2NKAkJ2soWk5O3FJgR0F2E81F9SRnj8u4TGbS87SfRJ+sSF
yM0isTq9Seas5gxklm6GbJ6Q2SIXJBV12g6H3BwLj99L7MEGKhivwnYh5ZJNxCPq
8/mpdFRek3K1Jyt5H4roB9yDeqwLfI+QdyBzqF6Y1+VxoNM9jxOouQTx0QxVO41D
SDqsjOgSaBT29HyQ1VEXgLbhvl5bMk3i8jHfPu7k9/00bjqxL/ToPbHVw7wh1qVO
dY4sKeEMgFLw0Q1Elz3cXV8VIlfSJs3xPerQCjDIbDWiIsg7rsh6qX8LOlRe3ymk
1HhhmXZQZlfFutcZchLNDEdzT/oZLsQ+Iz/XyseMaFnV7YFX7PFR9Qk8f6nJH+3z
6wP4Qn4IWgINMFkl43Pz3yZcVG5u93ByXXx8I3INEP9/c7O4YBU=
=85Rh
-----END PGP SIGNATURE-----

--cvva/6AwbSPr5Tlo--
