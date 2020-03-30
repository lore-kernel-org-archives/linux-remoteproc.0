Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 04/17] remoteproc: Split rproc_ops allocation from
 rproc_alloc()
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-5-mathieu.poirier@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <eefffa40-ad4d-22ee-8c5b-7c7d64ea8b43@ti.com>
Date: Mon, 30 Mar 2020 14:54:00 -0500
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-5-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> Make the rproc_ops allocation a function on its own in order to
> introduce more flexibility to function rproc_alloc().
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 45 ++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c0871f69929b..d22e557f27ed 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1992,6 +1992,32 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  	return 0;
>  }
>  
> +static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> +{
> +	if (!rproc)
> +		return -EINVAL;

This is an internal function, and this check is already performed in
rproc_alloc(), so you can drop this.

> +
> +	/* Nothing to do if there isn't and ops to work with */
> +	if (!ops)
> +		return 0;

Hmm, ops at the moment is mandatory, and is one of the first checks done
in rproc_alloc(). So, do drop the concept of optional ops from this
patch. It needs to be moved to a later patch that makes it optional.

> +
> +	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> +	if (!rproc->ops)
> +		return -ENOMEM;
> +
> +	/* Default to ELF loader if no load function is specified */
> +	if (!rproc->ops->load) {
> +		rproc->ops->load = rproc_elf_load_segments;
> +		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> +		rproc->ops->find_loaded_rsc_table =
> +						rproc_elf_find_loaded_rsc_table;
> +		rproc->ops->sanity_check = rproc_elf_sanity_check;

I understand you have done this patch on the latest -rc, but this hunk
has been modified on rproc-next as part of Clement's 64-bit loader
support, and there is one more patch from him that's changing stuff here
again.

regards
Suman

> +		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -2031,12 +2057,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (rproc_alloc_firmware(rproc, name, firmware))
>  		goto free_rproc;
>  
> -	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> -	if (!rproc->ops) {
> -		kfree(rproc->firmware);
> -		kfree(rproc);
> -		return NULL;
> -	}
> +	if (rproc_alloc_ops(rproc, ops))
> +		goto free_firmware;
>  
>  	rproc->name = name;
>  	rproc->priv = &rproc[1];
> @@ -2060,15 +2082,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  
>  	atomic_set(&rproc->power, 0);
>  
> -	/* Default to ELF loader if no load function is specified */
> -	if (!rproc->ops->load) {
> -		rproc->ops->load = rproc_elf_load_segments;
> -		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> -		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
> -		rproc->ops->sanity_check = rproc_elf_sanity_check;
> -		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> -	}
> -
>  	mutex_init(&rproc->lock);
>  
>  	idr_init(&rproc->notifyids);
> @@ -2086,6 +2099,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  
>  	return rproc;
>  
> +free_firmware:
> +	kfree(rproc->firmware);
>  free_rproc:
>  	kfree(rproc);
>  	return NULL;
> 
