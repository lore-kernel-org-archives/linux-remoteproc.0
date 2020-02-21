Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Fri, 21 Feb 2020 11:42:36 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 3/9] remoteproc: add support to skip firmware load when
 recovery
Message-ID: <20200221184236.GA10368@xps15>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <1582097265-20170-4-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582097265-20170-4-git-send-email-peng.fan@nxp.com>
To: peng.fan@nxp.com
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Peng,

On Wed, Feb 19, 2020 at 03:27:39PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Remote processor such as M4 inside i.MX8QXP is not handled by Linux
> when it is configured to run inside its own hardware partition by
> system control unit(SCU). So even remote processor crash reset, it is
> handled by SCU, not linux. To such case, firmware load should be
> ignored, So introduce skip_fw_load_recovery and platform driver
> should set it if needed.

For now I will not comment on the code - I just need clarifications on the
scenario.

In the specific case you are trying to address here, I understand that when the
M4 crashes, the SCU will recognize that and reload the MCU firmware. Does the
SCU also start the MCU or is that left to the remoteproc subsystem?

Thanks,
Mathieu

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 19 +++++++++++--------
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 876b5420a32b..ca310e3582bf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1678,20 +1678,23 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	if (ret)
>  		goto unlock_mutex;
>  
> -	/* generate coredump */
> -	rproc_coredump(rproc);
> +	if (!rproc->skip_fw_load_recovery) {
> +		/* generate coredump */
> +		rproc_coredump(rproc);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto unlock_mutex;
> +		/* load firmware */
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto unlock_mutex;
> +		}
>  	}
>  
>  	/* boot the remote processor up again */
>  	ret = rproc_start(rproc, firmware_p);
>  
> -	release_firmware(firmware_p);
> +	if (!rproc->skip_fw_load_recovery)
> +		release_firmware(firmware_p);
>  
>  unlock_mutex:
>  	mutex_unlock(&rproc->lock);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 4fd5bedab4fa..fe6ee253b385 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -514,6 +514,7 @@ struct rproc {
>  	bool has_iommu;
>  	bool auto_boot;
>  	bool skip_fw_load;
> +	bool skip_fw_load_recovery;
>  	struct list_head dump_segments;
>  	int nb_vdev;
>  };
> -- 
> 2.16.4
> 
