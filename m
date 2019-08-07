Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 7/9] remoteproc: Introduce "panic" callback in ops
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
 <20190807053942.9836-8-bjorn.andersson@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <52517bd4-288b-7df6-9b7f-b1d26474d13f@ti.com>
Date: Wed, 7 Aug 2019 14:30:57 -0500
MIME-Version: 1.0
In-Reply-To: <20190807053942.9836-8-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 8/7/19 12:39 AM, Bjorn Andersson wrote:
> Introduce a "panic" function in the remoteproc ops table, to allow
> remoteproc instances to perform operations needed in order to aid in
> post mortem system debugging, such as flushing caches etc, when the
> kernel panics.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++++
>  include/linux/remoteproc.h           |  3 +++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3c5fbbbfb0f1..cc47797c6496 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1833,6 +1833,16 @@ void rproc_shutdown(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL(rproc_shutdown);
>  
> +static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
> +			       void *ptr)
> +{
> +	struct rproc *rproc = container_of(nb, struct rproc, panic_nb);
> +
> +	rproc->ops->panic(rproc);
> +
> +	return NOTIFY_DONE;
> +}
> +
>  /**
>   * rproc_get_by_phandle() - find a remote processor by phandle
>   * @phandle: phandle to the rproc
> @@ -2058,6 +2068,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
>  	}
>  
> +	/* Register panic notifier for remoteprocs with "panic" callback */
> +	if (rproc->ops->panic) {
> +		rproc->panic_nb.notifier_call = rproc_panic_handler;
> +		atomic_notifier_chain_register(&panic_notifier_list, &rproc->panic_nb);
> +	}
> +
>  	mutex_init(&rproc->lock);
>  
>  	idr_init(&rproc->notifyids);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..33553f6d8ff0 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -383,6 +383,7 @@ struct rproc_ops {
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	void (*panic)(struct rproc *rproc);

Do add the kernel doc comment for the new callback op.

regards
Suman

>  };
>  
>  /**
> @@ -481,6 +482,7 @@ struct rproc_dump_segment {
>   * @auto_boot: flag to indicate if remote processor should be auto-started
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
> + * @panic_nb: notifier_block for remoteproc's panic handler
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -514,6 +516,7 @@ struct rproc {
>  	bool auto_boot;
>  	struct list_head dump_segments;
>  	int nb_vdev;
> +	struct notifier_block panic_nb;
>  };
>  
>  /**
> 
