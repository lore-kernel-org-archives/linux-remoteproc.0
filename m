Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Thu, 8 Sep 2016 09:48:05 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 12/19] remoteproc: core: Add vdev support and force
 mode to resource amending function
Message-ID: <20160908084805.GL4921@dell>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-13-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1472676622-32533-13-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 31 Aug 2016, Loic Pallardy wrote:

> This patch proposes diverse updates to rproc_update_resource_table_entry
> function:
> - rename rproc_update_resource_table_entry to __update_rsc_tbl_entry to
>   have shorter function name.
> - add RSC_VDEV support
> - add force mode resource even if resource already fixed on firmware side.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 30e9c70..aff1a00 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1027,13 +1027,15 @@ static int __verify_rsc_tbl_entry(struct rproc *rproc,
>  	return -EINVAL;
>  }
>  
> -static int rproc_update_resource_table_entry(struct rproc *rproc,
> +static int __update_rsc_tbl_entry(struct rproc *rproc,

Unless the name is unruly, (which I don't think it is, you're still
having to line wrap at the call site), I tend to go for clarity over
brevity.

>  				struct rproc_request_resource *request,
> -				struct resource_table *table, int size)
> +				struct resource_table *table, int size,
> +				bool force)
>  {
>  	struct fw_rsc_carveout *tblc, *newc;
>  	struct fw_rsc_devmem *tbld, *newd;
>  	struct fw_rsc_trace *tblt, *newt;
> +	struct fw_rsc_vdev *tblv, *newv;
>  	int updated = true;
>  	int i;
>  
> @@ -1054,7 +1056,8 @@ static int rproc_update_resource_table_entry(struct rproc *rproc,
>  				    sizeof(*tblc->name)))
>  				break;
>  
> -			memcpy(tblc, newc, request->size);
> +			if (tblc->pa == FW_RSC_ADDR_ANY || force)
> +				memcpy(tblc, newc, request->size);
>  
>  			return updated;
>  		case RSC_DEVMEM:
> @@ -1079,6 +1082,20 @@ static int rproc_update_resource_table_entry(struct rproc *rproc,
>  			memcpy(tblt, newt, request->size);
>  
>  			return updated;
> +		case RSC_VDEV:
> +			tblv = rsc;
> +			newv = request->resource;
> +			if (newv->id != tblv->id)
> +				break;
> +
> +			if (request->size > (sizeof(*tblv) +
> +				    tblv->num_of_vrings * sizeof(struct fw_rsc_vdev_vring) +
> +				    tblv->config_len))
> +				return -ENOSPC;
> +
> +			memcpy(tblv, newv, request->size);
> +
> +			return updated;

Again, there is more than one functional change in this patch.  You're
(unnecessarily IMO) renaming things, adding a force argument and
supplying support for a new type of device, all in one patch.

If any one of those functional changes has to be reverted, the
Maintainer will have no choice but to either revert the whole thing,
or someone will have to physically write an anti-patch, which is more
time consuming.

>  		default:
>  			dev_err(&rproc->dev,
>  				"Unsupported resource type: %d\n",
> @@ -1176,8 +1193,8 @@ rproc_apply_resource_overrides(struct rproc *rproc,
>  		int updated = 0;
>  
>  		/* If we already have a table, update it with the new values. */
> -		updated = rproc_update_resource_table_entry(rproc, resource,
> -							    table, size);
> +		updated = __update_rsc_tbl_entry(rproc, resource, table, size,
> +						 false);
>  		if (updated < 0) {
>  			table = ERR_PTR(updated);
>  			goto out;

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
