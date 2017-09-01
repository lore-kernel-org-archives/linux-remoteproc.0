Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] remoteproc: Introduce rproc handle accessor for children
References: <20170828053453.27187-1-bjorn.andersson@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <5a5166df-c95b-6199-89be-6381b934adae@ti.com>
Date: Fri, 1 Sep 2017 16:00:46 -0500
MIME-Version: 1.0
In-Reply-To: <20170828053453.27187-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 08/28/2017 12:34 AM, Bjorn Andersson wrote:
> In certain circumstances rpmsg devices needs to acquire a handle to the
> ancestor remoteproc instance, e.g. to invoke rproc_report_crash() when a
> fatal error is detected. Introduce an interface that walks the device
> tree in search for a remoteproc instance and return this.

Thanks for the patch. I also have a need to be able to get a rproc
handle from rpmsg device for some buffer translations. I have been using
a somewhat similar solution downstream and was able to use this patch
just fine.

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 18 ++++++++++++++++++
>  include/linux/remoteproc.h           |  2 ++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 564061dcc019..5b1b19519275 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1296,6 +1296,23 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  EXPORT_SYMBOL(rproc_get_by_phandle);
>  
>  /**
> + * rproc_get_by_child() - acquire rproc handle of @dev's ancestor
> + * @dev:	child device to find ancestor of
> + *
> + * Returns the ancestor rproc instance, or NULL if not found.
> + */
> +struct rproc *rproc_get_by_child(struct device *dev)
> +{
> +	for (dev = dev->parent; dev; dev = dev->parent) {
> +		if (dev->type && !strcmp(dev->type->name, "remoteproc"))

It's much simpler to just check the type pointer,
		if (dev->type && dev->type == &rproc_type)

Tested both versions of the patch.


regards
Suman

> +			return dev->driver_data;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(rproc_get_by_child);
> +
> +/**
>   * rproc_add() - register a remote processor
>   * @rproc: the remote processor handle to register
>   *
> @@ -1440,6 +1457,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->dev.parent = dev;
>  	rproc->dev.type = &rproc_type;
>  	rproc->dev.class = &rproc_class;
> +	rproc->dev.driver_data = rproc;
>  
>  	/* Assign a unique device index and name */
>  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 81da49564ff4..44e630eb3d94 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -510,6 +510,8 @@ struct rproc_vdev {
>  };
>  
>  struct rproc *rproc_get_by_phandle(phandle phandle);
> +struct rproc *rproc_get_by_child(struct device *dev);
> +
>  struct rproc *rproc_alloc(struct device *dev, const char *name,
>  			  const struct rproc_ops *ops,
>  			  const char *firmware, int len);
> 
