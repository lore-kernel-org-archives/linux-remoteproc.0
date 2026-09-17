Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2DD4A64C7
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636228; cv=none; b=hShZ9r4+69o2KIgsc7Apyq2Tm4e4wq962hpwzcIDzg/DHKPNUyf6ut8igYofz4CyFruf3V6W5BysoF3ZBxuiKxiuTeSa/4jToB2bRQGjs6n2qHdCO1HtKd5qbFTR2CLIrn8Jp/hokEWTAE0BXbe9vmAiJ+rSqWsdGoLEtDDc/TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636228; c=relaxed/simple;
	bh=RJjhdV9CwaoE74N1bNU0hY9BatQziexkypF2NItGJcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO25p096o0q6MlHqkjirzx7CC8+5Z9U8d+9pL9Lau39sBzXtA1nJIrMtt6JFTXlDI6SFiIdRUVLUi6VS8r5vXIzQfvxj2BEJwXt1/g/vz0Yy34ITb05sx+0haY7CJjL0ElnBdMpEo3Nb2uFE2TWaAx7OUtcKhYBDkLExaspryNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gen9XyEX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gen9XyEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=I67L
	oRiWtGV0qD+2zhDaad+CFeN3qsKkRGXxvceIiBY=; b=Gen9XyEXFJXDRb2NjW8f
	XfvlVt/ZpgVXFYjRvF4d4yjO97TfsTgPisFOp+Ciw7KRfqUNy1ZGaaEIOzzhwUYd
	6VrlCkckF5wL3Rzi9WM6hraJ+KfqIzwhbE30YbGCnwjYipiWEfavlfPOfu0d/tp0
	TpXrXh2qsYGN4RRsysvk11O0t7UYiTP1y26nwglVuwPolmGOcC1Dnhb7JLArMF0D
	qjTlzqssOyFrb4GV0xC2JvwcDKufyOCVtvMWnyD2rlz4mbtvuZqFspE0nmZuFe4M
	bf1tVmfJT2XO1ON5Tw7Q0xcok6xJk0ewr48FAM4hWgUGW3CENp1MJmQva01Xfi1N
	8w==
Received: (qmail 1932189 invoked from network); 17 Sep 2026 11:10:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 11:10:23 +0200
X-UD-Smtp-Session: l3s3148p1@yYxgJ6pbKLcujnsL
Date: Thu, 17 Sep 2026 11:10:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 3/3] hwspinlock: add low level debug capabilities
Message-ID: <aquufy5JW2Z5Gmq8@ninjato>
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
 <aqsNpEXjuZswCC9w@shikoro>
 <CAMuHMdUPcBfFrLLW9_URM99S1jR-KhqUBQo1n7oHqX8qL4=1-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uIs5o3p8zIYvQ1UP"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUPcBfFrLLW9_URM99S1jR-KhqUBQo1n7oHqX8qL4=1-w@mail.gmail.com>

--uIs5o3p8zIYvQ1UP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > You mean I should merge the two sentences into one?
>=20
> Yes, as the second "sentence" does not have a verb.

Pfff, okay.

> > > > +       debugfs_create_file("request", 0200, rootdir, NULL, &fops_r=
equest);
> > > > +       debugfs_create_file("free", 0200, rootdir, NULL, &fops_free=
);
> > > > +       debugfs_create_file("lock", 0200, rootdir, NULL, &fops_tryl=
ock_raw);
> > > > +       debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_un=
lock_raw);
> > > > +       debugfs_create_file("test_lock", 0200, rootdir, NULL, &fops=
_test);
> > >
> > > Perhaps just "test"?
> >
> > Hmm, too generic for my taste. In fact, I think I should maybe rename it
> > to "test_single_lock" to make it more precise...
>=20
> "test_single"? All others don't have "lock" in their name.

Hmm, I'd rather add 'lock' to request/free. Only lock_lock sounds
strange :)


--uIs5o3p8zIYvQ1UP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqrrn8ACgkQFA3kzBSg
KbYClw/+I1c9z8xwfb5udO+V3fANqMX1zXeIG1c7zAo+f3tuAPccz/No5uAPqaON
vg5/xSTMAQPpgvjUhQHg3dUOVZKZjp10inNjTD/pXSyNCDdHlBpPHgcwuC8xcoTA
HxXNIwqS/yP/GbEt6flyo15sUk75HMRxYPJIauHc9iED/3zfdmg8bPPInU6zzI04
CtyAKgotERAirsKQwu74JgDhduI3FIOyPZebXpWGpR0TbVunlYHDQacNQ6lJ6zCj
tPSHI/ME++O/0SAKdCcpS5v1VkPytAAc4ShLn1gFGpnEEIj1L2sXZGDtac5zM29A
ADfBw494pB/ORGZGfLOReQYBVP7Dp4VoYzLL3AFiAaPl6VPCOswK5qWqYYRBmh+z
LLc/iH/sCz+odW+GZD06dpkrhgGFw+By6tZDV22ceZvYNo+FVbFci7FW94CmsyOF
WkYCyZ/TYlNnYI3Fxg+5K6HUqm7rUCG7OcMYEP8XTvDKPqIcWAbqhz0YJiDBAbDW
3vpTguqVuuyOA7Mg2+8RhEebHjFAtjI01jpJaH+gwSJ+KU2OOxqe0Oe8uDxC04I3
5mnXxa05BvGp6eJDr1aooyI6EbLV0iIXf3t4+ihqPkAhvrbi7TP/rP3FZJiWGMBb
thvnZgmcK0ALPVkWOBl0HBllLxRKAOceXBKCJFT8WgetEjrkLoc=
=LKZ2
-----END PGP SIGNATURE-----

--uIs5o3p8zIYvQ1UP--
