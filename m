Date: Sun, 19 Apr 2020 22:00:54 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/7] remoteproc: Fix IDR initialisation in
 rproc_alloc()
Message-ID: <20200420050051.GB1516868@builder.lan>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415204858.2448-2-mathieu.poirier@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 15 Apr 13:48 PDT 2020, Mathieu Poirier wrote:

> From: Alex Elder <elder@linaro.org>
> 
> If ida_simple_get() returns an error when called in rproc_alloc(),
> put_device() is called to clean things up.  By this time the rproc
> device type has been assigned, with rproc_type_release() as the
> release function.
> 
> The first thing rproc_type_release() does is call:
>     idr_destroy(&rproc->notifyids);
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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e12a54e67588..80056513ae71 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2053,6 +2053,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->dev.type = &rproc_type;
>  	rproc->dev.class = &rproc_class;
>  	rproc->dev.driver_data = rproc;
> +	idr_init(&rproc->notifyids);
>  
>  	/* Assign a unique device index and name */
>  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
> @@ -2078,8 +2079,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  
>  	mutex_init(&rproc->lock);
>  
> -	idr_init(&rproc->notifyids);
> -
>  	INIT_LIST_HEAD(&rproc->carveouts);
>  	INIT_LIST_HEAD(&rproc->mappings);
>  	INIT_LIST_HEAD(&rproc->traces);
> -- 
> 2.20.1
> 
