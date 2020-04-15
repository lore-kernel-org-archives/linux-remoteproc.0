Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
Subject: Re: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
From: Alex Elder <elder@linaro.org>
Message-ID: <9a4b6342-750e-284a-2343-8151b478589b@linaro.org>
Date: Wed, 15 Apr 2020 16:23:14 -0500
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-6-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: s-anna@ti.com, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> Improve the readability of function rproc_alloc_firmware() by using
> a non-negated condition.
> 
> Suggested-by: Alex Elder <elder@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

If it were me, I'd move the comment above the if statement and
perhaps reword it a little bit to describe what's happening.
But no matter, this looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index ebaff496ef81..0bfa6998705d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  {
>  	const char *p;
>  
> -	if (!firmware)
> +	if (firmware)
> +		p = kstrdup_const(firmware, GFP_KERNEL);
> +	else
>  		/*
>  		 * If the caller didn't pass in a firmware name then
>  		 * construct a default name.
>  		 */
>  		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> -	else
> -		p = kstrdup_const(firmware, GFP_KERNEL);
>  
>  	if (!p)
>  		return -ENOMEM;
> 
