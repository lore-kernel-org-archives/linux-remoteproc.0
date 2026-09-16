Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5548A483833
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594846; cv=none; b=g9BK34vcUGTITayifcREXOgZim13Zr+XliCgZ2E7qzahgHsPmDErK6Y6O/gEyY3UPSObuYOrzTIqr4fnkoY5T1uA7+i4XIkPXUsfN5awvfMJ2TPXLWhfDU4Z/tZUfms1nPdyONSuyWCjgdRAu2TZjHaE2b4yq3YYejhtUeTQG6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594846; c=relaxed/simple;
	bh=ncOr7ug098p52KOY1+jbCW5KQwfv/KUCtYGB9tE1wCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWnaa6lrhzCc6AUUGyB4K5iSpSZA3h/ho9EQ4LhvttUrx1cWqtYfc6UlPxZoZUYu71McS78f3eMAQq9LUFVtfpScxg05Uf/0o8JR4N9+J6QgZPdQTyfcTNCQNqyMTefBWfODMRaPDtsBYDSb/CNAK4y3iNzxEt59S1vMol9Xsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bNe0k3wS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bNe0k3wS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UWBu
	4/9KThNGyufh5bed2wp8SVVGYiLD9tsi0Eb/JqQ=; b=bNe0k3wSUr5Ejp7s3dZj
	bHMvoxlB569GlIDPjy3S76L64SkIydIT3pgHxSDiHZ7i6Wy/o6rEHDEoiKAFf/2X
	wAAeCSTCQ4CdJrDvkSCjI6CKdEwBIRVD5ConroLD02WW9bSPLeJQyjHMiEq7eNDC
	XEv6PzFgsqYb7GWVFh2wy3Vo6Zy9oW9h0U3x9eCqOqIovMR5K3IrDXN16jrz064j
	RkoyH5VhX8qrIWwRtIWopfhNwxQfdSEi7p6STHfoUTtJGl5yUdFGj+WoX/psIazj
	nk1afqiQPOU00eqhV9J5fOFFs4WtDpBScvAWam+gXOaCCCr57lGSUN8N3i4oHSCb
	+g==
Received: (qmail 1717677 invoked from network); 16 Sep 2026 23:40:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2026 23:40:30 +0200
X-UD-Smtp-Session: l3s3148p1@Ya0jhKBbaKAujnt4
Date: Wed, 16 Sep 2026 23:40:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
Message-ID: <aqsMzXQ__BsWXUqH@shikoro>
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsICgkmrqWNnRNzn"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>

--tsICgkmrqWNnRNzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > +static void *hwspin_lock_seq_next(struct seq_file *s, void *v, loff_t =
*ppos)
> > +{
> > +       /* Increase ppos here to avoid endless loops. Don't use xa_find=
_after() */
>=20
> Do you mean xa_find_after() may loop forever?

Ehrm, it's been a while, I need to look this up. Which means the comment
is not explanationary enough :/

> > +static int hwspin_lock_seq_show(struct seq_file *s, void *v)
> > +{
> > +       struct hwspinlock *hwlock =3D v;
> > +       bool unused =3D xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_=
UNUSED);
> > +
> > +       seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "=
in use",
>=20
> For easier parsing the output, you may want to use a string without
> spaces, e.g. "busy", "active", ...

I get the idea, but haven't found a nice word yet. "Busy" could be
interpreted as "lock taken". I'll think some more about it.


--tsICgkmrqWNnRNzn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqrDM0ACgkQFA3kzBSg
KbbmaQ//XjTxQtJfjofgp1n45lUmLCTUUddGesfc7UuwTg+43zdM3fDaB95bhbMF
CQqAbw/9xmU2HX5Efr+Fw58wBqpMoieBt1eM1vakbwetuEdk0ln9P4f9/+VfMelh
npRmNdeahzJrjjzwEKK7md87AYXFkGPdLUlqAM4+3smLVcwh1Hs9Efn98uQSzHBs
LSatnUf2zMaKLzIl7wAjppIHKrj6pclVj2vMYiICLb9ojODHtyCCMxRWh55tKDst
Z+65iY5Yzgg+Hlmjx6/HXdYhuV5PkDd55g/ZvG+B368eY0WO889qpG4yzAcANaCG
8RBPYS1EXLT5UHJQXktX5V/HQKuOIyU1FWZnsLRkS+CwCj2v/Hi86/BM/0AqVT9Y
KInropc0Vl5ABz3HFWZ0ppu3LY63OKUhQaPvkYSklPJN4CLC9opX6+NrySq+8kfr
2hG26IvuVXMgmOO7Nz9N0k7MNREM1CMVS9FSAd06pEgaL65g5xjXUmkah64x05R7
7zMZKc1Mp21rfrxXzjlhq90ltkfZAqyQGe6PZUdns7SIX+CMdoKnrJfzS2aqMHmg
EijkCPeyT8v2/hyF8BAXzWLW7VcwxhG+Cv63OfGvp4rq6ubbLp4mI/Nv7Bqlsvvr
NIj8hmH/6MlBkBuiDp7UsmPKNPtUCtc32JLQQkS6ANfdjabcPN4=
=/0wZ
-----END PGP SIGNATURE-----

--tsICgkmrqWNnRNzn--
