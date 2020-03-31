Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 11/17] remoteproc: Repurpose function
 rproc_trigger_auto_boot()
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-12-mathieu.poirier@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <8558011f-5e3d-057b-6808-1dbd8661382d@ti.com>
Date: Tue, 31 Mar 2020 16:32:58 -0500
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-12-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> Repurpose function rproc_trigger_auto_boot() so that it can deal with
> scenarios where the MCU is already running.  As such give it a new name
> to better represent the capabilities and add a call to rproc_actuate()
> if instructed by the platform code to synchronise with the MCU rather
> than boot it from scratch.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7faee1396ef7..d57b47b0d6be 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -51,6 +51,8 @@ static int rproc_alloc_carveout(struct rproc *rproc,
>  				struct rproc_mem_entry *mem);
>  static int rproc_release_carveout(struct rproc *rproc,
>  				  struct rproc_mem_entry *mem);
> +static int rproc_actuate(struct rproc *rproc,
> +			 const struct firmware *firmware_p);
>  
>  /* Unique indices for remoteproc devices */
>  static DEFINE_IDA(rproc_dev_index);
> @@ -1444,10 +1446,17 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
>  	release_firmware(fw);
>  }
>  
> -static int rproc_trigger_auto_boot(struct rproc *rproc)
> +static int rproc_trigger_auto_initiate(struct rproc *rproc)
>  {
>  	int ret;
>  
> +	/*
> +	 * The MCU is already booted, all we need to do is synchronise with it.
> +	 * No point dealing with a firmware image.
> +	 */
> +	if (rproc_sync_with_mcu(rproc))
> +		return rproc_actuate(rproc, NULL);
> +
>  	/*
>  	 * We're initiating an asynchronous firmware loading, so we can
>  	 * be built-in kernel code, without hanging the boot process.
> @@ -1931,9 +1940,12 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> -	/* if rproc is marked always-on, request it to boot */
> +	/*
> +	 * if rproc is marked always-on, request it to boot or synchronise
> +	 * with it.

Can you please rephrase the "always-on" here while at this since are
already modifying this comment.

regards
Suman

> +	 */
>  	if (rproc->auto_boot) {
> -		ret = rproc_trigger_auto_boot(rproc);
> +		ret = rproc_trigger_auto_initiate(rproc);
>  		if (ret < 0)
>  			return ret;
>  	}
> 
