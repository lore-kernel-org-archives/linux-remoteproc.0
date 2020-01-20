Date: Mon, 20 Jan 2020 11:36:41 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/4] remoteproc: qcom: q6v5-mss: Improve readability of
 reset_assert
Message-ID: <20200120193638.GK1511@yoga>
References: <20200117135130.3605-1-sibis@codeaurora.org>
 <20200117135130.3605-5-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117135130.3605-5-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: evgreen@chromium.org, p.zabel@pengutronix.de, ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 17 Jan 05:51 PST 2020, Sibi Sankar wrote:

> Define CONN_BOX_SPARE_0_EN and fixup comments to improve readability of
> Q6 modem reset_assert sequence on SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 6a98e9029c70b..8c9cfc213d5ff 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -71,6 +71,7 @@
>  #define NAV_AXI_HALTREQ_BIT		BIT(0)
>  #define NAV_AXI_HALTACK_BIT		BIT(1)
>  #define NAV_AXI_IDLE_BIT		BIT(2)
> +#define CONN_BOX_SPARE_0_EN		BIT(0)
>  
>  #define HALT_ACK_TIMEOUT_MS		100
>  #define NAV_HALT_ACK_TIMEOUT_US		200
> @@ -415,16 +416,26 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
>  		ret = reset_control_reset(qproc->mss_restart);
>  		reset_control_deassert(qproc->pdc_reset);
>  	} else if (qproc->has_halt_nav) {
> -		/* SWAR using CONN_BOX_SPARE_0 for pipeline glitch issue */
> +		/*
> +		 * SWWA for the pipeline glitch issue seen while

Is SWWA an abbreviation for SoftWare WorkAround?

> +		 * putting the Q6 modem on SC7180 into reset:
> +		 * 1 - Assert PDC reset
> +		 * 2 - Set CONN_BOX_SPARE_0_EN
> +		 * 3 - Withdraw the halt requests
> +		 * 4 - Assert MSS reset
> +		 * 5 - Deassert PDC reset
> +		 * 6 - Clear CONN_BOX_SPARE_0_EN
> +		 * 7 - Deassert MSS reset

This pretty much outlines what's written below. How about making this
something like:

/* 
 * Work around a pipeline glitch seen when putting the Q6 modem in
 * SC7180 into reset by also toggling CONN_BOX_SPARE_0_EN, while holding
 * the PDC reset.
 */


Although, it would be even better if it indicated what you mean with
"pipeline glitch"...

Regards,
Bjorn

> +		 */
>  		reset_control_assert(qproc->pdc_reset);
>  		regmap_update_bits(qproc->conn_map, qproc->conn_box,
> -				   BIT(0), BIT(0));
> +				   CONN_BOX_SPARE_0_EN, 1);
>  		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
>  				   NAV_AXI_HALTREQ_BIT, 0);
>  		reset_control_assert(qproc->mss_restart);
>  		reset_control_deassert(qproc->pdc_reset);
>  		regmap_update_bits(qproc->conn_map, qproc->conn_box,
> -				   BIT(0), 0);
> +				   CONN_BOX_SPARE_0_EN, 0);
>  		ret = reset_control_deassert(qproc->mss_restart);
>  	} else {
>  		ret = reset_control_assert(qproc->mss_restart);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
