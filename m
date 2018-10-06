Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 5 Oct 2018 23:35:00 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Fix a race condition on fatal
 crash
Message-ID: <20181006063500.GH12063@builder>
References: <20181001142500.25457-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181001142500.25457-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 01 Oct 07:25 PDT 2018, Sibi Sankar wrote:

> Currently with GLINK_SSR enabled each fatal crash results in servicing
> a crash from wdog as well. This is due to a race that occurs in setting
> the running flag in the shutdown path. Fix this by moving the running
> flag to the end of fatal interrupt handler.
> 
> Crash Logs:
> qcom-q6v5-pil 4080000.remoteproc: fatal error without message
> remoteproc remoteproc0: crash detected in 4080000.remoteproc: type fatal
> 	error
> remoteproc remoteproc0: handling crash #1 in 4080000.remoteproc
> remoteproc remoteproc0: recovering 4080000.remoteproc
> qcom-q6v5-pil 4080000.remoteproc: watchdog without message
> remoteproc remoteproc0: crash detected in 4080000.remoteproc: type watchdog
> remoteproc:glink-edge: intent request timed out
> qcom_glink_ssr remoteproc:glink-edge.glink_ssr.-1.-1: failed to send
> 	cleanup message
> qcom_glink_ssr remoteproc:glink-edge.glink_ssr.-1.-1: timeout waiting
> 	for cleanup done message
> qcom-q6v5-pil 4080000.remoteproc: timed out on wait
> qcom-q6v5-pil 4080000.remoteproc: port failed halt
> remoteproc remoteproc0: stopped remote processor 4080000.remoteproc
> qcom-q6v5-pil 4080000.remoteproc: MBA booted, loading mpss
> remoteproc remoteproc0: remote processor 4080000.remoteproc is now up
> remoteproc remoteproc0: handling crash #2 in 4080000.remoteproc
> remoteproc remoteproc0: recovering 4080000.remoteproc
> qcom-q6v5-pil 4080000.remoteproc: port failed halt
> remoteproc remoteproc0: stopped remote processor 4080000.remoteproc
> qcom-q6v5-pil 4080000.remoteproc: MBA booted, loading mpss
> remoteproc remoteproc0: remote processor 4080000.remoteproc is now up
> 
> [bjorn: move running flag to the end of fatal interrupt handler]

Turned this line into a Suggested-by

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Applied.

Thanks,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index e9ab90c19304..edeb2e43209e 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -84,6 +84,7 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>  	else
>  		dev_err(q6v5->dev, "fatal error without message\n");
>  
> +	q6v5->running = false;
>  	rproc_report_crash(q6v5->rproc, RPROC_FATAL_ERROR);
>  
>  	return IRQ_HANDLED;
> @@ -150,8 +151,6 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
>  {
>  	int ret;
>  
> -	q6v5->running = false;
> -
>  	qcom_smem_state_update_bits(q6v5->state,
>  				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
