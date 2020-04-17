Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 7/7] remoteproc: Get rid of tedious error path
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-8-mathieu.poirier@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <6b21d836-a31c-eeaa-efff-aff589861775@ti.com>
Date: Fri, 17 Apr 2020 08:50:01 -0500
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-8-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: elder@linaro.org, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> Get rid of tedious error management by moving firmware and operation
> allocation after calling device_initialize().  That way we take advantage
> of the automatic call to rproc_type_release() to cleanup after ourselves
> when put_device() is called.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Alex Elder <elder@linaro.org>

Acked-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>   drivers/remoteproc/remoteproc_core.c | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a5a0ceb86b3f..405c94f151a7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2056,12 +2056,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>   	if (!rproc)
>   		return NULL;
>   
> -	if (rproc_alloc_firmware(rproc, name, firmware))
> -		goto free_rproc;
> -
> -	if (rproc_alloc_ops(rproc, ops))
> -		goto free_firmware;
> -
>   	rproc->name = name;
>   	rproc->priv = &rproc[1];
>   	rproc->auto_boot = true;
> @@ -2074,12 +2068,17 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>   	rproc->dev.driver_data = rproc;
>   	idr_init(&rproc->notifyids);
>   
> +	if (rproc_alloc_firmware(rproc, name, firmware))
> +		goto put_device;
> +
> +	if (rproc_alloc_ops(rproc, ops))
> +		goto put_device;
> +
>   	/* Assign a unique device index and name */
>   	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
>   	if (rproc->index < 0) {
>   		dev_err(dev, "ida_simple_get failed: %d\n", rproc->index);
> -		put_device(&rproc->dev);
> -		return NULL;
> +		goto put_device;
>   	}
>   
>   	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
> @@ -2100,11 +2099,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>   	rproc->state = RPROC_OFFLINE;
>   
>   	return rproc;
> -
> -free_firmware:
> -	kfree(rproc->firmware);
> -free_rproc:
> -	kfree(rproc);
> +put_device:
> +	put_device(&rproc->dev);
>   	return NULL;
>   }
>   EXPORT_SYMBOL(rproc_alloc);
> 
