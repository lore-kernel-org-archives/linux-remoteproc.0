Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 6/8] remoteproc: Move resource table load logic to find
Date: Thu, 14 Dec 2017 11:25:46 +0000
Message-ID: <63583c92f9e14fd881d53db2706ca689@SFHDAG7NODE2.st.com>
References: <20171213224111.17864-1-bjorn.andersson@linaro.org>
 <20171213224111.17864-7-bjorn.andersson@linaro.org>
In-Reply-To: <20171213224111.17864-7-bjorn.andersson@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
> owner@vger.kernel.org] On Behalf Of Bjorn Andersson
> Sent: Wednesday, December 13, 2017 11:41 PM
> To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH 6/8] remoteproc: Move resource table load logic to find
>=20
> Extend the previous operation of finding the resource table in the ELF
> with the extra step of populating the rproc struct with a copy and the
> size. This allows drivers to override the mechanism used for acquiring
> the resource table, or omit it for firmware that is known not to have a
> resource table.
>=20
> This leaves the custom, dummy, find_rsc_table implementations found in
> some drivers dangling.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c       | 32 ++++++------------------=
--
>  drivers/remoteproc/remoteproc_elf_loader.c | 37 ++++++++++++++++++--
> ----------
>  drivers/remoteproc/remoteproc_internal.h   | 16 +++++--------
>  include/linux/remoteproc.h                 |  1 +
>  4 files changed, 36 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 63d88d1d206e..cbd12382b219 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -907,8 +907,7 @@ static int rproc_fw_boot(struct rproc *rproc, const
> struct firmware *fw)
>  {
>  	struct device *dev =3D &rproc->dev;
>  	const char *name =3D rproc->firmware;
> -	struct resource_table *table;
> -	int ret, tablesz;
> +	int ret;
>=20
>  	ret =3D rproc_fw_sanity_check(rproc, fw);
>  	if (ret)
> @@ -927,27 +926,11 @@ static int rproc_fw_boot(struct rproc *rproc, const
> struct firmware *fw)
>  	}
>=20
>  	rproc->bootaddr =3D rproc_get_boot_addr(rproc, fw);
> -	ret =3D -EINVAL;
> -
> -	/* look for the resource table */
> -	table =3D rproc_find_rsc_table(rproc, fw, &tablesz);
> -	if (!table) {
> -		dev_err(dev, "Failed to find resource table\n");
> -		goto clean_up;
> -	}
> -
> -	/*
> -	 * Create a copy of the resource table. When a virtio device starts
> -	 * and calls vring_new_virtqueue() the address of the allocated vring
> -	 * will be stored in the cached_table. Before the device is started,
> -	 * cached_table will be copied into device memory.
> -	 */
> -	rproc->cached_table =3D kmemdup(table, tablesz, GFP_KERNEL);
> -	if (!rproc->cached_table)
> -		goto clean_up;
>=20
> -	rproc->table_ptr =3D rproc->cached_table;
> -	rproc->table_sz =3D tablesz;
> +	/* load resource table */
> +	ret =3D rproc_load_rsc_table(rproc, fw);
> +	if (ret)
> +		goto disable_iommu;
>=20
>  	/* reset max_notifyid */
>  	rproc->max_notifyid =3D -1;
> @@ -967,11 +950,10 @@ static int rproc_fw_boot(struct rproc *rproc, const
> struct firmware *fw)
>=20
>  clean_up_resources:
>  	rproc_resource_cleanup(rproc);
> -clean_up:
>  	kfree(rproc->cached_table);
>  	rproc->cached_table =3D NULL;
>  	rproc->table_ptr =3D NULL;
> -
> +disable_iommu:
>  	rproc_disable_iommu(rproc);
>  	return ret;
>  }
> @@ -1443,7 +1425,7 @@ struct rproc *rproc_alloc(struct device *dev, const
> char *name,
>  	/* Default to ELF loader if no load function is specified */
>  	if (!rproc->ops->load) {
>  		rproc->ops->load =3D rproc_elf_load_segments;
> -		rproc->ops->find_rsc_table =3D rproc_elf_find_rsc_table;
> +		rproc->ops->load_rsc_table =3D rproc_elf_load_rsc_table;
>  		rproc->ops->find_loaded_rsc_table =3D
> rproc_elf_find_loaded_rsc_table;
>  		rproc->ops->sanity_check =3D rproc_elf_sanity_check;
>  		rproc->ops->get_boot_addr =3D rproc_elf_get_boot_addr;
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> b/drivers/remoteproc/remoteproc_elf_loader.c
> index 822fa1bf893f..b17d72ec8603 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -268,42 +268,49 @@ find_table(struct device *dev, struct elf32_hdr
> *ehdr, size_t fw_size)
>  }
>=20
>  /**
> - * rproc_elf_find_rsc_table() - find the resource table
> + * rproc_elf_load_rsc_table() - load the resource table
>   * @rproc: the rproc handle
>   * @fw: the ELF firmware image
> - * @tablesz: place holder for providing back the table size
>   *
>   * This function finds the resource table inside the remote processor's
> - * firmware. It is used both upon the registration of @rproc (in order
> - * to look for and register the supported virito devices), and when the
> - * @rproc is booted.
> + * firmware, load it into the @cached_table and update @table_ptr.
>   *
> - * Returns the pointer to the resource table if it is found, and write i=
ts
> - * size into @tablesz. If a valid table isn't found, NULL is returned
> - * (and @tablesz isn't set).
> + * Return: 0 on success, negative errno on failure.
>   */
> -struct resource_table *rproc_elf_find_rsc_table(struct rproc *rproc,
> -						const struct firmware *fw,
> -						int *tablesz)
> +int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware =
*fw)
>  {
>  	struct elf32_hdr *ehdr;
>  	struct elf32_shdr *shdr;
>  	struct device *dev =3D &rproc->dev;
>  	struct resource_table *table =3D NULL;
>  	const u8 *elf_data =3D fw->data;
> +	size_t tablesz;
>=20
>  	ehdr =3D (struct elf32_hdr *)elf_data;
>=20
>  	shdr =3D find_table(dev, ehdr, fw->size);
>  	if (!shdr)
> -		return NULL;
> +		return -EINVAL;
>=20
>  	table =3D (struct resource_table *)(elf_data + shdr->sh_offset);
> -	*tablesz =3D shdr->sh_size;
> +	tablesz =3D shdr->sh_size;
> +
> +	/*
> +	 * Create a copy of the resource table. When a virtio device starts
> +	 * and calls vring_new_virtqueue() the address of the allocated vring
> +	 * will be stored in the cached_table. Before the device is started,
> +	 * cached_table will be copied into device memory.
> +	 */
> +	rproc->cached_table =3D kmemdup(table, tablesz, GFP_KERNEL);
> +	if (!rproc->cached_table)
> +		return -ENOMEM;
>=20
> -	return table;
> +	rproc->table_ptr =3D rproc->cached_table;
> +	rproc->table_sz =3D tablesz;
> +
> +	return 0;
>  }
> -EXPORT_SYMBOL(rproc_elf_find_rsc_table);
> +EXPORT_SYMBOL(rproc_elf_load_rsc_table);
[LPA] Hi Bjorn,

I understand the simplification of the  code, but I would like to keep rpro=
c_elf_find_rsc_table function as helper one.
Indeed if a driver wants to override the default rproc_elf_load_rsc_table, =
it may have to parse first the elf file to look up for resource table using=
 rproc_elf_find_rsc_table as helper.

Regards,
Loic

>=20
>  /**
>   * rproc_elf_find_loaded_rsc_table() - find the loaded resource table
> diff --git a/drivers/remoteproc/remoteproc_internal.h
> b/drivers/remoteproc/remoteproc_internal.h
> index a42690c514e2..55a2950c5cb7 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -57,9 +57,7 @@ int rproc_trigger_recovery(struct rproc *rproc);
>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *f=
w);
>  u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware
> *fw);
>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware
> *fw);
> -struct resource_table *rproc_elf_find_rsc_table(struct rproc *rproc,
> -						const struct firmware *fw,
> -						int *tablesz);
> +int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware
> *fw);
>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rpr=
oc,
>  						       const struct firmware
> *fw);
>=20
> @@ -90,15 +88,13 @@ int rproc_load_segments(struct rproc *rproc, const
> struct firmware *fw)
>  	return -EINVAL;
>  }
>=20
> -static inline
> -struct resource_table *rproc_find_rsc_table(struct rproc *rproc,
> -					    const struct firmware *fw,
> -					    int *tablesz)
> +static inline int rproc_load_rsc_table(struct rproc *rproc,
> +				       const struct firmware *fw)
>  {
> -	if (rproc->ops->find_rsc_table)
> -		return rproc->ops->find_rsc_table(rproc, fw, tablesz);
> +	if (rproc->ops->load_rsc_table)
> +		return rproc->ops->load_rsc_table(rproc, fw);
>=20
> -	return NULL;
> +	return 0;
>  }
>=20
>  static inline
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e21de55e19d1..ec1ada7cc6d7 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -344,6 +344,7 @@ struct rproc_ops {
>  	int (*stop)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
> +	int (*load_rsc_table)(struct rproc *rproc, const struct firmware *fw);
>  	struct resource_table *(*find_rsc_table)(struct rproc *rproc,
>  						 const struct firmware *fw,
>  						 int *tablesz);
> --
> 2.15.0
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remotepro=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
