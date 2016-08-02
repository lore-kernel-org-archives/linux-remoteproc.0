Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH 1/4] remoteproc: Introduce always-on flag
References: <1470077883-7419-1-git-send-email-bjorn.andersson@linaro.org>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <57A0B99F.6040206@st.com>
Date: Tue, 2 Aug 2016 17:17:51 +0200
MIME-Version: 1.0
In-Reply-To: <1470077883-7419-1-git-send-email-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 08/01/2016 08:58 PM, Bjorn Andersson wrote:
> Introduce an "always-on" flag on rprocs to make it possible to flag
> remote processors without vdevs to automatically boot once the firmware
> is found.
>
Should this flag rather be named "auto-boot"? From my pov, "always-on" 
means coprocessor can't be shutdown.

> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/remoteproc/remoteproc_core.c   | 27 ++++++++++++++++++++++++++-
>   drivers/remoteproc/remoteproc_virtio.c | 13 -------------
>   include/linux/remoteproc.h             |  1 +
>   3 files changed, 27 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index fe0539ed9cb5..7e7f24fcac69 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -933,6 +933,10 @@ static void rproc_fw_config_virtio(const struct firmware *fw, void *context)
>   	/* look for virtio devices and register them */
>   	ret = rproc_handle_resources(rproc, tablesz, rproc_vdev_handler);
>
> +	/* if rproc is marked always-on, request it to boot */
> +	if (rproc->always_on)
> +		rproc_boot_nowait(rproc);
> +
>   out:
>   	release_firmware(fw);
>   	/* allow rproc_del() contexts, if any, to proceed */
> @@ -978,11 +982,16 @@ static int rproc_add_virtio_devices(struct rproc *rproc)
>   int rproc_trigger_recovery(struct rproc *rproc)
>   {
>   	struct rproc_vdev *rvdev, *rvtmp;
> +	int ret;
>
>   	dev_err(&rproc->dev, "recovering %s\n", rproc->name);
>
>   	init_completion(&rproc->crash_comp);
>
> +	/* shut down the remote */
> +	/* TODO: make sure this works with rproc->power > 1 */
> +	rproc_shutdown(rproc);
> +
>   	/* clean up remote vdev entries */
>   	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
>   		rproc_remove_virtio_dev(rvdev);
> @@ -993,7 +1002,17 @@ int rproc_trigger_recovery(struct rproc *rproc)
>   	/* Free the copy of the resource table */
>   	kfree(rproc->cached_table);
>
> -	return rproc_add_virtio_devices(rproc);
> +	ret = rproc_add_virtio_devices(rproc);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * boot the remote processor up again, waiting for the async fw load to
> +	 * finish
> +	 */
> +	rproc_boot(rproc);
You are changing current behavior by forcing rproc boot whatever 
"always-on". Moreover coprocessor already rebooted by 
rproc_add_virtio_device if "always-on" flag is set, doesn't it?
If yes, rproc->power will be equal to 2 and rproc_shutdown call will 
failed as this second rproc_boot call is unknown from customer pov.

Regards,
Loic

> +
> +	return 0;
>   }
>
>   /**
> @@ -1374,6 +1393,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>   	rproc->name = name;
>   	rproc->ops = ops;
>   	rproc->priv = &rproc[1];
> +	rproc->always_on = true;
>
>   	device_initialize(&rproc->dev);
>   	rproc->dev.parent = dev;
> @@ -1452,6 +1472,11 @@ int rproc_del(struct rproc *rproc)
>   	/* if rproc is just being registered, wait */
>   	wait_for_completion(&rproc->firmware_loading_complete);
>
> +	/* if rproc is marked always-on, rproc_add() booted it */
> +	/* TODO: make sure this works with rproc->power > 1 */
> +	if (rproc->always_on)
> +		rproc_shutdown(rproc);
> +
>   	/* clean up remote vdev entries */
>   	list_for_each_entry_safe(rvdev, tmp, &rproc->rvdevs, node)
>   		rproc_remove_virtio_dev(rvdev);
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index cc91556313e1..574c90ce07f7 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -136,11 +136,6 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
>
>   static void rproc_virtio_del_vqs(struct virtio_device *vdev)
>   {
> -	struct rproc *rproc = vdev_to_rproc(vdev);
> -
> -	/* power down the remote processor before deleting vqs */
> -	rproc_shutdown(rproc);
> -
>   	__rproc_virtio_del_vqs(vdev);
>   }
>
> @@ -149,7 +144,6 @@ static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>   		       vq_callback_t *callbacks[],
>   		       const char * const names[])
>   {
> -	struct rproc *rproc = vdev_to_rproc(vdev);
>   	int i, ret;
>
>   	for (i = 0; i < nvqs; ++i) {
> @@ -160,13 +154,6 @@ static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>   		}
>   	}
>
> -	/* now that the vqs are all set, boot the remote processor */
> -	ret = rproc_boot_nowait(rproc);
> -	if (ret) {
> -		dev_err(&rproc->dev, "rproc_boot() failed %d\n", ret);
> -		goto error;
> -	}
> -
>   	return 0;
>
>   error:
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 1c457a8dd5a6..bd1cfcbb57b9 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -443,6 +443,7 @@ struct rproc {
>   	struct resource_table *cached_table;
>   	u32 table_csum;
>   	bool has_iommu;
> +	bool always_on;
>   };
>
>   /* we currently support only two vrings per rvdev */
>
