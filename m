Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 01/11] remoteproc: stm32: Decouple rproc from memory
 translation
Date: Fri, 27 Mar 2020 16:51:46 +0000
Message-ID: <e4a31d5675104d01b002df61c362a626@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-2-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-2-mathieu.poirier@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Mathieu Poirier
> Sent: mardi 24 mars 2020 23:03
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH 01/11] remoteproc: stm32: Decouple rproc from memory
> translation
>=20
> Remove the remote processor from the process of parsing the memory
> ranges since there is no correlation between them.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Thanks Mathieu

Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index a18f88044111..cde4b1a56381 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -127,10 +127,10 @@ static int stm32_rproc_mem_release(struct rproc
> *rproc,
>  	return 0;
>  }
>=20
> -static int stm32_rproc_of_memory_translations(struct rproc *rproc)
> +static int stm32_rproc_of_memory_translations(struct platform_device
> *pdev,
> +					      struct stm32_rproc *ddata)
>  {
> -	struct device *parent, *dev =3D rproc->dev.parent;
> -	struct stm32_rproc *ddata =3D rproc->priv;
> +	struct device *parent, *dev =3D &pdev->dev;
>  	struct device_node *np;
>  	struct stm32_rproc_mem *p_mems;
>  	struct stm32_rproc_mem_ranges *mem_range;
> @@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev)
>=20
>  	rproc->auto_boot =3D of_property_read_bool(np, "st,auto-boot");
>=20
> -	return stm32_rproc_of_memory_translations(rproc);
> +	return stm32_rproc_of_memory_translations(pdev, ddata);
>  }
>=20
>  static int stm32_rproc_probe(struct platform_device *pdev)
> --
> 2.20.1
