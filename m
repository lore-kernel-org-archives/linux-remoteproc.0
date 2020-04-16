Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 13:23:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 1/2] remoteproc: core: Add an API for changing
 firmware name
Message-ID: <20200416192350.GA29577@xps15>
References: <1586384305-7825-1-git-send-email-sidgup@codeaurora.org>
 <1586384305-7825-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586384305-7825-2-git-send-email-sidgup@codeaurora.org>
To: Siddharth Gupta <sidgup@codeaurora.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Siddharth,

On Wed, Apr 08, 2020 at 03:18:24PM -0700, Siddharth Gupta wrote:
> Add an API which allows to change the name of the firmware to be booted on
> the specified rproc. This change gives us the flixibility to change the
> firmware at run-time depending on the usecase. Some remoteprocs might use
> a different firmware for testing, production and development purposes,
> which may be selected based on the fuse settings during bootup.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 43 ++++++++++++++++++++++++++++++++++++
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index fb9c813..9f99fe2 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1796,6 +1796,49 @@ int rproc_boot(struct rproc *rproc)
>  EXPORT_SYMBOL(rproc_boot);
>  
>  /**
> + * rproc_set_firmware_name() - change the firmware name for specified remoteproc
> + * @rproc: handle of a remote processor
> + * @firmware: name of the firmware to boot with
> + *
> + * Change the name of the firmware to be loaded to @firmware in the rproc
> + * structure. We should ensure that the remoteproc is not running.
> + *
> + * Returns 0 on success, and an appropriate error value otherwise.
> + */
> +int rproc_set_firmware_name(struct rproc *rproc, const char *firmware)
> +{
> +	int len, ret = 0;
> +	char *p;
> +
> +	if (!rproc || !firmware)
> +		return -EINVAL;
> +
> +	len = strcspn(firmware, "\n");
> +	if (!len)
> +		return -EINVAL;
> +
> +	mutex_lock(&rproc->lock);
> +
> +	if (rproc->state != RPROC_OFFLINE) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	p = kstrndup(firmware, len, GFP_KERNEL);
> +	if (!p) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	kfree(rproc->firmware);
> +	rproc->firmware = p;
> +out:
> +	mutex_unlock(&rproc->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(rproc_set_firmware_name);
> +

This is much better, thanks for cleaning things up. Keep in mind that when you
do resend this rproc->firmware will likely have become a "const char *",
requiring the use of kstrndup_const()...  But that is for a later time.  

Mathieu

> +/**
>   * rproc_shutdown() - power off the remote processor
>   * @rproc: the remote processor
>   *
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 9c07d79..c5d36e6 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -613,6 +613,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  			     u32 da, const char *name, ...);
>  
>  int rproc_boot(struct rproc *rproc);
> +int rproc_set_firmware_name(struct rproc *rproc, const char *firmware);
>  void rproc_shutdown(struct rproc *rproc);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
