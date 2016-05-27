Return-Path: <broonie@sirena.org.uk>
Date: Fri, 27 May 2016 18:14:03 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20160527171403.GN16172@sirena.org.uk>
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
 <1464192412-16386-12-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tzZdJ4yHDV5r1Akt"
Content-Disposition: inline
In-Reply-To: <1464192412-16386-12-git-send-email-peter.griffin@linaro.org>
Subject: Re: [PATCH v4 10/18] ASoC: sti: Update DT example to match the
 driver code
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, arnd@arndb.de, lee.jones@linaro.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>


--tzZdJ4yHDV5r1Akt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 25, 2016 at 05:06:44PM +0100, Peter Griffin wrote:
> uniperiph-id, version and mode are ST specific bindings and
> need the 'st,' prefix. Update the examples, as otherwise copying
> them yields a runtime error parsing the DT node.

You've not copied me on the rest of the series so I've no idea what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

--tzZdJ4yHDV5r1Akt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXSIBaAAoJECTWi3JdVIfQyvAH/0exw8qQkzKGHkSmJaZqrYAl
Q3DblTHqfcDeTVF3Fov8JIYeShY1FzoyRsqgW1wut9w5gjJN5imLcqn0nuo7Xvr4
o3OBd4fmdFqWFkn80TZuRRj6Tj5fX7uRKFaav/goc09jRxBdCk5KMwjuafut6Ndn
TQRc5PX848/BxgDg5flIdfuTTv/A5hqwXtvJ6IAd10f5OtgT0mnvRaXu48EDBQLN
22c4zsEeovaaY1JQrG6BQRdN7ZcgJwKwOcYhJgTmGyB9c6wZp+dmmKuGziCfIsuZ
GXeBUmG9kkd1RFs3oZmdheq+thpmojTYrBeIRr85nw/G10+V1am1QmpGZAmRm64=
=Ss2t
-----END PGP SIGNATURE-----

--tzZdJ4yHDV5r1Akt--
