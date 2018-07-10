Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 10 Jul 2018 14:09:31 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: q6v5-pil: fix modem hang on SDM845
 after axis2 clk unvote
Message-ID: <20180710210931.GA5090@builder>
References: <20180709151220.12641-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180709151220.12641-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ohad@wizery.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 09 Jul 08:12 PDT 2018, Sibi Sankar wrote:

> GCC_MSS_AXIS2 clock is used for disabling boot IMEM (a part of
> AP boot up). With Boot IMEM disable now a part TZ/ATF, AXIS2
> clock is no longer required post AP boot up and expected to
> remain untouched. However if the clock is turned ON after Q6
> is brought out of reset and later turned off, it results in
> modem hang. When Q6 attempts a power collapse the internal
> handshaking to check if AXIS2 is idle never goes through since
> it is turned off preventing the RSC from getting triggered,
> leaving modem in a funky state. Hence removing AXIS2 clk
> enable/disable from the driver.
> 
> [bjorn: identified unvoting axis2 clk caused modem hang]
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Thanks Sibi

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index e04319573c91..d7a4b9eca5d2 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -1243,7 +1243,6 @@ static const struct rproc_hexagon_res sdm845_mss = {
>  	.hexagon_mba_image = "mba.mbn",
>  	.proxy_clk_names = (char*[]){
>  			"xo",
> -			"axis2",
>  			"prng",
>  			NULL
>  	},
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
