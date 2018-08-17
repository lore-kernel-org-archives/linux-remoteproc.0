Return-Path: <brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20180817004919.10805-1-bjorn.andersson@linaro.org>
References: <20180817004919.10805-1-bjorn.andersson@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Aug 2018 09:39:34 +0200
Message-ID: <CAMRc=Mcz9Ha_Jj=236d7Mp=abCUKs6oh9b9sW0uOGzQu1ROJ2g@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/davinci: Use %zx for formating size_t
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Suman Anna <s-anna@ti.com>, David Lechner <david@lechnology.com>
List-ID: <linux-remoteproc@vger.kernel.org>

2018-08-17 2:49 GMT+02:00 Bjorn Andersson <bjorn.andersson@linaro.org>:
> da8xx_rproc_mem size is of type size_t, so use %zx to format the debug
> print of it to avoid a compile warning.
>
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
>                                 res->start & DA8XX_RPROC_LOCAL_ADDRESS_MASK;
>                 drproc->mem[i].size = resource_size(res);
>
> -               dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
> +               dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %p da 0x%x\n",
>                         mem_names[i], &drproc->mem[i].bus_addr,
>                         drproc->mem[i].size, drproc->mem[i].cpu_addr,
>                         drproc->mem[i].dev_addr);
> --
> 2.18.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Can you also pick up this patch[1] for v4.19? David Lechner already
has a patch queued for v4.20 that depends on this one.

Thanks,
Bartosz

[1] https://patchwork.kernel.org/patch/10479365/
