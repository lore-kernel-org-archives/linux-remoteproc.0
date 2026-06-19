Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B61B31B833
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Jun 2026 05:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781845602; cv=none; b=ubRK3CAW2zb0uUFFec0vUcEU3RYun4QvWF0Q8ThaHzGynbxnI/GTPTgwrDRSo3Cux0JmmQFTNBVrp+03y8HRen0G+vPfcPrfkVd/wNnVC/vuIujkkm519lQuQKH5Kzni3QZ+MeCgMZmhynku55Xhv6XFFpD05GYAeArUPXJzlTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781845602; c=relaxed/simple;
	bh=i6WD8sG8BxHB9HFPWtd4YBGmmZ9gTCRtRhYGrpB2SrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCiapc9evRN5c1/d92qYphKAqK+8DrOD56FYXwDAJpuKhyALROWdIKXkwuRYzeT+59mmYgaGWdvTUe1McgNl0rxWv3OuL90NZbPe3FhEmx0GtGZR+LFatSFRphoxvg94+XWJxQZ8nquhVtQg2b45dPlsWRVA9m7yzOIxaNL+ia4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iOt01Cuq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iOt01Cuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8NRl
	Tq8xnE9dQ4eFA6zBAm7QC/b5xEW5cy+ypmxdVoA=; b=iOt01Cuq/tPmrJFbzjfq
	A2tPIFbIOSr1jd3ifOWnmHNI2vDxey9Qn3RFpQZdlCp5JWjXCaK+aAs2jRH3W09i
	I71YruBumdPNO2sjZ4FUYF//d6RW+bvZdlbCwKOCNrGRTTPG6A+iGs8Vptq9Wp+V
	JrQvhIGrSQegktbiiYYmbcuqwCkz7BhW5WxgpWO2/ocMSE+YndlHsHDEmikGgWsA
	I53YgpsGvHMQdZbc4dWrKDCTbHjitxvXCkXGPkG7NqP4XOYyzlKRM26RxAyZ8/jO
	jjPml31YWUXXc9vmWqztRK7JeSEjNoMnkBs5DlEnxvFpcil1PLRhUEIRn+xjXOrP
	1A==
Received: (qmail 820705 invoked from network); 19 Jun 2026 07:06:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jun 2026 07:06:35 +0200
X-UD-Smtp-Session: l3s3148p1@dyW6QZRU5Ikujnu2
Date: Fri, 19 Jun 2026 07:06:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwspinlock: reverse logic for used channels
Message-ID: <ajTOWqp38ZtTZGgD@shikoro>
References: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
 <20260618163422.17604-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ww3S/YEmt8LYNPqH"
Content-Disposition: inline
In-Reply-To: <20260618163422.17604-2-wsa+renesas@sang-engineering.com>


--ww3S/YEmt8LYNPqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > @@ -42,8 +42,8 @@
> >   * used as the ID's of the hwspinlock instances).
> >   *
> >   * The radix tree API supports tagging items in the tree, which this
> > - * framework uses to mark unused hwspinlock instances (see the
> > - * HWSPINLOCK_UNUSED tag above). As a result, the process of querying =
the
> > + * framework uses to mark used hwspinlock instances (see the
> > + * HWSPINLOCK_USED tag above). As a result, the process of querying the
> >   * tree, looking for an unused hwspinlock instance, is now reduced to a
> >   * single radix tree API call.
> >   */
>=20
> [Severity: Low]
> Is the documentation internally contradictory here? Because the tag is now
> exclusively applied to USED locks, it seems impossible to query for an
> UNUSED lock with a single tag-based API call.

Can reword to "getting the hwspinlock state". The core doesn't offer to
look for just some unused hwlock. Only specific locks are looked for and
their state is queried.

> [Severity: High]
> This isn't a bug introduced by this patch, but does

Ignored.

> > @@ -482,9 +482,9 @@ static struct hwspinlock *hwspin_lock_unregister_si=
ngle(unsigned int id)
> > =20
> >  	mutex_lock(&hwspinlock_tree_lock);
> > =20
> > -	/* make sure the hwspinlock is not in use (tag is set) */
> > -	ret =3D radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
> > -	if (ret =3D=3D 0) {
> > +	/* make sure the hwspinlock is not in use */
> > +	ret =3D radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_USED);
> > +	if (ret) {
> >  		pr_err("hwspinlock %d still in use (or not present)\n", id);
> >  		goto out;
> >  	}
>=20
> [Severity: Low]
> Is the "(or not present)" portion of this error message unreachable?

Can reword.

> > @@ -798,8 +798,8 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
> >  	pm_runtime_put(dev);
> > =20
> >  	/* mark this hwspinlock as available */
> > -	tmp =3D radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
> > -							HWSPINLOCK_UNUSED);
> > +	tmp =3D radix_tree_tag_clear(&hwspinlock_tree, hwlock_to_id(hwlock),
> > +				   HWSPINLOCK_USED);
> > =20
> >  	/* sanity check (this shouldn't happen) */
> >  	WARN_ON(tmp !=3D hwlock);
>=20
> [Severity: Medium]
> Does hwspin_lock_free() now incorrectly return 1 instead of 0 on success?

The quoted code is the wrong block, but the issue is correct. Will fix.

> [Severity: Critical]
> This is a pre-existing issue, but does accessing hwlock->bank->num_locks

Ignored.

> [Severity: High]
> This is a pre-existing issue, but does hwspin_lock_unregister() fail to
> rollback on an error?

=2E..

> [Severity: Critical]
> This is a pre-existing issue, but does devm_hwspin_lock_unreg() ignore the
> -EBUSY return value from hwspin_lock_unregister()?

Unregistering has _many_ problems. This will be addressed in a seperate
patch series.

   Wolfram


--ww3S/YEmt8LYNPqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmo0zlYACgkQFA3kzBSg
Kbbg9Q/+K5SEcy6iRHeVaFcC2D0wh29n6NHjB4Fynakm5cVAuH4scQh0uBYZQUZP
/ucE6bf9Y/Yrw/KlhCprtWuaVpHPZSJmXR2ruuG1HRBWH0dY/x3uVCyDrYs3t08F
LgvcQidTwuGS3OquMYOfr9unFKoA0CRLcLrMhfeS6TVlhbnuvd45OElNiTKtaMOB
LOArdlslW7hxmIkEGxVH5kizOE6J2pCkybukJC7i1H7e+Sz/+uYzEsox8FFWU5+s
D8F1srZjCQRDaUNoJ9RtZtuHEuY686S4EGjZfYoB6d45xzr/dlOT1sK3lRtmlJ3R
POd0tFFT03NaRhK4iWR9w6ToGLCYO5AHYUC5U/2Eb+0wAIWImgVRogc2zVynvLL1
lI4GzW8Mnom0HwvRQAfVkIcZ4QLQm6mwPpiPqRMQUCfdVkt65azk43cSfkcwOzbQ
QTFEpYETzAEccw72ZY9z3LDBayGZYsfn2VAi95TFHuC9aWEIysddPQwzg6rpiUs/
saub2gnFJCfk/FV8Dd7GiKmmLcY/TW+u8ozEYZeEiMN9HLumJ30DjO4fD/yAh2AZ
9RGKhHkd55Oe9VOpnMkqVJuZiiUr9ZH5dMC+IN0OIHgdPKlhCjNG2IMvSLvHpVyH
xjDSUjpM1UprglE4aI6/ynLUTShdj/6N9gq0R21JTZca1GPbsIE=
=UYfl
-----END PGP SIGNATURE-----

--ww3S/YEmt8LYNPqH--
