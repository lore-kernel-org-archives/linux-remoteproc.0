Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop ops
 for synchronisation
Date: Fri, 27 Mar 2020 17:04:34 +0000
Message-ID: <cf76679a1a7248df9620aeb2ca659062@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-9-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-9-mathieu.poirier@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 23:03
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop op=
s
> for synchronisation
>=20
> Introduce new start and stop rproc_ops functions to be used when
> synchonising with an MCU.
>=20
> Mainly based on the work published by Arnaud Pouliquen [1].
>=20
> [1]. https://patchwork.kernel.org/project/linux-
> remoteproc/list/?series=3D239877
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 37
> ++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 5bac0baf8f4c..734605a9223e 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -449,6 +449,13 @@ static int stm32_rproc_start(struct rproc *rproc)
>  	return stm32_rproc_set_hold_boot(rproc, true);
>  }
>=20
> +static int stm32_rproc_sync_start(struct rproc *rproc)
> +{
> +	stm32_rproc_add_coredump_trace(rproc);
> +
> +	return stm32_rproc_set_hold_boot(rproc, true);
> +}
> +
>  static int stm32_rproc_stop(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata =3D rproc->priv;
> @@ -489,6 +496,30 @@ static int stm32_rproc_stop(struct rproc *rproc)
>  	return 0;
>  }
>=20
> +static int stm32_rproc_sync_stop(struct rproc *rproc)
> +{
> +	struct stm32_rproc *ddata =3D rproc->priv;
> +	int err;
> +
> +	err =3D stm32_rproc_stop(rproc);
> +	if (err)
> +		return err;
> +
> +	/* update copro state to OFF */
> +	if (ddata->m4_state.map) {
> +		err =3D regmap_update_bits(ddata->m4_state.map,
> +					 ddata->m4_state.reg,
> +					 ddata->m4_state.mask,
> +					 M4_STATE_OFF);
> +		if (err) {
> +			dev_err(&rproc->dev, "failed to set copro state\n");
> +			return err;
> +		}
> +	}
In fact m4_state is updated in following way:
- it is set by Linux when M4 is guarantee, that means only when Linux is st=
opping the M4.
in that case M4 is under reset and m4_state could be updated to M4_STATE_OF=
F
- for all other states, it is M4 responsibility to update m4_state when run=
ning
That means the code above is common to both stm32_rproc_stop() and stm32_rp=
roc_sync_stop().
Only one function is required.

Regards,
Loic
> +
> +	return 0;
> +}
> +
>  static void stm32_rproc_kick(struct rproc *rproc, int vqid)
>  {
>  	struct stm32_rproc *ddata =3D rproc->priv;
> @@ -522,6 +553,12 @@ static struct rproc_ops st_rproc_ops =3D {
>  	.get_boot_addr	=3D rproc_elf_get_boot_addr,
>  };
>=20
> +static __maybe_unused struct rproc_ops st_rproc_sync_ops =3D {
> +	.start		=3D stm32_rproc_sync_start,
> +	.stop		=3D stm32_rproc_sync_stop,
> +	.kick		=3D stm32_rproc_kick,
> +};
> +
>  static const struct of_device_id stm32_rproc_match[] =3D {
>  	{ .compatible =3D "st,stm32mp1-m4" },
>  	{},
> --
> 2.20.1
