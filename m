Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
 rproc_alloc()
Date: Fri, 27 Mar 2020 11:05:56 +0000
Message-ID: <d0a399feb0f647ec98841ea8b8339449@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-4-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-4-mathieu.poirier@linaro.org>
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
> Sent: mardi 24 mars 2020 22:46
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
> rproc_alloc()
>=20
> Make the firmware name allocation a function on its own in order to
> introduce more flexibility to function rproc_alloc().
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 62 +++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..c0871f69929b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1962,6 +1962,36 @@ static const struct device_type rproc_type =3D {
>  	.release	=3D rproc_type_release,
>  };
>=20
> +static int rproc_alloc_firmware(struct rproc *rproc,
> +				const char *name, const char *firmware)
> +{
> +	char *p, *template =3D "rproc-%s-fw";
> +	int name_len;
> +
> +	if (!rproc || !name)
> +		return -EINVAL;
> +
> +	if (!firmware) {
> +		/*
> +		 * If the caller didn't pass in a firmware name then
> +		 * construct a default name.
> +		 */
> +		name_len =3D strlen(name) + strlen(template) - 2 + 1;
> +		p =3D kmalloc(name_len, GFP_KERNEL);
> +		if (!p)
> +			return -ENOMEM;
> +		snprintf(p, name_len, template, name);
> +	} else {
> +		p =3D kstrdup(firmware, GFP_KERNEL);
> +		if (!p)
> +			return -ENOMEM;
> +	}
> +
> +	rproc->firmware =3D p;
> +
> +	return 0;
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -1990,42 +2020,24 @@ struct rproc *rproc_alloc(struct device *dev,
> const char *name,
>  			  const char *firmware, int len)
>  {
>  	struct rproc *rproc;
> -	char *p, *template =3D "rproc-%s-fw";
> -	int name_len;
>=20
>  	if (!dev || !name || !ops)
>  		return NULL;
>=20
> -	if (!firmware) {
> -		/*
> -		 * If the caller didn't pass in a firmware name then
> -		 * construct a default name.
> -		 */
> -		name_len =3D strlen(name) + strlen(template) - 2 + 1;
> -		p =3D kmalloc(name_len, GFP_KERNEL);
> -		if (!p)
> -			return NULL;
> -		snprintf(p, name_len, template, name);
> -	} else {
> -		p =3D kstrdup(firmware, GFP_KERNEL);
> -		if (!p)
> -			return NULL;
> -	}
> -
>  	rproc =3D kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> -	if (!rproc) {
> -		kfree(p);
> +	if (!rproc)
>  		return NULL;
> -	}
> +
> +	if (rproc_alloc_firmware(rproc, name, firmware))
> +		goto free_rproc;
>=20
>  	rproc->ops =3D kmemdup(ops, sizeof(*ops), GFP_KERNEL);
>  	if (!rproc->ops) {
> -		kfree(p);
> +		kfree(rproc->firmware);
>  		kfree(rproc);
Small remark only for patch coherency, as it is modified in next patches.
Use free_rproc label which is introduced just below here for error manageme=
nt.

Regards,
Loic
>  		return NULL;
>  	}
>=20
> -	rproc->firmware =3D p;
>  	rproc->name =3D name;
>  	rproc->priv =3D &rproc[1];
>  	rproc->auto_boot =3D true;
> @@ -2073,6 +2085,10 @@ struct rproc *rproc_alloc(struct device *dev, cons=
t
> char *name,
>  	rproc->state =3D RPROC_OFFLINE;
>=20
>  	return rproc;
> +
> +free_rproc:
> +	kfree(rproc);
> +	return NULL;
>  }
>  EXPORT_SYMBOL(rproc_alloc);
>=20
> --
> 2.20.1
