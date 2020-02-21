Return-Path: <ore@pengutronix.de>
Date: Fri, 21 Feb 2020 07:51:40 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
Message-ID: <20200221065140.mn4wxk5c2xayqwan@pengutronix.de>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r3mvuywgdhewmqq6"
Content-Disposition: inline
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
To: peng.fan@nxp.com
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>


--r3mvuywgdhewmqq6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peng,

i can't apply your patches on kernel master HEAD. Do I need some
extras?

Please add me to CC for this driver next time.

On Wed, Feb 19, 2020 at 03:27:36PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> This patchset aim to replace NXP vendor imx_rpmsg.c driver.
>=20
> This patchset is tested with Loic PALLARDY's patch
> "remoteproc: add support for co-processor loaded and booted before kernel"
> https://patchwork.kernel.org/patch/11265869/,
> and inspried from st's remoteproc early boot support.
> Since Loic's patch is still under review, just expect your comments :)
>=20
> Patch [1,2]/9: dt-bindings convert to json and new SoC support
> Patch 3/9: skip firmware load when recovery. To i.MX8, firmware is not
>            handled by Linux.
>=20
> Patch [4-9]/9: i.MX specific part to support rpmsg/virtio with mbox.
>       because NXP release image not have resoure table, so add resource
>       table in dts
>=20
> My test dts diff for i.MX8QXP MEK, but I have tested this patchset
> for i.MX8QXP MEK, i.MX8MM EVK, i.MX7ULP EVK:
>=20
> +
> +	imx8x-cm4 {
> +		compatible =3D "fsl,imx8qxp-cm4";
> +		rsrc-table =3D <
> +			0x1 0x2 0x0 0x0 0x18 0x5c
> +			3
> +			/*fw_rsc_vdev*/
> +			7 0 1 0 0 0x200
> +			/*fw_rsc_vdev_vring*/
> +			0x90000000 4096 256 1 0
> +			0x90008000 4096 256 2 0
> +			3
> +			/*fw_rsc_vdev*/
> +			7 1 1 0 0 0x200
> +			/*fw_rsc_vdev_vring*/
> +			0x90010000 4096 256 1 0
> +			0x90018000 4096 256 2 0
> +		>;
> +		early-booted;
> +		mbox-names =3D "tx", "rx", "rxdb";
> +		mboxes =3D <&lsio_mu5 0 1
> +			  &lsio_mu5 1 1
> +			  &lsio_mu5 3 1>;
> +		mub-partition =3D <3>;
> +		memory-region =3D <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>,
> +				<&vdev1vring0>, <&vdev1vring1>, <&vdev0buffer>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		vdev0vring0: vdev0vring0@90000000 {
> +                       compatible =3D "shared-dma-pool";
> +			reg =3D <0 0x90000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@90008000 {
> +                       compatible =3D "shared-dma-pool";
> +			reg =3D <0 0x90008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: vdev1vring0@90010000 {
> +                       compatible =3D "shared-dma-pool";
> +			reg =3D <0 0x90010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: vdev1vring1@90018000 {
> +                       compatible =3D "shared-dma-pool";
> +			reg =3D <0 0x90018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer {
> +                       compatible =3D "shared-dma-pool";
> +			reg =3D <0 0x90400000 0 0x100000>;
> +			no-map;
> +		};
> +	};
> +
>=20
> Peng Fan (9):
>   dt-bindings: remoteproc: Convert imx-rproc to json-schema
>   dt-bindings: remoteproc: imx-rproc: support i.MX[8,8M,7ULP]
>   remoteproc: add support to skip firmware load when recovery
>   remoteproc: imx_rproc: surport early booted remote processor
>   remoteproc: imx_rproc: parse early-booted property
>   remoteproc: imx_proc: enable virtio/mailbox
>   remoteproc: imx_rproc: add i.MX8QM/QXP
>   remoteproc: imx_rproc: support i.MX7ULP
>   remoteproc: imx_rproc: add i.MX8MM support
>=20
>  .../devicetree/bindings/remoteproc/imx-rproc.txt   |  33 --
>  .../devicetree/bindings/remoteproc/imx-rproc.yaml  |  95 +++++
>  drivers/remoteproc/imx_rproc.c                     | 455 +++++++++++++++=
++++--
>  drivers/remoteproc/remoteproc_core.c               |  19 +-
>  include/linux/remoteproc.h                         |   1 +
>  5 files changed, 531 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rpro=
c.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rpro=
c.yaml
>=20
> --=20
> 2.16.4
>=20
>=20
>=20

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--r3mvuywgdhewmqq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEERBNZvwSgvmcMY/T74omh9DUaUbMFAl5PffgACgkQ4omh9DUa
UbMWkA//dIL2GgJzXR5afPwRrdvi0TCi5UXzzaX2RR4Up15wPHZC+lNzmH5yOBo+
lDWxKth8CuPMk26g7x+WkrIZvJM8Hbdk/0Y1csnEWTt7IMf4o+FHec5XoJ8WCIIw
ZEBSbytGL2AIfZCAUJ9J2PK64ZHW37HMgeI5S2t92wn7bV49OPEmR77vzevLZM/y
FBORX6zWFKvWgXj0ulMaGU6q8/67ZSjoAqcyDkCMMhF7AQplT3yyy1FAgNKNFy5p
N+W60csZiCMQHza7jYQmovsv2tgBSEYxCYmw2BYglQTDeTK9dolDTlJ+rCQNWR8u
7Mzj+PUX/jyeHZBSQ9Irkg+sHgbzjsPVkb8+U5DOpHa6IBi3oV6aKkwFGp/agfhd
7ZVI1bk02clGnM14/AypY1zogzHwo2CkMMXN0bOXFre72YMdNGLo42Op7Cq3tJ+N
lejlAFc71+/DBjBxwSbUpuXqKt4TAZX8MD5vPmryEcFMPlSMdyftOQ6r7hhx/vNZ
Svg8RI21V7HBsNfB3NlcqTjDXBK/cCVrgOSzzR3FDLq2EkmIBDvx4jHdteTwrsJO
S1Mc2C3c1o1/WUnJAjyuuK/pl2wT4vrE5eaom9REedveO0BI8azwfzcfy8bxg5ei
Xkc3/us2iWNeux1/x/V9wlrfcV4kpHnKtkDfvZP4vx5iSH0q2ak=
=KJgP
-----END PGP SIGNATURE-----

--r3mvuywgdhewmqq6--
