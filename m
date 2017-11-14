Return-Path: <broonie@sirena.org.uk>
Date: Tue, 14 Nov 2017 15:03:07 +0000
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] hwspinlock: Change hwspinlock to a bool
Message-ID: <20171114150307.4k5kh7ggbrbpj76o@sirena.org.uk>
References: <2d10549b83f8b4990af60a61b44514b47da4c287.1509777293.git.baolin.wang@linaro.org>
 <CAMz4kuKeqOH7m0zx7=rmaBOg5eekw3RZZwsREOJCC0sVotG40g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c6mtsakf345ljrw6"
Content-Disposition: inline
In-Reply-To: <CAMz4kuKeqOH7m0zx7=rmaBOg5eekw3RZZwsREOJCC0sVotG40g@mail.gmail.com>
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>


--c6mtsakf345ljrw6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2017 at 08:58:18PM +0800, Baolin Wang wrote:
> On 4 November 2017 at 14:37, Baolin Wang <baolin.wang@linaro.org> wrote:
> > Change hwspinlock to a bool in case some drivers will meet dependency
> > issue when hwspinlock is built as a module.
> >
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

> Could you apply this patch into K4.15 if there are no other comments? Thanks.

It's in -next already as commit d048236dfdfe454f059a0837431c3ae3d166d4d6
so it ought to get sent during the merge window.

--c6mtsakf345ljrw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloLBaoACgkQJNaLcl1U
h9DyQgf/TFnWo6pXsNSMWMcTYIV1kAplLl/S0wWPuCYaYcI04Kw0sZj6JmboKaqY
QHJKnC50OAl6FkQsDv3uzw/Duto91nCrTsV6Z+rzvyOI0bqZzM/F2MAZz7KrNDwS
s3Q4JII8u+lG+3Cfe45gviW6u67iwUyk6AxZghYaLnYTNTdKbk+uM/IVCf7G6U3X
ce14//4yu6KqnFxMgsxxG1RXHW7YU0cBc7TSAS1CR65ywl5PqfTPOmwVxzAKIvGI
lKPEwXOyflPsQqieVDjR1bDPGZL3qxQSY1U5LXckexaOYdzX7ArwHi1xbFbk2pe4
pMGbdGvGFuCwfNmc8ty20Q7Zfgcoqw==
=qu7i
-----END PGP SIGNATURE-----

--c6mtsakf345ljrw6--
