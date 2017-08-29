Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 29 Aug 2017 15:35:13 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: Use PTR_ERR_OR_ZERO
Message-ID: <20170829223513.GM29306@minitux>
References: <1504014198-16588-1-git-send-email-himanshujha199640@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504014198-16588-1-git-send-email-himanshujha199640@gmail.com>
To: Himanshu Jha <himanshujha199640@gmail.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 29 Aug 06:43 PDT 2017, Himanshu Jha wrote:

> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 

Applied for v4.14

Thank you,
Bjorn

> Signed-off-by: Himanshu Jha <himanshujha199640@gmail.com>
> ---
>  drivers/remoteproc/qcom_adsp_pil.c | 5 +----
>  drivers/remoteproc/qcom_common.c   | 2 +-
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
> index a41d399..d01a8da 100644
> --- a/drivers/remoteproc/qcom_adsp_pil.c
> +++ b/drivers/remoteproc/qcom_adsp_pil.c
> @@ -268,10 +268,7 @@ static int adsp_init_regulator(struct qcom_adsp *adsp)
>  	regulator_set_load(adsp->cx_supply, 100000);
>  
>  	adsp->px_supply = devm_regulator_get(adsp->dev, "px");
> -	if (IS_ERR(adsp->px_supply))
> -		return PTR_ERR(adsp->px_supply);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(adsp->px_supply);
>  }
>  
>  static int adsp_request_irq(struct qcom_adsp *adsp,
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 31b8291..7b40b79 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -55,7 +55,7 @@ static int smd_subdev_probe(struct rproc_subdev *subdev)
>  
>  	smd->edge = qcom_smd_register_edge(smd->dev, smd->node);
>  
> -	return IS_ERR(smd->edge) ? PTR_ERR(smd->edge) : 0;
> +	return PTR_ERR_OR_ZERO(smd->edge);
>  }
>  
>  static void smd_subdev_remove(struct rproc_subdev *subdev)
> -- 
> 2.7.4
> 
