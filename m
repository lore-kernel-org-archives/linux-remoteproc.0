Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED35D5C
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Nov 2023 14:50:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8TNj-0001Yv-Av; Wed, 29 Nov 2023 23:50:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8TNi-00CV01-Kv; Wed, 29 Nov 2023 23:50:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8TNi-00BAcn-AO; Wed, 29 Nov 2023 23:50:10 +0100
Date: Wed, 29 Nov 2023 23:50:10 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/3] remoteproc: k3-dsp: Suppress duplicate error message
 in .remove()
Message-ID: <20231129225010.ul2xcjjm7jcymmoq@pengutronix.de>
References: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
 <20231123211657.518181-6-u.kleine-koenig@pengutronix.de>
 <ZWd2ZLahjfFs7+Ut@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mkzgdjjptuwjbrop"
Content-Disposition: inline
In-Reply-To: <ZWd2ZLahjfFs7+Ut@p14s>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org


--mkzgdjjptuwjbrop
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Helo Mathieu,

On Wed, Nov 29, 2023 at 10:35:32AM -0700, Mathieu Poirier wrote:
> On Thu, Nov 23, 2023 at 10:16:59PM +0100, Uwe Kleine-K=F6nig wrote:
> > diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remote=
proc/ti_k3_dsp_remoteproc.c
> > index ef8415a7cd54..40a5fd8763fa 100644
> > --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > @@ -835,8 +835,9 @@ static int k3_dsp_rproc_remove(struct platform_devi=
ce *pdev)
> >  	if (rproc->state =3D=3D RPROC_ATTACHED) {
> >  		ret =3D rproc_detach(rproc);
> >  		if (ret) {
> > +			/* Note this error path leaks resources */
>=20
> I'm not sure why this comment has been added...

The comment was added because there is a real problem and I didn't try
to fix it as doing that without the hardware is hard.

> >  			dev_err(dev, "failed to detach proc, ret =3D %d\n", ret);
>=20
> And why this isn't refactored in the next patch.

the next patch has:

-                       dev_err(dev, "failed to detach proc, ret =3D %d\n",=
 ret);
+                       dev_err(dev, "failed to detach proc (%pe)\n", ERR_P=
TR(ret));

so this is refactored?!

> > -			return ret;
> > +			return 0;
>=20
> Appart from the above I'm good with this patchset.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mkzgdjjptuwjbrop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVnwCEACgkQj4D7WH0S
/k46eQf/X6oiGMirR8YbMxcActut81S9FjappM2UC7Mc+xKm6VPMXBxeJDTOLxS+
m5U+aJin3NrI5g+F2Y65OQu15cdKL/s12/+284MON2wwHQkmf4KclyIuMsxCMZmV
YtaEwomp7bixQl2ZrMg8S7NCt2eEpuAKmK0NJ0n2DWYSyIBuaSaKjvfOwZvVyY8p
170H605NptRcZq4c0R744nGTJ930rqgNRqJUQvA45c9/pOej/uqke8RB+lUo+YST
pS6o52xcKEqNMxOOp9cYjRVoLr25iSimvAn2Lv4cJjWcBYi2qPn1EPKu92ujyGwy
x6FxMrKMrjmmPbnwr6MS73F1Ot7HHw==
=fJLL
-----END PGP SIGNATURE-----

--mkzgdjjptuwjbrop--
