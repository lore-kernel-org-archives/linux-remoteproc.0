Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0654929B795
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Jun 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781853461; cv=none; b=fDy/Q68htPBoKaoEiVF8CEBF/IzGsU80ROgdCrOsco/YTIbxDiPE8GYpXVyoRUMPod6xnlmcJ8hgP7HIsdDmNgpnqpMLXbd9OI6KCyIodanxVGzLHwcZIJkTt52Scjq15mcsJSTlhuwkjYi8xsu0Ftwn3futcDKQTzASwWl5Kd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781853461; c=relaxed/simple;
	bh=wGXREsTwKS5/luf8Y/W2MTL5FKoYVc0+yg2PK0+PgI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YC11FZWYhttq18iamWXahypfgI0UoQUKy/lQdVBox9ClTCZeF344meMuUNNfOpsgOoHg7vxeYFvyby0jhmMX8lyY8vkN2/xHJv6Do9fnPFgwYJtvgnHOofIf/gxnUoM9pvaAj8y4oz+s5yydgTht9EgUCzXy3WIM89/KgLJk/cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TXeYzvBv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TXeYzvBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eTfs
	mMjoIaFZOLfQvk3UjnaihDkZSvyn09So7HZ2Oeg=; b=TXeYzvBvYd5+2k9UhlMi
	sVHQOYfei3L3wViI7UEeq4SpBu58hgIZJBweY7LKdiRNIJ6BjT/OB3trydCEZy0e
	NBmOAZNyJcl5BopBXvsAGCxDOrSEbI4DcCy9EfyIVqo6GGYbruTTgEdHYGkvzm3P
	YxlIQe6+kPgZcSRRCHG+7aucvSvNaS3AAmxVcdcurM6Hrkf0FyxUFEnHMV93IH4N
	1x10alL9Gy++m8rmg5zrZg0nq2fwcEQLpP0D1dwSMwMiS9+LuGRGme+P1J11JfN/
	qx7o5S2YmtwiGuoFcwhzmSsyAzUdn+aCyACo45ckn4iSKLvukO2EdV6nmwsOSIrL
	Qg==
Received: (qmail 854806 invoked from network); 19 Jun 2026 09:17:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jun 2026 09:17:35 +0200
X-UD-Smtp-Session: l3s3148p1@KQo6FpZULKYujnu2
Date: Fri, 19 Jun 2026 09:17:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/2] hwspinlock: reverse logic for used channels
Message-ID: <ajTtDoR83MuAnvs8@shikoro>
References: <20260618163422.17604-1-wsa+renesas@sang-engineering.com>
 <20260618163422.17604-2-wsa+renesas@sang-engineering.com>
 <ajTOWqp38ZtTZGgD@shikoro>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a7FEBDeal3g8ZYzU"
Content-Disposition: inline
In-Reply-To: <ajTOWqp38ZtTZGgD@shikoro>


--a7FEBDeal3g8ZYzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri, Jun 19, 2026 at 07:06:34AM +0200, Wolfram Sang wrote:
>=20
> > > @@ -42,8 +42,8 @@
> > >   * used as the ID's of the hwspinlock instances).
> > >   *
> > >   * The radix tree API supports tagging items in the tree, which this
> > > - * framework uses to mark unused hwspinlock instances (see the
> > > - * HWSPINLOCK_UNUSED tag above). As a result, the process of queryin=
g the
> > > + * framework uses to mark used hwspinlock instances (see the
> > > + * HWSPINLOCK_USED tag above). As a result, the process of querying =
the
> > >   * tree, looking for an unused hwspinlock instance, is now reduced t=
o a
> > >   * single radix tree API call.
> > >   */
> >=20
> > [Severity: Low]
> > Is the documentation internally contradictory here? Because the tag is =
now
> > exclusively applied to USED locks, it seems impossible to query for an
> > UNUSED lock with a single tag-based API call.
>=20
> Can reword to "getting the hwspinlock state". The core doesn't offer to
> look for just some unused hwlock. Only specific locks are looked for and
> their state is queried.

On second thought, this still shows the original intention of using an
UNUSED flag instead of a USED flag. I will probably drop this patch in
v2. It is less intrusive and probably more future proof.


--a7FEBDeal3g8ZYzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmo07Q4ACgkQFA3kzBSg
KbbaeQ//Qepb/SnOO7wCRdhaBdoVZXYKGxyH9POgRipDqIjSD4so6TLbzOIw3EIq
z5958MCyMhnJak0NcfhzMwnHlYCPRPxPD+B0fj+0KMwTgq8aeVA6IzMJgE3voLbq
jFdCGkR+xxeDerBqdSDrRaLB4PdCm6xNYonfnnyHw+Qlk8Z0U1XJctliPL/9Mp1Z
9sQaA2D+YU9Ze3zkE8bjGvmJboQPEDgVo+aYJ6DbOq0rvPltN9d7+o1AKyTfqkC8
mJfLVqp0SkIAHbZpGpTW389LsVISkXJklpkCD51wfUIEQCNYWXOVf0n3693RPuLM
TYU8bffr7LV8SWu7rpvZ87XVAHlS9Vgt8Xy1yWmxnn+rQp93DRI7pkP9saQ5ZB+L
jho0u5AQk9ZwRsTP53rBLfcw7uZm+7wsulURCUuCyGJx7h3KfkHMyEzJZBn6/2X5
E1qjiUo5I2ur4RE3gE3GRXQBJXK6Nqemgq9UDzdBKU//yK9T84vKBaGJZxiQt83w
jvQn5hRQESXSzcfL0a6Rc2vXWBgxovYF5MhrO5+o2Epda348vVB3pSEoie8o28/m
Bod+xIEEmbACLkn2AROQ1qSTef5JJzjJ4tA1cu6CRz70fmseMHh2oFI6+fLD/gdw
f5ovT1Vk0SHVOspVpRK3XmhXLVmomJ3k6DJdzhM5ibt5ZbzO/L8=
=uxIE
-----END PGP SIGNATURE-----

--a7FEBDeal3g8ZYzU--
