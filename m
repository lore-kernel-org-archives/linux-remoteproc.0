Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 17 Apr 2018 14:47:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: Prevent incorrect rproc state on xfer mem
 ownership failure
Message-ID: <20180417214715.GE17344@builder>
References: <20180417194415.5155-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180417194415.5155-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 17 Apr 12:44 PDT 2018, Sibi Sankar wrote:

> Any failure in the secure call for transferring mem ownership of mba
> region to Q6 would result in reporting that the remoteproc device
> is running. This is because the previous q6v5_clk_enable would have
> been a success. Prevent this by updating variable 'ret' accordingly.
> 

Added Cc: stable@vger.kernel.org and applied, thanks.

Regards,
Bjorn

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index 8e70a627e0bb..296eb3f8b551 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -761,13 +761,12 @@ static int q6v5_start(struct rproc *rproc)
>  	}
>  
>  	/* Assign MBA image access in DDR to q6 */
> -	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
>  						qproc->mba_phys,
>  						qproc->mba_size);
> -	if (xfermemop_ret) {
> +	if (ret) {
>  		dev_err(qproc->dev,
> -			"assigning Q6 access to mba memory failed: %d\n",
> -			xfermemop_ret);
> +			"assigning Q6 access to mba memory failed: %d\n", ret);
>  		goto disable_active_clks;
>  	}
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
