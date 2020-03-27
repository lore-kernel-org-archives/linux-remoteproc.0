Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 08/17] remoteproc: Allocate synchronisation state
 machine
Date: Fri, 27 Mar 2020 13:47:21 +0000
Message-ID: <e89d9859f4324cf59b0ae6787775d8f5@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-9-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-9-mathieu.poirier@linaro.org>
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
> Subject: [PATCH v2 08/17] remoteproc: Allocate synchronisation state
> machine
>=20
> This patch allocates a synchronisation state machine, either provided or
> not by users, in order to enact the proper behavior requested by the
> platform or specific scenarios.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 59
> +++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 02dbb826aa29..1578a9c70422 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1955,6 +1955,7 @@ static void rproc_type_release(struct device *dev)
>  	kfree(rproc->firmware);
>  	kfree(rproc->ops);
>  	kfree(rproc->sync_ops);
> +	kfree(rproc->sync_states);
>  	kfree(rproc);
>  }
>=20
> @@ -2035,6 +2036,59 @@ static int rproc_alloc_sync_ops(struct rproc *rpro=
c,
>  	return 0;
>  }
>=20
> +static int rproc_alloc_sync_states(struct rproc *rproc,
> +				   const struct rproc_ops *boot_ops,
> +				   const struct rproc_ops *sync_ops,
> +				   struct rproc_sync_states *sync_states)
> +{
> +	struct rproc_sync_states *st;
> +
> +	/* At least one set of operation is needed */
> +	if (!boot_ops && !sync_ops)
> +		return -EINVAL;
> +
> +	/* We have a synchronisation state machine, no need to build one */
> +	if (sync_states) {
> +		st =3D kmemdup(sync_states, sizeof(*st), GFP_KERNEL);
> +		if (!st)
> +			return -ENOMEM;
> +

I think a check between sync_states and boot_ops/sync_ops may be needed her=
e
even if it is platform driver responsibility to provide coherent configurat=
ion
As soon as one of the sync_states is set at true, sync_ops must be provided
As soon as one of the sync_states is set at false, boot_ops must be provide=
d

Regards,
Loic

> +		/* Nothing else to do */
> +		goto out;
> +	}
> +
> +	/* Allocate synchronisation state machine */
> +	st =3D kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	/*
> +	 * We have a boot_ops and no sync_ops - build a state machine that
> +	 * does _not_ synchronise with an MCU.
> +	 */
> +	if (boot_ops && !sync_ops) {
> +		st->on_init =3D st->after_stop =3D st->after_crash =3D false;
> +		goto out;
> +	}
> +
> +	/*
> +	 * We have a sync_ops and an no boot_ops - build a state machine
> that
> +	 * _only_ synchronises with an MCU.
> +	 */
> +	if (sync_ops && !boot_ops) {
> +		st->on_init =3D st->after_stop =3D st->after_crash =3D true;
> +		goto out;
> +	}
> +
> +out:
> +	rproc->sync_with_mcu =3D st->on_init;
> +	/* And the synchronisation state machine to use */
> +	rproc->sync_states =3D st;
> +	/* Tell the core what to do when initialising */
> +	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_INIT);
> +	return 0;
> +}
> +
>  static int rproc_alloc_internals(struct rproc *rproc, const char *name,
>  				 const struct rproc_ops *boot_ops,
>  				 const struct rproc_ops *sync_ops,
> @@ -2065,7 +2119,10 @@ static int rproc_alloc_internals(struct rproc *rpr=
oc,
> const char *name,
>  			return ret;
>  	}
>=20
> -	return 0;
> +	/* Finally allocate the synchronisation state machine */
> +	ret =3D rproc_alloc_sync_states(rproc, boot_ops, sync_ops,
> sync_states);
> +
> +	return ret;
>  }
>=20
>  /**
> --
> 2.20.1
