Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 04/11] remoteproc: stm32: Remove memory translation from
 DT parsing
Date: Fri, 27 Mar 2020 16:55:22 +0000
Message-ID: <b6e237a293464b85b6591c23cde20cb7@SFHDAG7NODE2.st.com>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-5-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-5-mathieu.poirier@linaro.org>
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
> Subject: [PATCH 04/11] remoteproc: stm32: Remove memory translation
> from DT parsing
>=20
> Other than one has to be done after the other, there is no correlation
> between memory translation and DT parsing.  As move function
> stm32_rproc_of_memory_translations() to stm32_rproc_probe() so that
> stm32_rproc_parse_dt() can be extended to look for synchronisation
> related binding in a clean way.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Thanks Mathieu
=20
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

> ---
>  drivers/remoteproc/stm32_rproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index ca60c917e218..a3e278490bb4 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev,
>=20
>  	*auto_boot =3D of_property_read_bool(np, "st,auto-boot");
>=20
> -	return stm32_rproc_of_memory_translations(pdev, ddata);
> +	return 0;
>  }
>=20
>  static int stm32_rproc_probe(struct platform_device *pdev)
> @@ -630,6 +630,10 @@ static int stm32_rproc_probe(struct platform_device
> *pdev)
>  	if (ret)
>  		goto free_ddata;
>=20
> +	ret =3D stm32_rproc_of_memory_translations(pdev, ddata);
> +	if (ret)
> +		goto free_ddata;
> +
>  	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> sizeof(*ddata));
>  	if (!rproc) {
>  		ret =3D -ENOMEM;
> --
> 2.20.1
