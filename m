Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:57915 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727370AbgC2Ucl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 29 Mar 2020 16:32:41 -0400
Date: Mon, 30 Mar 2020 07:32:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Build failure in omap_remoteproc due to 02e6d546e3bd
Message-ID: <20200330073231.6e04035e@canb.auug.org.au>
In-Reply-To: <20200327185055.GA22438@ubuntu-m2-xlarge-x86>
References: <20200327185055.GA22438@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n6aWScVd=OTDo0fxVhMctuB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-remoteproc-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

--Sig_/n6aWScVd=OTDo0fxVhMctuB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Fri, 27 Mar 2020 11:50:55 -0700 Nathan Chancellor <natechancellor@gmail.=
com> wrote:
>
> Apologies if this has already been reported, I did not see anything in
> the archives. On next-20200327, I see the following build error:
>=20
> drivers/remoteproc/omap_remoteproc.c:174:44: error: too many arguments
> to function call, expected 2, have 3
>         timer->timer_ops->set_load(timer->odt, 0, 0);
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
> 1 error generated.
>=20
> This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
> Enable autoreload in set_pwm") in the clockevents tree interacting with
> commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
> usage") from the rpmsg tree.
>=20
> Something like the diff below should resolve it but it cannot be applied
> to the rpmsg tree because it does not have the clockevents change. It
> will have to be applied by Linus as a merge fixup.
>=20
> Stephen, would you mind applying this to whichever merge happens second?
>=20
> Cheers,
> Nathan
>=20
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/om=
ap_remoteproc.c
> index cdb546f7232e..6955fab0a78b 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -171,7 +171,7 @@ static int omap_rproc_request_timer(struct device *de=
v, struct device_node *np,
>  	}
> =20
>  	/* clean counter, remoteproc code will set the value */
> -	timer->timer_ops->set_load(timer->odt, 0, 0);
> +	timer->timer_ops->set_load(timer->odt, 0);
> =20
>  	return 0;
>  }

Thanks, I will use that as a merge fix up from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/n6aWScVd=OTDo0fxVhMctuB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BBeAACgkQAVBC80lX
0Gz/tQf+Jak6uV9MnoCsyPrLx1fCq0oYPt8FVj/npVTYLTuEFiwKn3i7vXHVdFw4
vEzpW0ZtPrccyWk8gEwksLrhbwYZNt40Pzy9pEjlPjRIj3fWhRJI6bJmaZXyhM31
+u785y0yaX8nxjZIihxu7ghuWbLx11iCgTDunvBvhv/xVrrCPmbtuY4xMzDKt1va
OiHnGDfuOiENQckikS4gR6s1C1P97QHKSYSLyGhiB4DUuykzVQGqEPbfo2/WkfsP
cVnA+Wgf0+iHEc74LAb5JGqDsfkGZohoqiVKswBdPe1NKwmJQM2OMZksUMKpaUzN
1o7g+18wyHN9AdTmP9vMjZusY4q1Hw==
=eV0w
-----END PGP SIGNATURE-----

--Sig_/n6aWScVd=OTDo0fxVhMctuB--
