Date: Sun, 19 Apr 2020 23:37:17 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v6 4/5] remoteproc: ingenic: Added remoteproc driver
Message-ID: <20200420063714.GA1868936@builder.lan>
References: <20200417170040.174319-1-paul@crapouillou.net>
 <20200417170040.174319-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417170040.174319-4-paul@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, od@zcrc.me, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild test robot <lkp@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Mathieu Poirier <mathieu.poirier@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 17 Apr 10:00 PDT 2020, Paul Cercueil wrote:

> This driver is used to boot, communicate with and load firmwares to the
> MIPS co-processor found in the VPU hardware of the JZ47xx SoCs from
> Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Julia Lawall <julia.lawall@lip6.fr>

Please read Documentation/process/submitting-patches.rst about
"Developer's Certificate of Origin".

I suspect that you incorporated review feedback on previous revisions
from kbuild and Julia, this is generally omitted from the actual commit
message.

> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> 
> Notes:
>     v2: Remove exception for always-mapped memories
>     v3: - Use clk_bulk API
>     	- Move device-managed code to its own patch [3/4]
>     	- Move devicetree table right above ingenic_rproc_driver
>     	- Removed #ifdef CONFIG_OF around devicetree table
>     	- Removed .owner = THIS_MODULE in ingenic_rproc_driver
>     	- Removed useless platform_set_drvdata()
>     v4: - Add fix reported by Julia
>     	- Change Kconfig symbol to INGENIC_VPU_RPROC
>     	- Add documentation to struct vpu
>     	- disable_irq_nosync() -> disable_irq()
>     v5: No change
>     v6: Instead of prepare/unprepare callbacks, use PM runtime callbacks
> 
>  drivers/remoteproc/Kconfig         |   8 +
>  drivers/remoteproc/Makefile        |   1 +
>  drivers/remoteproc/ingenic_rproc.c | 282 +++++++++++++++++++++++++++++
>  3 files changed, 291 insertions(+)
>  create mode 100644 drivers/remoteproc/ingenic_rproc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index fbaed079b299..31da3e6c6281 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -240,6 +240,14 @@ config STM32_RPROC
>  
>  	  This can be either built-in or a loadable module.
>  
> +config INGENIC_VPU_RPROC

Please try to keep things alphabetically ordered.

> +	tristate "Ingenic JZ47xx VPU remoteproc support"
> +	depends on MIPS || COMPILE_TEST
> +	help
> +	  Say y or m here to support the VPU in the JZ47xx SoCs from Ingenic.
> +	  This can be either built-in or a loadable module.
> +	  If unsure say N.
> +
>  endif # REMOTEPROC
>  
>  endmenu
[..]
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
[..]
> +/**
> + * struct vpu - Ingenic VPU remoteproc private structure
> + * @irq: interrupt number
> + * @clks: pointers to the VPU and AUX clocks

aux_base is missing

> + * @mem_info: array of struct vpu_mem_info, which contain the mapping info of
> + *            each of the external memories
> + * @dev: private pointer to the device
> + */
> +struct vpu {
> +	int irq;
> +	struct clk_bulk_data clks[2];
> +	void __iomem *aux_base;
> +	struct vpu_mem_info mem_info[ARRAY_SIZE(vpu_mem_map)];
> +	struct device *dev;
> +};
[..]
> +static void *ingenic_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +{
> +	struct vpu *vpu = rproc->priv;
> +	void __iomem *va = NULL;
> +	unsigned int i;
> +
> +	if (len <= 0)

len can't be negative (also, does it add value to check for and fail len
== 0?)

> +		return NULL;
> +
> +	for (i = 0; i < ARRAY_SIZE(vpu_mem_map); i++) {
> +		const struct vpu_mem_info *info = &vpu->mem_info[i];
> +		const struct vpu_mem_map *map = info->map;
> +
> +		if (da >= map->da && (da + len) < (map->da + info->len)) {
> +			va = info->base + (da - map->da);
> +			break;
> +		}
> +	}
> +
> +	return (__force void *)va;
> +}
[..]
> +static struct platform_driver ingenic_rproc_driver = {
> +	.probe = ingenic_rproc_probe,
> +	.driver = {
> +		.name = "ingenic-vpu",
> +#ifdef CONFIG_PM

Please omit the #ifdef here.

> +		.pm = &ingenic_rproc_pm,
> +#endif
> +		.of_match_table = of_match_ptr(ingenic_rproc_of_matches),

Please omit the of_match_ptr()

Regards,
Bjorn

> +	},
> +};
> +module_platform_driver(ingenic_rproc_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
> +MODULE_DESCRIPTION("Ingenic JZ47xx Remote Processor control driver");
> -- 
> 2.25.1
> 
