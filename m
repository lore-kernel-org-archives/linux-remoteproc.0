Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 3/3] remoteproc: Add coredump sysfs attribute
Date: Fri, 17 Apr 2020 07:54:50 +0000
Message-ID: <8b807eab057e4dfabbc48d31cbf0b4cc@SFHDAG7NODE2.st.com>
References: <1587062312-4939-1-git-send-email-rishabhb@codeaurora.org>
 <1587062312-4939-3-git-send-email-rishabhb@codeaurora.org>
In-Reply-To: <1587062312-4939-3-git-send-email-rishabhb@codeaurora.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rishabh Bhatnagar <rishabhb@codeaurora.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>, "tsoni@codeaurora.org" <tsoni@codeaurora.org>, "psodagud@codeaurora.org" <psodagud@codeaurora.org>, "sidgup@codeaurora.org" <sidgup@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rishabh,

> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Rishabh Bhatnagar
> Sent: jeudi 16 avril 2020 20:39
> To: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: bjorn.andersson@linaro.org; ohad@wizery.com;
> mathieu.poirier@linaro.org; tsoni@codeaurora.org;
> psodagud@codeaurora.org; sidgup@codeaurora.org; Rishabh Bhatnagar
> <rishabhb@codeaurora.org>
> Subject: [PATCH 3/3] remoteproc: Add coredump sysfs attribute
>=20
> Add coredump sysfs attribute to configure the type of memory dump.
> User can select between default or inline coredump functionality.
> Also coredump collection can be disabled through this interface.
> This functionality can be configured differently for different
> remote processors.
> This provides an option to dynamically configure the dump type
> based on userpsace capability.
I think this should be under debugfs as it is not link to remoteproc contro=
l but only
to its debug capability. Moreover other fields related to coredump are alre=
ady un debugfs control.

Regards,
Loic
>=20
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 57
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> index 7f8536b..d112664 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -9,6 +9,62 @@
>=20
>  #define to_rproc(d) container_of(d, struct rproc, dev)
>=20
> +/*
> + * A coredump-configuration-to-string lookup table, for exposing a
> + * human readable configuration via sysfs. Always keep in sync with
> + * enum rproc_coredump_conf
> + */
> +static const char * const rproc_coredump_str[] =3D {
> +	[COREDUMP_DEFAULT]	=3D "default",
> +	[COREDUMP_INLINE]	=3D "inline",
> +	[COREDUMP_DISABLED]	=3D "disabled",
> +};
> +
> +/* Expose the current coredump configuration via sysfs */
> +static ssize_t coredump_show(struct device *dev, struct device_attribute
> *attr,
> +			      char *buf)
> +{
> +	struct rproc *rproc =3D to_rproc(dev);
> +
> +	return sprintf(buf, "%s\n", rproc_coredump_str[rproc-
> >coredump_conf]);
> +}
> +
> +/* Change the coredump configuration via sysfs */
> +static ssize_t coredump_store(struct device *dev, struct device_attribut=
e
> *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct rproc *rproc =3D to_rproc(dev);
> +	int err;
> +
> +	err =3D mutex_lock_interruptible(&rproc->lock);
> +	if (err) {
> +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
> +		return -EINVAL;
> +	}
> +
> +	if (rproc->state =3D=3D RPROC_CRASHED) {
> +		dev_err(dev, "can't change coredump configuration\n");
> +		err =3D -EBUSY;
> +		goto out;
> +	}
> +
> +	if (sysfs_streq(buf, "disable"))
> +		rproc->coredump_conf =3D COREDUMP_DISABLED;
> +	else if (sysfs_streq(buf, "inline"))
> +		rproc->coredump_conf =3D COREDUMP_INLINE;
> +	else if (sysfs_streq(buf, "default"))
> +		rproc->coredump_conf =3D COREDUMP_DEFAULT;
> +	else {
> +		dev_err(dev, "Invalid coredump configuration\n");
> +		err =3D -EINVAL;
> +	}
> +out:
> +	mutex_unlock(&rproc->lock);
> +
> +	return err ? err : count;
> +}
> +static DEVICE_ATTR_RW(coredump);
> +
>  /* Expose the loaded / running firmware name via sysfs */
>  static ssize_t firmware_show(struct device *dev, struct device_attribute
> *attr,
>  			  char *buf)
> @@ -127,6 +183,7 @@ static ssize_t name_show(struct device *dev, struct
> device_attribute *attr,
>  	&dev_attr_firmware.attr,
>  	&dev_attr_state.attr,
>  	&dev_attr_name.attr,
> +	&dev_attr_coredump.attr,
>  	NULL
>  };
>=20
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
> a Linux Foundation Collaborative Project
