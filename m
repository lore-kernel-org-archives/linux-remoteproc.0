Date: Mon, 20 Apr 2020 19:01:10 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/4] remoteproc: Get rid of tedious error path
Message-ID: <20200421020107.GJ1868936@builder.lan>
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
 <20200420231601.16781-5-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420231601.16781-5-mathieu.poirier@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, elder@linaro.org, s-anna@ti.com, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 20 Apr 16:16 PDT 2020, Mathieu Poirier wrote:

> Get rid of tedious error management by moving firmware and operation
> allocation after calling device_initialize().  That way we take advantage
> of the automatic call to rproc_type_release() to cleanup after ourselves
> when put_device() is called.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Alex Elder <elder@linaro.org>
> Acked-by: Suman Anna <s-anna@ti.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 15318507aedb..6fca4e2c0dd7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2084,12 +2084,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (!rproc)
>  		return NULL;
>  
> -	if (rproc_alloc_firmware(rproc, name, firmware))
> -		goto free_rproc;
> -
> -	if (rproc_alloc_ops(rproc, ops))
> -		goto free_firmware;
> -
>  	rproc->name = name;
>  	rproc->priv = &rproc[1];
>  	rproc->auto_boot = true;
> @@ -2103,12 +2097,17 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->dev.driver_data = rproc;
>  	idr_init(&rproc->notifyids);
>  
> +	if (rproc_alloc_firmware(rproc, name, firmware))
> +		goto put_device;
> +
> +	if (rproc_alloc_ops(rproc, ops))
> +		goto put_device;
> +
>  	/* Assign a unique device index and name */
>  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
>  	if (rproc->index < 0) {
>  		dev_err(dev, "ida_simple_get failed: %d\n", rproc->index);
> -		put_device(&rproc->dev);
> -		return NULL;
> +		goto put_device;
>  	}
>  
>  	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
> @@ -2130,10 +2129,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  
>  	return rproc;
>  
> -free_firmware:
> -	kfree_const(rproc->firmware);
> -free_rproc:
> -	kfree(rproc);
> +put_device:
> +	put_device(&rproc->dev);
>  	return NULL;
>  }
>  EXPORT_SYMBOL(rproc_alloc);
> -- 
> 2.20.1
> 
