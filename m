Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 25 Oct 2016 12:35:54 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 5/5] remoteproc: Modifying probe for initializing q6v55
 specific resources
Message-ID: <20161025193554.GQ7509@tuxbot>
References: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
 <1477324559-24752-6-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477324559-24752-6-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, kaushalk@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 24 Oct 08:55 PDT 2016, Avaneesh Kumar Dwivedi wrote:

> Probe is being modified to save q6 version and invoke appropriate
> init functions to accommodate q6v55 remoteproc driver.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 43 ++++++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index dd19d41..c65c904 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -1370,6 +1370,9 @@ static int q6v5_probe(struct platform_device *pdev)
>  	init_completion(&qproc->start_done);
>  	init_completion(&qproc->stop_done);
>  
> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,q6v55-pil"))
> +		qproc->is_q6v55 = true;
> +

With the changes I've suggested in the other patches I would recommend
that you describe the differences as a set of "features" in a struct
that you put as .data in the match table and then use
of_device_get_match_data() to acquire the matching data struct.

>  	ret = q6v5_init_mem(qproc, pdev);
>  	if (ret)
>  		goto free_rproc;
> @@ -1378,17 +1381,39 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	ret = q6v5_init_clocks(qproc);
> -	if (ret)
> -		goto free_rproc;
> +	if (qproc->is_q6v55) {
> +		ret = q6v55_init_clocks(qproc);
> +		if (ret)
> +			goto free_rproc;
> +	} else {
> +		ret = q6v5_init_clocks(qproc);
> +		if (ret)
> +			goto free_rproc;
> +	}

Based on the fact that I don't think this is a q6v55, but rather a q6v6,
we will now end up with:

if (is_q6v55) {
} else if (is_q6v6) {
} else if (is_q6v5) {
} else {
	fail
};

And this function will turn into an (even worse) mess.


I would suggest that you instead define each resource as a flag and
provide a struct with these flags as .data with the compatible. Then
pass that to the clock and regulator init and based on the flags they
can acquire the individual resources. That way adding a new version is a
matter of listing which resources that needs to grab.

And in that struct you can also have a function pointer to an
appropriate reset function, completely removing the need for checking
which version we have after initialization.

>  
> -	ret = q6v5_regulator_init(qproc);
> -	if (ret)
> -		goto free_rproc;
> +	if (qproc->is_q6v55) {
> +		ret = q6v55_init_reset(qproc, pdev);
> +		if (ret)
> +			goto free_rproc;
> +	} else {
> +		ret = q6v5_init_reset(qproc);
> +		if (ret)
> +			goto free_rproc;
> +	}
>  
> -	ret = q6v5_init_reset(qproc);
> -	if (ret)
> -		goto free_rproc;
> +	if (qproc->is_q6v55) {
> +		ret = q6v55_regulator_init(qproc);
> +		if (ret)
> +			goto free_rproc;
> +	} else {
> +		ret = q6v5_regulator_init(qproc);
> +		if (ret)
> +			goto free_rproc;
> +	}
> +
> +	qproc->ahb_clk_vote = of_property_read_bool(pdev->dev.of_node,
> +			"qcom,ahb-clk-vote");
> +	mutex_init(&qproc->q6_lock);
>  
>  	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
>  	if (ret < 0)

Regards,
Bjorn
