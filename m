Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 11/11] remoteproc: stm32: Allocate rproc for
 synchronisation with MCU
Date: Fri, 27 Mar 2020 17:11:37 +0000
Message-ID: <fd4e531aa40b40bcb401268e720cefe6@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-12-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-12-mathieu.poirier@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Mathieu Poirier
> Sent: mardi 24 mars 2020 23:03
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH 11/11] remoteproc: stm32: Allocate rproc for
> synchronisation with MCU
>=20
> Allocate remote processor structure with state machine if the MCU
> has already been started by an external entity.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 07be306c0fb1..f320ef9ee286 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -608,7 +608,7 @@ static struct rproc_ops st_rproc_ops =3D {
>  	.get_boot_addr	=3D rproc_elf_get_boot_addr,
>  };
>=20
> -static __maybe_unused struct rproc_ops st_rproc_sync_ops =3D {
> +static struct rproc_ops st_rproc_sync_ops =3D {
>  	.start		=3D stm32_rproc_sync_start,
>  	.stop		=3D stm32_rproc_sync_stop,
>  	.kick		=3D stm32_rproc_kick,
> @@ -616,6 +616,12 @@ static __maybe_unused struct rproc_ops
> st_rproc_sync_ops =3D {
>  	.find_loaded_rsc_table =3D
> stm32_rproc_sync_elf_find_loaded_rsc_table,
>  };
>=20
> +static struct rproc_sync_states st_sync_states =3D {
> +	.on_init =3D true, /* sync with MCU when the kernel boots */
> +	.after_stop =3D false, /* don't resync with MCU if stopped from sysfs
> */
> +	.after_crash =3D false, /* don't resync with MCU after a crash */
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] =3D {
>  	{ .compatible =3D "st,stm32mp1-m4" },
>  	{},
> @@ -847,15 +853,22 @@ static int stm32_rproc_probe(struct
> platform_device *pdev)
>  		ret =3D stm32_rproc_get_loaded_rsc_table(pdev, ddata);
>  		if (ret)
>  			goto free_ddata;
> +
> +		rproc =3D rproc_alloc_state_machine(dev, np->name,
> &st_rproc_ops,
> +						  &st_rproc_sync_ops,
> +						  &st_sync_states, NULL,
> +						  sizeof(*ddata));
Could we have only one call to rproc_alloc_state_machine(), simply configur=
ing
st_sync_states according to m4_state and other DT properties?

Regards,
Loic
> +	} else {
> +		rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops,
> +				    NULL, sizeof(*ddata));
> +		rproc->auto_boot =3D auto_boot;
>  	}
>=20
> -	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
>  	if (!rproc) {
>  		ret =3D -ENOMEM;
>  		goto free_ddata;
>  	}
>=20
> -	rproc->auto_boot =3D auto_boot;
>  	rproc->has_iommu =3D false;
>  	ddata->workqueue =3D create_workqueue(dev_name(dev));
>  	if (!ddata->workqueue) {
> --
> 2.20.1
