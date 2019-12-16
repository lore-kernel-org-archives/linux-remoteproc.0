Return-Path: <cleger@kalray.eu>
Date: Mon, 16 Dec 2019 11:46:12 +0100 (CET)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Message-ID: <340758118.96812669.1576493172804.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20191210164014.50739-2-paul@crapouillou.net>
References: <20191210164014.50739-1-paul@crapouillou.net> <20191210164014.50739-2-paul@crapouillou.net>
Subject: Re: [PATCH v4 2/5] remoteproc: Add device-managed variants of
 rproc_alloc/rproc_add
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, od <od@zcrc.me>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Paul,

I tested it on our driver and freeing/remove are called correctly on probe =
error and on module removal.

Tested-By: Clement Leger <cleger@kalray.eu>

Regards,

Cl=C3=A9ment

----- On 10 Dec, 2019, at 17:40, Paul Cercueil paul@crapouillou.net wrote:

> Add API functions devm_rproc_alloc() and devm_rproc_add(), which behave
> like rproc_alloc() and rproc_add() respectively, but register their
> respective cleanup function to be called on driver detach.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
>    v3: New patch
>    v4: No change
>=20
> drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++++++++
> include/linux/remoteproc.h           |  5 +++
> 2 files changed, 72 insertions(+)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 307df98347ba..0a9fc7fdd1c3 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1932,6 +1932,33 @@ int rproc_add(struct rproc *rproc)
> }
> EXPORT_SYMBOL(rproc_add);
>=20
> +static void devm_rproc_remove(void *rproc)
> +{
> +=09rproc_del(rproc);
> +}
> +
> +/**
> + * devm_rproc_add() - resource managed rproc_add()
> + * @dev: the underlying device
> + * @rproc: the remote processor handle to register
> + *
> + * This function performs like rproc_add() but the registered rproc devi=
ce will
> + * automatically be removed on driver detach.
> + *
> + * Returns 0 on success and an appropriate error code otherwise.
> + */
> +int devm_rproc_add(struct device *dev, struct rproc *rproc)
> +{
> +=09int err;
> +
> +=09err =3D rproc_add(rproc);
> +=09if (err)
> +=09=09return err;
> +
> +=09return devm_add_action_or_reset(dev, devm_rproc_remove, rproc);
> +}
> +EXPORT_SYMBOL(devm_rproc_add);
> +
> /**
>  * rproc_type_release() - release a remote processor instance
>  * @dev: the rproc's device
> @@ -2149,6 +2176,46 @@ int rproc_del(struct rproc *rproc)
> }
> EXPORT_SYMBOL(rproc_del);
>=20
> +static void devm_rproc_free(struct device *dev, void *res)
> +{
> +=09rproc_free(*(struct rproc **)res);
> +}
> +
> +/**
> + * devm_rproc_alloc() - resource managed rproc_alloc()
> + * @dev: the underlying device
> + * @name: name of this remote processor
> + * @ops: platform-specific handlers (mainly start/stop)
> + * @firmware: name of firmware file to load, can be NULL
> + * @len: length of private data needed by the rproc driver (in bytes)
> + *
> + * This function performs like rproc_alloc() but the acuired rproc devic=
e will
> + * automatically be released on driver detach.
> + *
> + * On success the new rproc is returned, and on failure, NULL.
> + */
> +struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
> +=09=09=09       const struct rproc_ops *ops,
> +=09=09=09       const char *firmware, int len)
> +{
> +=09struct rproc **ptr, *rproc;
> +
> +=09ptr =3D devres_alloc(devm_rproc_free, sizeof(*ptr), GFP_KERNEL);
> +=09if (!ptr)
> +=09=09return ERR_PTR(-ENOMEM);
> +
> +=09rproc =3D rproc_alloc(dev, name, ops, firmware, len);
> +=09if (rproc) {
> +=09=09*ptr =3D rproc;
> +=09=09devres_add(dev, ptr);
> +=09} else {
> +=09=09devres_free(ptr);
> +=09}
> +
> +=09return rproc;
> +}
> +EXPORT_SYMBOL(devm_rproc_alloc);
> +
> /**
>  * rproc_add_subdev() - add a subdevice to a remoteproc
>  * @rproc: rproc handle to add the subdevice to
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..5f201f0c86c3 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -595,6 +595,11 @@ int rproc_add(struct rproc *rproc);
> int rproc_del(struct rproc *rproc);
> void rproc_free(struct rproc *rproc);
>=20
> +struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
> +=09=09=09       const struct rproc_ops *ops,
> +=09=09=09       const char *firmware, int len);
> +int devm_rproc_add(struct device *dev, struct rproc *rproc);
> +
> void rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)=
;
>=20
> struct rproc_mem_entry *
> --
> 2.24.0
