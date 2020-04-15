Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
Subject: Re: [PATCH v2 3/7] remoteproc: Simplify default name allocation
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-4-mathieu.poirier@linaro.org>
From: Alex Elder <elder@linaro.org>
Message-ID: <1772f2f2-b063-c80f-9d3a-0127302d33f0@linaro.org>
Date: Wed, 15 Apr 2020 16:26:01 -0500
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-4-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: s-anna@ti.com, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> In an effort to cleanup firmware name allocation, replace the
> cumbersome mechanic used to allocate a default firmware name with
> function kasprintf().
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 4dee63f319ba..9899467fa1cf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1982,24 +1982,19 @@ static const struct device_type rproc_type = {
>  static int rproc_alloc_firmware(struct rproc *rproc,
>  				const char *name, const char *firmware)
>  {
> -	char *p, *template = "rproc-%s-fw";
> -	int name_len;
> +	char *p;
>  
> -	if (!firmware) {
> +	if (!firmware)
>  		/*
>  		 * If the caller didn't pass in a firmware name then
>  		 * construct a default name.
>  		 */
> -		name_len = strlen(name) + strlen(template) - 2 + 1;
> -		p = kmalloc(name_len, GFP_KERNEL);
> -		if (!p)
> -			return -ENOMEM;
> -		snprintf(p, name_len, template, name);
> -	} else {
> +		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> +	else
>  		p = kstrdup(firmware, GFP_KERNEL);
> -		if (!p)
> -			return -ENOMEM;
> -	}
> +
> +	if (!p)
> +		return -ENOMEM;
>  
>  	rproc->firmware = p;
>  
> 
