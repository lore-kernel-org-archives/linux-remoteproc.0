Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 12/17] remoteproc: Rename function rproc_fw_boot()
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-13-mathieu.poirier@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <29c93cf1-0512-5ad2-95af-fe262dd15b69@ti.com>
Date: Tue, 31 Mar 2020 16:42:42 -0500
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-13-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> Renaming function rproc_fw_boot() in order to better reflect the work
> that is done when supporting scenarios where the remoteproc core is
> synchronising with an MCU.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d57b47b0d6be..488723fcb142 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1363,7 +1363,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  /*
>   * take a firmware and boot a remote processor with it.
>   */
> -static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> +static int rproc_actuate_platform(struct rproc *rproc,
> +				  const struct firmware *fw)

Perhaps rproc_actuate_device instead of using platform and hw in the
other patch.

>  {
>  	struct device *dev = &rproc->dev;
>  	const char *name = rproc->firmware;
> @@ -1373,7 +1374,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> +	if (!rproc_sync_with_mcu(rproc))
> +		dev_info(dev, "Booting fw image %s, size %zd\n",
> +			 name, fw->size);

Better off moving this to patch 11 since that's where you change the
behavior.

>  
>  	/*
>  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> @@ -1756,7 +1759,7 @@ static int rproc_actuate(struct rproc *rproc,
>  		 firmware_p ? "powering up" : "syncing with",
>  		 rproc->name);

Also, you can move this similar "syncing with" trace from patch 10 to
patch 11.

regards
Suman

>  
> -	ret = rproc_fw_boot(rproc, firmware_p);
> +	ret = rproc_actuate_platform(rproc, firmware_p);
>  	if (ret)
>  		atomic_dec(&rproc->power);
>  
> 
