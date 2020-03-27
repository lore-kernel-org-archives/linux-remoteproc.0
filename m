Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 09/11] remoteproc: stm32: Introduce new parse fw ops for
 synchronisation
Date: Fri, 27 Mar 2020 17:05:00 +0000
Message-ID: <4a653bbeb4b14c41ad2fa9eae9cb140b@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-10-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-10-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 09/11] remoteproc: stm32: Introduce new parse fw ops for
> synchronisation
>=20
> Introduce new parse firmware rproc_ops functions to be used when
> synchonising with an MCU.
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
>  drivers/remoteproc/stm32_rproc.c | 49
> +++++++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 734605a9223e..4268d71f191d 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -215,7 +215,34 @@ static int stm32_rproc_elf_load_rsc_table(struct
> rproc *rproc,
>  	return 0;
>  }
>=20
> -static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmwa=
re
> *fw)
> +static int stm32_rproc_sync_elf_load_rsc_table(struct rproc *rproc,
> +					       const struct firmware *fw)
> +{
> +	struct resource_table *table =3D NULL;
> +	struct stm32_rproc *ddata =3D rproc->priv;
> +
> +	if (ddata->rsc_va) {
> +		table =3D (struct resource_table *)ddata->rsc_va;
> +		/* Assuming that the resource table fits in 1kB is fair */
> +		rproc->cached_table =3D kmemdup(table, RSC_TBL_SIZE,
> GFP_KERNEL);
> +		if (!rproc->cached_table)
> +			return -ENOMEM;
> +
> +		rproc->table_ptr =3D rproc->cached_table;
> +		rproc->table_sz =3D RSC_TBL_SIZE;
> +		return 0;
> +	}
> +
> +	rproc->cached_table =3D NULL;
> +	rproc->table_ptr =3D NULL;
> +	rproc->table_sz =3D 0;
> +
> +	dev_warn(&rproc->dev, "no resource table found for this
> firmware\n");
> +	return 0;
> +}
> +
> +static int stm32_rproc_parse_memory_regions(struct rproc *rproc,
> +					    const struct firmware *fw)
>  {
>  	struct device *dev =3D rproc->dev.parent;
>  	struct device_node *np =3D dev->of_node;
> @@ -268,9 +295,28 @@ static int stm32_rproc_parse_fw(struct rproc *rproc,
> const struct firmware *fw)
>  		index++;
>  	}
>=20
> +	return 0;
> +}
> +
> +static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmwa=
re
> *fw)
> +{
> +	int ret =3D stm32_rproc_parse_memory_regions(rproc, fw);
> +	if (ret)
> +		return ret;
> +
>  	return stm32_rproc_elf_load_rsc_table(rproc, fw);
>  }
>=20
> +static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
> +				     const struct firmware *fw)
> +{
> +	int ret =3D stm32_rproc_parse_memory_regions(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
> +}
> +
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev =3D data;
> @@ -557,6 +603,7 @@ static __maybe_unused struct rproc_ops
> st_rproc_sync_ops =3D {
>  	.start		=3D stm32_rproc_sync_start,
>  	.stop		=3D stm32_rproc_sync_stop,
>  	.kick		=3D stm32_rproc_kick,
> +	.parse_fw	=3D stm32_rproc_sync_parse_fw,
>  };
>=20
>  static const struct of_device_id stm32_rproc_match[] =3D {
> --
> 2.20.1
