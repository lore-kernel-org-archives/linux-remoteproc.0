Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC9A1C862D
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Jun 2026 05:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781848185; cv=none; b=GN9kVHg7iDGE/zN4QzxBokXdcyaW53ojGkLupXmgji8ZFTVaCegWTclfJBkOW0VGNB0OSLsbM1vjwQpH3rJT7XtfzXDxD8LORAYaFM8t2FkjlbAuGS2loNc/TbK8JijlIMj0nqbc07hhaVj1f9xnqQWODZ5Q6ZzFOFbVs+7wWCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781848185; c=relaxed/simple;
	bh=E98+5Qr+KeoM106Hq211PFBNKdVPjU/jBJb/aEB0bTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOFOQP9dLxwjyna2uVN4kXZ89L54Ds3ytGXVqEOmaw3bud54yB3twh89GKUKQnvXZ1pT2+7pQVw0WlEaDnAU+4rWyhmkP8hPUUvCOe0wxqyBYtkrZIN9wkndn/yIYSSS19qW1Uy+k/kexYSri9HCLvKNwv29pcpOh3opDJyw1fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O+NeMksp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O+NeMksp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hvCd
	6IgJSBTTy+itIz+xJJHE4KvsXRtxZLHnP9GcgNw=; b=O+NeMkspMnHO2uyVGQUX
	v+FVrgK0xX1j+Z0Dh4isavvR32ojDEj+l9lAwx8NURwi7yeJ98NfDUymBm87dpkc
	nGQVwkCeAgrfI2UgZ+cvV210i/cf7/7rAaIcukGBUjeRVUEi0oEjXwK00q434fpD
	4a9qFACfky8Dw0EdH8AIyuIIXC8xLGYjYFAin6r5xQJWAZ2JOmcw7I24bhxIfn6E
	vb2Kqn9Ajq2qlwYYQ4W1VXfeVqpNzSnezAw7VoQ+plhikbHzrc4wikq0L45ubiUK
	WmzYUuhIXdcvmaXDmPXIAJE0WNuwIretiYunl+QzSyiEVVDgKwTiQmjf4kCl6sXi
	Zw==
Received: (qmail 829568 invoked from network); 19 Jun 2026 07:49:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jun 2026 07:49:41 +0200
X-UD-Smtp-Session: l3s3148p1@g/fl25RUoJ4ujnu2
Date: Fri, 19 Jun 2026 07:49:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwspinlock: add summary in debugfs
Message-ID: <ajTYdE3Lu2YKL-O9@shikoro>
References: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
 <20260618163422.17604-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PhMJloWiTm1k9Dpg"
Content-Disposition: inline
In-Reply-To: <20260618163422.17604-3-wsa+renesas@sang-engineering.com>


--PhMJloWiTm1k9Dpg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > +static void *hwspinlock_seq_start(struct seq_file *s, loff_t *ppos)
> > +{
> > +	struct hwspinlock_seq_iterator *hwsp_seq_iter =3D kzalloc(sizeof(*hws=
p_seq_iter), GFP_KERNEL);
> > +
> > +	seq_puts(s, "id\tstatus\tdevice\n");
>=20
> [Severity: Medium]
> Will this unconditionally print the table header on every chunked read?
>=20
> Because the seq_file framework calls start() at the beginning of every re=
ad()
> syscall or when reallocating an internal buffer, this header might be
> redundantly injected into the middle of the output.
>=20
> Should it be printed only when *ppos =3D=3D 0, or handled in show() using
> SEQ_START_TOKEN?

Yes, I will do the latter.

> > +
> > +	if (!hwsp_seq_iter)
> > +		return NULL;
>=20
> [Severity: Medium]
> Should this return ERR_PTR(-ENOMEM) instead of NULL?

Yes.

> [Severity: High]
> Can this early return cause an unbalanced mutex unlock?

Yes.

> > +static void *hwspinlock_seq_next(struct seq_file *s, void *v, loff_t *=
ppos)
> > +{
> > +	struct hwspinlock_seq_iterator *hwsp_seq_iter =3D v;
> > +
> > +	++*ppos;
>=20
> [Severity: High]
> Does sequentially incrementing *ppos cause infinite loops or duplicate en=
tries
> on chunked reads?
>=20
> In hwspinlock_seq_start(), *ppos is passed to radix_tree_iter_init() to
> search the sparse radix tree. However, *ppos is incremented sequentially
> here.
>=20
> Because registered hwspinlock IDs (the radix tree keys) are often sparse,
> *ppos quickly desynchronizes from the actual keys. If a read() operation
> resumes, seq_start() might search the radix tree starting from a sequenti=
al
> *ppos value much smaller than the actual next key, re-printing already ou=
tput
> keys.

Probably true, will test.

>=20
> > +
> > +	hwsp_seq_iter->slot =3D radix_tree_next_slot(hwsp_seq_iter->slot, &hw=
sp_seq_iter->iter, 0);
> > +	if (!hwsp_seq_iter->slot)
> > +		hwsp_seq_iter->slot =3D radix_tree_next_chunk(&hwspinlock_tree, &hws=
p_seq_iter->iter, 0);
> > +
> > +	return hwsp_seq_iter->slot ? hwsp_seq_iter : NULL;
>=20
> [Severity: High]
> Does returning NULL here cause a memory leak of the sequence iterator?
>=20
> When iteration reaches the end of the radix tree, hwspinlock_seq_next()
> returns NULL to signal EOF.
>=20
> The seq_file framework then updates its internal iterator pointer to NULL=
 and
> calls hwspinlock_seq_stop() with v=3DNULL. Since stop() expects to free t=
he
> iterator, calling kfree(NULL) means the originally allocated iterator is =
lost
> and never freed.

Uh, yes, overlooked that.

> > +}
> > +
> > +static void hwspinlock_seq_stop(struct seq_file *s, void *v)
> > +{
> > +	kfree(v);
> > +	mutex_unlock(&hwspinlock_tree_lock);
> > +}
> > +
> > +static int hwspinlock_seq_show(struct seq_file *s, void *v)
> > +{
> > +	struct hwspinlock_seq_iterator *hwsp_seq_iter =3D v;
> > +	unsigned long id =3D hwsp_seq_iter->iter.index;
> > +	struct hwspinlock *hwlock;
> > +	int used;
> > +
> > +	used =3D radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_USED);
> > +	hwlock =3D radix_tree_deref_slot(hwsp_seq_iter->slot);
>=20
> [Severity: High]
> Does calling radix_tree_deref_slot() without an active RCU read lock trig=
ger
> a lockdep warning?

True. For such cases, radix_tree_deref_slot_protected() exists. But it
only targets spinlocks not mutexes. Will think about it.


--PhMJloWiTm1k9Dpg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmo02G8ACgkQFA3kzBSg
KbZ23w/9GMaapxQZsHc0RzE4SGX3nVkUTvTa7VcB+WDLEGXiS+Ykg3zch2U/pyBj
PBAzH3r73h/5iPylFH3yQjG2xFBdM9TxXGyAC4/ruSuvEp93IMhjv5HwbZluoDlV
unhyYN+8s6mBhMhUI9eqTNRaQrxx1pLyk8dkHwXoVb+c2UUKTcEEPUyIQpzi+JCX
xhM0BDno0myVcwk/KZe+hoRaLCnbsiZ3KKp7yCkR9aFl9nlL1FAjWgXA8NgcMYDr
/K8ik1/JCSnkpHvOcAaxHX9Jpub6YriJjxzY+phtm3Bsyb0GSPsWg8ugHmNZtAKa
FR0wpnNZncgl9eAvToUHq0e+54m60nWYWWQCHqkXfEykoJaWfSRFIm5sXEyis/2D
yhrrsbZ4oukuIbOo97jILZ4Mp1Gih/X+ZK2alnobwAlayyOb5CVLE4Xeq2zch30F
CSCjrGTaXIHtMzKUmIRn1mzTaJYHUaFORleuJlNpy8vBv3GubrLNbDIZGCtaVepg
xj6FuNKmUOVf8qz/qkoCts62NWinWtdVI+WWUmc0f+4UsnOKOvpv+UnnGw+M28e6
xvKtGIz24yc7sW3pL1DvyI3lRWijX2eO3hAmILjsBKiRJvbvQdaWV7idkLer2xNd
saD7N7DGETl5/Vmp1u4wycfUAKO4BjNXDZC17DUs3gU2mH1vjEY=
=3m0Q
-----END PGP SIGNATURE-----

--PhMJloWiTm1k9Dpg--
