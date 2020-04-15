Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
Subject: Re: [PATCH v2 4/7] remoteproc: Use kstrdup_const() rather than
 kstrup()
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-5-mathieu.poirier@linaro.org>
From: Alex Elder <elder@linaro.org>
Message-ID: <14b12ca8-823b-8115-bafa-281180e92c70@linaro.org>
Date: Wed, 15 Apr 2020 16:25:03 -0500
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-5-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: s-anna@ti.com, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> For cases where @firmware is declared "const char *", use function
> kstrdup_const() to avoid needlessly creating another copy on the
> heap.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++--
>  include/linux/remoteproc.h           | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 9899467fa1cf..ebaff496ef81 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1982,7 +1982,7 @@ static const struct device_type rproc_type = {
>  static int rproc_alloc_firmware(struct rproc *rproc,
>  				const char *name, const char *firmware)
>  {
> -	char *p;
> +	const char *p;
>  
>  	if (!firmware)
>  		/*
> @@ -1991,7 +1991,7 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  		 */
>  		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
>  	else
> -		p = kstrdup(firmware, GFP_KERNEL);
> +		p = kstrdup_const(firmware, GFP_KERNEL);
>  
>  	if (!p)
>  		return -ENOMEM;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 9c07d7958c53..38607107b7cb 100644
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
> 
