Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 2/4] remoteproc: Rename "load_rsc_table" to "parse_fw"
Date: Wed, 3 Jan 2018 10:26:59 +0000
Message-ID: <283cde2ddefd472eaeaa66f326df1283@SFHDAG7NODE2.st.com>
References: <20171226203832.14928-1-bjorn.andersson@linaro.org>
 <20171226203832.14928-3-bjorn.andersson@linaro.org>
In-Reply-To: <20171226203832.14928-3-bjorn.andersson@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, Suman Anna <s-anna@ti.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
> owner@vger.kernel.org] On Behalf Of Bjorn Andersson
> Sent: Tuesday, December 26, 2017 9:39 PM
> To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; linux=
-
> arm-msm@vger.kernel.org; linux-soc@vger.kernel.org; Suman Anna <s-
> anna@ti.com>; Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> Subject: [PATCH v2 2/4] remoteproc: Rename "load_rsc_table" to
> "parse_fw"
>=20
> The resource table is just one possible source of information that can
> be extracted from the firmware file. Generalize this interface to allow
> drivers to override this with parsers of other types of information.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>=20
> Changes since v1:
> - New patch
>=20
>  drivers/remoteproc/remoteproc_core.c     | 6 +++---
>  drivers/remoteproc/remoteproc_internal.h | 7 +++----
>  include/linux/remoteproc.h               | 2 +-
>  3 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 5af7547b9d8d..6a72daa94673 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -944,8 +944,8 @@ static int rproc_fw_boot(struct rproc *rproc, const
> struct firmware *fw)
>=20
>  	rproc->bootaddr =3D rproc_get_boot_addr(rproc, fw);
>=20
> -	/* load resource table */
> -	ret =3D rproc_load_rsc_table(rproc, fw);
> +	/* parse firmware resources */
> +	ret =3D rproc_parse_fw(rproc, fw);
Hi Bjorn,

I think it will be good to keep resource (aka rsc) in function name. only "=
parse_fw" is not enough explicit and we don't know why rproc should parse f=
irmware.

Regards,
Loic

>  	if (ret)
>  		goto disable_iommu;
>=20
> @@ -1555,7 +1555,7 @@ struct rproc *rproc_alloc(struct device *dev, const
> char *name,
>  	/* Default to ELF loader if no load function is specified */
>  	if (!rproc->ops->load) {
>  		rproc->ops->load =3D rproc_elf_load_segments;
> -		rproc->ops->load_rsc_table =3D rproc_elf_load_rsc_table;
> +		rproc->ops->parse_fw =3D rproc_elf_load_rsc_table;
>  		rproc->ops->find_loaded_rsc_table =3D
> rproc_elf_find_loaded_rsc_table;
>  		rproc->ops->sanity_check =3D rproc_elf_sanity_check;
>  		rproc->ops->get_boot_addr =3D rproc_elf_get_boot_addr;
> diff --git a/drivers/remoteproc/remoteproc_internal.h
> b/drivers/remoteproc/remoteproc_internal.h
> index 55a2950c5cb7..7570beb035b5 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -88,11 +88,10 @@ int rproc_load_segments(struct rproc *rproc, const
> struct firmware *fw)
>  	return -EINVAL;
>  }
>=20
> -static inline int rproc_load_rsc_table(struct rproc *rproc,
> -				       const struct firmware *fw)
> +static inline int rproc_parse_fw(struct rproc *rproc, const struct firmw=
are
> *fw)
>  {
> -	if (rproc->ops->load_rsc_table)
> -		return rproc->ops->load_rsc_table(rproc, fw);
> +	if (rproc->ops->parse_fw)
> +		return rproc->ops->parse_fw(rproc, fw);
>=20
>  	return 0;
>  }
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index de6e20a3f061..dc93ac3d1692 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -343,7 +343,7 @@ struct rproc_ops {
>  	int (*stop)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
> -	int (*load_rsc_table)(struct rproc *rproc, const struct firmware *fw);
> +	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>  	struct resource_table *(*find_loaded_rsc_table)(
>  				struct rproc *rproc, const struct firmware
> *fw);
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
> --
> 2.15.0
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remotepro=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
