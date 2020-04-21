Date: Mon, 20 Apr 2020 18:56:17 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/4] remoteproc: Use kstrdup_const() rather than
 kstrdup()
Message-ID: <20200421015614.GG1868936@builder.lan>
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
 <20200420231601.16781-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420231601.16781-2-mathieu.poirier@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, elder@linaro.org, s-anna@ti.com, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 20 Apr 16:15 PDT 2020, Mathieu Poirier wrote:

> For cases where @firmware is declared "const char *", use function
> kstrdup_const() to avoid needlessly creating another copy on the
> heap.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Alex Elder <elder@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 8 ++++----
>  include/linux/remoteproc.h           | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d9e6949e4ac1..db8a15fc1e4a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1996,7 +1996,7 @@ static void rproc_type_release(struct device *dev)
>  	if (rproc->index >= 0)
>  		ida_simple_remove(&rproc_dev_index, rproc->index);
>  
> -	kfree(rproc->firmware);
> +	kfree_const(rproc->firmware);
>  	kfree(rproc->ops);
>  	kfree(rproc);
>  }
> @@ -2009,7 +2009,7 @@ static const struct device_type rproc_type = {
>  static int rproc_alloc_firmware(struct rproc *rproc,
>  				const char *name, const char *firmware)
>  {
> -	char *p;
> +	const char *p;
>  
>  	if (!firmware)
>  		/*
> @@ -2018,7 +2018,7 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  		 */
>  		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
>  	else
> -		p = kstrdup(firmware, GFP_KERNEL);
> +		p = kstrdup_const(firmware, GFP_KERNEL);
>  
>  	if (!p)
>  		return -ENOMEM;
> @@ -2122,7 +2122,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	return rproc;
>  
>  free_firmware:
> -	kfree(rproc->firmware);
> +	kfree_const(rproc->firmware);
>  free_rproc:
>  	kfree(rproc);
>  	return NULL;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 0547676479d3..800b4f09dc98 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -489,7 +489,7 @@ struct rproc {
>  	struct list_head node;
>  	struct iommu_domain *domain;
>  	const char *name;
> -	char *firmware;
> +	const char *firmware;
>  	void *priv;
>  	struct rproc_ops *ops;
>  	struct device dev;
> -- 
> 2.20.1
> 
