Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 16/17] remoteproc: st: add reserved memory support
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-17-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <369c47bb-6ef1-d694-cf14-39bce87dfd0c@ti.com>
Date: Tue, 23 Oct 2018 22:01:42 -0500
MIME-Version: 1.0
In-Reply-To: <1532697292-14272-17-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 7/27/18 8:14 AM, Loic Pallardy wrote:
> ST remote processor needs some specified memory regions for
> firmware and IPC.
> Memory regions are defined as reserved memory and should
> be registered in remoteproc core thanks to rproc_add_carveout
> function before rproc_start. For this, st rproc driver implements
> prepare ops.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/st_remoteproc.c | 96 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 85 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index aacef0e..45958d5 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -19,6 +19,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_device.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
> @@ -91,6 +92,82 @@ static void st_rproc_kick(struct rproc *rproc, int vqid)
>  		dev_err(dev, "failed to send message via mbox: %d\n", ret);
>  }
>  
> +static int st_rproc_mem_alloc(struct rproc *rproc,
> +			      struct rproc_mem_entry *mem)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	void *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (!va) {
> +		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	/* Update memory entry va */
> +	mem->va = va;
> +
> +	return 0;
> +}
> +
> +static int st_rproc_mem_release(struct rproc *rproc,
> +				struct rproc_mem_entry *mem)
> +{
> +	iounmap(mem->va);
> +
> +	return 0;
> +}
> +
> +static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct device_node *np = dev->of_node;
> +	struct rproc_mem_entry *mem;
> +	void *va;
> +	struct reserved_mem *rmem;
> +	struct of_phandle_iterator it;
> +	int err, index = 0;
> +
> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> +	while ((err = of_phandle_iterator_next(&it)) == 0) {
> +		va = NULL;
> +		rmem = of_reserved_mem_lookup(it.node);
> +
> +		/*  No need to map vdev buffer */
> +		if (strcmp(it.node->name, "vdev0buffer")) {
> +			va = devm_ioremap_wc(dev, rmem->base, rmem->size);
> +			if (!va) {
> +				dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +					&rmem->base, rmem->size);
> +				return -ENOMEM;
> +			}
> +
> +			/* Register memory region */
> +			mem = rproc_mem_entry_init(dev, va,
> +						   (dma_addr_t)rmem->base,
> +						   rmem->size, rmem->base,
> +						   st_rproc_mem_alloc,
> +						   st_rproc_mem_release,

You seem to be double-mapping, first just above to supply the va to
mem_entry_init and then through the alloc function.

This is DT parsing and is fixed irrespective of firmware and only needs
to be done once really in the platform driver probe. I think this whole
logic is unnecessarily complicated in the name of letting the remoteproc
core handle the alloc and free for fixed memory carveouts during every
boot and shutdown, and having to redo the mapping everytime during the
firmware parse. I am not a big fan of overloading the parse_fw to do
this runtime remapping everytime for something that should have been
done once. I think you have done this in your v2, and somewhere along in
v3 got modified into this.

regards
Suman

> +						   it.node->name);
> +		} else {
> +			/* Register reserved memory for vdev buffer allocation */
> +			mem = rproc_of_resm_mem_entry_init(dev, index,
> +							   rmem->size,
> +							   rmem->base,
> +							   it.node->name);
> +		}
> +
> +		if (!mem)
> +			return -ENOMEM;
> +
> +		rproc_add_carveout(rproc, mem);
> +		index++;
> +	}
> +
> +	return rproc_elf_load_rsc_table(rproc, fw);
> +}
> +
>  static int st_rproc_start(struct rproc *rproc)
>  {
>  	struct st_rproc *ddata = rproc->priv;
> @@ -158,9 +235,14 @@ static int st_rproc_stop(struct rproc *rproc)
>  }
>  
>  static const struct rproc_ops st_rproc_ops = {
> -	.kick		= st_rproc_kick,
> -	.start		= st_rproc_start,
> -	.stop		= st_rproc_stop,
> +	.kick			= st_rproc_kick,
> +	.start			= st_rproc_start,
> +	.stop			= st_rproc_stop,
> +	.parse_fw		= st_rproc_parse_fw,
> +	.load			= rproc_elf_load_segments,
> +	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
> +	.sanity_check		= rproc_elf_sanity_check,
> +	.get_boot_addr		= rproc_elf_get_boot_addr,
>  };
>  
>  /*
> @@ -254,12 +336,6 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	err = of_reserved_mem_device_init(dev);
> -	if (err) {
> -		dev_err(dev, "Failed to obtain shared memory\n");
> -		return err;
> -	}
> -
>  	err = clk_prepare(ddata->clk);
>  	if (err)
>  		dev_err(dev, "failed to get clock\n");
> @@ -387,8 +463,6 @@ static int st_rproc_remove(struct platform_device *pdev)
>  
>  	clk_disable_unprepare(ddata->clk);
>  
> -	of_reserved_mem_device_release(&pdev->dev);
> -
>  	for (i = 0; i < ST_RPROC_MAX_VRING * MBOX_MAX; i++)
>  		mbox_free_channel(ddata->mbox_chan[i]);
>  
> 
