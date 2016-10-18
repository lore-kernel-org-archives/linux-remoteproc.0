Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 18 Oct 2016 15:03:59 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/4] remoteproc: Keep local copy of firmware name
Message-ID: <20161018220359.GA19384@tuxbot>
References: <1476719341-11651-1-git-send-email-matt.redfearn@imgtec.com>
 <1476719341-11651-2-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476719341-11651-2-git-send-email-matt.redfearn@imgtec.com>
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 17 Oct 08:48 PDT 2016, Matt Redfearn wrote:

> Storage of the firmware name was inconsistent, either storing a pointer
> to a name stored with unknown ownership, or a variable length tacked
> onto the end of the struct proc allocated in rproc_alloc.
> 
> In preparation for allowing the firmware of an already allocated struct
> rproc to be changed, instead always keep a locally maintained copy of
> the firmware name.
> 
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>

Applied, thanks

> ---
> 
> Changes in v2:
> Use a kmalloc'd copy of the firmware name instead of having a fixed
> length array in struct rproc
> 
>  drivers/remoteproc/remoteproc_core.c | 31 ++++++++++++++++---------------
>  include/linux/remoteproc.h           |  2 +-
>  2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c6bfb3496684..ccc2a73e94dd 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1273,6 +1273,7 @@ static void rproc_type_release(struct device *dev)
>  	if (rproc->index >= 0)
>  		ida_simple_remove(&rproc_dev_index, rproc->index);
>  
> +	kfree(rproc->firmware);
>  	kfree(rproc);
>  }
>  
> @@ -1310,31 +1311,31 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  {
>  	struct rproc *rproc;
>  	char *p, *template = "rproc-%s-fw";
> -	int name_len = 0;
> +	int name_len;
>  
>  	if (!dev || !name || !ops)
>  		return NULL;
>  
> -	if (!firmware)
> +	if (!firmware) {
>  		/*
> -		 * Make room for default firmware name (minus %s plus '\0').
>  		 * If the caller didn't pass in a firmware name then
> -		 * construct a default name.  We're already glomming 'len'
> -		 * bytes onto the end of the struct rproc allocation, so do
> -		 * a few more for the default firmware name (but only if
> -		 * the caller doesn't pass one).
> +		 * construct a default name.
>  		 */
>  		name_len = strlen(name) + strlen(template) - 2 + 1;
> -
> -	rproc = kzalloc(sizeof(*rproc) + len + name_len, GFP_KERNEL);
> -	if (!rproc)
> -		return NULL;
> -
> -	if (!firmware) {
> -		p = (char *)rproc + sizeof(struct rproc) + len;
> +		p = kmalloc(name_len, GFP_KERNEL);
> +		if (!p)
> +			return NULL;
>  		snprintf(p, name_len, template, name);
>  	} else {
> -		p = (char *)firmware;
> +		p = kstrdup(firmware, GFP_KERNEL);
> +		if (!p)
> +			return NULL;
> +	}
> +
> +	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> +	if (!rproc) {
> +		kfree(p);
> +		return NULL;
>  	}
>  
>  	rproc->firmware = p;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 930023b7c825..940e4cf2ac48 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -415,7 +415,7 @@ struct rproc {
>  	struct list_head node;
>  	struct iommu_domain *domain;
>  	const char *name;
> -	const char *firmware;
> +	char *firmware;
>  	void *priv;
>  	const struct rproc_ops *ops;
>  	struct device dev;
> -- 
> 2.7.4
> 
