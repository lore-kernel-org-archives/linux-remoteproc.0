Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
 synchronisation when changing state
Date: Fri, 27 Mar 2020 14:04:36 +0000
Message-ID: <c9fb2f50e93b4f8dad43392bf61f736a@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-17-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-17-mathieu.poirier@linaro.org>
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
> Subject: [PATCH v2 16/17] remoteproc: Correctly deal with MCU
> synchronisation when changing state
>=20
> This patch deals with state changes when synchronising with an MCU. More
> specifically it prevents the MCU from being started if it already has bee=
n
> started by another entity.  Similarly it prevents the AP from stopping th=
e
> MCU if it hasn't been given the capability by platform firmware.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 32
> ++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> index 4956577ad4b4..741a3c152b82 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -108,6 +108,29 @@ static ssize_t state_show(struct device *dev, struct
> device_attribute *attr,
>  	return sprintf(buf, "%s\n", rproc_state_string[state]);
>  }
>=20
> +static int rproc_can_shutdown(struct rproc *rproc)
> +{
> +	/* The MCU is not running, obviously an invalid operation. */
> +	if (rproc->state !=3D RPROC_RUNNING)
> +		return false;
> +
> +	/*
> +	 * The MCU is not running (see above) and the remoteproc core is
> the
> +	 * lifecycle manager, no problem calling for a shutdown.
> +	 */
> +	if (!rproc_sync_with_mcu(rproc))
> +		return true;
> +
> +	/*
> +	 * The MCU has been loaded by another entity (see above) and the
> +	 * platform code has _not_ given us the capability of stopping it.
> +	 */
> +	if (!rproc->sync_ops->stop)
> +		return false;

Test could be simplified
if (rproc_sync_with_mcu(rproc)) && !rproc->sync_ops->stop)
	return false;

> +
> +	return true;
> +}
> +
>  /* Change remote processor state via sysfs */
>  static ssize_t state_store(struct device *dev,
>  			      struct device_attribute *attr,
> @@ -120,11 +143,18 @@ static ssize_t state_store(struct device *dev,
>  		if (rproc->state =3D=3D RPROC_RUNNING)
>  			return -EBUSY;
>=20
> +		/*
> +		 * In synchronisation mode, booting the MCU is the
> +		 * responsibility of an external entity.
> +		 */
> +		if (rproc_sync_with_mcu(rproc))
> +			return -EINVAL;
> +
I don't understand this restriction, simply because it is preventing to res=
ynchronize with a
coprocessor after a "stop".
In the following configuration which can be configuration for coprocessor w=
ith romed/flashed
firmware (no reload needed):
on_init =3D true
after_stop =3D true
after_crash =3D true
Once you stop it via sysfs interface, you can't anymore restart/resync to i=
t.

I think it will be better to modify rproc_boot() to take into account rproc=
_sync_with_mcu()
as below:

int rproc_boot(struct rproc *rproc)
 {
-	const struct firmware *firmware_p;
+	const struct firmware *firmware_p =3D NULL;
 	struct device *dev =3D &rproc->dev;
 	int ret;
=20
 	if (!rproc) {
 		pr_err("invalid rproc handle\n");
 		return -EINVAL;
 	}
=20
 	/* load firmware */
-	ret =3D request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		return ret;
+	if (!rproc_sync_with_mcu(rproc)) {
+		ret =3D request_firmware(&firmware_p, rproc->firmware, dev);
+		if (ret < 0) {
+			dev_err(dev, "request_firmware failed: %d\n", ret);
+			return ret;
+		}
 	}
=20
 	ret =3D rproc_actuate(rproc, firmware_p);
=20
-	release_firmware(firmware_p);
+	if (firmware_p)
+		release_firmware(firmware_p);
=20
 	return ret;
 }
=20
Thanks to these modifications, I'm able to resync after a stop with coproce=
ssor without reloading firmware.

>  		ret =3D rproc_boot(rproc);
>  		if (ret)
>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>  	} else if (sysfs_streq(buf, "stop")) {
> -		if (rproc->state !=3D RPROC_RUNNING)
> +		if (!rproc_can_shutdown(rproc))
>  			return -EINVAL;
>=20
>  		rproc_shutdown(rproc);
As rproc shutdown is also accessible as kernel API, I propose to move
rproc_can_shutdown() check inside rproc_shutdown() and to test
returned error

Regards,
Loic
> --
> 2.20.1
