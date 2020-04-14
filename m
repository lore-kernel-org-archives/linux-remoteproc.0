Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Tue, 14 Apr 2020 11:46:44 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: memory regions
Message-ID: <20200414174644.GD24061@xps15>
References: <20200304142628.8471-1-NShubin@topcon.com>
 <20200406113310.3041-1-nikita.shubin@maquefel.me>
 <20200406113310.3041-4-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406113310.3041-4-nikita.shubin@maquefel.me>
To: nikita.shubin@maquefel.me
Cc: Nikita Shubin <NShubin@topcon.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Apr 06, 2020 at 02:33:10PM +0300, nikita.shubin@maquefel.me wrote:
> Add support for carveout memory regions required for vdev vring's and
> buffer.
> 
> Search in device tree and allocate memory regions like for ocram:
> 
> vdev0vring0: vdev0vring0@00920000 {
> 	compatible = "shared-dma-pool";
>         reg = <0x00920000 0x2000>;
>         no-map;
> };
> 
> vdev0vring1: vdev0vring1@00922000 {
> 	compatible = "shared-dma-pool";
> 	reg = <0x00922000 0x2000>;
> 	no-map;
> };
> 
> vdev0buffer: vdev0buffer@00924000 {
> 	compatible = "shared-dma-pool";
> 	reg = <0x00924000 0x4000>;
> 	no-map;
> };
> 
> imx7d-cm4 {
> 	compatible = "fsl,imx7d-cm4";
> 	memory-region = <&ocram>, <&vdev0vring0>, <&vdev0vring1>, \
> 		<&vdev0buffer>;
> }
> 
> vdev0vring0, vdev0vring1, vdev0buffer are required for virtio
> functioning.
> 
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 119 ++++++++++++++++++++++++++++++++-
>  1 file changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index d2bede4ccb70..cdcff2bd2867 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> @@ -238,6 +239,29 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  	return -ENOENT;
>  }
>  
> +static int imx_rproc_sys_to_da(struct imx_rproc *priv, u64 sys,
> +				int len, u64 *da)
> +{
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int i;
> +
> +	/* parse address translation table */
> +	for (i = 0; i < dcfg->att_size; i++) {
> +		const struct imx_rproc_att *att = &dcfg->att[i];
> +
> +		if (sys >= att->sa && sys + len <= att->sa + att->size) {
> +			unsigned int offset = sys - att->sa;
> +
> +			*da = att->da + offset;
> +			return 0;
> +		}
> +	}
> +
> +	dev_warn(priv->dev, "Translation failed: sys = 0x%llx len = 0x%x\n",
> +			 sys, len);
> +	return -ENOENT;
> +}
> +
>  static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -372,16 +396,109 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  		err = mbox_send_message(ddata->mb[i].chan, &vqid);
>  		if (err < 0)
>  			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
> -					__func__, ddata->mb[i].name, err);
> +				__func__, ddata->mb[i].name, err);
>  			return;
>  	}
>  }
>  
> +static int imx_rproc_mem_alloc(struct rproc *rproc,
> +				struct rproc_mem_entry *mem)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	void *va;
> +
> +	dev_dbg(dev, "map memory: %pa+%x\n", &mem->dma, mem->len);
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va)) {
> +		dev_err(dev, "Unable to map memory region: %pa+%x\n",
> +				&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	/* Update memory entry va */
> +	mem->va = va;
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_mem_release(struct rproc *rproc,
> +				struct rproc_mem_entry *mem)
> +{
> +	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> +	iounmap(mem->va);
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	struct device *dev = rproc->dev.parent;
> +	struct device_node *np = dev->of_node;
> +	struct of_phandle_iterator it;
> +	struct rproc_mem_entry *mem = 0;
> +	struct reserved_mem *rmem;
> +	u64 da;
> +	int index = 0;
> +
> +	/* Register associated reserved memory regions */
> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);

This will likely clash with the parsing done in imx_rproc_addr_init(), and the
parsing in there will also clash with what is done below...  I advise you to
register carvouts in imx_rproc_addr_init() as you parse the rest of the memory
regions.

Thanks,
Mathieu

> +	while (of_phandle_iterator_next(&it) == 0) {
> +		rmem = of_reserved_mem_lookup(it.node);
> +		if (!rmem) {
> +			dev_err(dev, "unable to acquire memory-region\n");
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * Let's assume all data in device tree is from
> +		 * CPU A7 point of view then we should translate
> +		 * rmem->base into M4 da
> +		 */
> +		if (imx_rproc_sys_to_da(priv, rmem->base, rmem->size, &da)) {
> +			dev_err(dev, "memory region not valid %pa\n",
> +				&rmem->base);
> +			return -EINVAL;
> +		}
> +
> +		if (strcmp(it.node->name, "vdev0buffer")) {
> +			/* Register memory region */
> +			mem = rproc_mem_entry_init(dev, NULL,
> +						(dma_addr_t)rmem->base,
> +						rmem->size, da,
> +						imx_rproc_mem_alloc,
> +						imx_rproc_mem_release,
> +						it.node->name);
> +
> +			if (mem)
> +				rproc_coredump_add_segment(rproc, da,
> +							rmem->size);
> +		} else {
> +			mem = rproc_of_resm_mem_entry_init(dev, index,
> +							rmem->size,
> +							rmem->base,
> +							it.node->name);
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
>  static const struct rproc_ops imx_rproc_ops = {
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
>  	.da_to_va	= imx_rproc_da_to_va,
>  	.kick		= imx_rproc_kick,
> +	.load		= rproc_elf_load_segments,
> +	.parse_fw	= imx_rproc_parse_fw,
> +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> -- 
> 2.25.1
> 
