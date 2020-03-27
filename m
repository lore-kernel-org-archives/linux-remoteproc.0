Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 07/11] remoteproc: stm32: Get loaded resource table for
 synchronisation
Date: Fri, 27 Mar 2020 16:59:18 +0000
Message-ID: <8b7a87e685d84b588254b54b5ace5d22@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-8-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-8-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 07/11] remoteproc: stm32: Get loaded resource table for
> synchronisation
>=20
> Get the resource table location when synchronising with the M4 so
> that the remoteproc and rpmsg subsystem can be initialised properly.
>=20
> Mainly based on the work published by Arnaud Pouliquen [1].
>=20
> [1]. https://patchwork.kernel.org/project/linux-
> remoteproc/list/?series=3D239877
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Thanks Mathieu
=20
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

> ---
>  drivers/remoteproc/stm32_rproc.c | 66
> ++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index b8af15dd0510..5bac0baf8f4c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -87,6 +87,7 @@ struct stm32_rproc {
>  	struct stm32_mbox mb[MBOX_NB_MBX];
>  	struct workqueue_struct *workqueue;
>  	bool secured_soc;
> +	void __iomem *rsc_va;
>  };
>=20
>  static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64
> *da)
> @@ -654,6 +655,65 @@ static int stm32_rproc_get_m4_status(struct
> stm32_rproc *ddata,
>  	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg,
> state);
>  }
>=20
> +static int stm32_rproc_da_to_pa(struct platform_device *pdev,
> +				struct stm32_rproc *ddata,
> +				u64 da, phys_addr_t *pa)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct stm32_rproc_mem *p_mem;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ddata->nb_rmems; i++) {
> +		p_mem =3D &ddata->rmems[i];
> +
> +		if (da < p_mem->dev_addr ||
> +		    da >=3D p_mem->dev_addr + p_mem->size)
> +			continue;
> +
> +		*pa =3D da - p_mem->dev_addr + p_mem->bus_addr;
> +		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
> +
> +		return 0;
> +	}
> +
> +	dev_err(dev, "can't translate da %llx\n", da);
> +
> +	return -EINVAL;
> +}
> +
> +static int stm32_rproc_get_loaded_rsc_table(struct platform_device
> *pdev,
> +					    struct stm32_rproc *ddata)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	phys_addr_t rsc_pa;
> +	u32 rsc_da;
> +	int err;
> +
> +	err =3D regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
> +	if (err) {
> +		dev_err(dev, "failed to read rsc tbl addr\n");
> +		return err;
> +	}
> +
> +	if (!rsc_da)
> +		/* no rsc table */
> +		return 0;
> +
> +	err =3D stm32_rproc_da_to_pa(pdev, ddata, rsc_da, &rsc_pa);
> +	if (err)
> +		return err;
> +
> +	ddata->rsc_va =3D devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
> +	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
> +		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +			&rsc_pa, RSC_TBL_SIZE);
> +		ddata->rsc_va =3D NULL;
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
>  static int stm32_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -689,6 +749,12 @@ static int stm32_rproc_probe(struct platform_device
> *pdev)
>  		state =3D M4_STATE_OFF;
>  	}
>=20
> +	if (state =3D=3D M4_STATE_CRUN) {
> +		ret =3D stm32_rproc_get_loaded_rsc_table(pdev, ddata);
> +		if (ret)
> +			goto free_ddata;
> +	}
> +
>  	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
>  	if (!rproc) {
>  		ret =3D -ENOMEM;
> --
> 2.20.1
