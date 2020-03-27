Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 05/11] remoteproc: stm32: Parse syscon that will manage M4
 synchronisation
Date: Fri, 27 Mar 2020 16:56:00 +0000
Message-ID: <871b05657f734e55a877009a9b420ded@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-6-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-6-mathieu.poirier@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 23:03
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH 05/11] remoteproc: stm32: Parse syscon that will manage
> M4 synchronisation
>=20
> Get from the DT the syncon to probe the state of the remote processor
> and the location of the resource table.
>=20
> Mainly based on the work published by Arnaud Pouliquen [1].
>=20
> [1]. https://patchwork.kernel.org/project/linux-
> remoteproc/list/?series=3D239877
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Thanks Mathieu

Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index a3e278490bb4..7d5d4a7dbb04 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -70,6 +70,8 @@ struct stm32_rproc {
>  	struct reset_control *rst;
>  	struct stm32_syscon hold_boot;
>  	struct stm32_syscon pdds;
> +	struct stm32_syscon m4_state;
> +	struct stm32_syscon rsctbl;
>  	int wdg_irq;
>  	u32 nb_rmems;
>  	struct stm32_rproc_mem *rmems;
> @@ -606,6 +608,30 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev,
>=20
>  	*auto_boot =3D of_property_read_bool(np, "st,auto-boot");
>=20
> +	/*
> +	 * See if we can check the M4 status, i.e if it was started
> +	 * from the boot loader or not.
> +	 */
> +        err =3D stm32_rproc_get_syscon(np, "st,syscfg-m4-state",
> +                                     &ddata->m4_state);
> +        if (err) {
> +		/* remember this */
> +		ddata->m4_state.map =3D NULL;
> +                /* no coprocessor state syscon (optional) */
> +                dev_warn(dev, "m4 state not supported\n");
> +
> +		/* no need to go further */
> +		return 0;
> +        }
> +
> +	/* See if we can get the resource table */
> +        err =3D stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl",
> +                                     &ddata->rsctbl);
> +	if (err) {
> +		/* no rsc table syscon (optional) */
> +		dev_warn(dev, "rsc tbl syscon not supported\n");
> +	}
> +
>  	return 0;
>  }
>=20
> --
> 2.20.1
