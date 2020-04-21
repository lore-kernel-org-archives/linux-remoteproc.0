Date: Mon, 20 Apr 2020 18:56:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/4] remoteproc: Restructure firmware name allocation
Message-ID: <20200421015650.GH1868936@builder.lan>
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
 <20200420231601.16781-3-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420231601.16781-3-mathieu.poirier@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, elder@linaro.org, s-anna@ti.com, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 20 Apr 16:15 PDT 2020, Mathieu Poirier wrote:

> Improve the readability of function rproc_alloc_firmware() by using
> a non-negated condition and moving the comment out of the conditional
> block
> 
> Suggested-by: Alex Elder <elder@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Alex Elder <elder@linaro.org>

Looks better, thanks for respinning.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index db8a15fc1e4a..45529d40342f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2011,14 +2011,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  {
>  	const char *p;
>  
> -	if (!firmware)
> -		/*
> -		 * If the caller didn't pass in a firmware name then
> -		 * construct a default name.
> -		 */
> -		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> -	else
> +	/*
> +	 * Allocate a firmware name if the caller gave us one to work
> +	 * with.  Otherwise construct a new one using a default pattern.
> +	 */
> +	if (firmware)
>  		p = kstrdup_const(firmware, GFP_KERNEL);
> +	else
> +		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
>  
>  	if (!p)
>  		return -ENOMEM;
> -- 
> 2.20.1
> 
