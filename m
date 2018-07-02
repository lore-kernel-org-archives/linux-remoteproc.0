Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 1 Jul 2018 23:33:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: smd: Add missing include of sizes.h
Message-ID: <20180702063351.GA21402@builder>
References: <20180629170101.16255-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180629170101.16255-1-niklas.cassel@linaro.org>
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 29 Jun 10:01 PDT 2018, Niklas Cassel wrote:

> Add missing include of sizes.h.
> 
> drivers/rpmsg/qcom_smd.c: In function �qcom_smd_channel_open�:
> drivers/rpmsg/qcom_smd.c:809:36: error: �SZ_4K� undeclared (first use in this function)
>   bb_size = min(channel->fifo_size, SZ_4K);
>                                     ^~~~~
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Applied

Thanks,
Bjorn

> ---
>  drivers/rpmsg/qcom_smd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 6437bbeebc91..8695cb041c31 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/sched.h>
> +#include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/wait.h>
> -- 
> 2.17.1
> 
