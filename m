Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 10 Aug 2016 10:52:13 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: hexagon: Fix error return code in
 q6v5_probe()
Message-ID: <20160810175213.GQ26240@tuxbot>
References: <1469807812-32765-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1469807812-32765-1-git-send-email-weiyj.lk@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 29 Jul 08:56 PDT 2016, Wei Yongjun wrote:

> Fix to return a negative error code from the state get failed error
> handling case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
> ---

Applied, thanks.

Regards,
Bjorn

>  drivers/remoteproc/qcom_q6v5_pil.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index 2479188..0ad536d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -864,8 +864,10 @@ static int q6v5_probe(struct platform_device *pdev)
>  		goto free_rproc;
>  
>  	qproc->state = qcom_smem_state_get(&pdev->dev, "stop", &qproc->stop_bit);
> -	if (IS_ERR(qproc->state))
> +	if (IS_ERR(qproc->state)) {
> +		ret = PTR_ERR(qproc->state);
>  		goto free_rproc;
> +	}
>  
>  	ret = rproc_add(rproc);
>  	if (ret)
> 
