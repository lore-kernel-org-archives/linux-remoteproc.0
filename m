Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 3/9] remoteproc: add support to skip firmware load when
 recovery
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <1582097265-20170-4-git-send-email-peng.fan@nxp.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <0d90b2c2-cb02-d052-57cb-b11c5f815f07@st.com>
Date: Wed, 19 Feb 2020 15:39:42 +0100
MIME-Version: 1.0
In-Reply-To: <1582097265-20170-4-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: peng.fan@nxp.com, ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On 2/19/20 8:27 AM, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Remote processor such as M4 inside i.MX8QXP is not handled by Linux
> when it is configured to run inside its own hardware partition by
> system control unit(SCU). So even remote processor crash reset, it is
> handled by SCU, not linux. To such case, firmware load should be
> ignored, So introduce skip_fw_load_recovery and platform driver
> should set it if needed.
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

Any specific reason to not reuse skip_fw_load here?
FYI i'm reworking the Loic's patch and i plan to implement the recovery part using skip_fw_load...

Regards
Arnaud

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
> 
