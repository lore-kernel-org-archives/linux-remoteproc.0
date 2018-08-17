Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] remoteproc/davinci: Use %zx for formating size_t
References: <20180817004919.10805-1-bjorn.andersson@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <88c4934b-6ac8-0f15-1757-9a5152f30dd1@ti.com>
Date: Thu, 16 Aug 2018 20:51:51 -0500
MIME-Version: 1.0
In-Reply-To: <20180817004919.10805-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 08/16/2018 07:49 PM, Bjorn Andersson wrote:
> da8xx_rproc_mem size is of type size_t, so use %zx to format the debug
> print of it to avoid a compile warning.
> 

Thanks for the improvement,

Acked-by: Suman Anna <s-anna@ti.com>

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/da8xx_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index e230bef71be1..d200334577f6 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -226,7 +226,7 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
>  				res->start & DA8XX_RPROC_LOCAL_ADDRESS_MASK;
>  		drproc->mem[i].size = resource_size(res);
>  
> -		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
> +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %p da 0x%x\n",
>  			mem_names[i], &drproc->mem[i].bus_addr,
>  			drproc->mem[i].size, drproc->mem[i].cpu_addr,
>  			drproc->mem[i].dev_addr);
> 
