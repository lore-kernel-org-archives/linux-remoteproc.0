Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 4/8] remoteproc: Merge rproc_ops and rproc_fw_ops
Date: Mon, 8 Jan 2018 21:03:50 +0000
Message-ID: <04d831f8622548338f4b4cbe8abaed89@SFHDAG7NODE2.st.com>
References: <20180105235805.9948-1-bjorn.andersson@linaro.org>
 <20180105235805.9948-5-bjorn.andersson@linaro.org>
In-Reply-To: <20180105235805.9948-5-bjorn.andersson@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Saturday, January 06, 2018 12:58 AM
> To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Loic
> PALLARDY <loic.pallardy@st.com>
> Subject: [PATCH v2 4/8] remoteproc: Merge rproc_ops and rproc_fw_ops
>=20
> There are currently a few different schemes used for overriding fw_ops
> or parts of fw_ops. Merge fw_ops into rproc_ops and expose the default
> ELF-loader symbols so that they can be assigned by the drivers.
>=20
> To keep backwards compatibility with the "default" case, a driver not
> specifying the "load" operation is assumed to want the full ELF-loader
> suit of functions.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>=20
> Changes since v1:
> - Fill load, sanity_check and get_boot_addr for st_slim
>=20
>  drivers/remoteproc/qcom_adsp_pil.c         |  9 ++----
>  drivers/remoteproc/qcom_q6v5_pil.c         |  9 ++----
>  drivers/remoteproc/qcom_wcnss.c            |  9 ++----
>  drivers/remoteproc/remoteproc_core.c       | 10 ++++--
>  drivers/remoteproc/remoteproc_elf_loader.c | 30 +++++++-----------
>  drivers/remoteproc/remoteproc_internal.h   | 51 +++++++++++-------------=
--
> ----
>  drivers/remoteproc/st_slim_rproc.c         | 22 ++++---------
>  include/linux/remoteproc.h                 | 17 ++++++++--
>  8 files changed, 67 insertions(+), 90 deletions(-)
>=20
> diff --git a/drivers/remoteproc/qcom_adsp_pil.c
> b/drivers/remoteproc/qcom_adsp_pil.c
> index 3f6af54dbc96..56156c12bd73 100644
> --- a/drivers/remoteproc/qcom_adsp_pil.c
> +++ b/drivers/remoteproc/qcom_adsp_pil.c
> @@ -85,11 +85,6 @@ static int adsp_load(struct rproc *rproc, const struct
> firmware *fw)
>  			     adsp->mem_region, adsp->mem_phys, adsp-
> >mem_size);
>  }
>=20
> -static const struct rproc_fw_ops adsp_fw_ops =3D {
> -	.find_rsc_table =3D qcom_mdt_find_rsc_table,
> -	.load =3D adsp_load,
> -};
> -
>  static int adsp_start(struct rproc *rproc)
>  {
>  	struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;
> @@ -182,6 +177,8 @@ static const struct rproc_ops adsp_ops =3D {
>  	.start =3D adsp_start,
>  	.stop =3D adsp_stop,
>  	.da_to_va =3D adsp_da_to_va,
> +	.find_rsc_table =3D qcom_mdt_find_rsc_table,
> +	.load =3D adsp_load,
>  };
>=20
>  static irqreturn_t adsp_wdog_interrupt(int irq, void *dev)
> @@ -344,8 +341,6 @@ static int adsp_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>=20
> -	rproc->fw_ops =3D &adsp_fw_ops;
> -
>  	adsp =3D (struct qcom_adsp *)rproc->priv;
>  	adsp->dev =3D &pdev->dev;
>  	adsp->rproc =3D rproc;
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c
> b/drivers/remoteproc/qcom_q6v5_pil.c
> index 8a3fa2bcc9f6..3ea668d9fd4c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -342,11 +342,6 @@ static int q6v5_load(struct rproc *rproc, const stru=
ct
> firmware *fw)
>  	return 0;
>  }
>=20
> -static const struct rproc_fw_ops q6v5_fw_ops =3D {
> -	.find_rsc_table =3D q6v5_find_rsc_table,
> -	.load =3D q6v5_load,
> -};
> -
>  static int q6v5_rmb_pbl_wait(struct q6v5 *qproc, int ms)
>  {
>  	unsigned long timeout;
> @@ -931,6 +926,8 @@ static const struct rproc_ops q6v5_ops =3D {
>  	.start =3D q6v5_start,
>  	.stop =3D q6v5_stop,
>  	.da_to_va =3D q6v5_da_to_va,
> +	.find_rsc_table =3D q6v5_find_rsc_table,
> +	.load =3D q6v5_load,
>  };
>=20
>  static irqreturn_t q6v5_wdog_interrupt(int irq, void *dev)
> @@ -1150,8 +1147,6 @@ static int q6v5_probe(struct platform_device
> *pdev)
>  		return -ENOMEM;
>  	}
>=20
> -	rproc->fw_ops =3D &q6v5_fw_ops;
> -
>  	qproc =3D (struct q6v5 *)rproc->priv;
>  	qproc->dev =3D &pdev->dev;
>  	qproc->rproc =3D rproc;
> diff --git a/drivers/remoteproc/qcom_wcnss.c
> b/drivers/remoteproc/qcom_wcnss.c
> index c7686393d505..e53fc6f268fc 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -156,11 +156,6 @@ static int wcnss_load(struct rproc *rproc, const str=
uct
> firmware *fw)
>  			     wcnss->mem_region, wcnss->mem_phys, wcnss-
> >mem_size);
>  }
>=20
> -static const struct rproc_fw_ops wcnss_fw_ops =3D {
> -	.find_rsc_table =3D qcom_mdt_find_rsc_table,
> -	.load =3D wcnss_load,
> -};
> -
>  static void wcnss_indicate_nv_download(struct qcom_wcnss *wcnss)
>  {
>  	u32 val;
> @@ -313,6 +308,8 @@ static const struct rproc_ops wcnss_ops =3D {
>  	.start =3D wcnss_start,
>  	.stop =3D wcnss_stop,
>  	.da_to_va =3D wcnss_da_to_va,
> +	.find_rsc_table =3D qcom_mdt_find_rsc_table,
> +	.load =3D wcnss_load,
>  };
>=20
>  static irqreturn_t wcnss_wdog_interrupt(int irq, void *dev)
> @@ -492,8 +489,6 @@ static int wcnss_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>=20
> -	rproc->fw_ops =3D &wcnss_fw_ops;
> -
>  	wcnss =3D (struct qcom_wcnss *)rproc->priv;
>  	wcnss->dev =3D &pdev->dev;
>  	wcnss->rproc =3D rproc;
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index dbf685dbafcf..2c669a73e77d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1437,8 +1437,14 @@ struct rproc *rproc_alloc(struct device *dev, cons=
t
> char *name,
>=20
>  	atomic_set(&rproc->power, 0);
>=20
> -	/* Set ELF as the default fw_ops handler */
> -	rproc->fw_ops =3D &rproc_elf_fw_ops;
> +	/* Default to ELF loader if no load function is specified */
> +	if (!rproc->ops->load) {
> +		rproc->ops->load =3D rproc_elf_load_segments;
> +		rproc->ops->find_rsc_table =3D rproc_elf_find_rsc_table;
> +		rproc->ops->find_loaded_rsc_table =3D
> rproc_elf_find_loaded_rsc_table;
> +		rproc->ops->sanity_check =3D rproc_elf_sanity_check;
> +		rproc->ops->get_boot_addr =3D rproc_elf_get_boot_addr;
> +	}
>=20
Hi Bjorn,

Code looks good. I'll tested by end of the week, when I'll be back to the o=
ffice.

Regards,
Loic
>  	mutex_init(&rproc->lock);
>=20
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> b/drivers/remoteproc/remoteproc_elf_loader.c
> index c523983a4aec..822fa1bf893f 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -39,8 +39,7 @@
>   *
>   * Make sure this fw image is sane.
>   */
> -static int
> -rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
> +int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *f=
w)
>  {
>  	const char *name =3D rproc->firmware;
>  	struct device *dev =3D &rproc->dev;
> @@ -98,6 +97,7 @@ rproc_elf_sanity_check(struct rproc *rproc, const struc=
t
> firmware *fw)
>=20
>  	return 0;
>  }
> +EXPORT_SYMBOL(rproc_elf_sanity_check);
>=20
>  /**
>   * rproc_elf_get_boot_addr() - Get rproc's boot address.
> @@ -110,13 +110,13 @@ rproc_elf_sanity_check(struct rproc *rproc, const
> struct firmware *fw)
>   * Note that the boot address is not a configurable property of all remo=
te
>   * processors. Some will always boot at a specific hard-coded address.
>   */
> -static
>  u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware
> *fw)
>  {
>  	struct elf32_hdr *ehdr  =3D (struct elf32_hdr *)fw->data;
>=20
>  	return ehdr->e_entry;
>  }
> +EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>=20
>  /**
>   * rproc_elf_load_segments() - load firmware segments to memory
> @@ -142,8 +142,7 @@ u32 rproc_elf_get_boot_addr(struct rproc *rproc,
> const struct firmware *fw)
>   * directly allocate memory for every segment/resource. This is not yet
>   * supported, though.
>   */
> -static int
> -rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
> +int rproc_elf_load_segments(struct rproc *rproc, const struct firmware
> *fw)
>  {
>  	struct device *dev =3D &rproc->dev;
>  	struct elf32_hdr *ehdr;
> @@ -207,6 +206,7 @@ rproc_elf_load_segments(struct rproc *rproc, const
> struct firmware *fw)
>=20
>  	return ret;
>  }
> +EXPORT_SYMBOL(rproc_elf_load_segments);
>=20
>  static struct elf32_shdr *
>  find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
> @@ -282,9 +282,9 @@ find_table(struct device *dev, struct elf32_hdr *ehdr=
,
> size_t fw_size)
>   * size into @tablesz. If a valid table isn't found, NULL is returned
>   * (and @tablesz isn't set).
>   */
> -static struct resource_table *
> -rproc_elf_find_rsc_table(struct rproc *rproc, const struct firmware *fw,
> -			 int *tablesz)
> +struct resource_table *rproc_elf_find_rsc_table(struct rproc *rproc,
> +						const struct firmware *fw,
> +						int *tablesz)
>  {
>  	struct elf32_hdr *ehdr;
>  	struct elf32_shdr *shdr;
> @@ -303,6 +303,7 @@ rproc_elf_find_rsc_table(struct rproc *rproc, const
> struct firmware *fw,
>=20
>  	return table;
>  }
> +EXPORT_SYMBOL(rproc_elf_find_rsc_table);
>=20
>  /**
>   * rproc_elf_find_loaded_rsc_table() - find the loaded resource table
> @@ -315,8 +316,8 @@ rproc_elf_find_rsc_table(struct rproc *rproc, const
> struct firmware *fw,
>   * Returns the pointer to the resource table if it is found or NULL othe=
rwise.
>   * If the table wasn't loaded yet the result is unspecified.
>   */
> -static struct resource_table *
> -rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmwa=
re
> *fw)
> +struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc
> *rproc,
> +						       const struct firmware
> *fw)
>  {
>  	struct elf32_hdr *ehdr =3D (struct elf32_hdr *)fw->data;
>  	struct elf32_shdr *shdr;
> @@ -327,11 +328,4 @@ rproc_elf_find_loaded_rsc_table(struct rproc
> *rproc, const struct firmware *fw)
>=20
>  	return rproc_da_to_va(rproc, shdr->sh_addr, shdr->sh_size);
>  }
> -
> -const struct rproc_fw_ops rproc_elf_fw_ops =3D {
> -	.load =3D rproc_elf_load_segments,
> -	.find_rsc_table =3D rproc_elf_find_rsc_table,
> -	.find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> -	.sanity_check =3D rproc_elf_sanity_check,
> -	.get_boot_addr =3D rproc_elf_get_boot_addr
> -};
> +EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
> diff --git a/drivers/remoteproc/remoteproc_internal.h
> b/drivers/remoteproc/remoteproc_internal.h
> index c1077bec5d0b..a42690c514e2 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -25,26 +25,6 @@
>=20
>  struct rproc;
>=20
> -/**
> - * struct rproc_fw_ops - firmware format specific operations.
> - * @find_rsc_table:	find the resource table inside the firmware image
> - * @find_loaded_rsc_table: find the loaded resouce table
> - * @load:		load firmeware to memory, where the remote
> processor
> - *			expects to find it
> - * @sanity_check:	sanity check the fw image
> - * @get_boot_addr:	get boot address to entry point specified in firmware
> - */
> -struct rproc_fw_ops {
> -	struct resource_table *(*find_rsc_table)(struct rproc *rproc,
> -						 const struct firmware *fw,
> -						 int *tablesz);
> -	struct resource_table *(*find_loaded_rsc_table)(
> -				struct rproc *rproc, const struct firmware
> *fw);
> -	int (*load)(struct rproc *rproc, const struct firmware *fw);
> -	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> -	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware
> *fw);
> -};
> -
>  /* from remoteproc_core.c */
>  void rproc_release(struct kref *kref);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> @@ -74,11 +54,20 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i=
);
>  void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
>  int rproc_trigger_recovery(struct rproc *rproc);
>=20
> +int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *f=
w);
> +u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware
> *fw);
> +int rproc_elf_load_segments(struct rproc *rproc, const struct firmware
> *fw);
> +struct resource_table *rproc_elf_find_rsc_table(struct rproc *rproc,
> +						const struct firmware *fw,
> +						int *tablesz);
> +struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc
> *rproc,
> +						       const struct firmware
> *fw);
> +
>  static inline
>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw=
)
>  {
> -	if (rproc->fw_ops->sanity_check)
> -		return rproc->fw_ops->sanity_check(rproc, fw);
> +	if (rproc->ops->sanity_check)
> +		return rproc->ops->sanity_check(rproc, fw);
>=20
>  	return 0;
>  }
> @@ -86,8 +75,8 @@ int rproc_fw_sanity_check(struct rproc *rproc, const
> struct firmware *fw)
>  static inline
>  u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  {
> -	if (rproc->fw_ops->get_boot_addr)
> -		return rproc->fw_ops->get_boot_addr(rproc, fw);
> +	if (rproc->ops->get_boot_addr)
> +		return rproc->ops->get_boot_addr(rproc, fw);
>=20
>  	return 0;
>  }
> @@ -95,8 +84,8 @@ u32 rproc_get_boot_addr(struct rproc *rproc, const
> struct firmware *fw)
>  static inline
>  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
>  {
> -	if (rproc->fw_ops->load)
> -		return rproc->fw_ops->load(rproc, fw);
> +	if (rproc->ops->load)
> +		return rproc->ops->load(rproc, fw);
>=20
>  	return -EINVAL;
>  }
> @@ -106,8 +95,8 @@ struct resource_table *rproc_find_rsc_table(struct
> rproc *rproc,
>  					    const struct firmware *fw,
>  					    int *tablesz)
>  {
> -	if (rproc->fw_ops->find_rsc_table)
> -		return rproc->fw_ops->find_rsc_table(rproc, fw, tablesz);
> +	if (rproc->ops->find_rsc_table)
> +		return rproc->ops->find_rsc_table(rproc, fw, tablesz);
>=20
>  	return NULL;
>  }
> @@ -116,12 +105,10 @@ static inline
>  struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
>  						   const struct firmware *fw)
>  {
> -	if (rproc->fw_ops->find_loaded_rsc_table)
> -		return rproc->fw_ops->find_loaded_rsc_table(rproc, fw);
> +	if (rproc->ops->find_loaded_rsc_table)
> +		return rproc->ops->find_loaded_rsc_table(rproc, fw);
>=20
>  	return NULL;
>  }
>=20
> -extern const struct rproc_fw_ops rproc_elf_fw_ops;
> -
>  #endif /* REMOTEPROC_INTERNAL_H */
> diff --git a/drivers/remoteproc/st_slim_rproc.c
> b/drivers/remoteproc/st_slim_rproc.c
> index 6cfd862f945b..1bce63a06424 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -200,12 +200,6 @@ static void *slim_rproc_da_to_va(struct rproc
> *rproc, u64 da, int len)
>  	return va;
>  }
>=20
> -static const struct rproc_ops slim_rproc_ops =3D {
> -	.start		=3D slim_rproc_start,
> -	.stop		=3D slim_rproc_stop,
> -	.da_to_va       =3D slim_rproc_da_to_va,
> -};
> -
>  /*
>   * Firmware handler operations: sanity, boot address, load ...
>   */
> @@ -223,8 +217,14 @@ static struct resource_table
> *slim_rproc_find_rsc_table(struct rproc *rproc,
>  	return &empty_rsc_tbl;
>  }
>=20
> -static struct rproc_fw_ops slim_rproc_fw_ops =3D {
> +static const struct rproc_ops slim_rproc_ops =3D {
> +	.start		=3D slim_rproc_start,
> +	.stop		=3D slim_rproc_stop,
> +	.da_to_va       =3D slim_rproc_da_to_va,
>  	.find_rsc_table =3D slim_rproc_find_rsc_table,
> +	.get_boot_addr	=3D rproc_elf_get_boot_addr,
> +	.load		=3D rproc_elf_load_segments,
> +	.sanity_check	=3D rproc_elf_sanity_check,
>  };
>=20
>  /**
> @@ -249,7 +249,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct
> platform_device *pdev,
>  	struct rproc *rproc;
>  	struct resource *res;
>  	int err, i;
> -	const struct rproc_fw_ops *elf_ops;
>=20
>  	if (!fw_name)
>  		return ERR_PTR(-EINVAL);
> @@ -267,13 +266,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct
> platform_device *pdev,
>  	slim_rproc =3D rproc->priv;
>  	slim_rproc->rproc =3D rproc;
>=20
> -	elf_ops =3D rproc->fw_ops;
> -	/* Use some generic elf ops */
> -	slim_rproc_fw_ops.load =3D elf_ops->load;
> -	slim_rproc_fw_ops.sanity_check =3D elf_ops->sanity_check;
> -
> -	rproc->fw_ops =3D &slim_rproc_fw_ops;
> -
>  	/* get imem and dmem */
>  	for (i =3D 0; i < ARRAY_SIZE(mem_names); i++) {
>  		res =3D platform_get_resource_byname(pdev,
> IORESOURCE_MEM,
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index cc4d30a790b3..ca2021cf7b39 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -324,6 +324,7 @@ struct rproc_mem_entry {
>  };
>=20
>  struct rproc;
> +struct firmware;
>=20
>  /**
>   * struct rproc_ops - platform-specific device handlers
> @@ -331,12 +332,26 @@ struct rproc;
>   * @stop:	power off the device
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
> + * @find_rsc_table:	find the resource table inside the firmware image
> + * @find_loaded_rsc_table: find the loaded resouce table
> + * @load:		load firmeware to memory, where the remote
> processor
> + *			expects to find it
> + * @sanity_check:	sanity check the fw image
> + * @get_boot_addr:	get boot address to entry point specified in firmware
>   */
>  struct rproc_ops {
>  	int (*start)(struct rproc *rproc);
>  	int (*stop)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
> +	struct resource_table *(*find_rsc_table)(struct rproc *rproc,
> +						 const struct firmware *fw,
> +						 int *tablesz);
> +	struct resource_table *(*find_loaded_rsc_table)(
> +				struct rproc *rproc, const struct firmware
> *fw);
> +	int (*load)(struct rproc *rproc, const struct firmware *fw);
> +	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> +	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware
> *fw);
>  };
>=20
>  /**
> @@ -390,7 +405,6 @@ enum rproc_crash_type {
>   * @priv: private data which belongs to the platform-specific rproc modu=
le
>   * @ops: platform-specific start/stop rproc handlers
>   * @dev: virtual device for refcounting and common remoteproc behavior
> - * @fw_ops: firmware-specific handlers
>   * @power: refcount of users who need this rproc powered up
>   * @state: state of the device
>   * @lock: lock which protects concurrent manipulations of the rproc
> @@ -421,7 +435,6 @@ struct rproc {
>  	void *priv;
>  	struct rproc_ops *ops;
>  	struct device dev;
> -	const struct rproc_fw_ops *fw_ops;
>  	atomic_t power;
>  	unsigned int state;
>  	struct mutex lock;
> --
> 2.15.0
