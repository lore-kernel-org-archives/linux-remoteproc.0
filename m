Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4064D9579
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 21:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595063; cv=none; b=u7ih2rhBXyqE0TyQiyM/yfPWkez/ttpkWZSqF7dqp7tM0xs3IQv3kYcqp6Qfo29Yc2OGoz/GWO92m3epmtZRaA70a4mPYWcvHucUV+f2Z7z8kk+Wn6T+5khl/QUpiF6sBpoLgRNxULVU2M2s28+VyZklk5vM4KDbeZYMprfBRHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595063; c=relaxed/simple;
	bh=u9CwAkRmRgfbHgKS7O8auSQpb+Jkdl9BSbZ4LLxb8Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L25pwoN4EPzm5tTy0Of6IV/KCh+NH6qYM2BcbGmCYrNRJOB+GCDHT2nWmgWctlhqwPGoLodRIMnixvpo3vdp3IO+kciCXx7f3qjxRFRpaSDZsYrzje5vRWgIV4UUp3v98psyRD6wGQUdo1XpDDNouGCXd0LtF9vN196KYjHHZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k67sJ/iv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k67sJ/iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DM/W
	7KCnxU7/tdq5Kc2WNPGwfZ0hBpeFzr7aGr/+qyo=; b=k67sJ/ivCmMJjXEfmVDt
	OXjDHvG9OqgfnDebkf05kUT1KLP+v9b21MYYDXEZcTJZZodnd3RGeykQI7RjtgPK
	R48INoQPNUNMxRyR1iIPzh4m0zYWmHa2ily7IbZfPD4dPzGdPlEke18fZo5OErnm
	/d1dsobEryvSpaM/xzU5WBNrVNq6p//DtL1IekdooVEmUU4L6WVfRaQYvXrB2sH9
	XjjfZJgWNrAB1Yd82mEFpC25oK0k7ie7wBoSZFu7y2grULX6/nlqV+GUE0kmlLX4
	I16/5vGZ9bnO5MkIUWGfCWK7LjUhMAPPDX5BZ6+ClVNWoO1/0zKg04EG0JTbC0N3
	kA==
Received: (qmail 1718523 invoked from network); 16 Sep 2026 23:44:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2026 23:44:04 +0200
X-UD-Smtp-Session: l3s3148p1@gFzskKBb+tsujnt4
Date: Wed, 16 Sep 2026 23:44:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 3/3] hwspinlock: add low level debug capabilities
Message-ID: <aqsNpEXjuZswCC9w@shikoro>
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ydJZIwgFrpNtqTV"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>

--1ydJZIwgFrpNtqTV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > While developing the hwspinlock core or a device driver, it can be
> > really helpful to change states from userspace. Add a debugsfs interface
>=20
> debugfs

Yes.

>=20
> > to request, free, lock, unlock, and test hwspinlocks. Because this is a
> > potentially dangerous interface, it can only be enabled via source code.
>=20
> ... code,
>=20
> > Similar to writeable attributes for clocks where this idea stems from.
>=20
> similar ...

You mean I should merge the two sentences into one?

> > +static void hwspin_lock_low_level_debug_init(struct dentry *rootdir)
> > +{
> > +       debugfs_create_file("request", 0200, rootdir, NULL, &fops_reque=
st);
> > +       debugfs_create_file("free", 0200, rootdir, NULL, &fops_free);
> > +       debugfs_create_file("lock", 0200, rootdir, NULL, &fops_trylock_=
raw);
> > +       debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_unlock=
_raw);
> > +       debugfs_create_file("test_lock", 0200, rootdir, NULL, &fops_tes=
t);
>=20
> Perhaps just "test"?

Hmm, too generic for my taste. In fact, I think I should maybe rename it
to "test_single_lock" to make it more precise...

> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you!


--1ydJZIwgFrpNtqTV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqrDaQACgkQFA3kzBSg
KbbFixAAgz371RqwNn/QHdIZlTiyc/IwwfiPlgZOQSKC//TA3PLQwhpjESSNaOj1
cUd66gVDmROXA5gZyY5k5XEhAD2YPgkRoPfy8lGaiNC/xuZ+3Soxvl2IfIZoKO6r
I1AFSFjUtCSouLHB0NFz4t8TxYL0kFBjniWaqNjgZP8K50uo3NaaS4dmRsYa7t01
t0uVAE0V1J8EG1u2XqjWKeUAX2fBHn1SmsTk3Jjeb/aYScd4ZP4XVS3iM7kjkEuf
R4KrlWBvR+GwXiB947dD8xs0l1OiqRgVSD17eiYtP0+fY07LuG+SE7mmuUyaYWfS
Q4SOUHqNs7Bw/p5lCMAno1cB74U+NxX+LJZgzos1jvjcBl814y5gKvFElDj57N6R
SMinFdOZxdDOfWtrTzTvquDnnrDbJAJR+iHQB2Fzka4d9uz3UnmQl0j+mSOOTH8N
Gwhigp76UejYwe4blLKn8oTzHOUTcPWbeS65HWddy82Zn2PBUAVBWkB7G0FY4EsB
pwgs9Jzr+ih1Ix515xuNfFLn6BfI/mhFQPD7SuAdhL691T+pjeU5rx/36BhvyVzE
fCoWr9MwJozctyWMkoomtZd26M53aQUrGxVBdc6Ofjwmv6s+PtH0NkUHfFuCXnQb
2xGKmSfVdmGnED3TSFQcmwVFcY9OxnNmGspxAB+/ALc9svEVPiw=
=C3xR
-----END PGP SIGNATURE-----

--1ydJZIwgFrpNtqTV--
