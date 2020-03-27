Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 06/11] remoteproc: stm32: Get coprocessor state
Date: Fri, 27 Mar 2020 16:58:00 +0000
Message-ID: <a1a4d8eb7da0468ea3e7125e0cb2e992@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-7-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-7-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 06/11] remoteproc: stm32: Get coprocessor state
>=20
> Introduce the required mechanic to get the state of the M4 when the
> remoteproc core is initialising.
>=20
> Mainly based on the work published by Arnaud Pouliquen [1].
>=20
> [1]. https://patchwork.kernel.org/project/linux-
> remoteproc/list/?series=3D239877
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 29
> +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 7d5d4a7dbb04..b8af15dd0510 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -38,6 +38,15 @@
>  #define STM32_MBX_VQ1_ID	1
>  #define STM32_MBX_SHUTDOWN	"shutdown"
>=20
> +#define RSC_TBL_SIZE		(1024)
> +
> +#define M4_STATE_OFF		0
> +#define M4_STATE_INI		1
Typo M4_STATE_INI -> M4_STATE_INIT

Else ok for me
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Regards,
Loic

> +#define M4_STATE_CRUN		2
> +#define M4_STATE_CSTOP		3
> +#define M4_STATE_STANDBY	4
> +#define M4_STATE_CRASH		5
> +
>  struct stm32_syscon {
>  	struct regmap *map;
>  	u32 reg;
> @@ -635,12 +644,23 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev,
>  	return 0;
>  }
>=20
> +static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
> +				     unsigned int *state)
> +{
> +	/* See stm32_rproc_parse_dt() */
> +	if (!ddata->m4_state.map)
> +		return -EINVAL;
> +
> +	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg,
> state);
> +}
> +
>  static int stm32_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np =3D dev->of_node;
>  	struct rproc *rproc;
> +	unsigned int state;
>  	bool auto_boot =3D false;
>  	int ret;
>=20
> @@ -660,6 +680,15 @@ static int stm32_rproc_probe(struct platform_device
> *pdev)
>  	if (ret)
>  		goto free_ddata;
>=20
> +	ret =3D stm32_rproc_get_m4_status(ddata, &state);
> +	if (ret) {
> +		/*
> +		 * We couldn't get the coprocessor's state, assume
> +		 * it is not running.
> +		 */
> +		state =3D M4_STATE_OFF;
> +	}
> +
>  	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
>  	if (!rproc) {
>  		ret =3D -ENOMEM;
> --
> 2.20.1
