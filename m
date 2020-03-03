Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Tue, 3 Mar 2020 15:56:38 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv7 03/15] remoteproc/omap: Add a sanity check for DSP boot
 address alignment
Message-ID: <20200303225638.GB8197@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-4-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-4-t-kristo@ti.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Feb 21, 2020 at 12:19:24PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The DSP remote processors on OMAP SoCs require a boot register to
> be programmed with a boot address, and this boot address needs to
> be on a 1KB boundary. The current code is simply masking the boot
> address appropriately without performing any sanity checks before
> releasing the resets. An unaligned boot address results in an
> undefined execution behavior and can result in various bus errors
> like MMU Faults or L3 NoC errors. Such errors are hard to debug and
> can be easily avoided by adding a sanity check for the alignment
> before booting a DSP remote processor.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> v7:
>   - minor kerneldoc update (added return value details for
>     omap_rproc_write_dsp_boot_addr)
> 
>  drivers/remoteproc/omap_remoteproc.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index d47d5ded651a..64b559caadff 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -121,14 +121,25 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>   * @rproc: handle of a remote processor
>   *
>   * Set boot address for a supported DSP remote processor.
> + *
> + * Return: 0 on success, or -EINVAL if boot address is not aligned properly
>   */
> -static void omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
> +static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>  {
> +	struct device *dev = rproc->dev.parent;
>  	struct omap_rproc *oproc = rproc->priv;
>  	struct omap_rproc_boot_data *bdata = oproc->boot_data;
>  	u32 offset = bdata->boot_reg;
>  
> +	if (rproc->bootaddr & (SZ_1K - 1)) {
> +		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 1KB boundary\n",
> +			rproc->bootaddr);
> +		return -EINVAL;
> +	}
> +
>  	regmap_write(bdata->syscon, offset, rproc->bootaddr);
> +
> +	return 0;
>  }
>  
>  /*
> @@ -145,8 +156,11 @@ static int omap_rproc_start(struct rproc *rproc)
>  	int ret;
>  	struct mbox_client *client = &oproc->client;
>  
> -	if (oproc->boot_data)
> -		omap_rproc_write_dsp_boot_addr(rproc);
> +	if (oproc->boot_data) {
> +		ret = omap_rproc_write_dsp_boot_addr(rproc);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	client->dev = dev;
>  	client->tx_done = NULL;
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
