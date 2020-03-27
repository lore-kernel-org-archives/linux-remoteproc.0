Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
 synchronisation when changing FW image
Date: Fri, 27 Mar 2020 13:50:18 +0000
Message-ID: <91d38ff6a39f4e07838d1e85c392eb8f@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-16-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-16-mathieu.poirier@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 22:46
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH v2 15/17] remoteproc: Correctly deal with MCU
> synchronisation when changing FW image
>=20
> This patch prevents the firmware image from being displayed or changed
> when
> the remoteproc core is synchronising with an MCU. This is needed since
> there is no guarantee about the nature of the firmware image that is load=
ed
> by the external entity.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 25
> ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> index 7f8536b73295..4956577ad4b4 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -13,9 +13,20 @@
>  static ssize_t firmware_show(struct device *dev, struct device_attribute
> *attr,
>  			  char *buf)
>  {
> +	ssize_t ret;
>  	struct rproc *rproc =3D to_rproc(dev);
>=20
> -	return sprintf(buf, "%s\n", rproc->firmware);
> +	/*
> +	 * In most instances there is no guarantee about the firmware
> +	 * that was loaded by the external entity.  As such simply don't
> +	 * print anything.
> +	 */
> +	if (rproc_sync_with_mcu(rproc))
> +		ret =3D sprintf(buf, "\n");
Is it enough to provide empty name, or should we add a message to indicate =
that's name is unkown/undefined ?

Regards,
Loic
> +	else
> +		ret =3D sprintf(buf, "%s\n", rproc->firmware);
> +
> +	return ret;
>  }
>=20
>  /* Change firmware name via sysfs */
> @@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
>  		return -EINVAL;
>  	}
>=20
> +	/*
> +	 * There is no point in trying to change the firmware if the MCU
> +	 * is currently running or if loading of the image is done by
> +	 * another entity.
> +	 */
> +	if (rproc_sync_with_mcu(rproc)) {
> +		dev_err(dev,
> +			"can't change firmware while synchronising with
> MCU\n");
> +		err =3D -EBUSY;
> +		goto out;
> +	}
> +
>  	if (rproc->state !=3D RPROC_OFFLINE) {
>  		dev_err(dev, "can't change firmware while running\n");
>  		err =3D -EBUSY;
> --
> 2.20.1
