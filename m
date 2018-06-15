Return-Path: <ore@pengutronix.de>
Date: Fri, 15 Jun 2018 18:37:33 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 1/2] imx-rproc: dt: provide new remote-nodes option
Message-ID: <20180615163733.4bmpuag5dbzdqw2n@pengutronix.de>
References: <20180615115731.18424-1-o.rempel@pengutronix.de>
 <6888c986-1e6b-81dd-fb3a-e27218b1785a@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xz5iofmq5d3rx6yj"
Content-Disposition: inline
In-Reply-To: <6888c986-1e6b-81dd-fb3a-e27218b1785a@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, kernel@pengutronix.de, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>


--xz5iofmq5d3rx6yj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnaud,

On Fri, Jun 15, 2018 at 03:21:19PM +0200, Arnaud Pouliquen wrote:
> Hi Oleksij,
>=20
> Nice to see that we have the same needs.
> We push several month ago an RFC based on something similar but i hope
> more generic...
> could you have a look?
>=20
> https://www.spinics.net/lists/linux-remoteproc/msg01823.html

I took a look at dt binding.
It would be really better to not redefine device nodes again.
DT is providing HW description and if it is still the same IP core
then most probably it is still the same from all CPUs. Most probably
there is different interrupt controller and memory offset, but all other
parts should be the same.
In long term it would be great to reduce duplicated information which is
needed to added system developer.

> Could be nice if we could find a generic solution...

I would be happy to have generic solution.=20

> Best Regards
> Arnaud
>=20
> On 06/15/2018 01:57 PM, Oleksij Rempel wrote:
> > On AMP systems we need to make sure that some device
> > nodes are not used by main system and reserved for
> > external system. Some of configuration should be
> > maintained by main system. For example clocks and pins.
> >=20
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/remoteproc/imx-rproc.txt    | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt=
 b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> > index fbcefd965dc4..40bec03e094c 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> > +++ b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> > @@ -15,6 +15,7 @@ Required properties:
> >  Optional properties:
> >  - memory-region		list of phandels to the reserved memory regions.
> >  			(See: ../reserved-memory/reserved-memory.txt)
> > +- remote-nodes		list of device node phandels used by remote system.
> > =20
> >  Example:
> >  	m4_reserved_sysmem1: cm4@80000000 {
> > @@ -25,9 +26,21 @@ Example:
> >  		reg =3D <0x81000000 0x80000>;
> >  	};
> > =20
> > +	/* node reserved for rproc */
> > +	&uart1 {
> > +		assigned-clock-rates =3D <240000000>;
> > +		status =3D "disabled";
> > +	};
> > +
> > +	&gpt2 {
> > +		assigned-clock-rates =3D <24000000>;
> > +		status =3D "disabled";
> > +	};
> > +
> >  	imx7d-cm4 {
> >  		compatible	=3D "fsl,imx7d-cm4";
> >  		memory-region	=3D <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
> >  		syscon		=3D <&src>;
> >  		clocks		=3D <&clks IMX7D_ARM_M4_ROOT_CLK>;
> > +		remote-nodes	=3D <&gpt2>, <&uart1>;
> >  	};
> >=20
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--xz5iofmq5d3rx6yj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlsj60kACgkQdQOiSHVI
77Q1Hwf+L951gzLVCvPrQBo+tuoL5adnGjUrN9X12fD6h4vk0B3Yti0eEeJat82f
SwByfgJfhaCIrTPzL80xwWNLL7fRg1SiqNlRGM/zQrYCI4f+gNlV7DKMkT/ofkNQ
6To7JSR+CnN/ThORl0nP30jJYmGANXngYdPGRWXpxMsBLXfhH1ti6dd/mTCvMuC8
PEUkCkm044t3yXDg69DvA2sAVhTFZMlPXWr33iOKugS5owRHHgpV/b8MVhJ38YZK
yqvu2G3X38vJDzgquvpk8/DxaiR+pQiK2aojgq4sYQC8K6fiu5BKsd60CNuORl5B
X/357VBjYZlHCPv2v7dALXZdl+PkKw==
=BGfj
-----END PGP SIGNATURE-----

--xz5iofmq5d3rx6yj--
