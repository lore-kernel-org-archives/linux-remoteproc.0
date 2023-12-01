Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E932910D7
	for <linux-remoteproc@vger.kernel.org>; Fri,  1 Dec 2023 00:39:25 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8z3N-0001Qw-Fm; Fri, 01 Dec 2023 09:39:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8z3M-00CoWO-QK; Fri, 01 Dec 2023 09:39:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8z3M-00C4ci-Gu; Fri, 01 Dec 2023 09:39:16 +0100
Date: Fri, 1 Dec 2023 09:39:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Hari Nagalla <hnagalla@ti.com>, Nishanth Menon <nm@ti.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/3] remoteproc: k3-dsp: Suppress duplicate error message
 in .remove()
Message-ID: <20231201083916.5r7e3mv3dymgqcbo@pengutronix.de>
References: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
 <20231123211657.518181-6-u.kleine-koenig@pengutronix.de>
 <CANLsYky5tL6UZADgVBPEnPkN4GMKOhvn95oci7PywSZ2nyNXqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b3w4g3dnrvo4eo3b"
Content-Disposition: inline
In-Reply-To: <CANLsYky5tL6UZADgVBPEnPkN4GMKOhvn95oci7PywSZ2nyNXqg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org


--b3w4g3dnrvo4eo3b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 30, 2023 at 10:19:42AM -0700, Mathieu Poirier wrote:
> Hari and Nishanth,
>=20
> On Thu, 23 Nov 2023 at 14:17, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > When the remove callback returns non-zero, the driver core emits an
> > error message about the error value being ignored. As the driver already
> > emits an error message already, return zero. This has no effect apart
> > from suppressing the core's message. The platform device gets unbound
> > irrespective of the return value.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remote=
proc/ti_k3_dsp_remoteproc.c
> > index ef8415a7cd54..40a5fd8763fa 100644
> > --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > @@ -835,8 +835,9 @@ static int k3_dsp_rproc_remove(struct platform_devi=
ce *pdev)
> >         if (rproc->state =3D=3D RPROC_ATTACHED) {
> >                 ret =3D rproc_detach(rproc);
> >                 if (ret) {
> > +                       /* Note this error path leaks resources */
> >                         dev_err(dev, "failed to detach proc, ret =3D %d=
\n", ret);
> > -                       return ret;
> > +                       return 0;
>=20
> Please have a look at this error path.  As with the scenario where the
> remote processor is controlled by the remoteproc core, nothing can be
> done in .remove() to prevent the driver from going away.  As such and
> even if rproc_detach() fails, other resources associated with this
> remote processor should be cleaned-up.

Without having done a deep dive into the driver and the remoteproc core
I think the remoteproc core should provide a function that deregisters
the software representation of a rproc device and returns void.

If you look at rproc_detach, that can even fail if it doesn't get the
mutex.

So I'm convinced there is something to do on the framework level before
removing the ti_k3_dsp_remoteproc driver can be done without leaking
stuff.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--b3w4g3dnrvo4eo3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVpm7MACgkQj4D7WH0S
/k5D2Af+MGBwZYsuWlVcJDwxNYYPnoKbMxfKb2bhO+EAsWV+jGcOj/+zfVOQ4T9M
wsIRzlOM4EyQcVV45xMFWFiL9vsziUOveuwwct7RaqUefGl33slIgOKsHljKh4LD
oWc3kNr2GemH20qjB0uTclXcMXx2UT7ETYJqGs/erGegCLgFC4W9qbkMblx6laIK
jcEBadpTBjDsYeXZ2RuuHfBiMClkQ8xVd296q+WnkOvU6+JATdN2iYXiw+4ICC1c
IibagYOWgIYwTmf4mAKTJU6n6KTJkOszdCVXmeVczrFYl7YsDWlPozTEJCPDcXD8
W9DTtzNRm3PuvMt6HyjPWqrDVOTqwg==
=n3ai
-----END PGP SIGNATURE-----

--b3w4g3dnrvo4eo3b--
