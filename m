Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 1/7] remoteproc: Fix IDR initialisation in
 rproc_alloc()
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-2-mathieu.poirier@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <672eb741-35d9-4aa2-1615-70c60ee85d1b@ti.com>
Date: Fri, 17 Apr 2020 08:37:00 -0500
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-2-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: elder@linaro.org, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> From: Alex Elder <elder@linaro.org>
> 
> If ida_simple_get() returns an error when called in rproc_alloc(),
> put_device() is called to clean things up.  By this time the rproc
> device type has been assigned, with rproc_type_release() as the
> release function.
> 
> The first thing rproc_type_release() does is call:
>      idr_destroy(&rproc->notifyids);
> 
> But at the time the ida_simple_get() call is made, the notifyids
> field in the remoteproc structure has not been initialized.
> 
> I'm not actually sure this case causes an observable problem, but
> it's incorrect.  Fix this by initializing the notifyids field before
> calling ida_simple_get() in rproc_alloc().
> 
> Fixes: b5ab5e24e960 ("remoteproc: maintain a generic child device for each rproc")
> Signed-off-by: Alex Elder <elder@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Suman Anna <s-anna@ti.com>

Thanks Alex. I had exactly this particular comment on Mathieu's sync 
patch series [1].

regards
Suman

[1] https://patchwork.kernel.org/comment/23254901/

> ---
>   drivers/remoteproc/remoteproc_core.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e12a54e67588..80056513ae71 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2053,6 +2053,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>   	rproc->dev.type = &rproc_type;
>   	rproc->dev.class = &rproc_class;
>   	rproc->dev.driver_data = rproc;
> +	idr_init(&rproc->notifyids);
>   
>   	/* Assign a unique device index and name */
>   	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
> @@ -2078,8 +2079,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>   
>   	mutex_init(&rproc->lock);
>   
> -	idr_init(&rproc->notifyids);
> -
>   	INIT_LIST_HEAD(&rproc->carveouts);
>   	INIT_LIST_HEAD(&rproc->mappings);
>   	INIT_LIST_HEAD(&rproc->traces);
> 
